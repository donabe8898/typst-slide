#import "@preview/polylux:0.3.1": *

#import themes.university: *

#show: university-theme.with(
  aspect-ratio: "16-9",
  short-title: "ArchLinuxの勧誘",

  short-author: "donabe8898",
  short-date: none,
  color-a: rgb("#0C6291"),
  color-b:rgb("#A63446"),
  color-c:rgb("#FBFEF9"),
  progress-bar: true
)

#show link: set text(blue)
#set text(font: "Noto Sans CJK JP")
#show heading: set text(font: "Noto Sans CJK JP")
#show raw: set text(font: "Noto Sans Mono CJK JP")
#show raw.where(block: true): block.with(
  fill: luma(240),
  inset: 10pt,
  radius: 4pt
)


// タイトル
#title-slide(
  title:"ArchLinuxの勧誘",
  subtitle: "シンプル is the B★E★S★T",
  authors: "OECU Programming Circle 岡本 悠吾",
  date: "2024-hoge-hoge",
  institution-name: "OPC"
)

// 目的
#slide()[
  = 本講義の目的
  #v(0.1em)
  === 建前
  自分の作るソフトウェアが存分に発揮できるシステムを構築する

  === 本音
  オタク御用達のディストリビューションで気持ちよくなることができる
]

// ほんへ
#slide(title: "What's ArchLinux?")[
  == Linux Distributionの一つ
    - ディストリビューション: 頒布物
      - Linuxはカーネルの名前なのでユーザーアプリケーションは別のやつを使う.

  == 有名なディストロ
  - Ubuntu

  == Archは星の数ほどあるDistroの一つ
]

#slide(title: "Linuxディストロの利用例")[
  - ゲームやwebのサーバー
    - 一番よくある使われ方
    - Minecraft(JE,BE)やnginx, Apache鯖など...

  - デスクトップOS
    - C,C++での競技プログラミング
    - Webプログラミング

  - 携帯電話
    - Android
]


// KISSの法則
#slide(title: "ArchLinuxの最大の特徴")[
]

#slide(title: "ArchLinuxの最大の特徴")[
  #v(6em)
  = A. KISSの法則に沿った開発・運営
]


#slide(title: "KISS")[
  = KISSの法則
  === Keep it simple stupid.
    - シンプルで愚鈍(愚直)にする

  #v(2em)
  - 設計を単純にする
  - 必要ないのであれば複雑にしない

  === ソフトウェア開発において、度々議論に挙がるマインド
]



// ArchLinux特徴

#slide(title: "ArchLinux利用のメリット")[
  = その1. シンプル
  #v(1em)
  - インストール直後の環境
    - カーネル, ドライバー, シェル, コマンド, パッケージマネージャー
    - その他自分が入れたもの
  - インストール直後の容量
    - メモリ: 150MB程度 | ドライブ: 700MB 程度

  === 最小限の物しか入らない
  でもOSとしては成り立ってる

]

#slide(title: "ArchLinux利用のメリット")[
  = その2. ローリング・リリース
  #v(1em)
  - ローリング・リリース
    - OS固有のバージョン番号が無い
      - Windows 10,  macOS Mojave

    - 半永久的に同じOSを使い続けられる
#v(1em)

]

#slide(title: "ArchLinuxの特徴")[
  = その3. ドキュメントが充実している
  #v(1em)
  - ArchLinux Wiki
    - URL: #link("https://wiki.archlinux.jp/index.php/メインページ")

  - ArchLinuxに入るパッケージのインストール方法, 設定方法
  - よくある不具合のQ & A

]
#slide(title: "ArchLinuxの特徴")[
  = その3. ドキュメントが充実している
  #v(1em)
  - ArchLinux Wiki
    - URL: #link("https://wiki.archlinux.jp/index.php/メインページ")

  - ArchLinuxに入るパッケージのインストール方法, 設定方法
  - よくある不具合のQ & A

  = #text(fill:red)[ArchLinux使いでなくでも必見]

]
#slide(title: "ArchLinuxの特徴")[
  #v(1em)
  === 情報量が多すぎる
  - StackOverflowや知恵袋を見ても解決できなかった問題ががあっさり直る
    - Linuxの教科書
    #v(1em)
  === ディストロに依らない情報
  - Arch自体がシンプル→ディストロ固有の問題なのかどうか分かる
  - UNIX全体に通用する知識

]




#slide(title: "ArchLinuxの特徴")[
  = その4. コンピュータに少しだけ強くなる
  #v(1em)
  - なにか起きたら自分で何とかしてｽﾀﾝｽ

  - 問題発生→原因究明→ドキュメント閲覧→解決

  - グラフィカルなインストーラは無い
    - パーティション割りやネットワーク設定などは自分でどうぞ

  #text(fill:red)[毎日使えばちょっとは詳しくなる...かも?]
]





#slide(title: "ArchLinuxの特徴")[
  = その5. Arch Build System
  #v(1em)
  - ソースコードのビルドとpacman用パッケージの作成を自動化するためのシステム
    - portsみたいなもの

  - `PKGBUILD`ファイルに手順を書けば、ソースコードの取得, コンパイル, パッケージング, インストールまで全て自動化できる

]


#slide(title: "ArchLinuxの特徴")[

  = Arch User Repository

  - `PKGBUILD`を一般ユーザーが配布

  - *Google Chrome, VSCode, Spotify, Slack*
    - ライセンスがフリーソフトウェアのものではない

  - *pacmanにあるソフトの開発版*
    - 試験的に使ってみたい人向け
    - `hogehoge-git`

]


#slide(title: "まとめ")[
  ArchLinuxとは

  + #text(fill:blue)[シンプル]
  + #text(fill:blue)[自由]
  + #text(fill:blue)[分かりやすい]

  の三拍子が揃った *ウルトラスーパーデラックスDistribution*

  - DIY好き, 自分で制御したい人にお薦め

]
#focus-slide()[
  さあ、あなたもArchをインストールしてみましょう
]

#slide(title: "ArchLinuxをインストール")[
  #v(1em)
  検索「ArchLinux インストール」

  ArchLinuxと似たようなOS
  - Gentoo Linux
    - ソフトウェアはソースからコンパイルする主義
    - ドM向き

  - FreeBSD
    - Not Linux
    - 正統派UNIXを使いたいならコレ
    - ディスク使用率が高い場合でも安定して動作（鯖向き）

]
