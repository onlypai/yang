###    时间转换

```js
/**
 * @param {string|number} times
 * 1643251873
 * 1643251873136
 * "1643251873136"
 * "2018-01-22T09:12:43.083Z"
 * "2021-09-03T22:42:05.659+00:00"
 * @param {string} format
 * "{Y}/{M}/{D} {h}:{m}:{s}"
 * @param {boolean} isWeek
 * @returns
 */
export function formatTime(
  times,
  format = "{Y}-{M}-{D} {h}:{m}:{s}",
  isWeek = false
) {
  let date
  let Y, M, D, h, m, s, a
  if (!isNaN(Number(times))) {
    //时间戳
    if (times.toString().length === 10) {
      times = Number(times) * 1000
    }
    date = new Date(Number(times))
    Y = date.getFullYear().toString()
    M = (date.getMonth() + 1).toString()
    D = date.getDate().toString()
    h = date.getHours().toString()
    m = date.getMinutes().toString()
    s = date.getSeconds().toString()
    a = date.getDay()
  } else {
    date = new Date(times)
    Y = date.getUTCFullYear().toString()
    M = (date.getUTCMonth() + 1).toString()
    D = date.getUTCDate().toString()
    h = date.getUTCHours().toString()
    m = date.getUTCMinutes().toString()
    s = date.getUTCSeconds().toString()
    a = date.getUTCDay()
  }
  const formatObj = {
    Y,
    M,
    D,
    h,
    m,
    s,
    a,
  }
  const res = format.replace(/{([YMDhmsa])+}/g, (result, key) => {
    const value = formatObj[key]
    // console.log(key); // a
    // console.log(result) //{Y}
    // console.log(value) //2022

    if (isWeek) {
      if (key === "a") {
        return ["日", "一", "二", "三", "四", "五", "六"][value]
      }
    }
    return value.toString().padStart(2, "0")
  })
  return res
}

console.log(formatTime(1643268783)) //2022-01-27 15:33:03
console.log(formatTime(1643268783056,"{Y}/{M}/{D} {h}:{m}:{s} {a}",true)) //2022/01/27 15:33:03 四
console.log(formatTime("1643268783056","{Y}/{M}/{D} {h}:{m}:{s} {a}",true))  //2022/01/27 15:33:03 四
console.log(formatTime("2018-01-22T09:12:43.083Z")) //2018-01-22 09:12:43
console.log(formatTime("2021-09-03T22:42:05.659+00:00","{Y}/{M}/{D} {h}:{m}:{s} {a}",true)) //2021/09/03 22:42:05 五
```

### 防抖和节流

#### 节流

在 **规定时间** 之内，限制 **一个动作** 只 **执行一次** 。

应用场景

1. 懒加载、滚动加载、加载更多或监听滚动条位置；
2. 百度搜索框，搜索联想功能；
3. 防止高频点击提交，防止表单重复提交；

```js
// 时间戳方案
function throttle(fn, wait) {
    var pre = Date.now()
    return function () {
        var now = Date.now()

        if (now - pre >= wait) {
            fn.apply(this, arguments) //arguments伪数组，apply方法正好需要数组参数
            pre = Date.now()
        }
    }
}
// 定时器方案
function throttle(fn,wait){
    var timer = null;
    return function(){
        if(!timer){
            timer = setTimeout(function(){
                fn.apply(this,arguments);
                timer = null;
            },wait)
        }
    }
}

//不传参使用
function handle1(){
    console.log(Math.random());
}
window.addEventListener("mousemove",throttle(handle,1000));

//传递参数
function handle2(num) {
    console.log(num)
}

window.addEventListener(
    "mousemove",
    throttle(function() {
        handle(111)
    }, 1000)
)
```

#### 防抖

#### 防抖和节流在vue中使用

```vue
<script>
export default {
  methods:{
      //错误使用方式
      getSearchResult() {
          debounce(function() {
              console.log(this.searchValue('111'));
          },1000)();
      },
      ///////////////////////////////////////////////////////////////
        debounce(function() {
              console.log(this.searchValue);
        })(); 

        // 这里的debounce 返回了一个函数 于是变成
        (function (fn) {
              clearTimeout(timeout); 
              timeout = setTimeout(() => {
                  // 创建一个新的 setTimeout, 这样就能保证输入字符后的
                  // interval 间隔内如果还有字符输入的话，就不会执行 fn 函数
                  fn.apply(this, arguments);
              }, 500);
        })()
        // 到这里  其实就变成了匿名函数的自执行
        // 由于每次触发input都会返回一个新的匿名函数  生成一个新的函数执行栈  所以防抖失效~
      //////////////////////////////////////////////////////////////
      
      //正确调用（子组件触发input的行为  返回的始终是一个同一个函数体  防抖成功 ）
      getSearchResult: debounce(function () {
            console.log(this.searchValue);
        }, 500)
  }
}
</script>
```

### div全屏显示

```js
//全屏
export function fullScreen(element) {
  //var element= document.documentElement; //若要全屏页面中div，var element= document.getElementById("divID");
  
  //IE 10及以下ActiveXObject
  if (window.ActiveXObject)
  {
      var WsShell = new ActiveXObject('WScript.Shell');
      WsShell.SendKeys('{F11}');
      //写全屏后的执行函数
  }
  //HTML W3C 提议
  else if(element.requestFullScreen) {
      element.requestFullScreen();
      //写全屏后的执行函数
  }
  //IE11
  else if(element.msRequestFullscreen) {
      element.msRequestFullscreen();
      //写全屏后的执行函数
  }
  // Webkit (works in Safari5.1 and Chrome 15)
  else if(element.webkitRequestFullScreen ) {
      element.webkitRequestFullScreen();
      //写全屏后的执行函数
  }
  // Firefox (works in nightly)
  else if(element.mozRequestFullScreen) {
      element.mozRequestFullScreen();
      //写全屏后的执行函数
  }
}



//退出全屏
export function fullExit(element){
  //var element= document.documentElement;//若要全屏页面中div，var element= document.getElementById("divID");

  //IE ActiveXObject
  if (window.ActiveXObject)
  {
      var WsShell = new ActiveXObject('WScript.Shell');
      WsShell.SendKeys('{F11}');
      //写退出全屏后的执行函数
  }
  //HTML5 W3C 提议
  else if(element.requestFullScreen) {
      document.exitFullscreen();
      //写退出全屏后的执行函数
  }
  //IE 11
  else if(element.msRequestFullscreen) {
      document.msExitFullscreen();
      //写退出全屏后的执行函数
  }
  // Webkit (works in Safari5.1 and Chrome 15)
  else if(element.webkitRequestFullScreen ) {
      document.webkitCancelFullScreen();
      //写退出全屏后的执行函数
  }
  // Firefox (works in nightly)
  else if(element.mozRequestFullScreen) {
      document.mozCancelFullScreen();
      //写退出全屏后的执行函数
  }
}
```





