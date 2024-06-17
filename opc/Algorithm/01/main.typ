#import "../template.typ": *

#set text(font: "Noto Sans CJK JP",size:11pt)
#show heading: set text(font: "Noto Sans CJK JP")
#show raw: set text(font: "0xProto Nerd Font")
#show raw.where(block: true): block.with(
  fill: luma(245),
  inset: 10pt,
  radius: 10pt
)
// 表紙とか
#show: project.with(
  title: "データ構造とアルゴリズム",
  subtitle: "配列構造（コンテナとソート）1",
  authors: (
    (name: "Yugo Okamoto"),
  ),
  date: "2024年hoge月huga日",
)
// ページ設定
#set page(
    numbering: "1",
)
#set figure(
  numbering: "1",
)

// 目次設定
#counter(page).update(1)
#outline(title: [目次])
// 改ページ
#pagebreak()

#v(1.5em)
#h(1em)本資料はOECUプログラミングサークル（以下OPC）の下級生メンバーに向けて, プログラミングの際に必要と思われるアルゴリズムとデータ構造を学ぶために作成した.

前期授業期間で錦氏 `@nkiib` やぶっとん氏 `@button501` がC/C++の基礎知識について解説してくれており, 前提として先述の講義を受けた者を本講義のターゲットとしている.

#strike[なお筆者の都合で他の言語による実装が登場するかもしれないが, やってることはC++とほとんど同じなので読み替えてもらって構わない.]


#h(1em)講義全体の内容は筆者の学科で「アルゴリズムとデータ構造」という授業が存在し, 基本的にはその講義の内容に沿いつつも一部で競技プログラミングの知識・問題を引用することもある.

#pagebreak()

= 配列構造

#v(1em)

== 固定長配列

#v(1.5em)
- メモリ上で指定した個数の変数をまとめて確保するデータ構造
  - 静的配列とも呼ばれる
- 互いの要素はメモリアドレス上で隣接している
- 配列の確保に成功すると*配列の先頭へのポインタが返される*

#v(2em)
#align(center)[

4つの固定長配列を確保したときのイメージ図
```text

pointer
 │   ┌───┬───┬───┬───┐
 │   │ 4 │ 5 │ 8 │ 3 │               
 └─˃ ├───┼───┼───┼───┤
     │a1 │a2 │a3 │a4 │               
     └───┴───┴───┴───┘

```


]

- 要素の下側a1~a4はメモリアドレス
- ポインタは配列の先頭要素を表す

#v(2em)
== 動的配列
#v(1.5em)
- プログラム実行中でもサイズを変更できる配列

- 配列宣言時よりも余分にメモリを確保し, 足りなくなるとメモリを確保する処理を行う
  - 多くの場合は静的配列よりも実行速度が落ちる

- C言語ではプログラマー自身が`malloc`等を用いて確保しなければならない.

#align(center)[
  ```C
  int *arr;
  arr = (int*)malloc(sizeof(int)* 11); // int型配列を要素数11個で確保
  ```
]

#v(1em)
- C++では`vector`, Rustでは`vec!`, Pythonでは`List`がそれに値する
#align(center)[
  ```cpp
  std::vector<int> arr(11, 0);  // int型のベクタを要素数11個で確保. 同時に0で初期化
  arr.push_back(3);             // 末尾に3を挿入
  arr.pop_back();               // 末尾の要素を削除
  int l = arr.size();           // 配列のサイズを取得
  arr.insert(begin() + 2, 2);   // イテレータを指定して挿入
  ```
]
#pagebreak()
== ソートアルゴリズム
#v(1.5em)
- 配列の中身を昇順・降順に並べ替えるアルゴリズム
- 安定ソートは順位が同じである複数の要素がソート前後で入れ替わらない.
#v(1em)
本講義で紹介するソートアルゴリズムは以下の通り

#table(
  columns: (auto,auto,auto,auto,auto),
  align: horizon,
  [名称],[平均計算時間],[最悪計算時間],[メモリ使用量],[安定],
  [バブルソート],[$ n^2 $],[$ n^2 $],[$ 1 $],[○],
  [クイックソート],[$ n log n $],[$ n^2 $],[$ log n $],[-],
  [選択ソート],[$ n^2 $],[$ n^2 $],[$ 1 $],[-],
  [ヒープソート],[$ n log n $],[$ n log n $],[$ 1 $],[-],
  [挿入ソート],[$ n^2 $],[$ n^2 $],[$ 1 $],[○],
  [シェルソート],[$ n log n $],[$ n^(3/2) $],[$ 1 $],[-],
  [マージソート],[$ n log n $],[$ n log n $],[$ n $],[○]

)

#v(2em)

=== バブルソート
#v(1.5em)
- 全ての要素に対して, 隣合う2つの要素を比較して順序が逆であれば入れ替える. これを要素数-1回繰り返す.

- 平均・最悪計算時間共に$O(n^2)$なので効率は悪い

  - 実装が簡単かつ安定ソート

#v(1em)

#figure(
  caption: [バブルソートの実装(C++)],
)[
  #text()[
    #set align(center)
    ```cpp
    #include <cstdlib>
    #include <iostream>
    #include <vector>

    int main() {
      std::vector<int> arr = {6, 1, 3, 2, 8, 2, 4, 9};
      for (int i = 0; i < arr.size(); ++i) {
        for (int j = 1; j < arr.size() - i; ++j) {
          if (arr[j - 1] > arr[j]) {
            std::swap(arr[j], arr[j - 1]);
          }
        }
      }

      for (int i : arr) {
        std::cout << i << ", ";
      } // 1, 2, 2, 3, 4, 6, 8, 9,
      std::cout << std::endl;
      return EXIT_SUCCESS;
    }
    ```
  ]
]

#pagebreak()

=== クイックソート
#v(1.5em)

// TODO: クイックソート

#v(1em)

#figure(
  caption: [クイックソートの実装(C++)],
)[
  #text()[
    #set align(center)
    ```cpp
    #include <iostream>

void swap(int *a, int *b) {
  int tmp = *a;
  *a = *b;
  *b = tmp;
}

int partition(int arr[], int l, int r) {
  int pivot = arr[r];
  int i = (l - 1);

  for (int j = l; j < r; j++) {
    if (arr[j] <= pivot) {
      i++;
      swap(&arr[i], &arr[j]);
    }
  }
  swap(&arr[i + 1], &arr[r]);
  return (i + 1);
}

void quickSort(int arr[], int l, int r) {
  if (l < r) {
    int pivot = partition(arr, l, r);
    quickSort(arr, l, pivot - 1);
    quickSort(arr, pivot + 1, r);
  }
}

int main() {
  int l;
  int arr[8] = {6, 1, 3, 2, 8, 2, 4, 9};
  quickSort(arr, 0, sizeof(arr) / sizeof(arr[0]) - 1);

  for (int i : arr) {
    std::cout << i << ", ";
  }
  std::cout << std::endl;
  return 0;
}
    ```
  ]
]

// TODO: 選択ソート, ヒープソート


// TODO: 挿入ソート, シェルソート
// TODO: マージソート

// TODO: 線形サーチ
// TODO: バイナリサーチ（二分探索）
// TODO: bit全探索
