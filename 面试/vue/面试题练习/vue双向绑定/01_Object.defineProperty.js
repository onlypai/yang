const obj = {
        name: 'haha',
        age: 12
    }
    //取值
    // console.log(obj.name)

//赋值
// obj.name='wangyang'

//劫持
Object.defineProperty(obj, 'name', {
    enumerable: true, //当前属性允许被循环
    configurable: true, //当前属性允许被赋值
    get() {
        console.log('正在获取name属性');
        return 'name属性被劫持了，你获取的是这return 的数据'
    },
    set(newVal) {
        console.log('我不需要你的赋值：' + newVal);
    }
})

// console.log(obj.name);
obj.name = 'heihei'