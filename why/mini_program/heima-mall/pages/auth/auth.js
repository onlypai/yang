// pages/auth/auth.js
import { request } from '../../request/index.js'
import regeneratorRuntime from '../../lib/runtime/runtime.js'
import { login } from '../../utils/asyncWx.js'
Page({

    /**
     * 页面的初始数据
     */
    data: {

    },

    /**
     * 生命周期函数--监听页面加载
     */
    onLoad: function(options) {

    },
    //获取授权
    async handleAuth(e) {
        try {

            // 1 获取用户信息
            const { encryptedData, rawData, iv, signature } = e.detail;
            // 2 获取小程序登录成功后的code
            const { code } = await login();
            const loginParams = { encryptedData, rawData, iv, signature, code };
            //  3 发送请求 获取用户的token
            const { token } = await request({ url: "/users/wxlogin", data: loginParams, method: "post" });
            console.log(token); //非企业账号没有添加到白名单获取不到token
            // 4 把token存入缓存中 同时跳转回上一个页面
            wx.setStorageSync("token", token);
            wx.navigateBack({
                delta: 1
            });

        } catch (error) {
            console.log(error);
        }
    }
})