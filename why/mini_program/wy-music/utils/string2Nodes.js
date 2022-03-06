export default function(keyword, value) {
  const nodes = []
  // startsWith匹配字符串开头字符是否相同，toUpperCase将字符转化成大写（兼容大写字母）
  if (keyword.toUpperCase().startsWith(value.toUpperCase())) {
    const key1 = keyword.slice(0, value.length)
    const node1 = {
      name: "span",
      attrs: { style: "color: #26ce8a; font-size: 14px;" },
      children: [ { type: "text", text: key1 } ]
    }
    nodes.push(node1)

    const key2 = keyword.slice(value.length)
    const node2 = {
      name: "span",
      attrs: { style: "color: #000000; font-size: 14px;" },
      children: [ { type: "text", text: key2 } ]
    }
    nodes.push(node2)
  } else {
    const node = {
      name: "span",
      attrs: { style: "color: #000000; font-size: 14px;" },
      children: [ { type: "text", text: keyword } ]
    } 
    nodes.push(node)
  }
  return nodes
}

