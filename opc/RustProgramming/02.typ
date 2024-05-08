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
  subtitle: "変数と基礎構文",
  author: "岡本 悠吾",
  date: "2024-hoge-hoge",
  extra: "OECU Programming Circle "
)

#slide(title:"この講義の目的")[

  #v(1em)
  + 変数について理解する

  + 基礎構文を書けるようになる


  #v(5em)
  = 備考
  #v(1em)
  - #crab: 実践項目
    - プログラミング, ターミナルでの作業など
  - #magnify.r :検索したりして是非調べてほしいもの
]

#new-section-slide("変数")

#slide(title: "束縛")[

  - 変数束縛は`let`キーワードを使う

  - 再代入は不可能

  ```rs
  let hoge;
  let huga = 2;
  let ham: i32 = 2;
  ```
]

#slide(title: "束縛")[
  ```rs
  let p = 3;
  // (1)
  let m = p;
  println("{}",p);
  {
    // (2)
    let m = 2;
    println!("{}",m); // 2
  }
  // ここで(2)のmは解放
  println!("{}", m) // 3
  ```

  - pという変数に3という数字を縛る
  - mという変数にpという変数の中身を縛る（ここでは値はコピーされます）
  - mという変数に2を縛る（もとの縛りは無かったことに）
]

#slide(title: "可変性")[
  - `mut`をつけると再代入可能になる
  - 型の変更は基本受け付けない

  ```rs
  let mut huga = 3;
  huga = 2;
  huga = 2.22; //これはエラー
  ```

]

#slide(title: "基本の型")[

  - 符号あり整数型: `i8`, `i16`, `i32`, `i64`, `isize`
  - 符号なし整数型: `u8`, `u16`, `u32`, `u64`, `u128`, `usize`
  - 浮動小数点数型: `f32`, `f64`
  - 文字型: `char`
  - ブール型: `bool`
  - タプル: `(char, u64, bool)`
]

#slide(title: "定数")[

  - `const`キーワードは定数
    - 普通に不変なので`mut`は使えない
    - 型は決めておく必要がある

  #crab
  ```rs
  const PI:f32 = 3.14;
  println!("ゆとり教育だと{:.0}になるとか嘘やで。",PI);
  ```
]


#slide(title: "所有権")[
  - Rustは1つの変数につき所有権を1つ持っている

  - 1つの所有権を、複数の変数が持つことができない

  - 所有権の移動（譲渡）
    - 変数を別の変数に束縛したとき
    - 関数に値を渡したとき

  #crab
  ```rs
  let p = String::from("ちくわ");

  // 以下のprintはエラー
  // println("{}",p);

  // これはOK
  println("{}",m);
  ```
]

#slide(title: "コピートレイト")[

  - `Trait` データ型を分類するための概念
    - トレイトに対してメソッドを定義できる

  - 標準で実装されたトレイトがある
    - `Copy trait`: 変数別の変数に束縛するときは所有権は移動せず、値をコピーして新しいオブジェクトを作成する。

  - 整数や浮動小数点数、ブール、文字型は`Copy trait`を実装している
]


#slide(title: "コピー")[
  - `.clone()`をつけることで、値のコピーを取れる
    - メモリを消費する（m,pそれぞれにメモリが割り当てられる）
    - コピーに時間がかかる

  #crab
  ```rs
  let p = 3;
  let m = p.clone();

  println("{}",p);
  println("{}",m);
  ```
]

#slide(title: "参照")[
  - 一時的に値を*借りる*

  ```rs
  let p = 
  ```

]

#slide(title:"ライフタイムとスコープ")[
  - 変数の束縛時にライフタイムが決まる
    - 変数がメモリに保存されていて、解放されていない状態
  ```
  
  x```

]