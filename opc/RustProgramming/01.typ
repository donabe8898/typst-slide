#import "@preview/polylux:0.3.1": *

#import themes.metropolis: *

#import emoji: crab
#import emoji: magnify

#show: metropolis-theme.with(
  aspect-ratio: "16-9",
  footer: "The Rust programming."
  // short-title: "The Rust programming.",

  // short-author: "donabe8898",
  // short-date: none,
  // color-a: rgb("#2196f3"),
  // color-b:rgb("#FF4A00"),
  // color-c:rgb("#FBFEF9"),
  // progress-bar: true
)


#show link: set text(blue)
#set text(font: "Noto Sans CJK JP",weight: "light", size: 18pt)
#show heading: set text(font: "Hack")
#show raw: set text(font: "Hack")
#show raw.where(block: true): block.with(
  fill: luma(240),
  inset: 10pt,
  radius: 4pt
)


// タイトル
#title-slide(
  title:"プログラミング Rust",
  subtitle: "環境構築 / 変数とif",
  author: "岡本 悠吾",
  date: "2024-hoge-hoge",
  extra: "OECU Programming Circle "
)

// この講義の目的
#slide(title:"この講義の目的")[

  #v(1em)
  + Rustのプログラミング環境を構築できる

  + 変数とif文が使えるようになる


  #v(5em)
  = 備考
  #v(1em)
  - #crab: 実践項目
    - プログラミング, ターミナルでの作業など
  - #magnify.r :検索したりして是非調べてほしいもの
]

// What is Rust language?

#new-section-slide("Rustとは？")

#slide(title: "What is Rust language?")[
  - Mozillaが開発しているプログラミング言語

  - オープンソースのコミュニティベースで絶賛開発中

  - 2015年にversion 1.0がリリース
    - Golang v1.0: 2012年, Kotlin v2.0: 2012年

  - 2016以降, 毎年StackOverflowにて「#text(fill:red)[プログラマーが最も愛する言語]」#text(fill:red)[1位]を獲得し続けている

  - Rust = 錆
  == 使いみち
  - Webアプリのバックエンド部 / Linux kernel / Windows NT kernel/  Android SDK / 組み込みシステム
]

// 特徴
#slide(title: "特徴")[

  + *メモリ安全*
    #v(0.5em)
    - メモリ(RAM)系のバグやセキュリティーホールから守る
      - Java, Go, Python
    - 変数の所有権, 借用チェッカー, 参照, 超強力な型システム
    #v(0.5em)

  + *実行速度が爆速*
    #v(0.5em)
    - コンパイラ基盤`llvm`を使用
    - ガベージコレクションが無い
      - メモリ安全な言語でGCが無いのはこいつだけ
    - 理論上, C言語と同等速度

    #v(0.5em)

  + *IDEレスで開発可能*
    #v(0.5em)
    - `rustup`, `cargo`などの有能ソフトウェアが標準で付属

]

// section 環境構築

#new-section-slide("環境構築")

#slide(title: "何をインストールするの?")[
  + *rustup*: Rustのコンパイラやツール群をインストールするためのマネージャ

    - cargo: デバッグ、ビルド、ドキュメント生成、テストなど様々なことができる万能ツール
    - clippy: リンター
    - rust-analyzer: LSP. テキストエディタで自動補完やセーブ時にフォーマットできたりする
    - rust-docs: 公式ドキュメントのコピー
    - rustfmt: フォーマッタ

]

#slide(title: "UNIX likeを使っている人")[
  == macOS, ※GNU/Linux, xBSD, Solaris
  #v(1em)
  + #crab webサイトにこれが載ってる
    ```sh
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
    ```

    - rustupから必要なツールチェインのインストールもやってくれます
]


#slide(title:"ローリング・リリースのLinux")[
  #v(0.5em)
  + Arch GNU/Linuxユーザーはパッケージマネージャから入れるのがオススメ
    ```sh
    sudo pacman -S rustup
    ```

  + rustupからツールチェインをインストール
    ```sh
    rustup default stable
    ```
    - toolchainのstable版（一番安定しているやつ）をインストール
      - よく使うのはstable版, nightly版

]


#slide(title:"窓ユーザーはすこしめどい")[

  == Windows10, 11
  #v(0.5em)
   #crab #magnify.r Windows で Rust 用の開発環境を設定する - Microsoft learn

  #link("https://learn.microsoft.com/ja-jp/windows/dev-environment/rust/setup")

  - Visual Studioのインストールが必須
  #v(2em)

  == オンラインエディタ
  #v(0.5em)
  Rust Playground

#link("https://play.rust-lang.org/?version=stable&mode=debug&edition=2021")

]

#new-section-slide("インストールできた方は反応ください")


//Hello,world

#new-section-slide("プロジェクトの作成")

#slide(title: "Hello,World")[
  = 作成方法
  #v(0.5em)
  + プロジェクトを作成したいディレクトリで #crab
    ```sh
    cargo new hogehoge
    ```

  + 既にあるディレクトリをプロジェクトディレクトリにする #crab
    ```sh
    cargo init
    ```
]

#slide(title: "Hello, world")[
  = 実行方法
  ```sh
  # 実行
  cargo run
  # 最適化をかけて実行
  cargo run --release
  # ビルド(プログラムは実行されない)
  cargo build
  # 最適化をかけてビルド(プログラムは実行されない)
  cargo build --release
  ```

  コードは`fn main(){}`に書く
  - Cでの`int main(void){}`と同じ

  実行すると`Hello, World`と表示される #crab
  - まさかのHello,worldを書かなくてもおk✨
]

#new-section-slide("変数")

#slide(title: "letキーワード")[
  - 変数宣言は「`let 変数名 = 値;`」 #crab
    - 変数は不変（イミュータブル）
    - 型推論あり

  - ミュータブル(再代入可能)にするには`mut`を追記

  - シャドーイングOK
    - 同じ名前の変数を何度も定義すること
]
#slide()[
  ```rs
  let a:i64 = 10;
  a = 1; // Error!
  let mut a: i64 = 10;
  a = 20; // OK!

  let b = 5; // これでもおk

  let love = 😻; // 絵文字もいけるぞ！
  ```
]

#slide(title: "型について")[
  = int（整数型）
  #v(0.5em)
  - `i8`, `i16`, `i32`, `i64`, `isize`
  - `i`のうしろはBit数
  - `size`はOSのBit数に依存

  = uint（符号なし整数型）
  #v(0.5em)
  - `u8`, `u16`, `u32`, `u64`, `u128`, `usize`

  = float
  #v(0.5em)
  - `f32`, `f64`
    - 基本的に`f64`を使えばよい

]

#slide(title: "if式")[
  - `if`式を用いて条件分岐できる #crab
    - C,C++のように`if`のあとの`()`は不要

  ```rs
  let a = 50;
  if a > 49 {
    println!("over 50");
  }else if a < 49{
    println!("under 50");
  }else{
    println!("{}",50);
  }
  ```
]

#slide(title: "標準出力")[
  - `println!()`マクロで標準出力ができる #crab
    - `!`が付いてたらマクロ

  - 変数を出力するには`{}`を使う
    - format

  ```rust
  println!("文字列のみの出力");
  let f = 3.14;
  println!("円周率は{}", f);
  ```

]

#new-section-slide("練習問題")

#slide(title:"練習問題1")[

  - 変数`fz`には符号なし整数が入ります.
  - 15の倍数であれば`fizzbuzz`, `fz`が3の倍数であれば`fizz`, 5の倍数であれば`buzz`と出力してください.
  - 以上のどれでもなければ`none`と出力してください.

  ```text
  fz = 60 -> fizzbuzz
  fz = 65 -> buzz
  fz = 66 -> fizz
  ```

  ```rs
  fn main(){
    let fz: usize = NUM;
    // これ以降にコードを書く
  }
  ```
]

#new-section-slide("めちゃくちゃ変な回答")

#slide()[
  ```rs
  fn main() {
    let fz = 66;
    let ans = if fz % 15 == 0 {
        "fizzbuzz"
    } else if fz % 5 == 0 {
        "buzz"
    } else if fz % 3 == 0 {
        "fizz"
    } else {
        "none"
    };
    println!("{}", ans);
}
  ```
]

#slide(title: "if文ではなくif式")[
  - Rustのifは結果を返す
  - これを利用すると三項演算子みたいに扱うことができる

  - `;`は途中式であることを表す

  = `;`が付いていない値が出てきた時点で、スコープの外側に戻り値として値が返される
]


// コンパイル
// typst compile 01.typ /home/yugo/git/donabe/typst-slide/opc/RustProgramming/01/{n} --format png