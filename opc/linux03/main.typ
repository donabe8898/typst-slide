#import "@preview/polylux:0.3.1": *

#import themes.university: *

#show: university-theme.with(
  aspect-ratio: "16-9",
  short-title: "gcc",

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
  title:"インターネット・リレー・チャット",
  subtitle: "インターネット老人御用達\nメッセンジャー",
  authors: "OECU Programming Circle 岡本 悠吾",
  date: "2024-hoge-hoge",
  institution-name: "OPC"
)



// 本講義の目的
// 1. クライアントサーバーシステムの基礎知識
// 2. IRCサーバーの仕組み

// IRCとは
// - 1980年代後半からすでに存在した
// - 2020現在でもインターネット上の様々なコミュニティで活用されている

// IRCプロトコルの特徴
// - 中央集権 & リレー
// - インターネット掲示板とは違って、ログインしないとメッセージが見れない

// IRCサーバー
// - クライアントはIRCサーバーにログインすることで、チャンネルの設立が可能になる
// - チャンネルに対して１つのメッセージを送ると, サーバーはチャンネルに所属するユーザー全員にメッセージを転送する
// - チャンネルに入ってないとメッセージは見れない

// IRCクライアント
// 様々なクライアントがある
// - コマンドライン上で動くものから, GUIを含むリッチなものまで
// - OSを問わず様々なクライアントが存在する

// 実際に使ってみましょう


// 1. クライアントを用意
//  - windows: LimeChat
//  - macOS: LimeChat
//  - GNU/Linux: pidgin

// スライドは以上です

