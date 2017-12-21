//
//  TopViewController.swift
//  DynamicTypeSample
//
//  Created by 麻生 拓弥 on 2017/12/21.
//  Copyright © 2017年 麻生 拓弥. All rights reserved.
//

import UIKit

class TopViewController: UIViewController {

    @IBOutlet weak var dynamicTypeListTableView: UITableView!
    @IBOutlet weak var topConstraint: NSLayoutConstraint!

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = "Dynamic Type Example"
        if #available(iOS 11.0, *) {
            self.navigationController?.navigationBar.prefersLargeTitles = true
            self.navigationItem.largeTitleDisplayMode = .always
        } else {
            self.topConstraint.constant = -64.0
        }
        let backButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        self.navigationItem.backBarButtonItem = backButtonItem

        self.dynamicTypeListTableView.delegate = self
        self.dynamicTypeListTableView.dataSource = self

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

extension TopViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: DynamicTypeSample.segueNameArray[indexPath.row], sender: nil)
    }
}

extension TopViewController: UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DynamicTypeSample.topTextArray.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "dynamicTypeListCell")
        cell?.textLabel?.text = DynamicTypeSample.topTextArray[indexPath.row]
        cell?.textLabel?.font = UIFont.preferredFont(forTextStyle: .body)
        cell?.textLabel?.adjustsFontForContentSizeCategory = true
        cell?.selectionStyle = .none
        return cell!
    }
}
