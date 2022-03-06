// pages/cart/cart.js
import { getSetting, chooseAddress, openSetting, showToast } from '../../utils/asyncWx.js'
import regeneratorRuntime from '../../lib/runtime/runtime.js'
Page({

    /**
     * 页面的初始数据
     */
    data: {
        //地址
        address: {},
        //购物车商品数组
        cart: [],
        //全选
        allChecked: false,
        //总价格
        totalPrice: 0,
        //总数量
        totalNum: 0
    },

    /**
     * 生命周期函数--页面显示：选完地址之后页面显示地址信息而不是按钮
     */
    onShow: function() {
        //获取地址
        const address = wx.getStorageSync("address")
            //获取购物车商品
        const cart = wx.getStorageSync("cart") || [];
        //判断商品是不是全选中，全选中才为true，every对空数组会返回true
        // const allChecked = cart.length ? cart.every(e => e.checked) : false
        this.setData({
            address
        })
        this.setCart(cart)
        console.log(cart);

    },
    //获取地址
    async getAddress() {
        // // 获取权限状态
        // wx.getSetting({
        //     success: (result1) => {
        //         if (result1.authSetting["scope.address"] === false) {
        //             //状态为false打开授权页面
        //             wx.openSetting({});
        //         }
        //         //获取地址
        //         wx.chooseAddress({
        //             success: (res2) => {
        //                 console.log('res2', res2);
        //             },
        //         });
        //     },
        // });

        try {
            // 获取权限状态
            const result1 = await getSetting()
                // console.log(result1);
            if (result1.authSetting["scope.address"] === false) {
                //状态为false打开授权页面
                await openSetting();
            }
            //获取地址
            let address = await chooseAddress()
                //拼接信息保存
            address.all = address.provinceName + address.cityName + address.countyName + address.detailInfo;

            //地址信息保存本地存储
            wx.setStorageSync('address', address);
            console.log(wx.getStorageSync("address"));
        } catch (error) {
            if (error === undefined) return
            console.log(error);
        }
    },
    //商品复选框选中事件
    handleCheck(e) {
        const { goods_id } = e.currentTarget.dataset

        //获取购物车列表
        let { cart } = this.data

        //选中的商品状态取反
        const index = cart.findIndex(item => item.goods_id === goods_id);
        // console.log(index);
        cart[index].checked = !cart[index].checked
        this.setCart(cart)

    },
    //全选按钮点击
    handleItemAllCheck() {
        //获取购物车商品数据和全选状态
        let { cart, allChecked } = this.data
            //全选按钮取反,所有商品状态改变
        allChecked = !allChecked
        cart.forEach(item => item.checked = allChecked)
            //重新添加数据到data中或缓存中
        this.setCart(cart)
    },
    //商品数量加减
    handleNum(e) {
        const { goods_id, operation } = e.currentTarget.dataset
        const { cart } = this.data
            //获取改商品在数组中的索引
        const index = cart.findIndex(item => item.goods_id === goods_id)
        if (cart[index].num === 1 && operation === '-1') {
            wx.showModal({
                title: '提示',
                content: '确定要删除吗',
                showCancel: true,
                cancelText: '取消',
                cancelColor: '#000000',
                confirmText: '确定',
                confirmColor: '#3CC51F',
                success: (result) => {
                    if (result.confirm) {
                        cart.splice(index, 1)
                        this.setCart(cart)
                    }
                },
            });
        } else {
            //设置商品数量
            cart[index].num += Number(operation)
        }

        //重新设置数据
        this.setCart(cart)
    },

    //结算
    async handlePay() {
        const { address, totalNum } = this.data
            //分别判断有没有添加收货地址、购物车中商品为不为空
        if (!address) {
            await showToast({ title: '您还没有添加收货地址' })
            return
        }
        if (totalNum === 0) {
            await showToast({ title: '您的购物车还没有添加商品' })
            return
        }
        wx.navigateTo({
            url: '../pay/pay'
        });
    },
    //封装数据设置
    setCart(cart) {
        //修改过后的购物车商品列表重新添加到本地存储和data中
        //重新渲染底部状态栏
        let allChecked = true
        let totalPrice = 0
        let totalNum = 0
        cart.forEach(item => {
            if (item.checked) {
                //计算总价格和总数目
                totalPrice += item.num * item.goods_price
                totalNum += item.num
            } else {
                //有商品未被选中，全选失败
                allChecked = false
            }
        });
        //注意：如果购物车没有商品，就不会走上面的遍历，那么allChecked就为true了
        allChecked = cart.length ? allChecked : false
        this.setData({
            //保存商品信息
            cart,
            allChecked,
            totalPrice,
            totalNum
        })
        wx.setStorageSync("cart", cart)
    },
})