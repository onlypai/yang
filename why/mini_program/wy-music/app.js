import {
  getLoginCode,
  codeToToken,
  checkSession,
  checkToken,
} from "./service/api_login"

// app.js
App({
  globalData: {
    screenWidth: 0,
    screenHeight: 0,
    statusBarHeight: 0,
    navBarHeight: 44,
    deviceRadio: 0,
  },
  onLaunch: async function () {
    const info = wx.getSystemInfoSync()
    this.globalData.screenWidth = info.screenWidth
    this.globalData.screenHeight = info.screenHeight
    this.globalData.statusBarHeight = info.statusBarHeight
    this.globalData.deviceRadio = info.screenHeight / info.screenWidth

    /**
     * 登录
     */
    const token = wx.getStorageSync("token")
    if (!token) {
      this.loginAction()
      return
    }
    const checkTokenRes = await checkToken(token) //errorCode存在则过期
    const checkSessionRes = await checkSession()
    // token不存在、过期、session_key过期都要重新登录
    if (checkTokenRes.errorCode || !checkSessionRes) {
      this.loginAction()
    }
  },
  loginAction: async function () {
    // 1.获取code
    const code = await getLoginCode()

    // 2.将code发送给服务器
    const { token } = await codeToToken(code)
    wx.setStorageSync("token", token)
  },
})
