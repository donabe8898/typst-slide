#import "@preview/polylux:0.3.1": *

#import themes.university: *

#show: university-theme.with(
  aspect-ratio: "16-9",
  short-title: "ディストロはデスクトップ環境で選べばいいと思う",
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



#title-slide(
  title:"デスクトップ環境で選べ",
  subtitle: "LinuxのGUI事情",
  authors: "OECU Programming Circle 岡本 悠吾",
  date: "2024-hoge-hoge",
  institution-name: "OPC"
  )

#slide(title: none)[
  = GUIなんてもんはあとからやってきた
  #v(1em)

  - OSをGUIで操作する仕組みは, コンピュターの歴史上で途中から始まった
#v(1em)
  - Linuxを含むUNIX系OSはUIを規定していない.
    - そもそもGUIなしでも動く（Windowsとは大違い）
    - サーバーとかGUIいらないのでこれでもいい
#v(1em)
  - *でも, GUIはほしいよね*
    - X window Systemの使用
]

#slide(title: "X window system")[

  - ビットマップディスプレイ上でウィンドウシステムを提供する*表示プロトコル*
    - ウィンドウシステム → ソフトのGUIサイズを自由に変更できる窓を表示するアレ
#v(1em)
  - お陰で複数のソフトを立ち上げて並べて表示できるぜ
#v(1em)
  - リファレンス実装としてX.Org Serverがある.

]

#slide()[
  #figure(
    image("images/xwindowsystem.png")
  )
]

#slide()[
  = デスクトップ環境
  #v(1em)
  - ウィンドウシステム, ディスプレイサーバー, GUIツールキット and more...を含むソフトウェア群
    - GUIを構成する仲間たち

  - ディストロは大体決まったデスクトップ環境を含んでる

]

#focus-slide()[
  Q. なんでデスクトップ環境で選ぶの?
]

#focus-slide()[
  A. *使い勝手が全ｯｯｯｯｯｯｯｯｯｯｯｯｯｯｯｯｯｯｯｯｯｯｯ然違うから*

]

#slide(title: "GNOME")[

  #grid(
    columns: (auto,auto),
    gutter: 15pt,
    text()[
        == 特徴
  #v(0.5em)
  - GNUプロジェクトのデスクトップ環境
  - マテリアルチックなデザイン

  #v(0.5em)
  == メリット・デメリット
  #v(0.5em)
  - #text(fill:blue)[独特の使い勝手]
  - #text(fill:blue)[情報多め]
  - #text(fill:red)[低スペPC殺し]
  - #text(fill:red)[設定項目が少ねぇ]
    ],
    text()[
      == 採用
      - Debian,Ubuntu
      - Fedora,RHEL,RockyLinux
      - ArchLinux,Manjaro
      - Gentoo Linux
      - FreeBSD(ports, pkg)
      - OpenBSD(pkg_add)
      - NetBSD(pkgsrc)
      - Solaris（OracleのUNIX）
      - AIX（IBMのUNIX）
      - HP-UX（HPのUNIX）
    ]



  )

]


#slide(title: "KDE Plasma")[

    #grid(
    columns: (auto,auto),
    gutter: 15pt,
    text[
      == 特徴
      #v(0.5em)
      - Windowsライクな使い心地
      - Qt使ってる
      #v(1em)
      == メリット・デメリット
      #v(0.5em)
      - #text(fill:blue)[高カスタマイズ性]
      - #text(fill:blue)[動作速度○]
      - #text(fill:red)[メモリーバカ食い]
      - #text(fill:red)[依存関係が大杉謙信]
    ],
    text[
      == 採用
      - Debian,Kubuntu
      - KDE Neon
      - Fedora,RockyLinux
      - ArchLinux,Manjaro
      - GentooLinux
      - OpenSUSE
      - Slackware
      - FreeBSD

    ]
    )

]

#slide()[
#figure(
  image("images/plasma01.png",width: 90%)
)

]

#slide(title: "Xfce")[

    #grid(
    columns: (auto,auto),
    gutter: 15pt,
    text[

      === 特徴
      #v(0.5em)
      - 軽さが売りのDE
      - UNIX哲学に則ったデザイン
      #v(1em)
      === メリット・デメリット
      #v(0.5em)
      - #text(fill:blue)[非常に軽快]
      - #text(fill:blue)[カスタマイズ性○]
      - #text(fill:red)[15年前くらいのデザイン]
      - #text(fill:red)[アニメーションとか知らない]
    ],
    text[
      == 採用
      - Debian,Xubuntu
      - Fedora,RockyLinux
      - ArchLinux,Manjaro
      - GentooLinux
      - FreeBSD
      - OpenBSD
      - NetBSD
    ]
    )
]

#slide()[
#figure(
  image("images/xfce01.png",width: 90%)
)

]

#slide(title: "Mate")[

  #grid(
    columns: (auto,auto),
    gutter: 15pt,
    text[
      === 特徴
      #v(0.5em)
      - 一昔前のGNOME
      #v(1em)
      === メリット・デメリット
      #v(0.5em)
      - #text(fill:blue)[分かりやすい配置]
      - #text(fill:blue)[Linux以外でも採用されがち]
      - #text(fill:red)[古臭いデザイン]
    ],
    text[
      == 採用
      - Debian,Ubuntu Mate
      - Fedora
      - ArchLinux
      - GentooLinux
      - FreeBSD
      - OpenBSD
      - NetBSD
      - OpenIndiana（フリーなSolaris）
    ]
    )
]

#slide()[
#figure(
  image("images/mate01.png",width: 90%)
)

]

#slide(title:"まとめ")[
  = ワイ的おすすめ順

#v(1em) 

GNOME $approx$ KDE Plasma $gt$ Xfce $gt.triple$ Mate


- GNOMEは採用率No.1で扱いやすい
- 飽きたら他のやつを使えばいい（どれも）

]

// #matrix-slide[
//   left
// ][
//   middle
// ][
//   right
// ]

/*
参考
https://polylux.dev/book/themes/gallery/university.html
*/