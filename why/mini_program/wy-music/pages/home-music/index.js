// pages/home-music/index.js
import { rankingStore, rankingMap, playerStore } from "../../store/index"

import { getBanners, getSongMenu } from "../../service/api_music"
import queryRect from "../../utils/query-rect"
import throttle from "../../utils/throttle"

// 轮播高度的bug：获取图片高度失败，节流时保证第一张和最后一张会执行一次
const throttleQueryRect = throttle(queryRect, 1000, { trailing: true })

Page({
  data: {
    swiperHeight: 0,
    banners: [],
    hotSongMenu: [], //热门歌单
    recommendSongMenu: [], //推荐歌单
    recommendSongs: [], //热门榜
    rankings: { 0: {}, 2: {}, 3: {} }, //其余三个榜单歌曲的名字、海报、播放量、前三首歌曲

    currentSong: {},
  },

  onLoad: function (options) {
    // 获取页面数据
    this.getPageData()

    // 发起共享数据的请求
    rankingStore.dispatch("getRankingDataAction")

    // 从store获取共享的数据
    rankingStore.onState("hotRanking", (res) => {
      if (!res.tracks) return
      const recommendSongs = res.tracks.slice(0, 6)
      this.setData({ recommendSongs })
    })
    rankingStore.onState("newRanking", this.getRankingHandler(0)) //这里执行这个函数，内部返回一个函数
    rankingStore.onState("originRanking", this.getRankingHandler(2))
    rankingStore.onState("upRanking", this.getRankingHandler(3))

    playerStore.onState("currentSong", (currentSong) => {
      this.setData({ currentSong })//判断播放工具栏是否显示
    })
  },

  // 网络请求
  getPageData: function () {
    getBanners().then((res) => {
      this.setData({ banners: res.banners })
    })

    getSongMenu().then((res) => {
      this.setData({ hotSongMenu: res.playlists })
    })

    getSongMenu("华语").then((res) => {
      this.setData({ recommendSongMenu: res.playlists })
    })
  },

  // 事件处理
  //搜索
  handleSearchClick: function () {
    wx.navigateTo({
      url: "/pages/detail-search/index",
    })
  },
  //推荐歌曲更多点击
  handleMoreClick: function () {
    this.navigateToDetailSongsPage("hotRanking")
  },
  //巅峰榜三个榜单点击
  handleRankingItemClick: function (event) {
    const idx = event.currentTarget.dataset.idx
    const rankingName = rankingMap[idx]
    this.navigateToDetailSongsPage(rankingName)
  },
  navigateToDetailSongsPage: function (rankingName) {
    wx.navigateTo({
      url: `/pages/detail-songs/index?ranking=${rankingName}&type=rank`,
    })
  },

  // 监听轮播图加载完成，获取图片高度
  handleSwiperImageLoaded: function () {
    // 获取图片的高度(如果去获取某一个组件的高度)
    throttleQueryRect(".swiper-image").then((res) => {
      const rect = res[0]
      this.setData({ swiperHeight: rect.height })
    })
  },

  //歌曲列表item点击
  handleSongItemClick: function (event) {
    playerStore.setState("playListSongs", this.data.recommendSongs)
    playerStore.setState("playListIndex", event.currentTarget.dataset.index)
  },

  onUnload: function () {
    // rankingStore.offState("newRanking", this.getNewRankingHandler)
  },

  // 高阶函数的使用
  getRankingHandler: function (idx) {
    return (res) => {
      if (Object.keys(res).length === 0) return
      const name = res.name //名字
      const coverImgUrl = res.coverImgUrl //海报
      const playCount = res.playCount //播放量
      const songList = res.tracks.slice(0, 3) //前三首歌曲
      const rankingObj = { name, coverImgUrl, playCount, songList }
      const newRankings = { ...this.data.rankings, [idx]: rankingObj } //对象扩展，[idx]动态设置属性名
      this.setData({
        rankings: newRankings,
      })
      // console.log(this.data.rankings)
    }
  },
})
