import { getTopMV } from "../../service/api_video"
// pages/home-video/index.js
Page({
  /**
   * 页面的初始数据
   */
  data: {
    topMV: [],
    hasMore: true,
  },
  handleVideoItemClick() {},
  /**
   * 生命周期函数--监听页面加载
   */
  onLoad: function (options) {
    this.getTopMV(0)
  },
  /**
   * 数据请求
   */
  getTopMV(offset) {
    if (!this.data.hasMore && offset !== 0) return
    // 展示加载动画(小圆圈)
    wx.showNavigationBarLoading()

    let newData = this.data.topMV
    getTopMV(offset).then((res) => {
      if (offset == 0) {
        newData = res.data
      } else {
        newData = newData.concat(res.data)
      }
      this.setData({ topMV: newData })
      this.setData({ hasMore: res.hasMore })
      wx.hideNavigationBarLoading()
      if (offset == 0) {
        wx, wx.stopPullDownRefresh()
      }
    })
  },

  // 事件处理
  handleVideoItemClick: function (event) {
    // 获取id
    const id = event.currentTarget.dataset.item.id
    // 页面跳转
    wx.navigateTo({
      url: `/pages/detail-video/index?id=${id}`,
    })
  },
  //下拉
  onPullDownRefresh: function () {
    this.getTopMV(0)
  },
  //触底
  onReachBottom: function () {
    this.getTopMV(this.data.topMV.length)
  },
})
