import request from "./index"
// 轮播图
export function getBanners() {
  return request.get("/banner", {
    type: 2,
  })
}
// 歌曲榜单
// 0 飙升
// 1 热门
// 2 新歌
// 3 原创
export function getRankings(idx) {
  return request.get("/top/list", {
    idx,
  })
}
// cat -> category 类别
export function getSongMenu(cat = "全部", limit = 6, offset = 0) {
  return request.get("/top/playlist", {
    cat,
    limit,
    offset,
  })
}
//歌单item里面的歌曲
export function getSongMenuDetail(id) {
  return request.get("/playlist/detail/dynamic", {
    id
  })
}