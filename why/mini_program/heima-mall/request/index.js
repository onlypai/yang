let requestNum = 0
export const request = (params) => {
    //设置请求头中的token
    const header = {...params.header } //这样解构header属性，之后也可以在外面传递其他的请求头信息，如果直接设置为{}，那么下面request设置的header就只能包含Authorization了

    //判断url中是否有/my/字段（有这个字段的请求都需要带上token）
    if (params.url.includes('/my/')) {
        header["Authorization"] = wx.getStorageSync("token")
    }

    //请求一次，请求数就加一
    requestNum++
    //显示请求中loading
    wx.showLoading({
        title: '正在加载',
        mask: true, //mask表示请求过程中不允许点击屏幕做其他事情
    });
    const baseUrl = 'https://api-hmugo-web.itheima.net/api/public/v1'
    return new Promise((resolve, reject) => {
        wx.request({
            // url: '',
            // data: {},
            // header: {'content-type':'application/json'},
            // method: 'GET',
            // dataType: 'json',
            // responseType: 'text',
            header,
            ...params, //params就是上面的某些配置
            url: baseUrl + params.url,
            success: (res) => {
                resolve(res)
            },
            fail: (err) => {
                reject(err)
            },
            //complete指无论成功失败都执行的事件
            complete() {
                //一个请求完成了就-1
                requestNum--
                //同时执行多个请求时当最后一个请求完成才关闭加载loading
                if (requestNum === 0) {
                    wx.hideLoading();
                }
            }
        });
    })

}