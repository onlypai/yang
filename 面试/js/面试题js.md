## es8

### str.`padstart`、`padend`

padstart(targetlength,padString)字符串补齐      //targetlength目标长度，padString填充字符串（可选）

```js
'abc'.padStart(10);         // "       abc"
'abc'.padStart(10, "foo");  // "foofoofabc"
'abc'.padStart(6,"123465"); // "123abc"
'abc'.padStart(8, "0");     // "00000abc"
'abc'.padStart(1);          // "abc"
```

### str.`repeat`

返回一个新字符串，该字符串包含被连接在一起的指定数量的字符串的副本。

参数是介于 `0` 和 [`+Infinity`](https://developer.mozilla.org/zh-CN/docs/Web/JavaScript/Reference/Global_Objects/Number/POSITIVE_INFINITY) 之间的整数。表示在新构造的字符串中重复了多少遍原字符串。

```
"abc".repeat(-1)     // RangeError: repeat count must be positive and less than inifinity
"abc".repeat(0)      // ""
"abc".repeat(1)      // "abc"
"abc".repeat(2)      // "abcabc"
"abc".repeat(3.5)    // "abcabcabc" 参数count将会被自动转换成整数.
"abc".repeat(1/0)    // RangeError: repeat count must be positive and less than inifinity
```

## 面试

### 1、算法题：深拷贝

方式一：

```js
JSON.parse(JSON.stringify(data))
```

可以实现一般数据的深拷贝，

缺点：1、 如果对象里面有**时间对象**，则序列化结果：**时间对象=>字符串的形式；**

2、 如果对象里有**RegExp、Error对象**，则序列化的结果将只得到**空对象 RegExp、Error => {}；**

3、 如果对象里有 **function,undefined**，则序列化的结果会把 **function,undefined 丢失**;

4、如果对象里有**NaN、Infinity和-Infinity**，则序列化的结果会变成**null；**

5、 如果对象里有对象是由**构造函数**生成的，则序列化的结果会**丢弃对象的 constructor；**

6、 如果对象中**存在循环引用**的情况也无法实现深拷贝



方式二：

以上是JSON.parse(JSON.stringify(data))的弊端，可以``借用MessageChannel实现深拷贝``

MessageChannel允许我们创建一个新的消息通道，使用port属性发送数据（两个端口都是只读的），

**一个端口只要绑定了onmessage回调方法，就可以接收来自另一个端口的数据，每个端口都可以通过postMessage发送数据**

```js
const channel=new MessageChannel()
var port1=channel.port1
var port2=channel.port2
port1.onmessage=function(e){
    console.log('接收端口2的数据',e.data)
}
port2.postmessage('端口2的数据哈哈哈')
```

通过postMessage方法传递参数实现深拷贝      循环引用也能解决

```js
const textObj = {
    a: 1,
    b: [1, 23, 3],
    c: {
        aa: 1
    }
}
//循环引用
textObj.c.bb = textObj.c

function deepC(obj) {
    return new Promise(resolve => {
        const {
            port1,
            port2
        } = new MessageChannel()
        port2.onmessage = e => resolve(e.data)
        port1.postMessage(obj)
    })
}
//此方法是异步的
async function text(obj) {
    const deepObj = await deepC(obj)
    console.log(deepObj)
}
text(textObj)
```





方式三：递归拷贝所有层级

`obj.hasOwnProperty(key) `  //判断一下key是不是obj自己拥有的属性，保证key不是原型的属性

```js
function deepClone(obj) {
    //递归终止
    if (typeof obj !== 'object' || obj === null) return
    //数组对象的判断
    const cloneObj = Array.isArray(obj) ? [] : {}
    //遍历
    for (let key in obj) {
        //判断key是不是自己拥有的属性，保证不是原型上面的属性
        if (obj.hasOwnProperty(key)) {
            if (obj[key] && typeof obj[key] === 'object') {
                //递归
                cloneObj[key] = deepClone(obj[key])
            } else {
                cloneObj[key] = obj[key]
            }
        }
    }
    return cloneObj
}
```



方式四：lodash.js库

可以实现深拷贝和浅拷贝

### 1-1浅拷贝

方式一：let deepObj=Object.assign({},obj)

方式二：let deepObj={...obj}

### 2、关于Object.prototype.toString.call()

这种方式可以很好的区分各种类型，但是无法区分自定义对象类型，自定义对象类型可以采用`instanceof`

```js
console.log(Object.prototype.toString.call("jerry"));//[object String]
console.log(Object.prototype.toString.call(12));//[object Number]
console.log(Object.prototype.toString.call(true));//[object Boolean]
console.log(Object.prototype.toString.call(undefined));//[object Undefined]
console.log(Object.prototype.toString.call(null));//[object Null]
console.log(Object.prototype.toString.call({name: "jerry"}));//[object Object]
console.log(Object.prototype.toString.call(function(){}));//[object Function]
console.log(Object.prototype.toString.call([]));//[object Array]
console.log(Object.prototype.toString.call(new Date));//[object Date]
console.log(Object.prototype.toString.call(/\d/));//[object RegExp]
function Person(){};
console.log(Object.prototype.toString.call(new Person));//[object Object]
```

### 3、算法题：Array.isArray 和 instanceof 

Array.isArray

​	如果参数是数组一定返回true，否则就返回false，判断对象或者数组时可以很好的使用，可以在任何地方使用

instanceof  例：obj instanceof Array

​	instanceof的原理是`判断右边参数的原型是否在左边参数的原型链上`，

​	不能跨iframe 工作，新环境中不能使用

### 4、输出指定格式的时间日期

转化成了时间戳（getTime（））以后不能使用getFullYear（）...

```js
function getTime() {
    var date = new Date()
    // console.log(date);
    var Y = date.getFullYear() + '-',
        M = (date.getMonth() + 1 < 10 ? '0' + (date.getMonth() + 1) : date.getMonth() + 1) + '-',
        D = (date.getDate() < 10 ? '0' + date.getDate() : date.getDate()) + ' ',
        h = (date.getHours() < 10 ? '0' + date.getHours() : date.getHours()) + ':',
        m = (date.getMinutes() < 10 ? '0' + date.getMinutes() : date.getMinutes()) + ':',
        s = (date.getSeconds() < 10 ? '0' + date.getSeconds() : date.getSeconds())
    console.log(Y + M + D + h + m + s);
    return Y + M + D + h + m + s
}
getTime()

//倒计时
setInterval(() => {
    var date = new Date('2022-2-1').getTime()
    var dateDiff = (date - Date.now()) / 1000
    // console.log(dateDiff); //时间差：秒
    var day = parseInt(dateDiff / (60 * 60 * 24))
    // console.log(day); //天
    var hour = parseInt((dateDiff - day * (60 * 60 * 24)) / 3600)
    // console.log(hour);
    var min = parseInt((dateDiff - day * 3600 * 24 - hour * 3600) / 60)
    // console.log(min);
    var sec = parseInt(dateDiff - day * 3600 * 24 - hour * 3600 - min * 60)
    // console.log(sec);
    console.log(`距2020年春节还有${day}天${hour}小时${min}分钟${sec}秒`);
}, 1000);
```

### 5、算法题：js打印出FIbonacci数

```js
//num是数组长度
function fibonacci(num){
    var arr=num>0?[1]:[]
    if(num>1){
        for(let index=1;index<num;index++){
            //如果说当前长度大于2，就 当前值=前两个值相加，否则就 前一个值+0
            arr.push(arr[index-1]+(index>=2?arr[index-2]:0))
        }
    }
    return arr
}
console.log(fibonacci(20))
```



### 6、switch case中有的地方用到了break和return，怎么用的

执行break会跳出switch循环 ,然后执行switch下面的语句;

执行return跳出方法。

不用break会发生`击穿现象,执行到下一个case`,

不用return 被调用的函数没有返回值(`undefined`)。

### 7、跨域的几种方法

同源策略：两个url的协议、域名、端口号都相同

img、link、script这三个标签是允许跨域加载资源的

##### 解决跨域的几种方法

jsonp：利用创建script标签以及它的src属性实现跨域

cors：跨域资源共享，Jsonp只支持Get请求，cors支持所有类型的HTTP请求

postMessage：实现跨文本档、多窗口、跨域消息传递。

window.name

websocket



jsonp的步骤：需要在前端和后端都要设置，这里介绍前端的步骤

```js
//创建script标签
var script=document.createElement('script')
//设置回调函数(数据请求回来会触发的函数)
function getData(data){
    //数据
    console.log(data)
}
//设置script标签的src属性
script.src='http://127.0.0.1:3000?callback=getData'
//将script添加到页面上(让标签生效)
document.applendChild('script')
```



### 8、算法题：数组去重

```js
//方法一：for循环嵌套
//获取当前元素
for (let i = 0; i < arr.length; i++) {
    //获取当前元素后一位元素
    for (let j = i + 1; j < arr.length; j++) {
        //两元素相同就把后一位删除，并且后退一位检查有没有连续重复
        if (arr[i] === arr[j]) {
            arr.splice(j, 1)
            j--
        }
    }
}


//方法二：Set集合+扩展运算符
let arr1 = [...new Set(arr)]


//方法三：obj[arr[i] + typeof arr[i]]
var arr2 = [3, 2, 3, 1, 4, true, false, "3", "22", "2", 2]
function noRepeat(arr) {
    let resArr = []
    let obj = {}
    for (let i = 0; i < arr.length; i++) {
        if (!(obj[arr[i] + typeof arr[i]])) {
            resArr.push(arr[i])
            obj[arr[i] + typeof arr[i]] = 1
        }
    }
    return resArr
}
console.log(noRepeat(arr2));


//方法四：for循环+indexOf
Array.prototype.noRepeat = function() {
    const hash = []
    for (let i = 0; i < this.length; i++) {
        //新数组中没有这个元素，就添加进去
        if (hash.indexOf(this[i]) == -1) {
            hash.push(this[i])
        }
    }
    return hash
}
```

### 9、document.write()和innerHTML()有什么区别 

document.write()只能重绘整个页面

innerHTML可以重绘页面的一部分

### 10、算法题：手写bind函数

```js
        function aaa() {
            console.log(...arguments);
            console.log("this:", this);
        }

        //方式一
        // const binda = aaa.bind({
        //     name: 'wangyang'
        // }, 12, 2, 56, 4)
        // binda()

        //方式二
        // const binda = aaa.bind({
        //     name: 'wangyang'
        // })(12, 2, 56, 4)


        //手动实现方式一
        /**
         * 函数aaa可以调用bind方法，说明Function.prototype上面有bind方法，因为aaa.hasOwnProperty('bind')=false
         * 
         */
        Function.prototype.myBind = function() {
            const self = this

            //将参数类数组变成数组
            const args = Array.prototype.slice.call(arguments)

            //分别获取第一个参数对象和后面的参数
            const thisValue = args.shift() //头部删除返回删除的
                // console.log(args);
                // console.log(thisValue);
            return function() {
                return self.call(thisValue, args)
            }
        }
        const res = aaa.myBind({
            name: 'kobe'
        }, 1, 2, 5)
        res()
```

### 11、get和post的区别

get一般用于获取信息，使用url传递参数，有数量限制，一般是2000字节左右

post一般用于修改服务器上的资源，对所发的信息没有限制

### 12、call和apply的区别

Function.prototype.call和Function.prototype.apply的作用是一样的，只是传入的参数不同

第一个参数都是指定函数体内this的指向

第二个参数开始不同，apply是`带下标的集合，数组或者类数组`，call从第二个开始传入的参数是不固定的，都会传递给函数作为参数

call比apply的性能要好，call传入的参数格式正是内部所需要的格式

### 13、瀑布流布局

##### 算法题：返回数组中的最小的值

```js
//返回数组中最小的值
const arr1 = [13, 51, 6, 2, 34, 58]

//1、排序法
arr1.sort(function(a, b) {
    return a - b
})
console.log(arr1[0]);

//2、假设最小的就是第一个
let min = arr1[0]
for (const key of arr1) {
    min < key ? min : min = key
}
console.log(min);

//3、Math.min
let min = Math.min.apply(null, arr1)
console.log(min);

//4、扩展运算符+Math.min
console.log(Math.min(...arr1));
```

##### 算法题：找到数组最小值的索引

```js
//找到最小值的索引
//1、findIndex
const minNum = Math.min(...arr1)
const i = arr1.findIndex(item => item === minNum)
console.log(i);

//2、判断
let num = 9999999
let index
for (const i in arr1) {
    if (arr1[i] < num) {
        num = arr1[i]//num=越小的那个值
        index = i
    }
}
console.log(index);
```

##### 流式布局

```html
    <div id="wrap">
        <div class="box"><img src="0.jpg" alt=""></div>
        <div class="box"><img src="1.jpg" alt=""></div>
    </div>
```

```css
 #wrap {
     width: 1500px;
     height: 2000px;
     position: relative;
     margin: 0 auto;
}

.box {
    float: left;//需要
    padding: 15px;
}

img {
    width: 270px;//需要
    border-radius: 7px;
}
```

```js
        window.onload = function() {
            /**
             * 瀑布流思路
             * 1、获取列数cols
             * 2、创建数组heightArr（长度就是列数，记录每一列的高度），存放高度值：第一行有cols个图片，获取最短的那个高度及索引，第二行开始往最短的那个下面插入（使用定绝对位），之后记录插入之后那一列的高度
             * 3、遍历所有图片，定位图片位置：第一行的图片高度直接插入到数组，第二行开始每插入一张计算一次
             */
            let div = document.getElementsByClassName('box')

            ;
            (function() {
                //1、获取列数(外包裹宽度/每个div宽度)
                let divWidth = div[0].offsetWidth
                let cols = parseInt(wrap.offsetWidth / divWidth)

                const heightArr = []
                for (let i = 0; i < div.length; i++) {
                    if (i < cols) { //第一行
                        let divHight = div[i].offsetHeight //div高度
                        heightArr.push(divHight)
                    } else {
                        // 从第二行开始，第二行第一张插入到第一行最短的那张图片下面
                        //获取最短的图片高度
                        let numHig = Math.min(...heightArr)
                            //获取最短图片索引
                        let numIndex = heightArr.findIndex(item => item === numHig)

                        //插入的那张的位置
                        div[i].style.position = 'absolute'
                        div[i].style.top = numHig + 'px'
                        div[i].style.left = numIndex * divWidth + 'px'
                        //更新数组中插入的那一列高度
                        heightArr[numIndex] += div[i].offsetHeight
                    }
                }
            })()
```

### 14、伪数组（类数组）

有length属性，可以通过索引索取，不具有数组的pop、push等方法

将伪数组转化成数组：

除了这三种方法，还可以使用遍历伪数组，将所有元素添加到数组中

```js
Array.from(div)
Array.prototype.slice.call(div)
[].slice.call(div)
```

### 15、算法题：数组冒泡排序（不使用sort）

```js
const arr = [1, 3, 521, 2, 4, 7, 42, 32, 9]
function mySort(arr) {
    for (let i = 0; i < arr.length; i++) {
        for (let j = i + 1; j < arr.length; j++) {
            var cur = arr[i];
            var index = arr[j];
            //前面大于后面就交换位置
            if (cur > index) {
                // 交换值
                arr[j] = cur;
                arr[i] = index;
            }
        }
    }
    return arr
}
console.log(mySort(arr));
```

### 16、算法题：找到一个字符串中出现频率最高的字符

```js
let str = 'wangyanghanhan'
let obj = {}//键：字符串中的字符，值：字符出现次数
let maxChar = '' //记录出现最多的那个字符
let max = 0 //记录最多的那个字符出现的次数
for (let i = 0; i < str.length; i++) {
    let char = str.charAt(i)
    if (obj[char]) {
        obj[char]++
    } else {
        obj[char] = 1 //比如说第一个字符w，obj['w']不存在，所以执行这里，让他等于1，接下来如果再有w，就+1，对象里面记录的值是字符出现的次数
    }
    if (max < obj[char]) {
        max = obj[char]
        maxChar = char
    }
}
//判断其他字符出现次数是不是最多
for (const i in obj) {
    if (obj[i] == max) {
        console.log('出现最多的字符是:', i);
        console.log('最多的次数是:', max);
    }
}
console.log(obj);
```

### 17、null：空对象指针和undefined：未初始化变量

null的值是一个空对象的指针，将来要保存对象值的变量时，可以使用null来初始化

对于==相等运算符，`null == undefined返回true`，并且他们两个与其他任何值都是不相等的

==运算符是先判断元类型，再使用`Number()`做转换，换一种理解，如下

```
`null` 表示是一个空对象指针，可以看作属于 `无值类型`
 `undefined` 表示未赋值，属于`无值类型`
 
 `''` 表示是一个空字符串，属于 `有值类型`
 `0` 表示一个数字0，属于`有值类型`
 `false` 表示一个布尔值 false，也属于`有值类型
```

虽然他们都是假值，但正是由于这个原因，`null==0为false`....

`null>0`为false，比较运算符中，如果一端为数字，会把另一端转化成数字去比较，正如上面所说，Number(null)=0

但是：`null>=0`为true

注意：**a>=b可以看作是!(a<b)**，并不是a>b||a=b，所以上面为true



变量未申明 但是使用typeof还是会返回undefined，所以建议申明的同时都初始化变量，这样使用typeof检测的如果是undefined就都是未申明得了

```js
let aa
console.log(typeof aa)//'undefined'
console.log(typeof bb)//'undefined'  
```

### 18、算法题：数组反转

```js
const arr1 = ['a', 2, 15, 666, 78787]
//第一种：for循环从后向前遍历数组，将其添加到新数组中
function arrReserve(arr) {
    let resArr = []
    for (i = arr.length - 1; i >= 0; i--) {
        resArr[resArr.length] = arr[i]
    }
    return resArr
}
console.log(arrReserve(arr1))

//第二种：从中间建立分隔符，将左右两边的交换
const arr2 = [5, 55, 555, 5555, 55555]

function rev(arr) {
    let resArr = JSON.parse(JSON.stringify(arr))
    for (let i = 0; i < resArr.length / 2; i++) {
        //保存左边的部分
        let temp = resArr[i]
        //将左边的值改为右边的
        resArr[i] = resArr[resArr.length - 1 - i]
        //将右边的改成左边的
        resArr[resArr.length - 1 - i] = temp

    }
    return resArr
}
console.log(rev(arr2));
```



## webpack中的loader和plugins的区别

loader：文件加载器，加载资源文件，对文件进行编译、压缩处理，将浏览器上运行不了的东西编译成html、css、js文件，是**单纯的文件转换操作**

plugins：扩展器，针对的是loader结束后，webpack打包的整个过程，并不直接操作文件，而是基于事件机制工作，监听打包过程中的某些节点，执行广泛的任务