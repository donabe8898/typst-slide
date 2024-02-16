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
#slide(title: "世の中には様々なOSがある")[
  カーネル別OSまとめ
  - *Windows NT* (10,11)
  - DOS (MS-DOS, FreeDOS, Human68k)
  - *Darwin/XNU* (macOS, iOS, iPad OS, Watch OS)
  - *Linux* (Ubuntu, Android)
  - BSD (FreeBSD, OpenBSD, NetBSD, Dragonfly BSD)
  - SunOS (Solaris, OpenIndiana)
  - TRON (μITRON)

十人十色

]

#slide(title: "なぜ推すのか")[

]

#slide(title: "なぜ推すのか")[
  - プログラミング技術は高い
    - ゲーム制作, プログラミング実習, 競プロ・アルゴリズムの授業etc..
]

#slide(title: "なぜ推すのか")[
  - プログラミング技術は高い
    - ゲーム制作, プログラミング実習, 競プロ・アルゴリズムの授業etc..

  === プログラムは書けるのに環境を構築・管理できない

  - 自分の商売道具は自分で整備できるようになりましょう
]

// KISSの法則
#slide(title: "ArchLinuxって何がいいの？")[
]

#slide(title: "ArchLinuxって何がいいの？")[
  #v(6em)
  = A. KISSの法則を徹底しているのが良い
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

#slide(title: "シンプルじゃない例")[
  = Windows11
  ===  ゲーム実況者Aさん
  毎日10時間ゲーム配信
  #v(2em)
  - ゲームクライアントと配信ソフト
  - メッセンジャー
  - ドライバー
]



#slide(title: "シンプルじゃない例")[
  == ゲームクライアント
  - XBOX → Steam使うからいらない
  == メッセンジャー
  - Teams → Gmail, discord使うからいらない
  == ドライバー
  - 最適化してFPS上げたい → ブラウザないとインストールできない
  - ドライバーが動かない → 設定項目どこ... レジストリ... ?
]



#slide(title: "シンプルじゃない例")[
#v(1em)
  = #text(fill:black)[いらないものが多い！]
  #v(1em)
  と同時に
  #v(1em)
  = #text(fill:black)[どこに何があるか分からない！]

]

#slide(title: "シンプルじゃない例")[
#v(1em)
  = #text(fill:black)[いらないものが多い！]
  #v(1em)
  と同時に
  #v(1em)
  = #text(fill:black)[どこに何があるか分からない！]
  #v(1em)
  だから
  #v(1em)
  = #text(fill:red)[シンプルじゃない！]
]

// ArchLinux特徴

#slide(title: "ArchLinuxの特徴")[
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

#slide(title: "ArchLinuxの特徴")[
  = その2. ローリング・リリース
  #v(1em)
  - ローリング・リリース
    - OS固有のバージョン番号が無い
      - Windows 10,  macOS Mojave

    - 半永久的に同じOSを使い続けられる
#v(1em)
  Q. OSのアップデートはどうするの？

  A. パッケージマネージャーに*全てお任せ*
]

#slide(title: "ArchLinuxの特徴")[
  = その3. Pacman
]

#slide()[
    #figure(
    image("pacman.jpg",width: 90%)
  )
]



#slide(title: "ArchLinuxの特徴")[
  = その3. Pacman
  #v(1em)
  - Arch系ディストロのパッケージマネージャ

  == aptやHomebrewとの違い
  - 扱うパッケージ（ソフトウェア）は常に最新
  - 設定項目が単純（/etc/pacman.confをいじるだけ）
  - *OSのアップデートにも使う*

]
#slide(title: "通常のOS update")[
  == Ubuntu
  + ソフトウェアセンター（GUI）を開く
  + アップデートを押す

  == Windows
  1. 設定→Windows Update
  2. 場合によっては強制再起動

]

#slide(title: "通常のOS update")[
  == Ubuntu
  + ソフトウェアセンター（GUI）を開く
  + アップデートを押す

  == Windows
  1. 設定→Windows Update
  2. 場合によっては強制再起動

  - 自分が入れたソフトウェアはアップデートされない

  - 使わないソフトウェアや機能も同時にアップデート
  - 使わないのに容量だけ喰う

]



#slide(title: "ArchLinuxのアップデート")[

  ```sh
  sudo pacman -Syu
  ```
  - OSを含むpacman経由でインストールしたソフトウェアが最新かどうかCheck
  - 最新でなければアップデート
    - カーネルは再起動すればアプデ反映

  === OSの基本機能, 応用ソフト問わず全てをアップデートできる
  === 常に最新！セキュリティ万全！
]

#slide(title: "ArchLinuxのアップデート")[

  ```sh
  sudo pacman -Syu
  ```
  - OSを含むpacman経由でインストールしたソフトウェアが最新かどうかCheck
  - 最新でなければアップデート
    - カーネルは再起動すればアプデ反映

]

#slide(title: "ArchLinuxの特徴")[
  = その4. Arch Build System
]

#slide(title: "ArchLinuxの特徴")[
  = その4. Arch Build System
  - ソースコードのビルドとpacman用パッケージの作成を自動化するためのシステム
    - portsみたいなもの

  - `PKGBUILD`ファイルに手順を書けば、コンパイルからパッケージング、インストールまで全て自動化できる
    - `PKGBUILD`とソースコードさえ持っていれば、コマンド一発でソフトのインストールが可能

  - `PKGBUILD`を一般ユーザーが配布
    - AUR（Arch User Repository）
]

#slide(title: "AURに登録されているソフトウェア")[
  - *Google Chrome, VSCode, Spotify, Slack*
    - ライセンスがフリーソフトウェアのものではない

  - *pacmanにあるソフトの開発版*
    - 試験的に使ってみたい人向け
    - `hogehoge-git`

]

#slide(title: "AURに登録されているソフトウェア")[
  - *Google Chrome, VSCode, Spotify, Slack*
    - ライセンスがフリーソフトウェアのものではない

  - *pacmanにあるソフトの開発版*
    - 試験的に使ってみたい人向け

  #v(2em)
  == #text(fill:blue)[pacman+AUR => Debian並のパッケージ数]
]

#focus-slide()[
  さあ、あなたもArchをインストールして

  圧倒的成長を遂げよう
]

#slide(title: "ArchLinuxをインストール")[
  #v(1em)
  検索「ArchLinux インストール」

  ArchLinux Wiki

  - #link("https://wiki.archlinux.jp/index.php/メインページ")
    - *Linuxの教科書*

  - VMか中古のThinkPadがオススメ
  - 下手な知恵袋見るよりこっち
  - 使えば使うほどスキルが上がっていく
    - 問題↔解決サイクル

]
