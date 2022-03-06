// pages/goods_list/goods_list.js
import { request } from '../../request/index.js'
import regeneratorRuntime from '../../lib/runtime/runtime.js'
Page({

    /**
     * 页面的初始数据
     */
    data: {
        titleData: [{
                id: 0,
                name: '综合',
                isActive: true
            },
            {
                id: 1,
                name: '销量',
                isActive: false
            },
            {
                id: 2,
                name: '价格',
                isActive: false
            },
        ],
        goodsData: []
    },
    //请求参数
    queryData: {
        query: '',
        cid: '',
        pagenum: 1,
        pagesize: 10
    },
    //totalPage总页数
    totalPage: '',
    /**
     * 生命周期函数--监听页面加载
     */
    onLoad: function(options) {
        console.log(options);
        this.queryData.cid = options.cid
        this.getGoodsList()
    },
    /**
     * 页面上拉触底事件的处理函数
     */
    onReachBottom: function() {
        //总页数=math.ceil(商品总数/一页的商品数)=math.ceil(23/10)=3
        if (this.queryData.pagenum < this.totalPage) {
            this.queryData.pagenum++
                this.getGoodsList()
        } else {
            wx.showToast({
                title: '商品加载完成',
            });
        }
    },
    /**
     * 下拉事件
     */
    onPullDownRefresh() {
        /**
         * 下拉要做的事
         * 1、重置商品数据
         * 2、重置当前页码
         * 3、重新发请求
         * */
        this.setData({
            goodsData: []
        })
        this.queryData.pagenum = 1
        this.getGoodsList()
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
    async getGoodsList() {
        const res = await request({ url: '/goods/search', data: this.queryData })
        console.log(res.data.message);
        //总页数=Math.ceil(商品总数/一页的商品数)=Math.ceil(23/10)=3
        this.totalPage = Math.ceil(res.data.message.total / this.queryData.pagesize)
        this.setData({
            //后刷新的商品添加到商品数组中，不是替换
            goodsData: [...this.data.goodsData, ...res.data.message.goods]
        })

        //商品请求加载完之后关闭下拉加载，刚进入页面没有下拉也不会报错
        wx.stopPullDownRefresh()
    }
})