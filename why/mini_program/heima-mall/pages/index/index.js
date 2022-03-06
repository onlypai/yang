// index.js
import { request } from '../../request/index.js'
// 获取应用实例
const app = getApp()

//Page Object
Page({
    data: {
        //轮播图
        swiperList: [],
        //分类导航
        cateList: [],
        //楼层
        floorList: []
    },
    onLoad: function(options) {
        this.getSwiperList()
        this.getCateList()
        this.getFloorList()
    },
    onReady: function() {

    },
    onShow: function() {

    },
    onHide: function() {

    },
    onUnload: function() {

    },
    onPullDownRefresh: function() {

    },
    onReachBottom: function() {

    },
    onShareAppMessage: function() {

    },
    onPageScroll: function() {

    },
    //item(index,pagePath,text)
    onTabItemTap: function(item) {

    },
    getSwiperList() {
        request({ url: '/home/swiperdata' }).then(res => {
            this.setData({
                swiperList: res.data.message
            })
        })
    },
    getCateList() {
        request({ url: '/home/catitems' }).then(res => {
            // console.log(res);
            this.setData({
                cateList: res.data.message
            })
        })
    },
    getFloorList() {
        request({ url: '/home/floordata' }).then(res => {
            // console.log(res);
            this.setData({
                floorList: res.data.message
            })
        })
    }

});