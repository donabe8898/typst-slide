// typst compile 01.typ /home/yugo/git/donabe8898/typst-slide/opc/並行prog/01/第1回/{n}.png --format png

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
  - サーバーに興味がある
  - モダンな言語を習得したい
]

#slide(title: "自己紹介")[
  = 岡本 悠吾 - Yugo Okamoto

  #v(0.5em)

  - T学科4回生
  - サークル内でLinux関連の講義をやってます
  - 先日内定もらいました〜 Happy〜♪

  #v(1em)

  #grid(
    columns: (200pt,auto),
    text[
      == すきなもの
      - 鉄道
      - ガソリン車
      - コンピュータ
      - ゲーム
      - 蕎麦

    ],
    text[
      == きらいなもの
      - きのこ類
    ]

  )
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

    Plan 9 from Bell Labs, Solaris, Microsoft Windows NT

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
#new-section-slide("Section 3. 並行処理と並列処理")

#slide()[
  = 並行と並列
  #v(1em)
  - 並行は*ある範囲で複数の処理を独立に実行できる構成*
  - 並列は*ある時点で物事の処理が同時に実行*

    - Golangは*並行処理*

]

#slide()[
  // 並行と並列の図
  #figure(
    image("01素材/並列と並行.svg",width: 90%)
  )
]



// TODO: 5. Golangの基礎文法(写経)
#new-section-slide("Section 4. Goの基礎")

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
// TODO: 6. 練習問題1
#new-section-slide("Section 5. 練習問題 1")

#slide()[
  = 次の問題を解きましょう
  #v(1em)
   - #link("https://atcoder.jp/contests/abc052/tasks/abc052_a")[https://atcoder.jp/contests/abc052/tasks/abc052_a]
   #align(left)[
    #figure(
      image("01素材/probrem01.png",width: 50%)
    )
   ]
]

// TODO: 7. goルーチン（写経）
#new-section-slide("Section 6. goルーチン")

#slide()[
  = goルーチン
  #v(1em)
  - Golangの並行処理を司る仕組み
    - 関数の前に`go`をつける
  #v(1em)

  ```Go
  go funcA()
  time.Sleep(3 * time.Second)
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


#slide(title: "解説")[
  #figure(
    image("01素材/並行処理1.svg",width: 50%)
  )
]

#slide(title: "次回")[
  - 次回は並行処理を採用する場合について説明

  == 並行処理は必ずしも優秀ではない
]