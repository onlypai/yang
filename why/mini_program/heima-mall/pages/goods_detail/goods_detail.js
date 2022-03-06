// pages/goods_detail/goods_detail.js
import { request } from '../../request/index.js'
import regeneratorRuntime from '../../lib/runtime/runtime.js'
Page({

    /**
     * 页面的初始数据
     */
    data: {
        //商品信息
        goodsData: {},
        //商品是否被收藏
        isCollect: false
    },
    //商品信息：点击预览大图使用
    GoodsData: {},

    /**
     * 生命周期函数--监听页面加载
     */
    onShow: function() {
        var pages = getCurrentPages();
        const options = pages[pages.length - 1].options

        //查找收藏缓存中有没有这个商品  放在这里不行

        this.getGoodsData(options.goods_id)
    },
    //获取商品详情数据
    async getGoodsData(id) {
        const res = await request({ url: '/goods/detail', data: { goods_id: id } })
        const data = res.data.message
        console.log(data);
        this.GoodsData = data
        const collect = wx.getStorageSync("collect") || [];
        //查找收藏缓存中有没有这个商品
        let isCollect = collect.some(v => v.goods_id === this.GoodsData.goods_id)
        this.setData({
            goodsData: {
                //只保存页面需要展示的数据
                pics: data.pics,
                goods_price: data.goods_price,
                goods_name: data.goods_name,
                goods_introduce: data.goods_introduce.replace(/\.webp/g, '.jpg')
            },
            isCollect
        })
    },
    //图片点击事件
    handlePreviewImage(e) {
        // console.log(e.currentTarget.dataset);
        const { url } = e.currentTarget.dataset
        const picList = this.GoodsData.pics.map(item => item.pics_mid)
        wx.previewImage({
            current: url, // 当前显示图片的http链接
            urls: picList // 需要预览的图片http链接列表
        })
    },
    //商品加入购物车
    addToCart() {
        console.log('11111');
        //获取本地存储中的购物车信息,没有就是空数组
        const Cart = wx.getStorageSync("cart") || [];
        //判断该商品是不是在购物车中，在：数量num加一，不在：加入并且数量为一
        const index = Cart.findIndex(item => item.goods_id === this.GoodsData.goods_id)
        if (index === -1) {
            //索引返回-1表示不存在该商品，加入
            //计数为1
            this.GoodsData.num = 1
                //购物车选中状态默认选中
            this.GoodsData.checked = true
            Cart.push(this.GoodsData)
        } else {
            //存在，则该商品数量加一
            Cart[index].num += 1
        }
        //将购物车数据存到本地
        wx.setStorageSync('cart', Cart);
        //成功加入，弹框提示
        wx.showToast({
            title: '加入购物车成功',
            icon: 'success',
            image: '',
            duration: 1000,
            mask: true,
        });
    },
    //收藏按钮点击
    handleCollect() {
        let collect = wx.getStorageSync("collect") || [];
        let isCollect = false

        //判断缓存中有没有该商品
        console.log(
            this.GoodsData.goods_id
        );
        const index = collect.findIndex(v => v.goods_id === this.GoodsData.goods_id)
        console.log(index);
        if (index !== -1) {
            //该商品已被收藏
            isCollect = false
            collect.splice(index, 1)
            wx.showToast({
                title: '已取消收藏',
                duration: 1000,
                mask: true
            });
        } else {
            isCollect = true
            collect.push(this.GoodsData)
            wx.showToast({
                title: '收藏成功',
                duration: 1000,
                mask: true
            });
        }
        //重新设置数据
        this.setData({
            isCollect
        })

        //重新设置收藏缓存
        wx.setStorageSync("collect", collect);
    }
})