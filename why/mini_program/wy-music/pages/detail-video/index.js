// pages/detail-video/index.js
import { getMVURL, getMVDetail, getRelatedVideo } from '../../service/api_video'
Page({

  /**
   * 页面的初始数据
   */
  data: {

    mvURLInfo: {},//mv地址
    mvDetail: {},//mv详细信息
    relatedVideos: [],//推荐
  },

  /**
   * 生命周期函数--监听页面加载
   */
  onLoad: function (options) {
    const id = options.id
    console.log(id)

     // 获取页面的数据
     this.getPageData(id)

     // 其他逻辑
   },
 
   getPageData: function(id) {
     // 1.请求播放地址
     getMVURL(id).then(res => {
       this.setData({ mvURLInfo: res.data })
     }) 
 
     // 2.请求视频信息
     getMVDetail(id).then(res => {
       this.setData({ mvDetail: res.data })
     })
 
     // 3.请求相关视频
     getRelatedVideo(id).then(res => {
       this.setData({ relatedVideos: res.data })
     })
   }
 })