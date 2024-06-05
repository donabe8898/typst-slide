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
	// 3大都市の連想配列
	mp := map[string]bool{
		"Tokyo":  true,
		"Osaka":  true,
		"Nagoya": false,
	}
	fmt.Printf("%v\n", mp) // 一旦表示してみる

	mp["Fukuoka"] = false // 福岡を追加
	fmt.Printf("%v\n", mp)

	delete(mp, "Nagoya") // 名古屋は3大都市引退したほうが良いと思う（爆）
	fmt.Printf("%v\n", mp)

	fmt.Println("長さ=", len(mp)) // mapの長さを確認

	_, ok := mp["Osaka"] // 大阪が存在するかどうか
	if ok {
		fmt.Println("ok")
	} else {
		fmt.Println("Not found")
	}

	for k, v := range mp {
		fmt.Printf("%s=%t\n", k, v)
	}

}

```

]

