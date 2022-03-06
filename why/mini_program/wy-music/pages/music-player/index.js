// pages/music-player/index.js
// import { getSongDetail, getSongLyric } from '../../service/api_player'
// import { parseLyric } from '../../utils/parse-lyric'
import { audioContext, playerStore } from "../../store/index"

const playModeNames = ["order", "repeat", "random"]
Page({
  data: {
    /**
     * 共享状态
     */
    // id: 0,
    // 网络请求获取的
    currentSong: {}, //歌曲信息
    durationTime: 0, //歌曲总时间
    lyricInfos: [], //歌词信息[{time,text}]

    currentTime: 0, //当前播放时间
    currentLyricIndex: 0, //正在播的歌词索引
    currentLyricText: "", //正在播的歌词

    isPlaying: false, //播放/暂停
    playingName: "pause", //播放/暂停对应icon
    playModeIndex: 0, //播放模式
    playModeName: "order", //播放模式对应icon

    /**
     * 页面信息
     */
    currentPage: 0,
    contentHeight: 0, //内容高度
    sliderValue: 0, //进度条值
    isMusicLyric: true, //歌词是否显示
    isSliderChanging: false, //是否正在拖动
    lyricScrollTop: 0, //歌词实时滚动
  },
  onLoad: function (options) {
    // 1.获取传入的id
    // const id = options.id
    // this.setData({ id })

    // 2.根据id获取歌曲信息 改为 监听数据（获取信息放在item点击时）
    this.setupPlayerStoreListener()

    // 3.动态计算内容高度
    const globalData = getApp().globalData
    const screenHeight = globalData.screenHeight
    const statusBarHeight = globalData.statusBarHeight
    const navBarHeight = globalData.navBarHeight
    const deviceRadio = globalData.deviceRadio
    const contentHeight = screenHeight - statusBarHeight - navBarHeight
    this.setData({ contentHeight, isMusicLyric: deviceRadio >= 2 })

    // 4.创建播放器
    // audioContext.stop()
    // audioContext.src = `https://music.163.com/song/media/outer/url?id=${id}.mp3`
    // audioContext.autoplay = true
    // 5.audioContext的事件监听
    // this.setupAudioContextListener()
  },

  // ========================   audio监听   ========================
  // setupAudioContextListener: function () {
  // audioContext.onCanplay(() => {
  //   audioContext.play()
  // })
  // // 监听时间改变
  // audioContext.onTimeUpdate(() => {
  //   // 1.获取当前时间
  //   const currentTime = audioContext.currentTime * 1000
  //   // 2.如果不是正在拖动，就根据当前时间修改currentTime/sliderValue(当前播放时间和进度条)
  //   if (!this.data.isSliderChanging) {
  //     this.setData({
  //       currentTime,
  //       sliderValue: (currentTime / this.data.durationTime) * 100,
  //     })
  //   }
  //   // 3.根据当前时间去查找播放的歌词
  //   let i = 0
  //   for (; i < this.data.lyricInfos.length; i++) {
  //     const lyricInfo = this.data.lyricInfos[i]
  //     if (currentTime < lyricInfo.time) {
  //       break
  //     }
  //   }
  //   // 设置当前歌词的索引、内容、实时滚动scroll-top⭐
  //   const currentIndex = i - 1
  //   if (this.data.currentLyricIndex !== currentIndex) {
  //     //防止重复执行
  //     const currentLyricInfo = this.data.lyricInfos[currentIndex]
  //     this.setData({
  //       currentLyricText: currentLyricInfo.text,
  //       currentLyricIndex: currentIndex,
  //       lyricScrollTop: currentIndex * 35,
  //     }) // 每行歌词35px
  //   }
  // })
  // },

  // ========================   事件处理   ========================
  // 歌词页海报页切换
  handleSwiperChange: function (event) {
    const current = event.detail.current
    this.setData({ currentPage: current })
  },

  //进度条拖动，这里不需要设置sliderValue（设置数据同步，视图渲染异步，会有问题）
  handleSliderChanging: function (event) {
    const value = event.detail.value
    const currentTime = (this.data.durationTime * value) / 100
    this.setData({ currentTime, isSliderChanging: true })
  },

  //进度条点击
  handleSliderChange: function (event) {
    // 1.获取slider变化的值
    const value = event.detail.value
    // 2.计算需要播放的currentTIme
    const currentTime = (this.data.durationTime * value) / 100
    // 3.设置context播放currentTime位置的音乐
    // audioContext.pause()//去除此操作
    audioContext.seek(currentTime / 1000) //单位秒
    // 4.记录最新的sliderValue, 并且需要将isSliderChaning设置回false
    this.setData({ sliderValue: value, isSliderChanging: false })
  },

  //页面返回
  handleBackBtnClick: function () {
    wx.navigateBack()
  },

  //播放模式
  handleModeBtnClick: function () {
    // 计算最新的playModeIndex
    let playModeIndex = this.data.playModeIndex + 1
    if (playModeIndex === 3) playModeIndex = 0
    // 设置新的状态值
    playerStore.setState("playModeIndex", playModeIndex)
  },
  //播放暂停
  handlePlayBtnClick: function () {
    playerStore.dispatch("changeMusicPlayStatusAction", !this.data.isPlaying)
  },

  //上一首下一首
  handleNewMusicBtnClick: function (event) {
    const isNext = event.currentTarget.dataset.isnext
    playerStore.dispatch("changeNewMusicAction", isNext)
  },
  setupPlayerStoreListener: function () {
    // 1.监听currentSong/durationTime/lyricInfos
    playerStore.onStates(
      ["currentSong", "durationTime", "lyricInfos"],
      ({ currentSong, durationTime, lyricInfos }) => {
        //同时监听三个变量，但是其中一个变量更新时，这里的代码都会执行一遍，所以判断指定的变量更新时执行指定的逻辑
        if (currentSong) this.setData({ currentSong })
        if (durationTime) this.setData({ durationTime })
        if (lyricInfos) this.setData({ lyricInfos })
      }
    )

    // 2.监听currentTime/currentLyricIndex/currentLyricText
    playerStore.onStates(
      ["currentTime", "currentLyricIndex", "currentLyricText"],
      ({ currentTime, currentLyricIndex, currentLyricText }) => {
        //时间变化
        if (currentTime && !this.data.isSliderChanging) {
          this.setData({
            currentTime,
            sliderValue: (currentTime / this.data.durationTime) * 100,
          })
        }
        //歌词变化
        if (currentLyricIndex) {
          this.setData({
            currentLyricIndex,
            lyricScrollTop: currentLyricIndex * 35,
          }) // 每行歌词35px
        }
        if (currentLyricText) {
          this.setData({ currentLyricText })
        }
      }
    )

    // 3.监听播放模式相关的数据
    playerStore.onStates(
      ["playModeIndex", "isPlaying"],
      ({ playModeIndex, isPlaying }) => {
        // 这两个变量的值涉及到 0 和 false，使用undefined判断
        if (playModeIndex !== undefined) {
          this.setData({
            playModeIndex,
            playModeName: playModeNames[playModeIndex],
          })
        }
        if (isPlaying !== undefined) {
          this.setData({
            isPlaying,
            playingName: isPlaying ? "pause" : "resume",
          })
        }
      }
    )
  },
  onUnload: function () {},
})
