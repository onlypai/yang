// components/song-item-v2/index.js
import { playerStore } from "../../store/index"
Component({
  /**
   * 组件的属性列表
   */
  properties: {
    index: {
      type: Number,
      value: 0,
    },
    item: {
      type: Object,
      value: {},
    },
  },

  /**
   * 组件的初始数据
   */
  data: {},

  /**
   * 组件的方法列表
   */
  methods: {
    handleSongItemClick: function () {
      const id = this.properties.item.id
      // 页面跳转
      wx.navigateTo({
        url: "/pages/music-player/index",
      })
      // 对歌曲的数据请求和其他操作
      playerStore.dispatch("playMusicWithSongIdAction", { id })
    },
  },
})
