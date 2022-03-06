import request from './index'

// 歌曲信息
export function getSongDetail(ids) {
  return request.get("/song/detail", {
    ids
  })
}
//歌词
export function getSongLyric(id) {
  return request.get("/lyric", {
    id
  })
}


