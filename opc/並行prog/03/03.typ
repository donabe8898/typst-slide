// typst compile 02.typ /home/yugo/git/donabe8898/typst-slide/opc/並行prog/02/第2回/{n}.png --format png

#import "@preview/polylux:0.3.1": *
#import themes.clean: *

#show: clean-theme.with(
  aspect-ratio: "16-9",
  footer: "Goであそぼう",
  // short-title: "",
  logo: image("03素材/gopher.svg"),
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
  title: "Go言語であそぼう",
  subtitle: "(第三回) Goの基礎",
  authors: "Yugo Okamoto a.k.a donabe8898",
  date: none,
  // watermark: image("01素材/gopher.svg",) ,//透かしの画像
  secondlogo: image("03素材/gopher.svg") // 通常ロゴの反対側に映るロゴ
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
  - 車（できればMR）
  - パソコン（そろそろ買い替えたい）

  #v(1em)
]


// TODO: 本文
#new-section-slide("Section 8. Goとデータ")


#slide(title:"型")[

- `int8`/`int16`/`int32`/`int64`: 整数
- `uint8`/`uint16`/`uint32`/`uint64`: 非負整数
- `int`: `int32`か`int64`（システムのbitにより異なる）
- `float32`/`float64`: 浮動小数点数
- `complex64`/`complex128`: 虚数
- `byte`: 1バイトデータ（=`uint8`）
- `rune`: 1文字（=`int32`）
- `uintptr`: ポインタを表現するのに十分な非負整数
- `string`: 文字列
- `bool`: 真偽値
]

#slide(title: "型変換")[
  - `型名()`で型変換を行うことができる

  main.go
  ```go
	var hoge uint32 = 8110
	fmt.Printf("%T\n", hoge) // uint32
	var huga uint64 = uint64(hoge)
	fmt.Printf("%T\n", huga) // uint64
  ```
]

#slide(title: "Printf関数")[
  - `fmt.Printf`関数では引数をフォーマットして文字列として出力する.
  - 個人的によく使う形式は以下の通り
  ```text
  %v（デフォルト）, %s（文字列）, %e（浮動小数点数）, %f（小数）, %d（整数）, %T（型表示）, %p（ポインタ）
  ```
]

#slide(title: "リテラル")[
  データの表現方法を色々と工夫できる
  ```text
  nil                   無しを表す値
  true                  真
  false                 偽
  1234, 1_064           整数（_は無視されるのでカンマの代わりに）
  0b101001, 0B1101      2進数
  0777, 0o757, 0O775    8進数
  0xFFFF, 0XFF12        16進数
  3.14                  小数
  1.21e5, 3.141E6       浮動小数点数
  1.33i                 虚数
  "Hello"               文字列
  'E'                   文字（rune型）
  ```
]

#new-section-slide("Section 9. Goとデータ構造")

#slide(title: "配列")[
コンパイル時に個数が決定されるものが*配列*

== 写経タイム

`Go1.pdf`
```go
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
```


]

#slide(title: "スライス")[
個数を途中で変更可能なものをスライスと呼ぶ

= 配列との違い
- メモリ効率や速度が低下する
- 配列よりも便利

== 写経タイム

`Go2.pdf`
// OK: 写経用PDFの作成
```go
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
```
]

#slide(title: "マップ")[
  - 所謂、連想配列・辞書型
    - (key, value)の形で保存されるスライス
    - keyで検索してvalueを得る
== 写経タイム

`Go3.pdf`

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

#slide(title: "構造体")[
  - Goには *classが無い*
    - structに対してメソッドの実装を行うことはできる（structがclassの一部機能を有している）
]
// TODO: マップ

// TODO: 構造体
