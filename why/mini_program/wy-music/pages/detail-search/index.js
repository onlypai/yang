// pages/detail-search/index.js
import {
  getSearchHot,
  getSearchSuggest,
  getSearchResult,
} from "../../service/api_search"
import debounce from "../../utils/debounce"
import stringToNodes from "../../utils/string2Nodes"
import { playerStore } from "../../store/index"

const debounceGetSearchSuggest = debounce(getSearchSuggest, 300)

Page({
  data: {
    hotKeywords: [],
    suggestSongs: [], //建议歌曲列表
    suggestSongsNodes: [], //富文本节点数组
    resultSongs: [], //搜索结果
    searchValue: "",
  },
  onLoad: function (options) {
    // 1.获取页面的数据
    this.getPageData()
  },

  // 网络请求
  getPageData: function () {
    getSearchHot().then((res) => {
      this.setData({ hotKeywords: res.result.hots })
    })
  },

  // 事件处理
  handleSearchChange: function (event) {
    this.setData({ resultSongs: [] })
    // 1.获取输入的关键字
    const searchValue = event.detail

    // 2.保存关键字
    this.setData({ searchValue })

    // 3.判断关键字为空字符的处理逻辑
    if (!searchValue.trim().length) {
      this.setData({ suggestSongsNodes: [], suggestSongs: [] })
      debounceGetSearchSuggest.cancel()
      return
    }
    // 4.根据关键字进行搜索
    debounceGetSearchSuggest(searchValue).then((res) => {
      //步骤三到步骤四中，快速退格会有bug
      // if(!this.data.searchValue.length){//这里不能使用searchValue,使用searchValue是上方的值（闭包），还是不为空
      //   return
      // }
      // 1.获取建议的关键字歌曲
      const suggestSongs = res.result.allMatch
      if (suggestSongs) {
        this.setData({ suggestSongs })
        //将文字转化成富文本数据
        const suggestKeywords = suggestSongs.map((item) => item.keyword)
        const suggestSongsNodes = []
        suggestKeywords.forEach((keyword) => {
          const nodes = stringToNodes(keyword, searchValue)
          suggestSongsNodes.push(nodes)
        })
        this.setData({
          suggestSongsNodes,
        })
      } else {
        this.setData({ suggestSongsNodes: [], suggestSongs: [] })
      }
    })
  },
  //输入框回车
  handleSearchAction: function () {
    // 保存一下searchValue

    const searchValue = this.data.searchValue
    getSearchResult(searchValue).then((res) => {
      this.setData({ resultSongs: res.result.songs })
    })
  },
  handleKeywordItemClick: function (event) {
    // 1.获取点击的关键字
    const keyword = event.currentTarget.dataset.keyword

    // 2.将关键设置到searchValue中
    this.setData({ searchValue: keyword })

    // 3.发送网络请求
    this.handleSearchAction()
  },
  //歌曲列表item点击
  handleSongItemClick: function (event) {
    playerStore.setState("playListSongs", this.data.resultSongs)
    playerStore.setState("playListIndex", event.currentTarget.dataset.index)
  },
})
