import request from "./index"

// 获取热门搜索（进来就展示的关键字）
export function getSearchHot() {
  return request.get("/search/hot")
}

// 搜索建议（输入框change）
export function getSearchSuggest(keywords) {
  return request.get("/search/suggest", {
    keywords,
    type: "mobile",
  })
}
// 获取搜索结果
export function getSearchResult(keywords) {
  return request.get("/search", {
    keywords,
  })
}
