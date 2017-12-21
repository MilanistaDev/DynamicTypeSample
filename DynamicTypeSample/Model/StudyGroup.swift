//
//  StudyGroup.swift
//  DynamicTypeSample
//
//  Created by 麻生 拓弥 on 2017/12/21.
//  Copyright © 2017年 麻生 拓弥. All rights reserved.
//

import UIKit

class StudyGroup: NSObject {
    let imageName: String
    let titleName: String
    let contentsDescription: String

    init(imageName: String, titleName: String, contentsDescription: String) {
        self.imageName = imageName
        self.titleName = titleName
        self.contentsDescription = contentsDescription
    }
}
