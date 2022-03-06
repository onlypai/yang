//获取节点信息
export default function (selector) {
  return new Promise((resolve) => {
    const query = wx.createSelectorQuery()
    query.select(selector).boundingClientRect()
    query.exec(resolve)//简写
    // query.exec((res) => {
    //   resolve(res)
    // })
  })
}