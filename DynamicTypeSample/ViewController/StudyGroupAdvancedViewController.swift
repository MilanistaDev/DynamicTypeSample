//
//  StudyGroupAdvancedViewController.swift
//  DynamicTypeSample
//
//  Created by 麻生 拓弥 on 2017/12/21.
//  Copyright © 2017年 麻生 拓弥. All rights reserved.
//

import UIKit

class StudyGroupAdvancedViewController: UIViewController {

    @IBOutlet weak var dynamicTypeTableView: UITableView!
    @IBOutlet weak var topConstraint: NSLayoutConstraint!

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = "Multiple UI components"
        if #available(iOS 11.0, *) {
            self.navigationItem.largeTitleDisplayMode = .never
        } else {
            self.topConstraint.constant = -64.0
        }
        self.dynamicTypeTableView.estimatedRowHeight = 100.0
        self.dynamicTypeTableView.rowHeight = UITableViewAutomaticDimension
        self.dynamicTypeTableView.tableFooterView = UIView(frame: .zero)
        self.dynamicTypeTableView.delegate = self
        self.dynamicTypeTableView.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

extension StudyGroupAdvancedViewController: UITableViewDelegate {

}

extension StudyGroupAdvancedViewController: UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return StudyGroupSample.iconNameArray.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let studyGroupAdvancedCell = tableView.dequeueReusableCell(withIdentifier: "studyGroupAdvancedCell", for: indexPath) as? StudyGroupAdvancedTableViewCell else {
            fatalError()
        }
        let studyGroupModel = StudyGroup(imageName: StudyGroupSample.iconNameArray[indexPath.row], titleName: StudyGroupSample.titleArray[indexPath.row], contentsDescription: StudyGroupSample.contentArray[indexPath.row])
        studyGroupAdvancedCell.studyGroup = studyGroupModel
        return studyGroupAdvancedCell
    }
}
