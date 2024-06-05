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
package main

import (
	"fmt"
	"time"
)

func main() {
	ch1 := make(chan int, 5) // バッファサイズ5のチャネル1を作成
	ch2 := make(chan int, 5) // バッファサイズ5のチャネル2を作成

	fmt.Printf("Start!\n") // スタート

	// 2つのゴルーチン起動
	go r("A", ch1)
	go r("B", ch2)

	// 受信チャネル
	for ch := range ch1 {
		fmt.Println("A channel", ch)
	}
	for ch := range ch2 {
		fmt.Println("B channel", ch)
	}

	fmt.Printf("Finish!\n")

}

func process(num int, str string) {
	// num秒処理
	for i := 0; i <= num; i++ {
		time.Sleep(1 * time.Second)
		fmt.Println(i, str)
	}
}

func r(str string, ch chan int) {
	process(2, str)
	ch <- 1
	fmt.Println(str, "process 1 done")

	process(1, str)
	ch <- 2
	fmt.Println(str, "process 2 done")

	process(2, str)
	ch <- 3
	fmt.Println(str, "process 3 done")

	close(ch)
}

```

]

