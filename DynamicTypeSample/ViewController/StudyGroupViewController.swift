//
//  StudyGroupViewController.swift
//  DynamicTypeSample
//
//  Created by 麻生 拓弥 on 2017/12/21.
//  Copyright © 2017年 麻生 拓弥. All rights reserved.
//

import UIKit

class StudyGroupViewController: UIViewController {

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
        self.dynamicTypeTableView.delegate = self
        self.dynamicTypeTableView.dataSource = self
        self.dynamicTypeTableView.tableFooterView = UIView(frame: .zero)
        let studyGroupCellNib = UINib(nibName: "StudyGroupTableViewCell", bundle: nil)
        self.dynamicTypeTableView.register(studyGroupCellNib, forCellReuseIdentifier: "studyGroupTableViewCell")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

extension StudyGroupViewController: UITableViewDelegate {

}

extension StudyGroupViewController: UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return StudyGroupSample.iconNameArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let studyGroupCell = tableView.dequeueReusableCell(withIdentifier: "studyGroupTableViewCell", for: indexPath) as! StudyGroupTableViewCell
        studyGroupCell.iconImageView.image = UIImage(named: StudyGroupSample.iconNameArray[indexPath.row])
        studyGroupCell.titleLabel.text = StudyGroupSample.titleArray[indexPath.row]
        studyGroupCell.descriptionLabel.text = StudyGroupSample.contentArray[indexPath.row]
        return studyGroupCell
    }
}
