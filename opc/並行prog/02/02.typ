// typst compile 02.typ /home/yugo/git/donabe8898/typst-slide/opc/並行prog/02/第2回/{n}.png --format png

#import "@preview/polylux:0.3.1": *
#import themes.clean: *

#show: clean-theme.with(
  aspect-ratio: "16-9",
  footer: "Goであそぼう",
  // short-title: "",
  logo: image("02素材/gopher.svg"),
  color: teal
)

#show link: set text(blue)
#set text(font: "Noto Sans CJK JP",size:18pt)
#show heading: set text(font: "Noto Sans CJK JP")
#show raw: set text(font: "JetBrains Mono")
#show raw.where(block: true): block.with(
  fill: luma(240),
  inset: 10pt,
  radius: 4pt
)

// TODO: 本文

#title-slide(
  title: "Goの並行処理であそぼう",
  subtitle: "(第二回) 並行処理はむずい",
  authors: "Yugo Okamoto a.k.a donabe8898",
  date: none,
  // watermark: image("01素材/gopher.svg",) ,//透かしの画像
  secondlogo: image("02素材/gopher.svg") // 通常ロゴの反対側に映るロゴ
)

#slide(title: "本講義のターゲット層")[
  - サーバーに興味がある
  - モダンな言語を習得したい
]

#slide(title: "自己紹介")[
  = 岡本 悠吾 - Yugo Okamoto

  #v(0.5em)

  - T学科4回生
  - サークル内でLinux関連の講義をやってます

  = 欲しい物リスト
  - 車（FR車）
  - パソコン（そろそろ買い替えたい）

  #v(1em)
]


// TODO: 本文
#new-section-slide("Section 7. チャネルとバッファ")


#slide(title:"バッファ")[

#v(1em)
チャネルにはバッファを持たすことができる.
= メリット
- 複数のデータを一時的に格納できる
- チャネルでやりとりできるデータの数が増える

]

#slide()[
```go
package main

import "fmt"

func main() {
	ch := make(chan int, 2) // チャネル変数作成

	ch <- 10             // チャネルの1番目のバッファに値を追加
	fmt.Println(len(ch)) // チャネルの長さを見てみる

	ch <- 20             // チャネルの2番目のバッファに値を追加
	fmt.Println(len(ch)) // チャネルの長さを見てみる
}
```
]

#slide()[
```go
package main

import "fmt"

func main() {
	ch := make(chan int, 2) // チャネル変数作成

	ch <- 10             // チャネルの1番目のバッファに値を追加
	fmt.Println(len(ch)) // チャネルの長さを見てみる

	ch <- 20             // チャネルの2番目のバッファに値を追加
	fmt.Println(len(ch)) // チャネルの長さを見てみる

	ch <- 30 // バッファの数を超えるのでこれはエラー
	fmt.Println(len(ch))
}
```

]

#slide()[
  = 写経タイム!!!!
  #v(1em)
  - Discordに貼ったPDFのソースコードを写経（丸写し）しましょう。

    - なるべく自分でタイピングすることを*強く*おすすめします
  #v(1em)
  - 写経できた人はVCステータスを「できた!」にしてください
  - 質問がある人はテキストチャットかVCでどうぞ
]

#new-section-slide("解説")

#slide()[
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

#new-section-slide("Section VOID. 雑談")

#slide(title: "アノテーションコメント")[

  コードに残すコメントの意味を示す.

  = メリット
  - 第三者にコードをわかりやすく解説できる
  - 時間が経ってもすぐにコードの全貌がわかる
  - 進捗が掴みやすい。何をすればいいかわかる。
]

#slide()[
```md

TODO: 追加機能を実装しますよ〜。機能が不足していますよ〜。何らかのメッセージでもありますよ〜
FIXME: 修正が必要ですよ〜
OPTIMIZE: バカほど非効率なコードですよ〜
HACK: 何も考えずに書いたコードですよ〜
REVIEW: レビューが必要なコードですよ〜



XXX: 危険なコード。今すぐ修正。 💀
CHANGED: コードの変更点ありますよ〜
NOTE: 雑記ですよ〜
WARNING: 注意必要ですよ〜

```
]

#slide()[
```go
// TODO: ch<-30から2行を削除
package main
import "fmt"

func main() {
	ch := make(chan int, 2) // NOTE: チャネル変数作成

	ch <- 10             // チャネルの1番目のバッファに値を追加
	fmt.Println(len(ch)) // チャネルの長さを見てみる

	ch <- 20             // チャネルの2番目のバッファに値を追加
	fmt.Println(len(ch)) // チャネルの長さを見てみる

	ch <- 30 // WARNING: バッファの数を超えるのでこれはエラー
	fmt.Println(len(ch))
}
```
]
