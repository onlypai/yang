// pages/search/search.js
import { request } from '../../request/index.js'
import regeneratorRuntime from '../../lib/runtime/runtime.js'
Page({

    /**
     * 页面的初始数据
     */
    data: {
        searchGoods: [],
        //取消按钮的显示隐藏
        isButton: false,
        //input值
        inputValue: ''
    },
    timer: null,
    //输入框输入事件
    inputValue(e) {
        console.log(e.detail);
        let { value } = e.detail

        //函数防抖
        if (this.timer) clearTimeout(this.timer)
        this.timer = setTimeout(() => {
            this.qsearch(value)
        }, 500)
    },
    async qsearch(query) {
        if (!query.trim()) {
            //如果去除两边空格还是为false，就是为空格
            this.setData({
                isButton: false,
                searchGoods: [],
                inputValue: ''
            })
            return
        }
        const res = await request({ url: '/goods/qsearch', data: { query } })
        console.log(res.data.message);
        this.setData({
            isButton: true,
            searchGoods: res.data.message,
            inputValue: query
        })
    },
    //取消按钮的点击事件
    btnTap() {
        this.setData({
            isButton: false,
            searchGoods: [],
            inputValue: ''
        })
    }

})