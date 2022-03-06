// pages/collect/collect.js
Page({

    /**
     * 页面的初始数据
     */
    data: {
        titleData: [{
                id: 0,
                name: '商品收藏',
                isActive: true
            },
            {
                id: 1,
                name: '品牌收藏',
                isActive: false
            },
            {
                id: 2,
                name: '店铺收藏',
                isActive: false
            },
            {
                id: 3,
                name: '浏览痕迹',
                isActive: false
            }
        ],
        collect: []
    },

    /**
     * 生命周期函数--监听页面显示
     */
    onShow: function() {
        const collect = wx.getStorageSync("collect");
        this.setData({
            collect
        })
    },
    //组件子向父传递tabbar点击事件
    handleTap(e) {
        console.log(e);
        const index = e.detail
            //不修改源数据
        const clonetitleData = JSON.parse(JSON.stringify(this.data.titleData))
        clonetitleData.forEach(element => {
            element.id === index ? element.isActive = true : element.isActive = false
        });
        //重新设置数据
        this.setData({
            titleData: clonetitleData
        })
    },

})