#import "@preview/polylux:0.3.1": *

#import themes.metropolis: *

#show: metropolis-theme.with(
  aspect-ratio: "16-9",
  footer: [IRC],

  // short-author: "donabe8898",
  // short-date: none,
  // color-a: rgb("#0C6291"),
  // color-b:rgb("#A63446"),
  // color-c:rgb("#FBFEF9"),
  // progress-bar: true
)


#show link: set text(blue)
#set text(font: "Noto Sans CJK JP",size:18pt)
#show heading: set text(font: "Noto Sans CJK JP")
#show raw: set text(font: "Noto Sans Mono CJK JP")
#show raw.where(block: true): block.with(
  fill: luma(240),
  inset: 10pt,
  radius: 4pt
)


// タイトル
#title-slide(
  title: "IRCで遊ぼう",
  subtitle: "インターネットチャットの原点",
  author: "岡本 悠吾",
  date: "2024-1-1",
  extra: "OECUプログラミングサークル"
)

#slide(title: "本講義の目的")[
  - IRCで遊びます
]

#focus-slide()[みなさん、チャットアプリ何使っていますか？]

#slide(title: "IRC")[
  - Internet Relay Chat 👀
    - サーバーを経由してクライアント同士でチャトができる仕組み
    - OSI参照モデル → アプリケーション層

  - 1988年にネット掲示板で使われていた技術の代用として開発

  *LINEやDiscordの先祖*
]


#slide(title:"特徴")[
  + 中央集権
    - 1サーバーに複数のチャンネルを作成してユーザーがそこに入る

  #v(1em)
  + 連携
    - サーバー同士を連携させることが可能
    - 連携先と連携者のサーバーで同一のチャンネルが作成
      - 片方のサーバーが落ちてももう片方でチャットを継続

  #v(1em)
  + 秘匿性
    - サーバーにログインしないとメッセージが閲覧できない
    - サーバーにメッセージが残らない→ログイン以前のやりとりが見えない
    - 通信内容は暗号化されない
      - TLSで暗号化することも可能
]

#slide(title: "使ってみよう")[

  = クライアントソフトウェア
  #v(1em)
  - *HexChat* (Win, Linux)
  - Pidgin (BSD, Linux, Solaris)
  - LimeChat (Win, mac)

    - 「IRC client」で検索すると出てくる

  お好きなものをインストールしよう
]

#slide(title: "サーバーにログイン")[

  + Network Listで「追加」を押す
  + ネットワークの名前を決める（各自のお好みで）
  + ネットワークを選択したまま「編集」を押す
  + 「サーバー」タブのipとポートを`irc.donabe8898.dev/6697`に設定
  + 「このネットワークのすべてのサーバーへはSSLを使う」にチェックを入れる
  + 「不正なSSL証明書を受け入れる」にチェックを入れる
  + 「パスワード」を`serverDona9118`に設定する
  + 閉じて接続
]

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

