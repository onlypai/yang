class Vue {
    constructor(options) {
        this.$data = options.data

        //调用数据劫持的方法
        Observe(this.$data)

        //属性代理
        Object.keys(this.$data).forEach(key => {
            //把data里的属性直接加到vm示例上面
            Object.defineProperty(this, key, {
                enumerable: true,
                configurable: true,
                get() {
                    return this.$data[key]
                },
                set(newVal) {
                    this.$data[key] = newVal
                }
            })
        })

        //执行模板编译的方法
        Compile(options.el, this)
    }
}

function Observe(obj) {
    //递归的终止条件
    if (!obj || typeof obj !== 'object') return
    const dep = new Dep()

    Object.keys(obj).forEach(key => { //obj对象的属性

        let value = obj[key]
        Observe(value) //value是子节点，进行递归，目的将内部属性的属性设置getter和setter

        Object.defineProperty(obj, key, {
            enumerable: true,
            configurable: true,
            get() {
                // console.log(`获取到了${key}属性`)
                Dep.target && dep.addSubs(Dep.target) //将订阅者添加到数组中
                return value
            },
            set(newVal) {
                // console.log(`${key}被重新定义`);
                value = newVal

                //新赋值的对象进行递归
                Observe(value)

                //调用notify通知订阅者进行更新
                dep.notify()
            }
        })
    })
}

function Compile(el, vm) {
    //保存要操作的dom节点
    vm.$el = document.querySelector(el)

    //创建文档碎片，提高DOM的操作性能
    //1、将节点中的dom元素全部加到文档碎片中去
    const fragment = document.createDocumentFragment()
    while (childNode = vm.$el.firstChild) { //while循环
        fragment.appendChild(childNode)
    }

    //2、在这里进行模板编译
    replace(fragment)

    //3、将文档碎片再次渲染到页面上
    vm.$el.appendChild(fragment)



    //定义模板编译的方法
    function replace(node) {
        //定义匹配差值表达式的正则
        const reg = /\{\{\s*(\S+)\s*\}\}/ //(\S+)加上括号是提取内容

        //当前节点是一个文本节点时，进行正则替换
        if (node.nodeType === 3) {
            //注意：文本节点也是一个对象，需要通过textContent属性拿到文本内容
            const text = node.textContent
            console.log(text);
            const execResult = reg.exec(text)
            if (execResult) { //空白文本就不存在这个数组
                console.log(execResult); //["{{info.a}}", "info.a", index: 9, input: "info.a的值是{{info.a}}", groups: undefined]
                const value = execResult[1].split('.').reduce((newVal, key) => newVal[key], vm)
                node.textContent = text.replace(reg, value)

                //在这里创建watcher订阅者实例
                new Watcher(vm, execResult[1], (newVal) => {
                    node.textContent = text.replace(reg, newVal)
                })
            }

            //递归终止
            return
        }


        //判断是不是input输入框
        if (node.nodeType === 1 && node.tagName.toUpperCase() === 'INPUT') {
            // console.dir(node);
            //获取input元素的所有属性节点数组
            // console.log(node.attributes);
            const attrs = Array.from(node.attributes)

            // console.dir(attrs)
            const findResult = attrs.find(x => x.name === 'v-model')
            if (findResult) {
                //获取值  v-model="info.a"
                const attrVal = findResult.value
                const value = attrVal.split('.').reduce((newVal, k) => newVal[k], vm)

                //给input输入框赋值
                node.value = value

                //创建watcher实例
                new Watcher(vm, attrVal, (newVal) => {
                    node.value = newVal
                })


                //实现文本框输入事件
                node.oninput = function(e) {
                    const keyArr = attrVal.split('.')
                    const val = keyArr.slice(0, keyArr.length - 1).reduce((newVal, k) => newVal[k], vm)
                    val[keyArr[keyArr.length - 1]] = e.target.value
                }
            }

        }


        //如果该节点下还有dom节点，就往子节点进行递归
        node.childNodes.forEach(item => {
            replace(item)
        })
    }
}

//定义依赖收集/收集订阅者的类
class Dep {
    constructor() {
        //watcher保存到数组中
        this.subs = []
    }

    //添加到数组中的方法
    addSubs(watcher) {
        this.subs.push(watcher)
    }

    //负责通知watcher的方法
    notify() {
        this.subs.forEach(item => { item.update() })
    }
}

//订阅者的类
class Watcher {
    /**
     * 
     * @param {*} vm 拿到最新的数据（数据都在vm中）
     * @param {*} key 在vm众多的数据中，要知道哪一个数据是当前需要的数据
     * @param {*} cb 回调函数记录着watcher如何更新自己的文本内容
     */
    constructor(vm, key, cb) {
        this.vm = vm
        this.key = key
        this.cb = cb


        //*****关键：下面三行负责把watcher订阅者实例保存到subs数组中****
        Dep.target = this //this就是watcher订阅者实例,保存在自定义属性target中
        key.split('.').reduce((newVal, k) => newVal[k], vm) //表面是在获取key属性，获取的同时实则调用getter，见上
        Dep.target = null //取消指向

    }

    //watcher的实例，需要有update方法，让发布者知道我们再更新内容
    update() {
        const value = this.key.split('.').reduce((newVal, k) => newVal[k], vm)
        this.cb(value)
    }
}