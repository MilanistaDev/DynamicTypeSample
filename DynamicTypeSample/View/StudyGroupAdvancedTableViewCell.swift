//
//  StudyGroupAdvancedTableViewCell.swift
//  DynamicTypeSample
//
//  Created by 麻生 拓弥 on 2017/12/21.
//  Copyright © 2017年 麻生 拓弥. All rights reserved.
//

import UIKit

class StudyGroupAdvancedTableViewCell: UITableViewCell {

    // 表示させるUI部品
    private let studyGroupGenreImageView = UIImageView()
    private let titleNameLabel = UILabel()
    private let contentsDescriptionLabel = UILabel()
    let attendButton = UIButton()

    // レイアウト制約群
    private var commonConstraints: [NSLayoutConstraint] = []
    private var regularConstraints: [NSLayoutConstraint] = []
    private var largeTextConstraints: [NSLayoutConstraint] = []
    private let verticalAnchorConstant: CGFloat = 16.0
    private let horizontalAnchorConstant: CGFloat = 16.0

    // モデルを受け取ってプロパティに代入
    var studyGroup: StudyGroup? {
        didSet {
            if let studyGroup = studyGroup {
                studyGroupGenreImageView.image = UIImage(named: studyGroup.imageName)
                titleNameLabel.text = studyGroup.titleName
                contentsDescriptionLabel.text = studyGroup.contentsDescription
            }
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
        // UI部品の初期設定
        setupLabelsAndButtons()
        // セルにUI部品をaddSubView
        contentView.addSubview(studyGroupGenreImageView)
        contentView.addSubview(titleNameLabel)
        contentView.addSubview(contentsDescriptionLabel)
        contentView.addSubview(attendButton)
        // レイアウト制約適用
        setupLayoutConstraints()
        updateLayoutConstraints()
    }

    /// 各UI部品の初期設定
    private func setupLabelsAndButtons() {

        // 画像の初期設定(今回は画像サイズ固定)
        studyGroupGenreImageView.translatesAutoresizingMaskIntoConstraints = false
        studyGroupGenreImageView.contentMode = .scaleAspectFit

        // 勉強会タイトルの初期設定
        // UIFontTextStyle は Title2 を指定・自動でフォントサイズが変わるように設定・1行にする
        titleNameLabel.font = UIFont.preferredFont(forTextStyle: .title2)
        titleNameLabel.adjustsFontForContentSizeCategory = true
        titleNameLabel.translatesAutoresizingMaskIntoConstraints = false

        // 勉強会内容説明の初期設定
        contentsDescriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        // UIFontTextStyle は Body を指定・自動でフォントサイズが変わるように設定・3行にする
        contentsDescriptionLabel.font = UIFont.preferredFont(forTextStyle: .body)
        contentsDescriptionLabel.adjustsFontForContentSizeCategory = true
        contentsDescriptionLabel.numberOfLines = 3

        // 参加ボタンの初期設定
        attendButton.setTitle("参加", for: .normal)
        attendButton.setTitleColor(attendButton.tintColor, for: .normal)
        attendButton.backgroundColor = UIColor.clear
        attendButton.translatesAutoresizingMaskIntoConstraints = false
        // UIFontTextStyle は Subheadline を指定
        attendButton.titleLabel?.font = UIFont.preferredFont(forTextStyle: .subheadline)
        // 自動でフォントサイズが変わるように設定
        attendButton.titleLabel?.adjustsFontForContentSizeCategory = true
        attendButton.setContentHuggingPriority(UILayoutPriority.required, for: .horizontal)
    }

    /// Accessibility の Larger Text が有効になっている場合と通常設定の場合用にレイアウト制約を用意する
    private func setupLayoutConstraints() {

        let heightConstraint = studyGroupGenreImageView.heightAnchor.constraint(equalToConstant: 100)
        heightConstraint.priority = UILayoutPriority(rawValue: 999)

        // 共通のレイアウト制約
        commonConstraints = [
            studyGroupGenreImageView.leadingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leadingAnchor),
            studyGroupGenreImageView.topAnchor.constraint(greaterThanOrEqualTo: contentView.topAnchor, constant: verticalAnchorConstant),
            studyGroupGenreImageView.widthAnchor.constraint(equalToConstant: 100),
            heightConstraint
        ]
        // 通常設定の場合のレイアウト制約
        if #available(iOS 11.0, *) {
            regularConstraints = [

                studyGroupGenreImageView.bottomAnchor.constraint(lessThanOrEqualTo: contentView.bottomAnchor, constant: -verticalAnchorConstant),

                titleNameLabel.leadingAnchor.constraint(equalTo: studyGroupGenreImageView.trailingAnchor, constant: horizontalAnchorConstant),
                titleNameLabel.topAnchor.constraint(equalTo: studyGroupGenreImageView.topAnchor),
                titleNameLabel.trailingAnchor.constraint(equalTo: attendButton.leadingAnchor, constant: -horizontalAnchorConstant),

                contentsDescriptionLabel.firstBaselineAnchor.constraintEqualToSystemSpacingBelow(titleNameLabel.lastBaselineAnchor, multiplier: 1),

                contentsDescriptionLabel.leadingAnchor.constraint(equalTo: studyGroupGenreImageView.trailingAnchor, constant: horizontalAnchorConstant),
                contentsDescriptionLabel.bottomAnchor.constraint(lessThanOrEqualTo: contentView.bottomAnchor, constant: -verticalAnchorConstant),
                contentsDescriptionLabel.trailingAnchor.constraint(equalTo: attendButton.leadingAnchor, constant: -horizontalAnchorConstant),

                attendButton.centerYAnchor.constraint(equalTo: studyGroupGenreImageView.centerYAnchor),
                attendButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -horizontalAnchorConstant)
            ]
        }

        // Accessibility の Larger Text が有効になっている場合のレイアウト制約
        if #available(iOS 11.0, *) {
            largeTextConstraints = [
                titleNameLabel.leadingAnchor.constraint(equalTo: studyGroupGenreImageView.leadingAnchor),
                titleNameLabel.topAnchor.constraint(equalTo: studyGroupGenreImageView.bottomAnchor),
                titleNameLabel.trailingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.trailingAnchor),

                contentsDescriptionLabel.firstBaselineAnchor.constraintEqualToSystemSpacingBelow(titleNameLabel.lastBaselineAnchor, multiplier: 1),

                contentsDescriptionLabel.leadingAnchor.constraint(equalTo: studyGroupGenreImageView.leadingAnchor),
                contentsDescriptionLabel.bottomAnchor.constraint(equalTo: attendButton.topAnchor, constant: -verticalAnchorConstant),
                contentsDescriptionLabel.trailingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.trailingAnchor),

                attendButton.leadingAnchor.constraint(equalTo: studyGroupGenreImageView.leadingAnchor),
                attendButton.bottomAnchor.constraint(lessThanOrEqualTo: contentView.bottomAnchor, constant: -verticalAnchorConstant)
            ]
        }
    }

    /// フォントサイズが変わると呼ばれる
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        if #available(iOS 11.0, *) {
            let isAccessibilityCategory = traitCollection.preferredContentSizeCategory.isAccessibilityCategory
            if isAccessibilityCategory != previousTraitCollection?.preferredContentSizeCategory.isAccessibilityCategory {
                updateLayoutConstraints()
            }
        }
    }

    /// Accessibility の Larger Text が有効になっている場合と通常設定の場合用のレイアウト制約を適用する
    private func updateLayoutConstraints() {
        NSLayoutConstraint.activate(commonConstraints)
        if #available(iOS 11.0, *) {
            if traitCollection.preferredContentSizeCategory.isAccessibilityCategory {
                NSLayoutConstraint.deactivate(regularConstraints)
                NSLayoutConstraint.activate(largeTextConstraints)
            } else {
                NSLayoutConstraint.deactivate(largeTextConstraints)
                NSLayoutConstraint.activate(regularConstraints)
            }
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
}
