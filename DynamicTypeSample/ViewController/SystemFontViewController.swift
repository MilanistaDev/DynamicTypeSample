//
//  SystemFontViewController.swift
//  DynamicTypeSample
//
//  Created by 麻生 拓弥 on 2017/12/21.
//  Copyright © 2017年 麻生 拓弥. All rights reserved.
//

import UIKit

class SystemFontViewController: UIViewController {

    @IBOutlet weak var dynamicTypeTableView: UITableView!
    @IBOutlet weak var topConstraint: NSLayoutConstraint!

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = "System Font ver"
        if #available(iOS 11.0, *) {
            self.navigationItem.largeTitleDisplayMode = .never
        } else {
            self.topConstraint.constant = -64.0
        }
        self.dynamicTypeTableView.delegate = self
        self.dynamicTypeTableView.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

extension SystemFontViewController: UITableViewDelegate {

}

extension SystemFontViewController: UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DynamicTypeSample.textArray.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "dynamicTypeSystemFontListCell")
        cell?.textLabel?.text = DynamicTypeSample.textArray[indexPath.row]
        cell?.textLabel?.font = UIFont.preferredFont(forTextStyle: DynamicTypeSample.styleArray[indexPath.row])
        cell?.textLabel?.adjustsFontForContentSizeCategory = true
        cell?.selectionStyle = .none
        return cell!
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "System Font"
    }
}
