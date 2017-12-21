//
//  Constant.swift
//  DynamicTypeSample
//
//  Created by 麻生 拓弥 on 2017/12/21.
//  Copyright © 2017年 麻生 拓弥. All rights reserved.
//

import UIKit

struct DynamicTypeSample {
    static let topTextArray: [String] = ["SystemFont", "CustomFont", "Multiple UI components", "Advanced"]
    static let segueNameArray: [String] = ["systemFontSegue", "customFontSegue", "MultipleUIComponentsSegue", "MultipleUIComponentsAdvanceSegue"]
    static let textArray: [String] = ["Body", "Callout", "Caption1", "Caption2", "Footnote",
                                      "Headline", "Subhead", "Title1", "Title2", "Title3"]
    static let styleArray: [UIFontTextStyle] = [.body, .callout, .caption1, .caption2, .footnote,
                                                .headline, .subheadline, .title1, .title2, .title3]
}

struct StudyGroupSample {
    static let iconNameArray: [String] = ["ic_swift_study", "ic_kotlin_study", "ic_android_study"]
    static let titleArray: [String] = ["Swift勉強会 #1", "Kotlin勉強会 #2", "Android勉強会 #1"]
    static let contentArray: [String] =
        ["記念すべき第1回開催！Swift 4で追加された新しい要素・iOS 11で追加された新しい技術について学びましょう！興味がある方なら誰でも参加OK！",
         "前回好評だった勉強会が帰ってくる。Kotlinの基本的なことから応用まで学んじゃいましょう！Apple・iOSな方も大歓迎！",
         "記念すべき第1回開催！今回はLT形式！Androidに関連する内容ならなんでもOK！発表者もまだまだ募集中！"]
}
