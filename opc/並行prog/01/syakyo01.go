// AtCoder Beginner Contest 267: Probrem A - Saturday
// URL: https://atcoder.jp/contests/abc267/tasks/abc267_a
// 少しだけ変更を加えています

package main

import (
	"fmt"
)

func main() {
	var a string        // 入力する値を格納する変数
	fmt.Scanf("%s", &a) // 標準入力

	// 土曜日まで何日あるかを辞書型で持つ
	var day = map[string]int{
		"Monday":    5,
		"Tuesday":   4,
		"Wednesday": 3,
		"Thursday":  2,
		"Friday":    1,
	}

	// 入力から検索
	ans, is_found := day[a]

	// 曜日が見つかった場合
	if is_found {
		fmt.Println(ans)
	} else { // 曜日が見つからなかった場合
		fmt.Println("ans =", ans)
		fmt.Printf("%v is Not found \n", a)
	}

}
