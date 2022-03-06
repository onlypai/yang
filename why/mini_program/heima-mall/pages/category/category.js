// pages/category/category.js
import { request } from '../../request/index.js'
import regeneratorRuntime from '../../lib/runtime/runtime.js'
Page({

    /**
     * 页面的初始数据
     */
    data: {
        //左侧菜单数据
        leftCates: [],
        //右侧商品数据
        rightContent: [],
        //菜单项索引
        currentIndex: 0,
        //右侧内容顶部距离
        scrollTop: 0
    },
    //存放所有数据
    cates: [],
    /**
     * 生命周期函数--监听页面加载
     */
    onLoad: function(options) {
        //获取本地存储里面保存的数据
        const Cates = wx.getStorageSync("storageCates");
        if (!Cates) {
            //本地存储没有数据就说明没有请求过,发请求
            this.getCates()
        } else {
            if (Date.now() - Cates.time > 1000 * 10) {
                //本地存储中数据过期（10秒钟），发请求
                this.getCates()
            } else {
                // 使用本地存储中的数据
                this.cates = Cates.data
                let leftCates = this.cates.map(item => item.cat_name)
                let rightContent = this.cates[0].children
                this.setData({
                    leftCates,
                    rightContent
                })
            }
        }

    },

    /**
     * 生命周期函数--监听页面初次渲染完成
     */
    onReady: function() {

    },

    /**
     * 生命周期函数--监听页面显示
     */
    onShow: function() {

    },

    /**
     * 生命周期函数--监听页面隐藏
     */
    onHide: function() {

    },

    /**
     * 生命周期函数--监听页面卸载
     */
    onUnload: function() {

    },

    /**
     * 页面相关事件处理函数--监听用户下拉动作
     */
    onPullDownRefresh: function() {

    },

    /**
     * 页面上拉触底事件的处理函数
     */
    onReachBottom: function() {

    },

    /**
     * 用户点击右上角分享
     */
    onShareAppMessage: function() {

    },
    //获取分类页面数据
    async getCates() {
        //async await
        const res = await request({ url: '/categories' })
        console.log(res);
        this.cates = res.data.message
            //将数据保存在本地存储里面
        wx.setStorageSync("storageCates", { time: Date.now(), data: this.cates });
        //保存左侧菜单名字
        let leftCates = this.cates.map(item => item.cat_name)
            //保存右侧各个菜单的数据
        let rightContent = this.cates[0].children
        this.setData({
            leftCates,
            rightContent
        })
    },
    //左侧菜单点击事件
    menuTap(e) {
        console.log(e);
        const { index } = e.currentTarget.dataset
            //右侧内容跟随点击变化
        let rightContent = this.cates[index].children
        this.setData({
            //菜单样式跟随点击改变
            currentIndex: index,
            //右侧商品内容改变
            rightContent,
            //右侧内容置顶
            scrollTop: 0
        })
    }
})