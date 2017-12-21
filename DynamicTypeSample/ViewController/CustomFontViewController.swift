//
//  CustomFontViewController.swift
//  DynamicTypeSample
//
//  Created by 麻生 拓弥 on 2017/12/21.
//  Copyright © 2017年 麻生 拓弥. All rights reserved.
//

import UIKit

class CustomFontViewController: UIViewController {

    @IBOutlet weak var dynamicTypeTableView: UITableView!
    @IBOutlet weak var topConstraint: NSLayoutConstraint!

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = "Custom Font ver Futura"
        if #available(iOS 11.0, *) {
            self.navigationItem.largeTitleDisplayMode = .never
        } else {
            self.topConstraint.constant = -64.0
        }
        self.dynamicTypeTableView.delegate = self
        self.dynamicTypeTableView.dataSource = self
    }

    /// For header height and view
    func generateHeaderView() -> UIView {
        let sectionLabel = UILabel(frame: CGRect(x: self.dynamicTypeTableView.separatorInset.left,
                                                 y: 4.0,
                                                 width: (self.dynamicTypeTableView.frame.size.width - self.dynamicTypeTableView.separatorInset.left),
                                                 height: 0.0))
        sectionLabel.text = "Custom Font"
        if #available(iOS 11.0, *) {
            if let customFont = UIFont(name: "Futura-Medium", size: UIFont.labelFontSize) {
                sectionLabel.font = UIFontMetrics(forTextStyle: .headline).scaledFont(for: customFont)
            } else {
                sectionLabel.font = UIFont.preferredFont(forTextStyle: .headline)
            }
        } else {
            sectionLabel.font = UIFont.preferredFont(forTextStyle: .headline)
        }
        sectionLabel.sizeToFit()
        let sectionView = UIView(frame: CGRect(origin: .zero,
                                               size: CGSize(width: self.dynamicTypeTableView.frame.size.width,
                                                            height: sectionLabel.frame.size.height + 8.0)))
        sectionView.backgroundColor = UIColor(red: 232/255, green: 233/255, blue: 237/255, alpha: 1)
        sectionView.addSubview(sectionLabel)

        return sectionView
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

extension CustomFontViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = self.generateHeaderView()
        return headerView
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        let headerView = self.generateHeaderView()
        return headerView.frame.size.height
    }
}

extension CustomFontViewController: UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DynamicTypeSample.textArray.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "dynamicTypeCustomFontListCell")
        cell?.textLabel?.text = DynamicTypeSample.textArray[indexPath.row]
        // Custom Font は iOS 11 から
        if #available(iOS 11.0, *) {
            if let customFont = UIFont(name: "Futura-Medium", size: UIFont.labelFontSize) {
                cell?.textLabel?.font = UIFontMetrics(forTextStyle: DynamicTypeSample.styleArray[indexPath.row]).scaledFont(for: customFont)
            } else {
                cell?.textLabel?.font = UIFont.preferredFont(forTextStyle: DynamicTypeSample.styleArray[indexPath.row])
            }
        } else {
            cell?.textLabel?.font = UIFont.preferredFont(forTextStyle: DynamicTypeSample.styleArray[indexPath.row])
        }
        cell?.textLabel?.adjustsFontForContentSizeCategory = true
        cell?.selectionStyle = .none
        return cell!
    }
}
