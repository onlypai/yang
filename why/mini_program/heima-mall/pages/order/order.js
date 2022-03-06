// pages/order/order.js
import { request } from '../../request/index.js'
import regeneratorRuntime from '../../lib/runtime/runtime.js'
Page({

    /**
     * 页面的初始数据
     */
    data: {
        titleData: [{
                id: 0,
                name: "全部",
                isActive: true
            },
            {
                id: 1,
                name: "待付款",
                isActive: false
            },
            {
                id: 2,
                name: "待发货",
                isActive: false
            },
            {
                id: 3,
                name: "退款/退货",
                isActive: false
            }
        ],
        orders: []
    },

    /**
     * 生命周期函数--监听页面显示
     */
    onShow: function() {
        const token = wx.getStorageSync("token");
        if (!token) {
            wx.navigateTo({
                url: '../auth/auth'
            });
            return
        }
        let pages = getCurrentPages();
        const { type } = pages[pages.length - 1].options
        console.log(type);
        this.getOrders(type)
        this.changeTitleStyle(type - 1)

    },
    //订单查询
    async getOrders(type) {
        const res = await request({ url: '/orders/all', data: { type } })
        console.log(res);
        const orders = res.orders
        this.setData({
            orders
        })
    },
    //根据标题索引来激活选中标题
    changeTitleStyle(index) {
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
    //点击事件
    handleTap(e) {
        console.log(e);
        const index = e.detail
        this.changeTitleStyle(index)

        //标题点击重新发送请求
        this.getOrders(index + 1)

    },

})