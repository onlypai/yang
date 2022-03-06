// components/play-bar/index.js
import { playerStore } from "../../store/index"
Component({
  /**
   * 组件的属性列表
   */
  properties: {},
  lifetimes: {
    attached: function () {
      // 在组件实例进入页面节点树时执行
      playerStore.onStates(
        ["currentSong", "isPlaying"],
        ({ currentSong, isPlaying }) => {
          if (currentSong) {
            this.setData({ currentSong })
          }
          if (isPlaying !== undefined) {
            this.setData({
              isPlaying,
              playAnimState: isPlaying ? "running" : "paused",
            })
          }
        }
      )
    },
    detached: function () {
      // 在组件实例被从页面节点树移除时执行
    },
  },
  /**
   * 组件的初始数据
   */
  data: {
    isHaveSong: false, //是否存在歌曲
    currentSong: {},
    isPlaying: false,
    playAnimState: "paused",
  },

  /**
   * 组件的方法列表
   */
  methods: {
    handlePlayBtnClick: function () {
      playerStore.dispatch("changeMusicPlayStatusAction", !this.data.isPlaying)
    },
    handlePlayBarClick: function () {
      wx.navigateTo({
        url: "/pages/music-player/index",
      })
    },
  },
})
