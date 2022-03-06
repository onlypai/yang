import request from "./index"
//获取mv信息
export function getTopMV(params) {
  return request.get("/top/mv", { offset: params, limit: 10 })
}

/**
 * 请求MV的播放地址
 * @param {number} id MV的id
 */
export function getMVURL(id) {
  return request.get("/mv/url", {
    id,
  })
}

/**
 * 请求MV的详情
 * @param {number} mvid MV的id
 */
export function getMVDetail(mvid) {
  return request.get("/mv/detail", {
    mvid,
  })
}

export function getRelatedVideo(id) {
  return request.get("/related/allvideo", {
    id,
  })
}
