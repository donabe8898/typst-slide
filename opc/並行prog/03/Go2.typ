#show link: set text(blue)
#set text(font: "Noto Sans CJK JP",size:13pt)
#show heading: set text(font: "Noto Sans CJK JP")
#show raw: set text(font: "0xProto Nerd Font")
#show raw.where(block: true): block.with(
  fill: luma(245),
  inset: 10pt,
  radius: 10pt
)


#align(center)[
```go
// 今回はコメント書かなくてOKです
package main

import "fmt"

func main() {
	arr := []string{} // 個数未決定のスライス

	arr = append(arr, "Microsoft Window")
	arr = append(arr, "Apple macOS")
	arr = append(arr, "GNU/Linux")
	arr = append(arr, "FreeBSD")

	fmt.Println("長さ: ", len(arr))
	fmt.Println("キャパ: ", cap(arr))

	mk := make([]byte, 0, 114514) // make()によるメモリ確保
	fmt.Println("長さ: ", len(mk))
	fmt.Println("キャパ: ", cap(mk))
}

```

]

