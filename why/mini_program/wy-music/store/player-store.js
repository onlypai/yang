import { HYEventStore } from "hy-event-store"
import { getSongDetail, getSongLyric } from "../service/api_player"
import { parseLyric } from "../utils/parse-lyric"

// const audioContext = wx.createInnerAudioContext()
const audioContext = wx.getBackgroundAudioManager()

const playerStore = new HYEventStore({
  state: {
    isFirstPlay: true, //是否是第一次播放，audioContext对象事件监听只需要监听第一次
    isStoping: false, //是否在后台停止播放

    currentSong: {}, //歌曲信息
    durationTime: 0, //歌曲总时间
    lyricInfos: [], //歌词信息[{time,text}]

    currentTime: 0, //当前播放时间
    currentLyricIndex: 0, //正在播的歌词索引
    currentLyricText: "", //正在播的歌词

    isPlaying: false, //歌曲播放true / 暂停false
    playModeIndex: 0, // 0: 循环播放 1: 单曲循环 2: 随机播放

    playListSongs: [], //播放列表
    playListIndex: 0, //正在播放歌曲在播放列表中的索引
  },
  actions: {
    playMusicWithSongIdAction(ctx, { id, isRefresh = false }) {
      if (ctx.id == id && !isRefresh) {
        //如果是同一首歌，不需要重头播放，直接继续播放
        this.dispatch("changeMusicPlayStatusAction", true)
        return
      }

      ctx.id = id

      /**
       * 0、播放歌曲，初始化页面数据为空（防止进入看见上一首歌信息的残影）
       */
      ctx.isPlaying = true
      ctx.currentSong = {}
      ctx.durationTime = 0
      ctx.lyricInfos = []
      ctx.currentTime = 0
      ctx.currentLyricIndex = 0
      ctx.currentLyricText = ""

      /**
       * 1、网络请求
       */
      // 歌曲信息
      getSongDetail(id).then((res) => {
        // this.setData({ currentSong: res.songs[0], durationTime: res.songs[0].dt })
        ctx.currentSong = res.songs[0]
        ctx.durationTime = res.songs[0].dt
        audioContext.title = res.songs[0].name //再次设置title属性
      })
      // 歌词信息
      getSongLyric(id).then((res) => {
        const lyricString = res.lrc.lyric
        const lyricInfos = parseLyric(lyricString)
        // this.setData({ lyricInfos })
        ctx.lyricInfos = lyricInfos
      })

      /**
       * 2、播放歌曲以及事件监听
       */
      audioContext.stop()
      audioContext.src = `https://music.163.com/song/media/outer/url?id=${id}.mp3`
      audioContext.title = id
      audioContext.autoplay = true

      if (ctx.isFirstPlay) {
        // 第一次监听后无需监听
        this.dispatch("setupAudioContextListenerAction")
        ctx.isFirstPlay = false
      }
    },
    setupAudioContextListenerAction(ctx) {
      // 1.监听歌曲可以播放
      audioContext.onCanplay(() => {
        audioContext.play()
      })
      // 2.监听时间改变
      audioContext.onTimeUpdate(() => {
        // 1.获取当前时间
        const currentTime = audioContext.currentTime * 1000

        // 2.如果不是正在拖动，就根据当前时间修改currentTime/sliderValue(当前播放时间和进度条)
        // if (!this.data.isSliderChanging) {
        //   this.setData({
        //     currentTime,
        //     sliderValue: (currentTime / this.data.durationTime) * 100,
        //   })
        // }
        ctx.currentTime = currentTime

        // 3.根据当前时间去查找播放的歌词
        if (!ctx.lyricInfos.length) return
        let i = 0
        for (; i < ctx.lyricInfos.length; i++) {
          const lyricInfo = ctx.lyricInfos[i]
          if (currentTime < lyricInfo.time) {
            break
          }
        }
        // 设置当前歌词的索引、内容、实时滚动scroll-top⭐
        const currentIndex = i - 1
        if (ctx.currentLyricIndex !== currentIndex) {
          //防止重复执行
          const currentLyricInfo = ctx.lyricInfos[currentIndex]
          // this.setData({
          //   currentLyricText: currentLyricInfo.text,
          //   currentLyricIndex: currentIndex,
          //   lyricScrollTop: currentIndex * 35,
          // }) // 每行歌词35px
          ctx.currentLyricIndex = currentIndex
          ctx.currentLyricText = currentLyricInfo.text
        }
      })
      //3.监听歌曲播放完成
      audioContext.onEnded(() => {
        this.dispatch("changeNewMusicAction", true)
      })

      //4、监听背景音频的播放、暂停、停止、上下切换歌曲(仅ios)
      //播放
      audioContext.onPlay(() => {
        ctx.isPlaying = true
      })
      //暂停
      audioContext.onPause(() => {
        ctx.isPlaying = false
      })
      //停止
      audioContext.onStop(() => {
        ctx.isPlaying = false
        //背景音频在后台被关闭了，这时我需要进入程序点击播放重新进行播放，见歌曲控制
        ctx.isStoping = true
      })
      audioContext.onNext(() => {
        this.dispatch("changeNewMusicAction", true)
      })
      audioContext.onPrev(() => {
        this.dispatch("changeNewMusicAction", false)
      })
    },
    //歌曲控制
    changeMusicPlayStatusAction(ctx, isPlaying) {
      // ctx.isPlaying ? audioContext.pause() : audioContext.play()
      ctx.isPlaying = isPlaying
      //歌曲在后台被停止了，这里点击再次播放
      if (ctx.isPlaying && ctx.isStoping) {
        audioContext.src = `https://music.163.com/song/media/outer/url?id=${ctx.id}.mp3`
        audioContext.title = ctx.currentSong.name
        audioContext.startTime = ctx.currentTime / 1000 //再次播放从上次位置继续播放
        ctx.isStoping = false
      }
      //先将播放状态改变，在进行相应的播放暂停，这是判断逻辑要反过来
      ctx.isPlaying ? audioContext.play() : audioContext.pause()
    },

    //歌曲切换
    changeNewMusicAction(ctx, isNext) {
      let index = ctx.playListIndex
      switch (ctx.playModeIndex) {
        case 0: //顺序播放
          index = isNext ? index + 1 : index - 1 //上还是下
          if (index == ctx.playListSongs.length) index = 0
          if (index == -1) index = ctx.playListSongs.length - 1
          break
        case 1: //单曲循环
          break
        case 2: //随机播放
          index = Math.floor(Math.random() * ctx.playListSongs.length)
          break
      }
      let currentSong = ctx.playListSongs[index]
      if (!currentSong) {
        // 歌曲没有找到，可能这个歌曲列表就只有这一首歌曲
        currentSong = ctx.currentSong
      } else {
        // 记录最新的索引
        ctx.playListIndex = index
      }
      console.log(currentSong.id)
      this.dispatch("playMusicWithSongIdAction", {
        id: currentSong.id,
        isRefresh: true,
      }) //isRefresh如果歌曲列表只有一首歌，点击切换也是从头开始放
    },
  },
})

export { audioContext, playerStore }
