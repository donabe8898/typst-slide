#show link: set text(blue)
#set text(font: "Noto Sans CJK JP",size:11pt)
#show heading: set text(font: "Noto Sans CJK JP")
#show raw: set text(font: "0xProto Nerd Font")
#show raw.where(block: true): block.with(
  fill: luma(240),
  inset: 10pt,
  radius: 4pt
)
#align(center)[
```go
// =====================================
// 関数かけっこ
// fnAとfnBのどちらが先に終了するか
// =====================================

package main

import (
	"fmt"
	"math/rand"
	"time"
)

func main() {
	fmt.Println("関数かけっこ")

	// チャネルの作成
	chA := make(chan string)
	chB := make(chan string)

	// ゴルーチン実行
	go fnA(chA)
	go fnB(chB)

	// どちらが先にチャネルを受け取るか
	select {
	case msg := <-chA:
		// 受け取ったメッセージの表示
		fmt.Printf("%v\n", msg)
		fmt.Println("Aの勝ち!")
	case msg := <-chB:
		// 受け取ったメッセージの表示
		fmt.Printf("%v\n", msg)
		fmt.Println("Bの勝ち!")
	}
}

// 処理A
func fnA(ch chan string) {
	r := rand.Intn(5000)                            // 1~5000までの乱数を生成
	time.Sleep(time.Millisecond * time.Duration(r)) // 処理をrミリ秒停止させる
	ch <- "function A is done"                      // 再開したらチャネルを送信
}

// 処理B
func fnB(ch chan string) {
	r := rand.Intn(5000)                            // 1~5000までの乱数を生成
	time.Sleep(time.Millisecond * time.Duration(r)) // 処理をrミリ秒停止させる
	ch <- "function B is done"                      // 再開したらチャネルを送信
}


```

]
