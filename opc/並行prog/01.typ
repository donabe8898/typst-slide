// typst compile 01.typ /home/yugo/git/donabe8898/typst-slide/opc/並行prog/第1回/{n} --format png

#import "@preview/polylux:0.3.1": *
#import themes.clean: *

#show: clean-theme.with(
  aspect-ratio: "16-9",
  footer: "Goであそぼう",
  // short-title: "",
  logo: image("01素材/gopher.svg"),
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
  title: "Goの並行処理であそぼう 🐭",
  subtitle: "(第一回) 並行処理はいいぜ",
  authors: "Yugo Okamoto a.k.a donabe8898",
  date: none,
  // watermark: image("01素材/gopher.svg",) ,//透かしの画像
  secondlogo: image("01素材/gopher.svg") // 通常ロゴの反対側に映るロゴ
)

#slide(title: "本講義のターゲット層")[
  - Linux好き 🐧
  - ゲーム好き 🎮
  - パソコン好き 🖥
  - プログラミング好き 💾 *一番重要*
  - 問題解決好き ❗
  - めんどくさいのが嫌い 😮‍💨
]

#focus-slide(foreground:white, background: teal)[
  みなさんプログラム書いてますか！！！！！！
]


// TODO: 1. みなさん何のプログラムを書いてるか

#slide(title: "アンケート取ります")[
  #v(1em)
  *Q. 普段どんなプログラムを書いている？*
  #v(1em)
  + 競技プログラミング 🚴
  + ゲーム開発 🎮
  + 自作ソフトウェア 🖳
  + 研究用 🧪
  + 授業でしかプログラム書かない 🏫
  + プログラミング嫌い 🙁
]

#focus-slide(foreground:white, background: teal)[
  何も特別な事をしていない限り単一処理
]

// TODO: 2. プロセスの説明
#new-section-slide("Section 1. プロセス")

#slide()[
  = プロセス
  #v(1em)
  ```text
  プロセスとは、処理のことである。情報処理においてプログラムの動作中のインスタンスを意味し、プログラムのコードおよび全ての変数やその他の状態を含む。オペレーティングシステム (OS) によっては、プロセスが複数のスレッドで構成される場合があり、命令を同時並行して実行する

  - Wikipediより
  ```
  #v(1em)
  - プロセス → プログラム本体

  - スレッド → プログラムの処理内容

    - プロセス数 $<=$ スレッド数
]

#slide()[
  #figure(
    image("01素材/process.png",width: 60%),
    caption: [
      OS内のプロセスなんとなく図
    ]
  )
]

#slide()[

  #align(center)[
    = プロセス数の確認
    ```bash
    ps aux | wc -l
    ```
  ]

  #v(5em)

  #align(center)[
    = スレッド数の確認
    ```bash
    ps -eL | wc -l
    ```
  ]
]

// TODO: 3. Golangの説明
#new-section-slide("Section 2. Go言語")
#slide()[
  #grid(
    columns: (auto,auto),
    gutter: 15pt,
    text[
      = Go
      #v(1em)
      2009年Googleが発表したプログラミング言語
      == 特徴
      - *クセの強い*オブジェクト指向
      - コンパイル言語
      - メモリ安全かつガベージコレクション
      - 静的型付け
      - Python,Rubyに負けない程高い生産性
      - オープンソース
      - マスコットはホリネズミのGopherくん
    ],
    text[
      #figure(
        image("01素材/gopher.svg",width: 40%),
      )
    ],
  )
]
#slide()[
  == 対応OS
    Linux, macOS, FreeBSD, NetBSD, OpenBSD, DragonFly BSD

    Plan 9 from Bell LabsSolaris, Microsoft Windows NT

    iOS, Android, AIX, illumos

    #v(2em)

  - *開発者がSuper Hacker*

    - ケン・トンプソン: オリジナルのUNIX開発者の一人. grep, 正規表現の発案者

    - ロブ・パイク: UTF-8, 世界初のUNIX用ウィンドウシステム

    - Robert Griesemer: V8JavaScriptエンジン, Java HotSpot 仮想マシン

]
#slide()[
  #grid(

    columns: (auto,auto),
    text[
      = 何ができるのコレ
      #v(1em)
      + サーバーサイドプログラム
        - API返したり, ミドルウェアを操作したり...
        - Webサーバーのバックエンドプログラム

      + オープンソースプロジェクト
        - 言語使用もコンパイラ、ツール群も一式揃えるのが楽
    ],
    text[
    #figure(
        image("01素材/gopher_brown.png",width: 40%),
      )
    ]
  )
]

#slide(title: "Goの環境を作ってみよう")[

  #v(1em)
  構築方法: 私が書いた構築手順書（Linux用だけど他のOSでも大体一緒）

  #link("https://github.com/donabe8898/BuildEnvironments/blob/donabe8898/Language/Go/Ubuntu.md")[
    https://github.com/donabe8898/BuildEnvironments/blob/donabe8898/Language/Go/Ubuntu.md
  ]
  #v(4em)
  == 環境構築がどうしても出来ない人

  - The Go Playground
    - #link("https://go.dev/play/")[https://go.dev/play/]
]

#slide(title:"Hello, World")[
#align(center)[
  ```go
  package main
  import "fmt"

  func main() {
      fmt.Println("Hello, World")
  }
  ```
]
]

// TODO: 4. 並行処理と並列処理
// TODO: 5. Golangの基礎文法(写経)
// TODO: 6. 練習問題1
// TODO: 7. goルーチン（写経）
// TODO: 8. 練習問題2