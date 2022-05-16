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
      src="https://unpkg.com/react@16/umd/react.development.js"
      crossorigin
    ></script>
    <script
      src="https://unpkg.com/react-dom@16/umd/react-dom.development.js"
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
        ReactDOM.render(
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
      src="https://unpkg.com/react@16/umd/react.development.js"
      crossorigin
    ></script>
    <script
      src="https://unpkg.com/react-dom@16/umd/react-dom.development.js"
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
      ReactDOM.render(<App />, document.getElementById('app'))
    </script>
  </body>
```

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
      ReactDOM.render(<App />, document.getElementById('app'))
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
      ReactDOM.render(<App />, document.getElementById('app'))
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
      ReactDOM.render(<App />, document.getElementById('app'))
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
      ReactDOM.render(<App />, document.getElementById('app'))
    </script>
```

#### jsx本质

实际上，jsx仅仅是`React.createElement(component,props,...children)`函数的语法糖

①所有的jsx最终都会被转换成`React.createElement`函数调用

![image-20220512103715421](index.assets/image-20220512103715421.png) 

```js
  <body>
    <div id="app"></div>
    <script src="https://unpkg.com/react@16/umd/react.development.js" crossorigin></script>
    <script src="https://unpkg.com/react-dom@16/umd/react-dom.development.js" crossorigin></script>
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
      ReactDOM.render(msg1, document.getElementById("app")) //③虚拟DOM转化成真实的DOM并塞进根元素
    </script>
  </body>
```

![image-20220512104552642](index.assets/image-20220512104552642.png) 

[jsx -> React.createElement](https://babeljs.io/repl)

②执行React.createElement()会返回一个`ReactElement`对象（其实是一个对象树，就是大名鼎鼎的`虚拟DOM`）

可以打印这个对象看结构

![image-20220513153656809](index.assets/image-20220513153656809.png) 

③`ReactDOM.render(<App/>,document.getElementById("app"))`方法将虚拟DOM与真实的DOM同步（映射）起来，这个过程叫做`协调（Reconciliation）`

> WEB开发中的流程：jsx -> React.createElement() -> ReactElement对象 -> 经过ReactDOM.render -> 真实的DOM
>
> react-navite中的流程：jsx -> React.createElement() -> ReactElement对象 -> 经过ReactDOM.render -> 原生的（移动端）控件

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
      ReactDOM.render(<App />, document.getElementById('app'))
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
    <script src="https://unpkg.com/react@16/umd/react.development.js" crossorigin></script>
    <script src="https://unpkg.com/react-dom@16/umd/react-dom.development.js" crossorigin></script>
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
      ReactDOM.render(<App />, document.getElementById('app'))
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

### PWA-渐进式WEB应用

![image-20220516145337395](index.assets/image-20220516145337395.png) 

> 如果你的应用程序没有PWA功能，那么可以将相关文件全部删除

### 脚手架中的webpack

和`vue-cli3`脚手架一样，react脚手架将有关微博pack的配置信息都隐藏起来了

如果想查看webpack相关配置信息，运行`npm run eject`命令，前提是你的本地代码需要全部提交（本地无修改）

![image-20220516152422723](index.assets/image-20220516152422723.png) 

![image-20220516152817559](index.assets/image-20220516152817559.png) 

多出的两个文件夹就是配置信息，并且`package.json`文件中之前隐藏的依赖增加了很多
