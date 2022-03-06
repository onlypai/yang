const baseURL = "http://123.207.32.32:9001"
const LOGIN_BASE_URL = "http://123.207.32.32:3000"
class Request {
  constructor(baseurl) {
    this.baseURL = baseurl || baseURL
  }
  request(url, method, params, headerOptions) {
    return new Promise((resolve, reject) => {
      wx.request({
        url: this.baseURL + url,
        method: method,
        header: {
          Authorization: "Bearer " + wx.getStorageSync("token"),
          ...headerOptions,
        },
        data: params,
        success: function (res) {
          resolve(res.data)
        },
        fail: reject,
      })
    })
  }
  get(url, params, headerOptions) {
    return this.request(url, "GET", params, headerOptions)
  }
  post(url, params, headerOptions) {
    return this.request(url, "POST", params, headerOptions)
  }
  put(url, params, headerOptions) {
    return this.request(url, "PUT", params, headerOptions)
  }
  delete(url, params, headerOptions) {
    return this.request(url, "DELETE", params, headerOptions)
  }
}
export default new Request()

const loginRequest = new Request(LOGIN_BASE_URL)
export { loginRequest }
