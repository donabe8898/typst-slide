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
	var arr1 = [3]string{} // 配列宣言
	arr1[0] = "りんご"
	arr1[1] = "バナナ"
	arr1[2] = "CL7 Honda ACCORD Euro R"
	arr2 := [3]int{3, 1, 8} // :=での宣言も可能

	// 出力
	for i := 0; i < 3; i++ {
		fmt.Printf("%s = %d\n", arr1[i], arr2[i])
	}

	// 宣言時に個数が決まっているのであれば[...]でもOk
	arr3 := [...]int64{1000, 1500, 1600, 1050, 1150, 1550, 1650, 1100}
	fmt.Printf("%v\n", arr3)

}
```

]

