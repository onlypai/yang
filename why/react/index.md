## React邂逅

### 起源

![image-20220422163757545](index.assets/image-20220422163757545.png) 

### 特点

#### 声明式编程

![image-20220422164043147](index.assets/image-20220422164043147.png) 

#### 组件化开发

#### 多平台适配

![image-20220422164331040](index.assets/image-20220422164331040.png) 

## Hello Eeact

### react开发依赖

![image-20220423132218749](index.assets/image-20220423132218749.png) 

![image-20220423132711183](index.assets/image-20220423132711183.png) 

### 第一个react案例

```js
  <body>
    <div id="app">内容被覆盖</div>
    <!-- crossorigin：本地显示远程js包的错误信息 -->
    <script
      src="https://unpkg.com/react@18/umd/react.development.js"
      crossorigin
    ></script>
    <script
      src="https://unpkg.com/react-dom@18/umd/react-dom.development.js"
      crossorigin
    ></script>
    <script src="https://unpkg.com/babel-standalone@6/babel.min.js"></script>

    <!-- 默认不能在script中使用jsx，如果想使用，并且希望代码被解析，必须在script标签上加上 type="text/babel" ⭐ -->
    <!-- jsx特点：根元素只能有一个标签 -->
    <!-- 点击执行handleClick方法，会将message改变，但视图不会立即更新，需要重新渲染jsx⭐ -->
    <script type="text/babel">
      //<h2>hello react</h2>就是jsx
      let message = 'hello world'
      function handleClick() {
        message = 'hello react'
        render()
      }
      function render() {
          
      const root = ReactDOM.createRoot(document.getElementById("app"))
      root.render(
          <div>
            <h2>{message}</h2>
            <button onClick={handleClick}>改变文本</button>   
          </div>,
          document.getElementById('app')
        )
      }
      render()
    </script>
  </body>
```

```js
  <body>
    <div id="app"></div>
    <script
      src="https://unpkg.com/react@18/umd/react.development.js"
      crossorigin
    ></script>
    <script
      src="https://unpkg.com/react-dom@18/umd/react-dom.development.js"
      crossorigin
    ></script>
    <script src="https://unpkg.com/babel-standalone@6/babel.min.js"></script>
    <script type="text/babel">
      // 子组件
      class App extends React.Component {
        constructor() {
          super()
          //想要数据被修改的同时视图更新，要将数据放在state对象中⭐
          this.state = {
            message: 'hello world',
          }
        }
        // render函数永远不会手动调用
        render() {
          // 括号无特殊作用，将内部内容看成一个整体
          return (
            <div>
              <h2>{this.state.message}</h2>
              <button onClick={this.handleClick.bind(this)}>改变文本</button>
            </div>
          )
        }
        handleClick() {
          //修改state数据
          this.setState({
            message: 'hello react',
          })
        }
      }
      //React中组件名称必须以大写字母开头。⭐ React 会将以小写字母开头的组件视为原生 DOM 标签。
      const root = ReactDOM.createRoot(document.getElementById("app"))
      root.render(<App />)
    </script>
  </body>
```

> React18之前:
>
> ​	`ReactDOM.render(<App />, document.getElementById("app"))`
>
> React18:
>
> ​	 `const root = ReactDOM.createRoot(document.getElementById("app"))
>       root.render(<App />)`

## react核心概念

### JSX

jsx语法只有在`引入babel`和script标签上有`type="text/babel"`属性的时候才可以使用，直接在script中使用就是错误的语法

```jsx
const com = <h4>hello world</h4>
```

![image-20220509214845697](index.assets/image-20220509214845697.png) 

为什么react选择jsx：`all in js`设计哲学

jsx书写规范：

* 顶层只能有一个根标签
* 通常在jsx外层包裹一个小括号，便于阅读、换行书写
* jsx中标签可以是单标签，也可以是双标签，但是单标签一定要以`/>`结尾

 #### jsx注释

```jsx
{/*这是jsx的注释*/}
```

#### jsx嵌入数据

* 可以展示的Number、String、Array
* 不能正常展示null，undefined、布尔值，要转化成`字符串`
* 对象类型不能作为jsx子元素

```js
    <script type="text/babel">
      class App extends React.Component {
        constructor() {
          super()
          this.state = {
            //{}中可以展示的Number、String、Array
            num: 1,
            str: 'haha',
            arr: ['das', 'fgsd', 'gd'],

            //{}中不能正常展示的（忽略）
            nu: null,
            unde: undefined,
            boo: true,

            //对象类型不能作为jsx子元素
            obj: {
              aaa: 'fasfs',
            },
          }
        }
        render() {
          return (
            <div>
              <h4>{this.state.num}</h4>
              <h4>{this.state.str}</h4>
              <h4>{this.state.arr}</h4>

              <h4>{String(this.state.nu)}</h4>
              <h4>{String(this.state.unde)}</h4>
              <h4>{this.state.boo.toString()}</h4>
              <h4>{this.state.boo + ''}</h4>

              {/*<h4>{this.state.obj}</h4>*/}
            </div>
          )
        }
      }
      const root = ReactDOM.createRoot(document.getElementById("app"))
      root.render(<App />)
    </script>
```

#### jsx嵌入表达式

```jsx
{/*表达式*/}
<h4>{this.state.num + this.state.str}</h4>
<h4>{20 * 90}</h4>
<h4>{this.state.num === 1 ? '发射' : '哈哈'}</h4>
<h4>{this.add()}</h4>
```

#### jsx绑定元素的属性

* `className={'box wrap ' + (isActive ? 'active' : '')}`
* `style={{key: value,}}`

> jsx里面不能存在js关键字，像class属性，for属性都是关键字⭐，class用className代替，for用htmlFor代替

```jsx
    <script type="text/babel">
      class App extends React.Component {
        constructor() {
          super()
          this.state = {
            title: 'hahah',
            src: 'http://p4.music.126.net/sjyk0uNtgH9-ZCM6djXR5g==/109951167039788611.jpg?param=200y200',
            hrefs: 'http://www.baidu.com',
            isActive: true,
            fontSize: '14px',
          }
        }
        render() {
          const { title, src, hrefs, isActive, fontSize } = this.state
          function formatSrc(e) {
            return e
          }
          return (
            <div>
              {/*绑定普通属性*/}
              <h4 title={title}>标题</h4>
              <img src={src} alt="" />
              <img src={formatSrc(src)} alt="" />
              <a href={hrefs} target="_blank">
                百度
              </a>
              {/*动态绑定class属性*/}
              {/*jsx里面不能存在js关键字，像class属性，for属性都是关键字⭐，class用className代替，for用htmlFor代替*/}
              <div className={'box wrap ' + (isActive ? 'active' : '')}>
                动态绑定class
              </div>
              <label htmlFor="aaa"></label>

              {/*动态绑定style属性⭐*/}
              {/*里面的{}是对象，style属性以键值对的形式存在*/}
              <div style={{ color: 'red', fontSize: fontSize }}>
                动态绑定style
              </div>
            </div>
          )
        }
      }
      const root = ReactDOM.createRoot(document.getElementById("app"))
      root.render(<App />)
    </script>
```

#### jsx绑定事件

事件使用`小驼峰式`，而不是原生的`小写方式`

this绑定有三种方式

```jsx
    <script type="text/babel">
      class App extends React.Component {
        constructor() {
          super()
          this.state = {
            title: 'hahah',
          }
          this.handleClick1 = this.handleClick1.bind(this) //方式一：this显示绑定
        }
        render() {
          return (
            <div>
              <button onClick={this.handleClick1}>提交</button>
              <button onClick={this.handleClick2}>提交</button>
              {/*方式三：箭头函数中调用需要执行的函数⭐(推荐使用)*/}
              <button
                onClick={() => {
                  this.handleClick3()
                }}
              >
                提交
              </button>
            </div>
          )
        }
        handleClick1() {
          console.log('handleClick1')
        }
        //ES6中给对象增加属性的语法，class fields⭐
        handleClick2 = () => {
          console.log('handleClick2')
        } //方式二：箭头函数
        handleClick3() {
          console.log('handleClick3')
        }
      }
      const root = ReactDOM.createRoot(document.getElementById("app"))
      root.render(<App />)
    </script>
```

事件绑定传递参数

```jsx
    <script type="text/babel">
      class App extends React.Component {
        constructor() {
          super()
          this.state = {
            title: 'hahah',
          }
          this.handleClick1 = this.handleClick1.bind(this)
        }
        render() {
          return (
            <div>
              <button onClick={this.handleClick1}>提交</button>
              <button onClick={this.handleClick2}>提交</button>
              {/*event事件对象是在箭头函数上的，搞清楚⭐ */}
              <button
                onClick={(event) => {
                  this.handleClick3('参数一', event)
                }}
              >
                提交
              </button>
            </div>
          )
        }
        handleClick1(event) {
          console.log(event) //这个事件对象是react内部合成的事件对象，而不是浏览器的那个事件对象⭐
        }
        handleClick2 = () => {
          console.log('handleClick2')
        } //方式二：箭头函数
        handleClick3(aaa, event) {
          console.log(aaa, event)
        }
      }
      const root = ReactDOM.createRoot(document.getElementById("app"))
      root.render(<App />)
    </script>
```

#### jsx本质（react的渲染流程）

实际上，jsx仅仅是`React.createElement(component,props,...children)`函数的语法糖

①所有的jsx最终都会被转换成`React.createElement`函数调用

![image-20220512103715421](index.assets/image-20220512103715421.png) 

```js
  <body>
    <div id="app"></div>
    <script src="https://unpkg.com/react@18/umd/react.development.js" crossorigin></script>
    <script src="https://unpkg.com/react-dom@18/umd/react-dom.development.js" crossorigin></script>
    <script src="https://unpkg.com/babel-standalone@6/babel.min.js"></script>
    <script type="text/babel">
      // const msg1 = <h4>jsxxx</h4>
      const msg1 = (
        <div className="wrap">
          <div className="top">
            <h4>554454</h4>
          </div>
          <div className="middle">
            <div>zhongjian</div>
          </div>
          <div className="footer">jiao</div>
        </div>
      )
      const msg2 = React.createElement("h4", null, "jsxxx") //不使用jsx也就不需要babel，①jsx其实就是转成React.createElement函数调用
      console.log(msg1) //②返回ReactElement对象
      console.log(msg2) //②返回ReactElement对象

      const root = ReactDOM.createRoot(document.getElementById("app"))
      root.render(msg1)//③虚拟DOM转化成真实的DOM并塞进根元素
    </script>
  </body>
```

![image-20220512104552642](index.assets/image-20220512104552642.png) 

[jsx -> React.createElement](https://babeljs.io/repl)

②执行React.createElement()会返回一个`ReactElement`对象（其实是一个对象树，就是大名鼎鼎的`虚拟DOM`）

可以打印这个对象看结构

![image-20220513153656809](index.assets/image-20220513153656809.png) 

③`const root = ReactDOM.createRoot(document.getElementById("app"))
   root.render(<App />)`方法将虚拟DOM与真实的DOM同步（映射）起来，这个过程叫做`协调（Reconciliation）`

> WEB开发中的流程：jsx -> React.createElement() -> ReactElement对象 -> 经过root.render -> 真实的DOM
>
> react-navite中的流程：jsx -> React.createElement() -> ReactElement对象 -> 经过root.render -> 原生的（移动端）控件

![image-20220513154241155](index.assets/image-20220513154241155.png) 

##### 疑问：为什么使用虚拟DOM

* 原有的开发模式很难跟踪`状态(数据)`发生的改变，我们可以直接调式虚拟DOM里面的数据，使用react调式工具
* 操作真实的DOM`性能较低`：传统开发模式会进行频繁的DOM操作，而这一做法性能较低，DOM操作会引起`浏览器的重绘和回流`，所以在开发中应避免频繁的DOM操作

##### 声明式编程

![image-20220513155534451](index.assets/image-20220513155534451.png) 

### 元素(条件)渲染

v-if的效果：

* if条件语句
* 三元运算符
* 逻辑与 `&&`

> 注意：jsx中 布尔值 不显示，所以 逻辑与 前面为否的话就返回前面的，也就是什么都不显示，但是`0`也表示否，如果前面的值是0的话，显示的内容就是数字`0`

```jsx
    <script type="text/babel">
      class App extends React.Component {
        constructor() {
          super()
          this.state = {
            isLogin: true,
            zero: 0,
          }
        }
        render() {
          //方式一：if条件判断语句
          let welcome = null
          if (this.state.isLogin) {
            welcome = <h4>欢迎回来</h4>
          } else {
            welcome = <h4>滚</h4>
          }
          return (
            <div>
              {welcome}
              <button
                onClick={() => {
                  this.setState({ isLogin: !this.state.isLogin })
                }}
              >
                {/*方式二：三元运算符*/}
                {!this.state.isLogin ? '登录' : '退出'}
              </button>
              {/*方式三：逻辑与：数字0表示否，但是会显示0⭐*/}
              <h4>{this.state.isLogin && '你终于登陆了'}</h4>
              <h4>{this.state.zero && 'zzz'}</h4>
            </div>
          )
        }
      }
      const root = ReactDOM.createRoot(document.getElementById("app"))
      root.render(<App />)
    </script>
```

v-show的效果（元素一直存在，不显示就修改display为none）：

```jsx
<div style={{ display: this.state.isLogin ? 'block' : 'none' }}>
    你终于登陆了
</div>
```

### 列表渲染 

* 数组高阶函数`map、filter...`
* `key`值设定

```jsx
  <body>
    <div id="app"></div>
    <script src="https://unpkg.com/react@18/umd/react.development.js" crossorigin></script>
    <script src="https://unpkg.com/react-dom@18/umd/react-dom.development.js" crossorigin></script>
    <script src="https://unpkg.com/babel-standalone@6/babel.min.js"></script>
    <script type="text/babel">
      class App extends React.Component {
        constructor() {
          super()
          this.state = {
            movies: ['黄飞鸿', '狼牙', '摔跤吧爸爸', '变形金刚', '大话西游'],
            numbers: [100, 209, 20, 1209, 342, 3, 50, 2, 321, 212],
          }
        }
        render() {
          return (
            <div>
              <h4>名字列表</h4>
              <ul>
                {this.state.movies.map((e) => (
                  <li key={e}>{e}</li>
                ))}
              </ul>
              <h4>大于等于50的列表</h4>
              <ul>
                {this.state.numbers
                  .filter((e) => e >= 50)
                  .map((e) => (
                    <li key={e.toString()}>{e}</li>
                  ))}
              </ul>

              <h4>前4个元素的列表</h4>
              <ul>
                {this.state.numbers.slice(0, 4).map((e) => (
                  <li key={e.toString()}>{e}</li>
                ))}
              </ul>
            </div>
          )
        }
      }
      const root = ReactDOM.createRoot(document.getElementById("app"))
      root.render(<App />)
    </script>
  </body>
```

* key 帮助 React 识别哪些元素改变了，比如被添加或删除。因此你应当给数组中的每一个元素赋予一个确定的标识。

* 一个元素的 key 最好是这个元素在列表中拥有的一个`独一无二的字符串`。

* 当元素没有确定 id 的时候，`万不得已你可以使用元素索引 index 作为 key`
* 如果你选择`不指定显式的 key 值`，那么 React 将`默认使用索引`用作为列表项目的 key 值。
* key 值在兄弟节点之间必须唯一，当我们生成两个不同的数组时，我们可以使用相同的 key 值，见上面的例子

* 用 key 提取组件

元素的 key 只有放在就近的数组上下文中才有意义。一个好的经验法则是：在 `map()` 方法中的元素需要设置 key 属性。

```jsx
function ListItem(props) {
  // 正确！这里不需要指定 key：
  return <li>{props.value}</li>;
}

function NumberList(props) {
  const numbers = props.numbers;
  const listItems = numbers.map((number) =>
    // 正确！key 应该在数组的上下文中被指定
    <ListItem key={number.toString()} value={number} />
  );
  return (
    <ul>
      {listItems}
    </ul>
  );
}
```



## React脚手架`create-react-app`

前端三大脚手架都是使用node编写的，并且都是基于webpack，所以电脑上需要安装`node环境`

```shell
# 安装react脚手架工具
npm i -g create-react-app

# 创建项目
# 项目名字不允许使用大写字母⭐
create-react-app name
```

![image-20220516144522050](index.assets/image-20220516144522050.png) 

`reportWebVitals.js`

这个webVital是Google提出的、检测用户体验的标准，这些指标包含三个关键指标（CLS、FID、LCP）和两个辅助指标（FCP、TTFB）。具体含义如下（参考链接）：

* **LCP** (Largest Contentful Paint)：最大内容渲染时间。指的是从用户请求网址到窗口中渲染最大可见内容所需要的时间（最大可见内容通常是图片或者视频，或者大块的文本）。

* **FID** (First Input Delay):首次输入延迟。指的是从用户首次与网页互动（点击链接、按钮等）到浏览器响应此次互动直接的时间。用于判断网页进入互动状态的时间。

* **CLS** (Cumulative Layout Shift) :累计布局偏移，得分范围0-1，指的是网页布局在加载期间的偏移量，0表示没有偏移，1表示最大偏移，这个指标指示用户与网站的交互体验，如果网址在加载过程布局一直跳动，用户体验会很差。比如加载一张图片，但没有大小空白占位，导致图片显示时页面高度跳动。

* **FCP**(First Contentful Paint)首次内容绘制。标记浏览器渲染来自 DOM 第一位内容的时间点，内容可能是文本、图像等元素。
* **TTFB** (Time to First Byte) 首字节到达的时间点。

通过把`index.js`文件的最后一行改为：

```js
reportWebVitals(console.warn);
```

![image-20220620110449871](index.assets/image-20220620110449871.png) 

FCP值表示，当前页面中元素最早出现时间是在页面开始加载后的7154ms。

LCP值表示元素最晚出现的时间是加载开始后7185.8ms。

CLS值表示我的页面中元素的没有偏移，在缩放变换后该值还是0，那么说明这个页面还是比较稳定流畅的。

### PWA-渐进式WEB应用

![image-20220516145337395](index.assets/image-20220516145337395.png) 

> 如果你的应用程序没有PWA功能，那么可以将相关文件全部删除

### 脚手架中的webpack

和`vue-cli3`脚手架一样，react脚手架将有关webpack的配置信息都隐藏起来了

如果想查看webpack相关配置信息，运行`npm run eject`命令，前提是你的本地代码需要全部提交（本地无修改）

![image-20220516152422723](index.assets/image-20220516152422723.png) 

`permanent`：永恒的，不可逆的；暴露之后无法再隐藏起来

![image-20220516152817559](index.assets/image-20220516152817559.png) 

多出的两个文件夹就是配置信息，并且`package.json`文件中之前隐藏的依赖增加了很多

### react组件化

![image-20220517092338090](index.assets/image-20220517092338090.png) 

#### 类组件和函数组件

类组件

* 组件名是`大写字符`开头（无论是类组件还是函数组件）
* 类组件需要继承自`React.Component`
* 类组件必须实现`render`函数

> ES6之前，可以通过`create-react-class`模块定义类组件，但是目前官网建议使用ES6的class类定义

使用class来定义一个组件

* constructor是可选的，通常在其中初始化一些数据
* this.state中维护的就是我们组件内部的数据
* render()方法是class中唯一必须实现的方法

函数组件

* 没有this对象

* 没有内部的变量

#### render返回值

```js
  render() {
    返回React元素，通常通过JSX创建
    // return (
    //   <div>
    //     <h4>哈哈哈</h4>
    //   </div>
    // )

    返回一个数组或fragments，使render方法可以返回多个元素
    // return [<div>sasasas</div>, <div>shahahah</div>]

    返回Portals，可以渲染子节点到不同的DOM子树中

    返回字符串或数值类型，会在DOM中渲染成文本节点

    返回布尔值或null，什么都不渲染
  }
```

#### 组件生命周期

![image-20220517104219297](index.assets/image-20220517104219297.png) 

再说生命周期时，都是类的生命周期，`函数式组件没有生命周期函数`，后面再hoos中模拟一些生命周期回调

![image-20220517105208660](index.assets/image-20220517105208660.png) 

各个生命周期做什么事情⭐

* constructor

![image-20220517110126860](index.assets/image-20220517110126860.png) 

* componentDidMount

![image-20220517110225381](index.assets/image-20220517110225381.png) 

* componentDidUpdate

![image-20220517110514183](index.assets/image-20220517110514183.png) 

componentDidUpdate有三个参数

```js
componentDidUpdate(prevProps, prevState, snapshot) {
    console.log(prevProps, prevState, snapshot)//更新之前的props和state数据，第三个参数是getSnapshotBeforeUpdate() 生命周期的返回值，没有即为undefined
    console.log('componentDidUpdate')
  }
```

* componentWillUnmount

![image-20220517110549987](index.assets/image-20220517110549987.png) 



[不常用的生命周期函数](https://zh-hans.reactjs.org/docs/react-component.html)：

![image-20220517144915927](index.assets/image-20220517144915927.png) 

* shouldComponentUpdate

根据 `shouldComponentUpdate()` 的返回值，判断 React 组件的输出是否受当前 state 或 props 更改的影响。默认行为是 state 每次发生变化组件都会重新渲染(就是发生改变就会执行一下`render()`)。

当 props 或 state 发生变化时，`shouldComponentUpdate()` 会在渲染执行之前被调用。`返回值默认为 true`。首次渲染或使用 `forceUpdate()` 时不会调用该方法。

* getSnapshotBeforeUpdate

`getSnapshotBeforeUpdate()` 在最近一次渲染输出（提交到 DOM 节点）之前调用（数据更新之前调用）。

#### 组件的嵌套

#### 组件通信

##### 父传子

* 传入的属性保存在props对象中
* propTypes定义验证
* defaultProps定义默认值

* 使用`prop-types库`对props属性进行验证，[查看所有验证器](https://zh-hans.reactjs.org/docs/typechecking-with-proptypes.html)

```js
import React, { Component } from 'react'
import PropTypes from 'prop-types' //自React15起抽出为单独库

//类子组件
class Child extends Component {
  //属性验证
  static propTypes = {
    name: PropTypes.string.isRequired,
    age: PropTypes.number,
    list: PropTypes.array,
  }
  //属性默认值
  static defaultProps = {
    name: 'Child',
    age: 12,
    list: [21, 342, 55],
  }
  render() {
    const { name, age, list } = this.props
    return (
      <div>
        类子组件显示props信息: {name + ' ' + age}
        <ul>
          {list.map((e, i) => {
            return <li key={i}>{e}</li>
          })}
        </ul>
      </div>
    )
  }
}
//对props属性进行验证，(类组件还可以在内部定义static)⭐
// Child.propTypes = {
//   name: PropTypes.string.isRequired,
//   age: PropTypes.number,
//   list: PropTypes.array,
// }
// Child.defaultProps = {
//   name: 'moren',
//   age: 12,
//   list: [21, 342, 55],
// }

//函数子组件
function ChildOther(props) {
  const { name, age } = props
  return <div>函数子组件显示props信息: {name + ' ' + age}</div>
}
ChildOther.propTypes = {
  name: PropTypes.string,
  age: PropTypes.number,
}
ChildOther.defaultProps = {
  name: 'ChildOther',
  age: 45,
}

//父组件
export default class App extends Component {
  constructor() {
    super()
    this.state = {
      num: 1,
      unMount: true,
    }
  }
  render() {
    return (
      <div>
        <Child name="wangyang" age={18} list={[1, 2, 3]} />
        <Child name="kobe" age={19} list={[1, 2, 3, 5]} />
        <Child />
        <hr />
        <ChildOther name="kobe" age={19} />
        <ChildOther />
      </div>
    )
  }
}
```

> 子组件中不手动使用super保存props的话，也是可以的，但是在constructor函数中还拿不到数据
>
> ```js
>   //子组件constructor
>   constructor(props) {
>     //这里子类如果没有保存props，那么constructor函数中拿不到props，但是react内部会帮你做保存，在render生命周期及之后能拿到⭐，源码可看react-test-renderer
>     // super()
>     // console.log(props)//undefined
>       
>     super(props)
>     console.log(props) //super(props)手动做保存可以在constructor中拿到props，正规操作就是自己保存一下
>   }
> ```

```js
import PropTypes from 'prop-types';

MyComponent.propTypes = {
  // 你可以将属性声明为 JS 原生类型，默认情况下
  // 这些属性都是可选的。
  optionalArray: PropTypes.array,
  optionalBool: PropTypes.bool,
  optionalFunc: PropTypes.func,
  optionalNumber: PropTypes.number,
  optionalObject: PropTypes.object,
  optionalString: PropTypes.string,
  optionalSymbol: PropTypes.symbol,

  // 任何可被渲染的元素（包括数字、字符串、元素或数组）
  // (或 Fragment) 也包含这些类型。
  optionalNode: PropTypes.node,

  // 一个 React 元素。(插槽)
  optionalElement: PropTypes.element,

  // 一个 React 元素类型（即，MyComponent）。
  optionalElementType: PropTypes.elementType,

  // 你也可以声明 prop 为类的实例，这里使用
  // JS 的 instanceof 操作符。
  optionalMessage: PropTypes.instanceOf(Message),

  // 你可以让你的 prop 只能是特定的值，指定它为
  // 枚举类型。
  optionalEnum: PropTypes.oneOf(['News', 'Photos']),

  // 一个对象可以是几种类型中的任意一个类型
  optionalUnion: PropTypes.oneOfType([
    PropTypes.string,
    PropTypes.number,
    PropTypes.instanceOf(Message)
  ]),

  // 可以指定一个数组由某一类型的元素组成
  optionalArrayOf: PropTypes.arrayOf(PropTypes.number),

  // 可以指定一个对象由某一类型的值组成
  optionalObjectOf: PropTypes.objectOf(PropTypes.number),

  // 可以指定一个对象由特定的类型值组成
  optionalObjectWithShape: PropTypes.shape({
    color: PropTypes.string,
    fontSize: PropTypes.number
  }),

  // An object with warnings on extra properties
  optionalObjectWithStrictShape: PropTypes.exact({
    name: PropTypes.string,
    quantity: PropTypes.number
  }),

  // 你可以在任何 PropTypes 属性后面加上 `isRequired` ，确保
  // 这个 prop 没有被提供时，会打印警告信息。
  requiredFunc: PropTypes.func.isRequired,

  // 任意类型的必需数据
  requiredAny: PropTypes.any.isRequired,

  // 你可以指定一个自定义验证器。它在验证失败时应返回一个 Error 对象。
  // 请不要使用 `console.warn` 或抛出异常，因为这在 `oneOfType` 中不会起作用。
  customProp: function(props, propName, componentName) {
    if (!/matchme/.test(props[propName])) {
      return new Error(
        'Invalid prop `' + propName + '` supplied to' +
        ' `' + componentName + '`. Validation failed.'
      );
    }
  },

  // 你也可以提供一个自定义的 `arrayOf` 或 `objectOf` 验证器。
  // 它应该在验证失败时返回一个 Error 对象。
  // 验证器将验证数组或对象中的每个值。验证器的前两个参数
  // 第一个是数组或对象本身
  // 第二个是他们当前的键。
  customArrayProp: PropTypes.arrayOf(function(propValue, key, componentName, location, propFullName) {
    if (!/matchme/.test(propValue[key])) {
      return new Error(
        'Invalid prop `' + propFullName + '` supplied to' +
        ' `' + componentName + '`. Validation failed.'
      );
    }
  })
};

```



##### 子传父（状态提升）

```js
import React, { Component } from "react"

//类子组件
class Child extends Component {
  render() {
    return (
      <div>
        类子组件
        <button onClick={(e) => this.incrementClick(e)}>状态提升</button>
      </div>
    )
  }
  incrementClick(e) {
    this.props.btnClick(e, 12, 12512)
  }
}

//父组件
export default class App extends Component {
  constructor() {
    super()
    this.state = {
      num: 1,
      unMount: true,
    }
  }
  render() {
    return (
      <div>
        {/* 注意，下面第一种方式虽然可以进行状态提升，也可以传递数据，但是在handleClick中拿到的this是子组件中的btnClick函数，而第二种中拿到的才是对的this⭐ */}
        <Child btnClick={this.handleClick} />
        <Child btnClick={(e, a, b) => this.handleClick2(e, a, b)} />
      </div>
    )
  }
  handleClick(e, a, b) {
    console.log(this) //btnClick
    console.log("dsafdas", e, a, b)
  }
  handleClick2(e, a, b) {
    console.log(this) //父组件
    console.log("dsafdas", e, a, b)
  }
}
```

##### 跨组件通信`context`上下文

跨组件通信你可以使用自上而下组件传递，但是往往比较繁琐，而且冗余代码较多



类组件

* 1.创建context对象并传入默认数据

* 2.context对象内的Provider组件包裹子组件并传值

* 3.设置contextType

* 4.从`context`对象中获取共享的数据

> 类组件实现同时消费多个context，需要使用函数时组件的Consumer组件

```js
import React, { Component } from "react"

//1.创建context对象并传入默认数据
const UserContext = React.createContext({ name: "", age: 0 })

//孙子组件
class Grandson extends Component {
  //3.设置contextType方式一
  /**
   * 挂载在 class 上的 contextType 属性可以赋值为由 React.createContext() 创建的 Context 对象。
   * 此属性可以让你使用 this.context 来获取最近 Context 上的值。你可以在任何生命周期中访问到它，包括 render 函数中。⭐
   */
  static contextType = UserContext
  render() {
    console.log(this.context)
    return <div>Grandson</div>
  }
}
//3.设置contextType方式二
// Grandson.contextType = UserContext

//孙子组件同时消费多个context⭐
//class Grandson extends Component {
 // render() {
 //   return (
 //   	<UserContext.Consumer>
   //       {(user) => (
 //           <ThemeContext.Consumer>
       //       {(theme) => (
     //           <div>
        //          <div>名字：{user.name}</div>
        //          <div>年龄：{user.age}</div>
         //         <div style={{ color: theme.color }}>我是什么颜色</div>
        //        </div>
        //      )}
       //     </ThemeContext.Consumer>
       //   )}
      //  </UserContext.Consumer>
   // )
//  }
//}


//子组件
class Child extends Component {
  render() {
    return (
      <div>
        <Grandson />
      </div>
    )
  }
}
//父组件
export default class App extends Component {
  constructor() {
    super()
    this.state = {
      name: "wangyang",
      age: 18,
    }
  }
  render() {
    return (
      <div>
        {/* 2.context对象内的Provider组件包裹子组件并传值，如果子组件没有包裹在Provider当中，使用的就是默认数据*/}
        <UserContext.Provider value={this.state}>
          <Child />
        </UserContext.Provider>
      </div>
    )
  }
}
```

函数式组件

使用方式大致相同，但是子类组件使用不是设置`contextType`，而是使用`上下文对象中的Consumer组件`，并且可以实现消费多个context

```js
import React, { Component } from "react"

//1.创建context对象并传入默认数据
const UserContext = React.createContext({ name: "", age: 0 })
const ThemeContext = React.createContext(null)

//孙子组件,函数式组件
function Grandson() {
  return (
    <div>
      {
        /**
         * 函数式组件使用UserContext.Consumer⭐
         * 这种方法需要一个函数作为子元素（function as a child）。
         * 这个函数接收当前的 context 值，并返回一个 React 节点。
         * 传递给函数的 value 值等价于组件树上方离这个 context 最近的 Provider 提供的 value 值。
         * 如果没有对应的 Provider，value 参数等同于传递给 createContext() 的 defaultValue。
         * ⭐函数式组件使用UserContext.Consumer，则不需要设置contextType属性
         */
        <UserContext.Consumer>
          {(value) => (
            <div>
              <div>名字：{value.name}</div>
              <div>年龄：{value.age}</div>
            </div>
          )}
        </UserContext.Consumer>
      }
      {
        /**
         * 消费多个context
         * 类组件同时消费多个context也是用这种方式⭐
         */
        <UserContext.Consumer>
          {(user) => (
            <ThemeContext.Consumer>
              {(theme) => (
                <div>
                  <div>名字：{user.name}</div>
                  <div>年龄：{user.age}</div>
                  <div style={{ color: theme.color }}>我是什么颜色</div>
                </div>
              )}
            </ThemeContext.Consumer>
          )}
        </UserContext.Consumer>
      }
    </div>
  )
}

//子组件
class Child extends Component {
  render() {
    return (
      <div>
        <Grandson />
      </div>
    )
  }
}
//父组件
export default class App extends Component {
  constructor() {
    super()
    this.state = {
      name: "wangyang",
      age: 18,
    }
  }
  render() {
    return (
      <div>
        {/* 2.context对象内的Provider组件包裹子组件，并传值，如果子组件没有包裹在Provider当中，使用的就是默认数据*/}
        <UserContext.Provider value={this.state}>
          <ThemeContext.Provider value={{ color: "red" }}>
            <Child />
          </ThemeContext.Provider>
        </UserContext.Provider>
      </div>
    )
  }
}
```

#### 全局事件传递events

```shell
yarn add events
```

```js
import React, { PureComponent } from "react"
import { EventEmitter } from "events"

//创建事件总线
const eventBus = new EventEmitter()

class Header extends PureComponent {
  constructor(props) {
    super(props)
  }
  render() {
    return (
      <div>
        <button
          onClick={() => {
            this.handleClick()
          }}
        >
          发出事件
        </button>
        <h4>header</h4>
      </div>
    )
  }
  handleClick() {
    eventBus.emit("helloEmit", 111, 222)
  }
}
class Footer extends PureComponent {
  constructor(props) {
    super(props)
  }
  //监听
  componentDidMount() {
    // eventBus.on("helloEmit", this.helloEmitListener)
    eventBus.addListener("helloEmit", this.helloEmitListener) //两种方式都可以
  }
  //取消监听
  componentWillUnmount() {
    // eventBus.off("helloEmit", this.helloEmitListener)
    eventBus.removeListener("helloEmit", this.helloEmitListener)
  }
  helloEmitListener(num1, num2) {
    console.log(num1, num2)
  }
  render() {
    return <h4>footer</h4>
  }
}

export default class App extends PureComponent {
  render() {
    return (
      <div>
        <Header></Header>
        <Footer></Footer>
      </div>
    )
  }
}
```



#### react中实现`插槽`

* 子组件标签内部的jsx代码会被保存在子组件中的`props.chaldren`数组（一个元素）或者对象中
* 使用父子传值的方式传入

```js
import React, { Component } from "react"

//子组件
class Child extends Component {
  render() {
    console.log(this.props.children)
    return <div>Child {this.props.children[0]}</div>
  }
}

//子组件
class Child2 extends Component {
  render() {
    return (
      <div>
        Child2 {this.props.leftSlot}
        <div>{this.props.middleSlot}</div>
      </div>
    )
  }
}

//父组件
export default class App extends Component {
  constructor() {
    super()
    this.state = {}
  }
  render() {
    return (
      <div>
        <Child>
          {/* 方式一：直接在标签内部传入，会存在子组件的props.children数组或对象中,使用时使用数组下标获取，但是要注意顺序 */}
          <div>left</div>
          <div>middle</div>
          <div>right</div>
        </Child>
        <hr />
        {/* 方式二：父子传值的方式传入，存放在props对象中*/}
        <Child2
          leftSlot={<div>left</div>}
          middleSlot={<div>middle</div>}
          rightSlot={<div>right</div>}
        />
      </div>
    )
  }
}
```

### 关于`setState`

setState方法继承自`React.Component`类

![image-20220519151644175](index.assets/image-20220519151644175.png) 

#### setState异步更新

使用异步更新的原因

![image-20220519152658047](index.assets/image-20220519152658047.png) 

#### 如何获取异步结果

```js
import React, { Component } from "react"

//获取异步数据
export default class App extends Component {
  constructor() {
    super()
    this.state = {
      name: "wangyang",
      age: 18,
    }
  }
  //方式二
  componentDidUpdate() {
    console.log(this.state.name) //先获取
  }
  render() {
    return (
      <div>
        <button onClick={() => this.handleClick()}>修改数据</button>
      </div>
    )
  }
  handleClick() {
    this.setState(
      {
        name: "kobe",
      },
      () => {
        //方式一
        //第二个参数接收一个函数，这里可以获取异步数据，类似vue $nextTick
        console.log(this.state.name) //后获取
      }
    )
  }
}
```

#### 使setState同步更新

reatc18版本之前，在定时器中和执行原生函数中设置setState是同步的，

```js
  componentDidMount() {
    //方式一：使用原生事件
    document.getElementById('btn').addEventListener('click', () => {
      this.setState({
        name: 'kobe',
      })
      console.log(this.state.name)
    })
  }

  handleClick() {
    // 方式二：在定时器中执行
    setTimeout(() => {
      this.setState({
        name: 'kobe',
      })
      console.log(this.state.name)
    }, 0)
  }
```

![image-20220701101505127](index.assets/image-20220701101505127.png) 

> 合成事件
>
> ```js
> render() {
>     return (
>       <div>
>         <button onClick={() => this.handleClick()}>修改数据</button>
>       </div>
>     )
>   }
> ```
>
> 这里的`onClick`就是合成事件
>
> react开发的项目，你可以跑在浏览器中，也可以使用react-native跑在移动端中
>
> 所以对于jsx代码：跑在浏览器中，产生的就是浏览器的DOM事件对象，跑在移动端，产生的就是移动端原生控件的对象

#### setState数据的合并操作

当你调用`this.setState({name:'traeyoung'})`设置state中的属性时，是不是担心之前state中别的数据会被覆盖

react的操作是执行此方法时，实际上是调用`Object.assign({},this.state,{name:'kobe'})`，依次将源对象（第二个和第三个）复制到目标对象（第一个）中，此方法返回目标对象

这样其他的属性还在，并且新的name属性覆盖了之前的

#### setState本身的合并

```js
 //age=0 
 handleClick() {
    this.setState({
      age: this.state.age + 1,
    })
    this.setState({
      age: this.state.age + 1,
    })
    this.setState({
      age: this.state.age + 5,
    })
    //age=5
    //内部会把三次执行setState合并成一次，每次做的操作一样，都是设置age的值，使用do while遍历队列，也是使用Object.assign复制源对象到目标对象，只会执行较后一次
  }
```

如果你确实是想连续执行`setState`的操作，可以使用`updater`函数的方式

```js
  //age=0 
  handleClick() {
    //使用updater函数，这种方式也会调用do while遍历队列，但是updater函数中的第一个参数永远是前一次setState更新后的数据
    this.setState((prevState, props) => {
      //props参数用的较少
      return {
        age: prevState.age + 1,
      }
    })
    this.setState((prevState) => {
      return {
        age: prevState.age + 1,
      }
    })
    this.setState((prevState) => {
      return {
        age: prevState.age + 1,
      }
    })
    //age=3
  }
```

### React更新机制

#### diff算法、keys优化

![image-20220703102907624](index.assets/image-20220703102907624.png) 

![image-20220703103722203](index.assets/image-20220703103722203.png) 

![image-20220703115345967](index.assets/image-20220703115345967.png) 



![image-20220703115543514](index.assets/image-20220703115543514.png) 

` keys`属性的使用原因：mutation的产生

![image-20220703115926523](index.assets/image-20220703115926523.png) 

**keys的优化：**

![image-20220703120918986](index.assets/image-20220703120918986.png) 

#### 组件嵌套的render函数调用(性能优化)

`shouldComponentUpdate`生命周期函数，函数默认返回`true`，表示数据更新，render函数就会重新渲染，如果返回`false`，render函数就不会重新渲染，以此得到性能优化

该函数有两个参数：`nextProps`，`nextState`，更新后的props和state

```js
import React, { Component } from "react"

class Banner extends Component {
  render() {
    console.log("Banner")
    return <h4>Banner</h4>
  }
}
class Main extends Component {
  render() {
    console.log("Main")
    return <Banner></Banner>
  }
}

class Header extends Component {
  render() {
    console.log("Header")
    return <h4>header</h4>
  }
}
class Footer extends Component {
  render() {
    console.log("Footer")
    return <h4>footer</h4>
  }
}

export default class App extends Component {
  constructor() {
    super()
    this.state = {
      counter: 0,
      message: "哈哈",
    }
  }
  render() {
    console.log("App")
    return (
      <div>
        {this.state.counter}
        <button onClick={() => this.handleClick()}>修改数据</button>
        <button onClick={() => this.handleClick2()}>修改文本</button>
        <Header></Header>
        <Main></Main>
        <Footer></Footer>
      </div>
    )
  }
  //控制当前组件在数据更新时是否重新渲染⭐
  shouldComponentUpdate(nextProps, nextState) {
    if (this.state.counter !== nextState.counter) {
      return true
    }
    return false
  }
  //点击按钮使用setState修改数据，这会使render函数重新渲染，所以所有嵌套组件中的render都会重新渲染
  //并且该组件中并没有使用改变的message数据，这显然是不合理的，我们仅希望修改counter时重新渲染
  handleClick() {
    this.setState({
      counter: this.state.counter + 1,
    })
  }
  handleClick2() {
    this.setState({
      message: this.state.message + "哈",
    })
  }
}
```

问题：

* 每个类都需要手动执行该生命周期函数吗?

`React.PureComponent`的使用

```js
  shouldComponentUpdate(nextProps, nextState) {
    if (this.props.color !== nextProps.color) {
      return true;
    }
    if (this.state.count !== nextState.count) {
      return true;
    }
    return false;
  }
```

在这段代码中，`shouldComponentUpdate` 仅检查了 `props.color` 或 `state.count` 是否改变。

如果这些值没有改变，那么这个组件不会更新。

如果你的组件更复杂一些，你可以使用类似`“浅比较”`的模式来检查 `props` 和 `state` 中所有的字段，以此来决定是否组件需要更新。

在每个类组件中都使用shouldComponentUpdate函数过于麻烦，我们可以将`类组件`继承自` React.PureComponent `来自动的进行 浅比较

```js
import React, { PureComponent } from "react"

class Banner extends PureComponent {
  render() {
    console.log("Banner")
    return <h4>Banner</h4>
  }
}
class Main extends PureComponent {
  render() {
    console.log("Main")
    return <Banner></Banner>
  }
}

export default class App extends PureComponent {//⭐
  constructor() {
    super()
    this.state = {
      counter: 0,
      message: "哈哈",
    }
  }
  render() {
    console.log("App")
    return (
      <div>
        {this.state.counter}
        <button onClick={() => this.handleClick()}>修改数据</button>
        <button onClick={() => this.handleClick2()}>修改文本</button>
        <Main></Main>
      </div>
    )
  }
  handleClick() {
    this.setState({
      counter: this.state.counter + 1,
    })
  }
  handleClick2() {
    this.setState({
      message: this.state.message + "哈",
    })
  }
}
```

* 函数组件没有生命周期，如何解决该问题?

`memo`的使用

```js
//memo是一个函数，实际上也是一个高阶组件，这个函数传递一个函数，返回一个新的函数组件
const MemoHeader = memo(function () {
  console.log("header")
  return <h4>header</h4>
})
```

```js
import React, { PureComponent, memo } from "react"

//Banner组件没有使用memo包裹，但是也没有重新渲染，是因为Main类组件继承自了PureComponent，父组件本身就不会渲染
function Banner() {
  console.log("Banner")
  return <h4>banner</h4>
}
class Main extends PureComponent {
  render() {
    console.log("Main")
    return <Banner></Banner>
  }
}

const MemoHeader = memo(function () {
  console.log("header")
  return <h4>header</h4>
})
const MemoFooter = memo(function () {
  console.log("footer")
  return <h4>footer</h4>
})

export default class App extends PureComponent {
  //⭐
  constructor() {
    super()
    this.state = {
      counter: 0,
      message: "哈哈",
    }
  }
  render() {
    console.log("App")
    return (
      <div>
        {this.state.counter}
        <button onClick={() => this.handleClick()}>修改数据</button>
        <button onClick={() => this.handleClick2()}>修改文本</button>
        <MemoHeader />
        <Main></Main>
        <MemoFooter />
      </div>
    )
  }
  handleClick() {
    this.setState({
      counter: this.state.counter + 1,
    })
  }
  handleClick2() {
    this.setState({
      message: this.state.message + "哈",
    })
  }
}
```

> 理论上，所有的类组件都可以继承自`React.PureComponent`，所有的函数组件都可以使用`memo`包裹

> 源码：浅层比较函数`shallowEqual`，PureComponent和memo都是使用浅层比较，
>
> memo方式中，如果你传入比较函数就是用传入的函数，没有传入就用shallowEqual
>
> ![image-20220704155915379](index.assets/image-20220704155915379.png) 

### setState不可变性

* 需求是在`friends`数组后面添加新的一项：

![image-20220704165252685](index.assets/image-20220704165252685.png) 

这种写法，先直接在数组后面push一个新的项，再使用setState进行render重新渲染，但是这种方式根本不会重新渲染render

理由：

```js
this.setState({
    friends:this.state.friends
})
```

这时的两个数据其实指向的根本就是同一个`内存地址`，之后在`shoudleComponentUpdate`中浅比较时虽然看似更改了数组，但是并未更改，所以函数返回false，不会进行render重新渲染

正确方式：`必须保证state中数据是不变的`

![image-20220704171037040](index.assets/image-20220704171037040.png) 

* 改变数组其中某一项中的数据，道理也是一样

![image-20220704171438953](index.assets/image-20220704171438953.png) 

![image-20220704172020253](index.assets/image-20220704172020253.png) 

> 在该例中，如果不进行浅比较（直接继承自`React.Component`）是没有问题的，但是没有得到性能优化，如果进行浅比较，就要保证setState数据的不可变性
>
> * 不改变原本数组，我们可以使用`ES6扩展运算符`
>
> * 不改变原本对象，可以使用`Object.assign`方法，也可以使用`ES6扩展运算符`



### 受控组件和非受控组件

#### `ref`

![image-20220705112303728](index.assets/image-20220705112303728.png) 

ref属性的值：可以是两种类型：`对象、函数 `  //字符串类型已启用

* 对象方式使用`createRef`api创建，在 ref 的 `current` 属性中访问

ref类型：

- 当 `ref` 属性用于 HTML 元素时，构造函数中使用 `React.createRef()` 创建的 `ref` 接收底层 DOM 元素作为其 `current` 属性。
- 当 `ref` 属性用于自定义 class 组件时，`ref` 对象接收组件的挂载`实例对象`作为其 `current` 属性。
- **你不能在函数组件上使用 `ref` 属性**，因为他们没有实例。

> 当 `ref` 属性用于自定义 class 组件时
>
> React 会在组件挂载时给 `current` 属性传入 DOM 元素，并在组件卸载时传入 `null` 值。`ref` 会在 `componentDidMount` 或 `componentDidUpdate` 生命周期钩子触发前更新。

```js
import React, { PureComponent, createRef } from "react"

class Child extends PureComponent {
  constructor(props) {
    super(props)
    this.state = {
      counter: 0,
    }
  }
  render() {
    return (
      <div>
        <div>{this.state.counter}</div>
        <button onClick={() => this.addNum()}>+</button>
      </div>
    )
  }
  addNum() {
    this.setState({
      counter: this.state.counter + 1,
    })
  }
}
export default class App extends PureComponent {
  constructor(props) {
    super(props)
    this.titleRef = createRef()
    this.ChildRef = createRef()
    this.titleEl = null
  }
  render() {
    return (
      <div>
        {/* 对象方式，推荐使用 */}
        <h4 ref={this.titleRef}>hello111</h4>
        {/* 函数方式 */}
        <h4 ref={(arg) => (this.titleEl = arg)}>hello222</h4>
        <button onClick={() => this.handleClick()}>获取</button>
        <hr />

        <button onClick={() => this.handleChild()}>执行子类组件中的方法</button>
        {/* 为 class 组件添加 Ref */}
        <Child ref={this.ChildRef}></Child>
      </div>
    )
  }
  handleClick() {
    //对象方式
    console.log(this.titleRef.current)
    this.titleRef.current.innerHTML = "createRef"
    //回调函数方式
    console.log(this.titleEl)
    this.titleEl.innerHTML = "func"
  }
  handleChild() {
    this.ChildRef.current.addNum()
  }
}
```

如果要在函数组件中使用 `ref`，你可以使用 [`forwardRef`](https://react.docschina.org/docs/forwarding-refs.html)（可与 [`useImperativeHandle`](https://react.docschina.org/docs/hooks-reference.html#useimperativehandle) 结合使用），或者可以将该组件转化为 class 组件。

#### `forwardRef` (ref转发)

函数组件上使用ref获取的是组件内部`某个`DOM元素，看你把ref属性设置在哪个DOM元素上⭐ 

```js
import React, { PureComponent, createRef, forwardRef } from "react"

//函数组件使用forwardRef高阶组件包裹，可以传入第二个参数ref
const Child = forwardRef(function (props, ref) {
  return (
    <div>
      <h4 ref={ref}>forwardRef{props.name}</h4>
    </div>
  )
})
export default class App extends PureComponent {
  constructor(props) {
    super(props)
    this.ChildRef = createRef()
  }
  render() {
    return (
      <div>
        {/* 如果不使用forwardRef，这里直接传入ref属性无效 */}
        <Child ref={this.ChildRef} name="组件aaaa" />
        <button onClick={() => this.handleClick()}>获取</button>
      </div>
    )
  }
  handleClick() {
    console.log(this.ChildRef.current)
  }
}
```

#### 受控组件、非受控组件

* 受控组件

![image-20220705142548369](index.assets/image-20220705142548369.png) 

![image-20220705152413943](index.assets/image-20220705152413943.png) 

受控组件基本演练

```js
import React, { PureComponent } from "react"

export default class App extends PureComponent {
  constructor(props) {
    super(props)
    this.state = {
      form: {
        username: "科比",
        duty: "SG",
      },
    }
  }
  render() {
    return (
      <div>
        <form
          onSubmit={(e) => {
            this.handleSubmit(e)
          }}
        >
          <label htmlFor="username">
            用户：
            {/* 这个input就是受控组件 */}
            <input
              type="text"
              id="username"
              name="username"
              value={this.state.form.username}
              onChange={(e) => this.formItemChange(e)}
            ></input>
          </label>
          <label htmlFor="duty">
            司职：
            {/* 这个select就是受控组件 */}
            <select
              id="duty"
              value={this.state.form.duty}
              name="duty"
              onChange={(e) => this.formItemChange(e)}
            >
              <option value="PG">控球后卫</option>
              <option value="SG">得分后卫</option>
              <option value="SF">小前锋</option>
            </select>
          </label>
          <button type="submit">提交</button>
        </form>
      </div>
    )
  }
  handleSubmit(e) {
    e.preventDefault()
    console.log(this.state.form)
  }
  // usernameChange(e) {
  //   const username = e.target.value
  //   this.setState({
  //     form: Object.assign({}, this.state.form, { username }),
  //   })
  // }
  // dutyChange(e) {
  //   this.setState({
  //     form: { ...this.state.form, duty: e.target.value },
  //   })
  // }

  //处理函数合并
  formItemChange(e) {
    this.setState({
      // [e.target.name] ES6计算属性名⭐
      form: { ...this.state.form, [e.target.name]: e.target.value },
    })
  }
}
```

* 非受控组件

不推荐使用非受控组件

![image-20220705162546070](index.assets/image-20220705162546070.png) 

```js
import React, { createRef, PureComponent } from "react"

export default class App extends PureComponent {
  constructor(props) {
    super(props)
    this.usernameRef = createRef()
    this.state = {
      form: {
        username: "科比",
      },
    }
  }
  render() {
    return (
      <div>
        <form
          onSubmit={(e) => {
            this.handleSubmit(e)
          }}
        >
          <label htmlFor="username">
            用户：
            <input type="text" id="username" ref={this.usernameRef}></input>
          </label>

          <button type="submit">提交</button>
        </form>
      </div>
    )
  }
  handleSubmit(e) {
    e.preventDefault()
    this.state.form.username = this.usernameRef.current.value
    console.log(this.state.form)
  }
}
```

### 高阶组件

![image-20220706102619632](index.assets/image-20220706102619632.png) 

![image-20220706105213147](index.assets/image-20220706105213147.png) 

```js
import React, { PureComponent } from "react"

class Home extends PureComponent {
  constructor(props) {
    super(props)
  }
  render() {
    return <div>{this.props.name}</div>
  }
}

//定义高阶组件
function enhanceComponent(WapperdComponent) {
  class NewComponent extends PureComponent {
    render() {
      return <WapperdComponent {...this.props} />
    }
  }
  NewComponent.displayName = "Kobe" //使用displayName属性修改组件(在devtools中)展示的名字，很少改动
  return NewComponent
}
const EnhanceHome = enhanceComponent(Home)

export default class App extends PureComponent {
  constructor(props) {
    super(props)
  }
  render() {
    return (
      <div>
        <EnhanceHome name="haha" />
      </div>
    )
  }
}
```

![image-20220706110504453](index.assets/image-20220706110504453.png) 

> 高阶组件内部也可以返回`函数组件`



#### 高阶组件应用

##### props 和 context

* 增强props

有些props是相同的，不需要欸个传入，使用高阶组件，可以从高阶组件中获取更多的props，`react-router`中的`withRouter`高阶组件就是一个例子

```js
import React, { PureComponent } from "react"

class Home extends PureComponent {
  constructor(props) {
    super(props)
  }
  render() {
    return (
      <div>
        {this.props.name}
        {this.props.county}
      </div>
    )
  }
}
class About extends PureComponent {
  constructor(props) {
    super(props)
  }
  render() {
    return (
      <div>
        {this.props.name}
        {this.props.county}
      </div>
    )
  }
}

//增强props
function enhanceComponent(WapperdComponent) {
  return class NewComponent extends PureComponent {
    render() {
      return <WapperdComponent {...this.props} level={100} county="中国" />
    }
  }
}
const EnhanceHome = enhanceComponent(Home)
const EnhanceAbout = enhanceComponent(About)

export default class App extends PureComponent {
  constructor(props) {
    super(props)
  }
  render() {
    return (
      <div>
        <EnhanceHome name="haha" />
        <EnhanceAbout name="kobe" />
      </div>
    )
  }
}
```

* 增强context

```js
import React, { PureComponent, createContext } from "react"

const UserContext = createContext({
  duty: "SG",
  country: "美国",
})

class Home extends PureComponent {
  constructor(props) {
    super(props)
  }
  render() {
    return (
      <div>
        {this.props.name}
        {this.props.country}
      </div>
    )
  }
}
class About extends PureComponent {
  constructor(props) {
    super(props)
  }
  render() {
    return (
      <div>
        {this.props.name}
        {this.props.country}
      </div>
    )
  }
}

//增强context
function enhanceComponent(WapperdComponent) {
  return (props) => {
    return (
      // 上下文对象需要传递的值放在高阶组件中，这样使用高阶组件包裹的组件就可以直接从props中拿到
      <UserContext.Consumer>
        {(value) => {
          return <WapperdComponent {...props} {...value} />
        }}
      </UserContext.Consumer>
    )
  }
}
const EnhanceHome = enhanceComponent(Home)
const EnhanceAbout = enhanceComponent(About)

export default class App extends PureComponent {
  constructor(props) {
    super(props)
  }
  render() {
    return (
      <div>
        <UserContext.Provider value={{ duty: "PG", country: "德国" }}>
          <EnhanceHome name="haha" />
          <EnhanceAbout name="kobe" />
        </UserContext.Provider>
      </div>
    )
  }
}
```

##### 渲染判断鉴权

比如说用户未登录，只能跳转到登录页面

```js
import React, { PureComponent } from "react"

class Home extends PureComponent {
  constructor(props) {
    super(props)
  }
  render() {
    return <div>home page</div>
  }
}
class LoginPage extends PureComponent {
  constructor(props) {
    super(props)
  }
  render() {
    return <div>login page</div>
  }
}

//登录渲染鉴权
function enhanceAuth(WapperdComponent) {
  return (props) => {
    if (!props.isLogin) {
      return <LoginPage />
    } else {
      return <WapperdComponent {...props}/>
    }
  }
}
const EnhanceHome = enhanceAuth(Home)

export default class App extends PureComponent {
  constructor(props) {
    super(props)
  }
  render() {
    return (
      <div>
        <EnhanceHome isLogin={true} />
        <EnhanceHome isLogin={false} />
      </div>
    )
  }
}
```

##### 生命周期劫持

比如现在需要知道每个组件的初次渲染时间

```js
import React, { PureComponent } from "react"

class Home extends PureComponent {
  constructor(props) {
    super(props)
  }
  render() {
    return <div>home page</div>
  }
}

//生命周期劫持
function WithRenderTime(WapperdComponent) {
  return class extends PureComponent {
    constructor(props) {
      super(props)
      this.beginTime = Date.now()
    }
    componentDidMount() {
      const interval = Date.now() - this.beginTime
      console.log(`${WapperdComponent.name}组件的渲染时间是:${interval}`)
    }
    render() {
      return <WapperdComponent />
    }
  }
}
const EnhanceHome = WithRenderTime(Home)

export default class App extends PureComponent {
  constructor(props) {
    super(props)
  }
  render() {
    return (
      <div>
        <EnhanceHome />
      </div>
    )
  }
}
```

#### 高阶组件意义

![image-20220706152531424](index.assets/image-20220706152531424.png) 

### 组件补充

#### refs转发

见`ref`

#### Portals的使用

![image-20220706160230110](index.assets/image-20220706160230110.png) 



Modal模态框案例

封装一个弹窗，但是现在要让弹窗都加载到根节点的兄弟元素`#modal`上面

![image-20220706162300886](index.assets/image-20220706162300886.png) 

![image-20220706162330050](index.assets/image-20220706162330050.png) 效果

...

#### Fragment组件

此组件的作用相当于vue中的`template`，小程序中的`block`

你可以使用此组件代替jsx最外层包裹的元素，不会渲染在页面

```js
import React, { Fragment, PureComponent } from "react"

export default class App extends PureComponent {
  render() {
    return (
      // <Fragment>
      //   <h4>标题</h4>
      //   <div>内容</div>
      // </Fragment>

      // 短语法,只写个标签也是代表使用了Fragment
      // 但是，短语法中不能添加任何属性⭐，如果你渲染一个列表要使用key属性，就需要写全Fragment
      <>
        <h4>标题</h4>
        <div>内容</div>
      </>
    )
  }
}
```

#### StrictMode组件

![image-20220707105012315](index.assets/image-20220707105012315.png) 

```js
const root = ReactDOM.createRoot(document.getElementById("root"))
// root.render(<App />)
root.render(
  <React.StrictMode>
    <App />
  </React.StrictMode>
)
```

> 严格模式检查的是什么

![image-20220707110213555](index.assets/image-20220707110213555.png) 

```js
import React, { Fragment, PureComponent, StrictMode } from "react"

class Home extends PureComponent {
  UNSAFE_componentWillMount() {
    console.log("UNSAFE_componentWillMount 严格模式抛出警告")
  }
  render() {
    return (
      <>
        <h4>哈哈</h4>
      </>
    )
  }
}
export default class App extends PureComponent {
  render() {
    return (
      <Fragment>
        <h4>标题</h4>
        <div>内容</div>
        <StrictMode>
          <Home />
        </StrictMode>
      </Fragment>
    )
  }
}
```

![image-20220707110654693](index.assets/image-20220707110654693.png) 

> 有些第三方库开发时可能没有使用严格模式，所以报错都是有可能的

## React中的样式

### React中的css

![image-20220707111739165](index.assets/image-20220707111739165.png) 

### 几种书写css的方式

#### 内联样式

![image-20220707112507554](index.assets/image-20220707112507554.png) 

```js
export default class App extends PureComponent {
  constructor(props) {
    super(props)
    this.state = {
      color: "green",
    }
  }
  render() {
    const pStyle = {
      fontSize: "60px",
      background: this.state.color,
    }
    return (
      <div>
        <h2 style={{ fontSize: "50px", color: "red" }}>标题</h2>
        <p style={pStyle}>文字藐视大赛u发表iub</p>
      </div>
    )
  }
}
```

#### 普通css

每个组件引入自己的css样式文件

![image-20220708103048615](index.assets/image-20220708103048615.png) 

![image-20220708105458800](index.assets/image-20220708105458800.png) 

> 弊端
>
> * 不同文件中相同类名的样式会有覆盖
> * 如果精确到`子代选择器`确实可以避免覆盖，但是这样做过于复杂
> * 如果你使用`less、scss`等css预处理器来方便书写，但是这些样式在打包后依然变成普通的css样式，所有还是有覆盖问题

#### css modules(css模块)

css modules并不是react特有的方案，而是所有使用了类似于webpack配置的环境下都可以使用

但是在其他项目中使用需要自己配置，比如配置`webpack.config.js`中`css-loader`相关的`modules:true`

react脚手架内置了css modules的配置

**将.css/.less/.scss样式文件改成`.module.css/.module.less/.module.scss`**即可直接引入并`当作模块`使用

![image-20220708140724375](index.assets/image-20220708140724375.png) 

 ![image-20220708142825494](index.assets/image-20220708142825494.png) 渲染出来的类名会加上唯一字符

> 解决了局部作用域的问题，但是也有一定的缺陷
>
> ![image-20220708143822378](index.assets/image-20220708143822378.png) 

#### css in js（styled-componentd库）

 CSS 由 JavaScript 生成而不是在外部文件中定义

*注意此功能并不是 React 的一部分，而是由第三方库提供。* React 对样式如何定义并没有明确态度

认识`styled-componentd`

![image-20220708144551479](index.assets/image-20220708144551479.png) 

> 样式代码中分号不可省略

包含css常用预处理器功能：`样式嵌套、伪类选择器、伪元素选择器、动态修改属性`等

styled.button``

styled.input``

styled.main``   调用什么元素所对应的函数返回的组件就渲染成什么元素对象

![image-20220708152421647](index.assets/image-20220708152421647.png) 



**动态修改属性⭐**：模板字符串

![image-20220708155021798](index.assets/image-20220708155021798.png) 



高级特性：`继承`、`主题`

有一些样式可能是相同的，可以使用继承

![image-20220708161136477](index.assets/image-20220708161136477.png) 



> 该库搭配vscode插件`vscode-styled-components`使用（语法提示）
>
> ![image-20220708150927839](index.assets/image-20220708150927839.png) 























### 语法补充

#### 编码规范

建议在state中只保存会改变的数据，那些`不会改变的数据可以直接放在constructor函数里面`

```js
  constructor() {
    this.list = ["一楼", "二楼", "三楼"]
    this.state = {
      currentIndex: 0,
    }
  }
```

#### 属性展开

传入给子组件的数据可以直接展开写，在子组件中的props对象中拿到

```js
<Child {...this.state} />
<Child {...this.props} />
```

#### ES6模板字符串

```js
    //标签模板字符串:可以通过模板字符串的方式对一个函数进行调用、
    const name = "kobe"
    const age = 18
    function aaa(...args) {
      console.log(args)
    }
    aaa``
    aaa`my name is ${name},age is ${age}` //调用函数并传参
    
    //console
    [Array(1)]
    0: ['', raw: Array(1)]
    length: 1
    [[Prototype]]: Array(0)
    VM1397:236 

    (3) [Array(3), 'kobe', 18]
    0: (3) ['my name is ', ',age is ', '', raw: Array(3)]
    1: "kobe"
    2: 18
    length: 3
    [[Prototype]]: Array(0)
```

![image-20220708150019199](index.assets/image-20220708150019199.png) 

