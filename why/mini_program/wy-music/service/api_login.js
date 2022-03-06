import { loginRequest } from "./index"
// 获取code
export function getLoginCode() {
  return new Promise((resolve, reject) => {
    wx.login({
      timeout: 1000,
      success: (res) => {
        const code = res.code
        resolve(code)
      },
      fail: (err) => {
        console.log(err)
        reject(err)
      },
    })
  })
}
//登录，获取token
export function codeToToken(code) {
  return loginRequest.post("/login", { code })
}

//验证token是否过期
export function checkToken(token) {
  return loginRequest.post("/auth", {}, {
    token
  })
}
// session_key验证
export function checkSession() {
  return new Promise((resolve) => {
    wx.checkSession({
      success: () => {
        resolve(true)
      },
      fail: () => {
        resolve(false)
      }
    })
  })
}