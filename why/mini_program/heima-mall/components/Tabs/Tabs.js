// components/Tabs/Tabs.js
Component({
    /**
     * 组件的属性列表
     */
    properties: {
        titleData: {
            type: Array,
            default: []
        }
    },

    /**
     * 组件的初始数据
     */
    data: {

    },

    /**
     * 组件的方法列表
     */
    methods: {
        //标题tabbar点击事件
        titleTap(e) {
            // console.log(e);
            const { index } = e.currentTarget.dataset
            this.triggerEvent("handleTap", index)
        }
    }
})