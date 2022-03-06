/* 
1 页面加载的时候
  1 从缓存中获取购物车数据 渲染到页面中
    这些数据  checked=true 
2 微信支付
  1 哪些人 哪些帐号 可以实现微信支付
    1 企业帐号 
    2 企业帐号的小程序后台中 必须 给开发者 添加上白名单 
      1 一个 appid 可以同时绑定多个开发者
      2 这些开发者就可以公用这个appid 和 它的开发权限  
3 支付按钮
  1 先判断缓存中有没有token
  2 没有 跳转到授权页面 进行获取token 
  3 有token 。。。
  4 创建订单 获取订单编号
  5 已经完成了微信支付
  6 手动删除缓存中 已经被选中了的商品 
  7 删除后的购物车数据 填充回缓存
  8 再跳转页面 
 */
import { requestPayment } from "../../utils/asyncWx.js";
import regeneratorRuntime from '../../lib/runtime/runtime';
import { request } from "../../request/index.js";
Page({
    data: {
        address: {},
        cart: [],
        totalPrice: 0,
        totalNum: 0
    },
    onShow() {
        // 1 获取缓存中的收货地址信息
        const address = wx.getStorageSync("address");
        // 1 获取缓存中的购物车数据
        let cart = wx.getStorageSync("cart") || [];
        // 过滤后的购物车数组，只有选中的才会进行支付操作
        cart = cart.filter(v => v.checked);
        this.setData({ address });

        // 1 总价格 总数量
        let totalPrice = 0;
        let totalNum = 0;
        cart.forEach(v => {
            totalPrice += v.num * v.goods_price;
            totalNum += v.num;
        })
        this.setData({
            cart,
            totalPrice,
            totalNum,
            address
        });
    },
    //支付
    async handleOrderPay() {
        try {
            const token = wx.getStorageSync("token");
            if (!token) {
                wx.navigateTo({
                    url: '../auth/auth'
                });
            }
            //创建订单
            //请求头
            // const header = { Authorization: token }

            //请求体
            const order_price = this.data.totalPrice;
            const consignee_addr = this.data.address.all;
            //商品字段说明
            const cart = this.data.cart;
            let goods = []
            cart.forEach(item => goods.push({
                goods_id: item.goods_id,
                goods_number: item.num,
                goods_price: item.goods_price
            }))
            const orderParams = { order_price, consignee_addr, goods };

            //发送创建订单请求 获取订单编号
            const { order_number } = request({ url: '/my/orders/create', data: orderParams, })

            //发送预支付请求，获取调用微信支付方法的所需参数
            const { pay } = await request({ url: "/my/orders/req_unifiedorder", method: "POST", data: { order_number } });

            //发起微信支付
            await requestPayment(pay)

            //查询订单状态
            const res = await request({ url: "/my/orders/chkOrder", method: "POST", data: { order_number } });
            console.log(res);
            await showToast({ title: "支付成功" });

            //支付成功了，手动删除购物车中刚刚购买的商品
            let newCart = wx.getStorageSync('cart');
            newCart = newCart.filter(item => !item.checked)
            wx.setStorageSync("cart", newCart);

            // 跳转到订单页面
            wx.navigateTo({
                url: '/pages/order/order'
            });
        } catch (error) {
            await showToast({ title: "支付失败" });
        }
    }
})