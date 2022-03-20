## 引入

### 浏览器内核

![image-20220320115622323](index.assets/image-20220320115622323.png) 

事实上,我们经常说的浏览器内核指的是浏览器的排版引擎:

**排版引擎**( layout engine ) , 也称为**浏览器引擎**( browser engine )、**页面渲染引擎**( rendering engine )或**样版引擎**。

### 渲染引擎工作的过程

![image-20220320120146609](index.assets/image-20220320120146609.png) 

### JavaScript引擎

#### 以webkit内核为例

![image-20220320120411515](index.assets/image-20220320120411515.png) 

#### 以v8引擎为例

![image-20220320120356547](index.assets/image-20220320120356547.png)

#### v8引擎的原理

![image-20220320120526042](index.assets/image-20220320120526042.png) 

### nodejs是什么

> 官方：node.js是一个**基于V8JavaScript引擎**的JavaScript运行时环境

node.js不是一门语言，不是库，不是框架，是一个JavaScript运行时环境，

简单点就是nodejs可以**解析和执行**JavaScript代码，以前只有浏览器可以解析和执行JavaScript代码，就是说现在JavaScript可以完全摆脱浏览器来运行，一切都归功于：nodejs

**Node.js里面没有BOM DOM，需要学习服务器级别的操作API**

### 浏览器和Node.js架构区别

![image-20220320121505336](index.assets/image-20220320121505336.png) 

![image-20220320121519037](index.assets/image-20220320121519037.png) 

### nodejs应用场景

![image-20220320121701468](index.assets/image-20220320121701468.png) 

### nodeJS版本选择及安装及安装多版本（nvm 和 n）

公司开发就使用LTS版本（稳定），学习就用current版本（支持的js新特性更多）

安装：

安装过程中会**配置环境变量**(让我们**可以在命令行使用**) ; 并且会安装`npm(Node Package Manager)`工具;

安装多版本node：

​    需要使用版本管理工具`n(Interactively Manage Your Node.js Versions交互式管理你的node版本)`或`nvm(Node Version Manager)`两个都不支持windows系统，n更简单好用

#### mac系统中[n](https://github.com/tj/n)的使用

直接使用npm全局安装`n`工具

```shell
npm i n -g
```

安装 Node.js 版本

只需执行`n <version>`下载并安装一个版本的 Node.js。如果`<version>`已经下载，`n`将从其缓存中安装。

```shell
# 安装10.16.0版本的node
n 10.16.0
# 安装最新lts版本的node
n lts
# 安装最新current版本的node
n latest

# 删除8.0.0版本的node
n rm 8.0.0
```

> mac系统如果安装需要权限，在前面加上`sudo`
>
> ```shell
> sudo n lts
> ```

`n` 执行n以查看您下载的版本，并切换安装选定的版本。

```shell
$ n

  node/4.9.1
ο node/8.11.3
  node/10.15.0

Use up/down arrow keys to select a version, return key to install, d to delete, q to quit
```

#### [nvm-windows](https://github.com/coreybutler/nvm-windows)的使用

nvm是不支持windows系统的，但是也有人开发出在windows系统中使用nvm切换node版本的工具`nvm-windows`

[github下载](https://github.com/coreybutler/nvm-windows/releases)

![image-20220320135245373](index.assets/image-20220320135245373.png) 

相关命令

```shell
# 查看nvm是否安装完成
nvm

# 查看已经安装的node版本列表
nvm list
# 查看可用的node版本列表
nvm list available



# 直接使用nvm安装指定版本的node开会很慢，可以添加淘宝镜像
# 这里你需要设置两个镜像，node的镜像和npm的镜像（安装node会顺带安装npm包管理工具）
# node镜像 
nvm node_mirror https://npm.taobao.org/mirrors/node/
# npm镜像
nvm npm_mirror https://npm.taobao.org/mirrors/npm/



# 注意：建议使用管理员身份运行终端来执行以下命令，跟mac系统使用sudo道理相同⭐

# 安装最新lts版本的node
nvm install lts
# 安装最新current版本的node
nvm install latest

# 卸载指定版本的node
nvm  uninstall <version>

# 指定版本：进行node版本切换
nvm use <version>
```

```shell
Microsoft Windows [版本 10.0.19044.1586]
(c) Microsoft Corporation。保留所有权利。

C:\Windows\system32>nvm list

    16.13.1

C:\Windows\system32>nvm use 16.13.1
Now using node v16.13.1 (64-bit)

C:\Windows\system32>nvm list

  * 16.13.1 (Currently using 64-bit executable)

C:\Windows\system32>nvm install latest
Downloading node.js version 17.7.2 (64-bit)...
Extracting...
Complete


Installation complete. If you want to use this version, type

nvm use 17.7.2

C:\Windows\system32>nvm list

    17.7.2
  * 16.13.1 (Currently using 64-bit executable)

C:\Windows\system32>nvm use 17.7.2
Now using node v17.7.2 (64-bit)

C:\Windows\system32>nvm list

  * 17.7.2 (Currently using 64-bit executable)
    16.13.1

C:\Windows\system32>nvm use 16.13.1
Now using node v16.13.1 (64-bit)

C:\Windows\system32>nvm list

    17.7.2
  * 16.13.1 (Currently using 64-bit executable)
```

### REPL的使用：交互式编程环境

REPL是Read-Eval-print Loop的简称，翻译为**读取-求值-输出 的循环**

浏览器中console输出界面可以`输入js代码然后执行`，这就是REPL

node中也可以像浏览器一样使用repl：输入命令 **node** 即可

![image-20220320132435459](index.assets/image-20220320132435459.png) 

## 基础

### 给node传递参数

```shell
# 执行node.js文件
node fileName
# 传递参数
node fileName aaa sasa

```

`process.argv`中获取传递的参数

```shell
PS C:\Users\leopai\Desktop\leopai_web_notes\nodejs> node .\00process.js aaa sasa
[
  'D:\\Program Files\\nodejs\\node.exe',
  'C:\\Users\\leopai\\Desktop\\leopai_web_notes\\nodejs\\00process.js',
  'aaa',
  'sasa'
]
```

### node程序输出（了解）

```js
// console.log(process)
console.log(process.argv)

//清除控制台
console.clear()

//输出警告
const names = 'Will Robinson'
console.warn(`Danger ${names}! Danger!`)

//输出错误
console.error(new Error('Whoops, something bad happened'))

//输出函数调用栈
function aaa() {
  console.trace()
}
aaa()

```

```shell
# console.trace()方法跟踪aaa函数的执行栈，可以查看aaa函数在某某文件中调用过
Trace
    at aaa (C:\Users\leopai\Desktop\leopai_web_notes\nodejs\00process.js:9:11)
    at Object.<anonymous> (C:\Users\leopai\Desktop\leopai_web_notes\nodejs\00process.js:11:1)
    at Module._compile (node:internal/modules/cjs/loader:1101:14)
    at Object.Module._extensions..js (node:internal/modules/cjs/loader:1153:10)
    at Module.load (node:internal/modules/cjs/loader:981:32)
    at Function.Module._load (node:internal/modules/cjs/loader:822:12)
    at Function.executeUserEntryPoint [as runMain] (node:internal/modules/run_main:81:12)
    at node:internal/main/run_main_module:17:47
    
Danger Will Robinson! Danger!

Error: Whoops, something bad happened
    at Object.<anonymous> (C:\Users\leopai\Desktop\leopai_web_notes\nodejs\00process.js:16:15)
    at Module._compile (node:internal/modules/cjs/loader:1101:14)
    at Object.Module._extensions..js (node:internal/modules/cjs/loader:1153:10)
    at Module.load (node:internal/modules/cjs/loader:981:32)
    at Function.Module._load (node:internal/modules/cjs/loader:822:12)
    at Function.executeUserEntryPoint [as runMain] (node:internal/modules/run_main:81:12)
    at node:internal/main/run_main_module:17:47
```

### 特殊的全局对象

这些对象其实是模块中的变量，只是每个模块里面都有，看起来是全局变量

包括：`__dirname、__filename、exports、module、require()`

`__dirname`当前文件所在的绝对路径

`__filename` 当前文件所在的绝对路径文件名

```js
console.log(__dirname)//C:\Users\leopai\Desktop\leopai_web_notes\nodejs
console.log(__filename)//C:\Users\leopai\Desktop\leopai_web_notes\nodejs\process.js
```

在命令行交互(REPL)中不可以使用

```shell
PS C:\Users\leopai\Desktop\leopai_web_notes\nodejs> node
Welcome to Node.js v16.13.1.      
Type ".help" for more information.
> __dirname
Uncaught ReferenceError: __dirname is not defined
> __filename
Uncaught ReferenceError: __filename is not defined
>
```

### [常见全局变量](https://nodejs.org/dist/latest-v16.x/docs/api/globals.html)

- [Class: `Buffer`](https://nodejs.org/dist/latest-v16.x/docs/api/globals.html#class-buffer)
- [`console`](https://nodejs.org/dist/latest-v16.x/docs/api/globals.html#console)
- [`Event`](https://nodejs.org/dist/latest-v16.x/docs/api/globals.html#event)
- [`exports`](https://nodejs.org/dist/latest-v16.x/docs/api/globals.html#exports)
- [`global`](https://nodejs.org/dist/latest-v16.x/docs/api/globals.html#global)
- [`module`](https://nodejs.org/dist/latest-v16.x/docs/api/globals.html#module)
- [`process`](https://nodejs.org/dist/latest-v16.x/docs/api/globals.html#process)
- [`require()`](https://nodejs.org/dist/latest-v16.x/docs/api/globals.html#require)
- [`setImmediate(callback[, ...args\])`](https://nodejs.org/dist/latest-v16.x/docs/api/globals.html#setimmediatecallback-args)
- [`setInterval(callback, delay[, ...args\])`](https://nodejs.org/dist/latest-v16.x/docs/api/globals.html#setintervalcallback-delay-args)
- [`setTimeout(callback, delay[, ...args\])`](https://nodejs.org/dist/latest-v16.x/docs/api/globals.html#settimeoutcallback-delay-args)
- [`URL`](https://nodejs.org/dist/latest-v16.x/docs/api/globals.html#url)

以上仅为部分

#### process

process提供了Node进程中相关信息

比如`Node运行环境、参数信息`

在项目中，可以将一些环境变量读取到`process的env中`

#### console

#### 计时器对象

```js
//计时器相关对象
setTimeout(() => {
  console.log('setTimeout')
}, 0)
setInterval(() => {
  console.log('setInterval')
}, 5000)
//setTimeout时间设置为0和setImmediate是有区别的
setImmediate(() => {
  console.log('setImmediate')
})
//下一帧执行
process.nextTick(() => {
  console.log('process.nextTick')
})

//还有与之对应的取消定时器的对象
```

#### global

global对象与浏览器中的window对象类似，如果一个属性不方便获取，可以使用`global.属性名`来获取

区别：浏览器中定义变量会直接成为window的属性，node中不会成为global的属性，因为浏览器中没有模块的概念，所以会直接吧变量放到window对象中，但是node中每一个js文件都是一个单独的模块，定义的变量只属于这个模块但是不属于全局

```js
const name = 'aaaaaa'
console.log(name) //aaaaaa
console.log(global.name) //undefined
```

> 控制台输出来查看global全局对象的属性是不全的，可以在node的repl交互中敲**`global. `再按两次tab键查看** 
>
> ```shell
> PS C:\Users\leopai\Desktop\leopai_web_notes\nodejs> node
> Welcome to Node.js v16.13.1.
> Type ".help" for more information.
> > global.
> global.__proto__             global.hasOwnProperty        global.isPrototypeOf         global.propertyIsEnumerable  global.toLocaleString
> global.toString              global.valueOf
> 
> global.constructor
> 
> global.AbortController       global.AbortSignal           global.AggregateError        global.Array                 global.ArrayBuffer
> global.Atomics               global.BigInt                global.BigInt64Array         global.BigUint64Array        global.Boolean
> global.Buffer                global.DataView              global.Date                  global.Error                 global.EvalError
> global.Event                 global.EventTarget           global.FinalizationRegistry  global.Float32Array          global.Float64Array
> global.Function              global.Infinity              global.Int16Array            global.Int32Array            global.Int8Array
> global.Intl                  global.JSON                  global.Map                   global.Math                  global.MessageChannel
> global.MessageEvent          global.MessagePort           global.NaN                   global.Number                global.Object
> global.Promise               global.Proxy                 global.RangeError            global.ReferenceError        global.Reflect
> global.RegExp                global.Set                   global.SharedArrayBuffer     global.String                global.Symbol
> global.SyntaxError           global.TextDecoder           global.TextEncoder           global.TypeError             global.URIError
> global.URL                   global.URLSearchParams       global.Uint16Array           global.Uint32Array           global.Uint8Array
> global.Uint8ClampedArray     global.WeakMap               global.WeakRef               global.WeakSet               global.WebAssembly
> global._                     global._error                global.assert                global.async_hooks           global.atob
> global.btoa                  global.buffer                global.child_process         global.clearImmediate        global.clearInterval
> global.clearTimeout          global.cluster               global.console               global.constants             global.crypto
> global.decodeURI             global.decodeURIComponent    global.dgram                 global.diagnostics_channel   global.dns
> global.domain                global.encodeURI             global.encodeURIComponent    global.escape                global.eval
> global.events                global.fs                    global.global                global.globalThis            global.http
> global.http2                 global.https                 global.inspector             global.isFinite              global.isNaN
> global.module                global.net                   global.os                    global.parseFloat            global.parseInt
> global.path                  global.perf_hooks            global.performance           global.process               global.punycode
> global.querystring           global.queueMicrotask        global.readline              global.repl                  global.require
> global.setImmediate          global.setInterval           global.setTimeout            global.stream                global.string_decoder
> global.sys                   global.timers                global.tls                   global.trace_events          global.tty
> global.undefined             global.unescape              global.url                   global.util                  global.v8
> global.vm                    global.wasi                  global.worker_threads        global.zlib
> ```

### JavaScript模块化

![image-20220320204600197](index.assets/image-20220320204600197.png) 

node中的js有重要的概念：`模块系统`

`require`加载模块     `exports`导出模块

#### commonjs和node

![image-20220320204835997](index.assets/image-20220320204835997.png) 

```js
//没有模块化的时候实现模块化可以使用IIFE
const moduleAAA = (function () {
  var name = 'wang'
  var age = 18
  return {
    name: name,
    age: age,
  }
})()
//这样把文件嵌入到html文件当中，其他的js文件就可以使用moduleAAA.name来使用了
```

#### exports和module.exports

每个模块里面原本都有一个`exports空对象`，通过添加（导出）属性供别的模块使用

`moo = require('./导出的文件名')`对象是exports对象的浅拷贝（浅拷贝就是引用赋值）

![image-20220320205303391](index.assets/image-20220320205303391.png) 

> `exports是commonjs里面要求exports作为导出，而node中增加了module.exports`
>
> 每个模块中都有一个module对象，真正导出的是module对象里面的exports

```js
// module.exports === exports      node内部语句（在顶层）
console.log(module.exports === exports) //true

exports.aa = 'aa'
exports.fn = function (x, y) {
  return x + y
}

/*
不要写 exports = {}这种语句，不管用，因为commonjs模块化内部默认语句是在文件最底部最终导出的是 ：return module.exports，如果那样写是将exports指向另一个对象，导出的不是我们想要的，所以一般导出多个是使用
module.exports={...}

记住最终导出的是module.exports即可⭐，如果module.exports重新赋值（指向一个新对象），则exports方法导出就无效
一般不会混合使用
*/
//导出多个接口成员
exports.xx1 = xxx
exports.xx2 = xxx
exports.xx3 = xxx
//或
module.exports = { xx1, xx2, xx3 }

//导出单个接口成员
module.exports.xx = xxx

/**
 * 导入：const moo = require(‘./导出的文件名’)
 * require(‘./导出的文件名’) 返回的就是导出的那个对象
 * 所以可以直接使用moo.xxx来使用导出的属性
 */
```

#### require细节





## express

## koa

## express和koa对比



 