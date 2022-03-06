// pages/user/user.js
Page({

    /**
     * 页面的初始数据
     */
    data: {
        userInfo: {},
        //收藏的商品数
        collectNums: 0
    },

    /**
     * 生命周期函数--监听页面显示
     */
    onShow: function() {
        const userInfo = wx.getStorageSync("userInfo");
        const collect = wx.getStorageSync("collect") || [];
        this.setData({
            userInfo,
            collectNums: collect.length
        })
    },
    getUserInfo() {
        wx.getUserInfo({
            withCredentials: 'false',
            lang: 'zh_CN',
            timeout: 10000,
            success: (res) => {
                const { userInfo } = res
                wx.setStorageSync("userInfo", userInfo);
                this.setData({
                    userInfo
                })
            },
        });
    },

})