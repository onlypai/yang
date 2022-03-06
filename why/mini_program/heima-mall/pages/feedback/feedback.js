// pages/feedback/feedback.js
Page({

    /**
     * 页面的初始数据
     */
    data: {
        imageData: [],
        textValue: '',
    },
    //保存上传的img外网地址
    uploadImgs: [],
    //+号上传图片
    upImage() {
        wx.chooseImage({
            count: 9,
            sizeType: ['original', 'compressed'],
            sourceType: ['album', 'camera'],
            success: (result) => {
                console.log(result.tempFilePaths);
                this.setData({
                    //拼接原来上传的图片
                    imageData: [...this.data.imageData, ...result.tempFilePaths]
                })
            },
        });
    },
    //移除图片
    removeImg(e) {
        const { index } = e.currentTarget.dataset
        console.log(index);
        const imageData = this.data.imageData

        //移除指定索引的图片
        imageData.splice(index, 1)
        this.setData({
            imageData
        })
    },
    //文本域输入事件
    textInput(e) {
        const { value } = e.detail
        this.setData({
            textValue: value
        })
    },
    //按钮提交
    submit() {
        const { imageData, textValue } = this.data
        if (!textValue.trim()) {
            wx.showToast({
                title: '您还没有输入内容',
                icon: 'none',
                mask: true
            });
            return
        }

        //提交时弹出按提示，提交完毕后关闭
        wx.showLoading({
            title: '正在提交',
            mask: true
        });
        //用户选择了图片
        if (imageData.length) {
            imageData.forEach((e, i) => {
                wx.uploadFile({
                    url: 'https://www.hualigs.cn/api/upload',
                    filePath: e,
                    name: 'file',
                    success: (result) => {
                        console.log(result);
                        const url = JSON.parse(result.data).url
                        this.uploadImgs.push(url)

                        //所有图片遍历完了再执行下一步
                        if (i === imageData.length - 1) {
                            console.log('把文本内容和图片地址数组提交到后台中');
                            //关闭提示框
                            wx.hideLoading();
                        }
                    },
                })
            });
        } else {
            //用户没有选择图片
            //只把文本内容提交到后台
        }
    }

})