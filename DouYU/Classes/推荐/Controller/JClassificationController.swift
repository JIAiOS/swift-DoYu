//
//  JClassificationController.swift
//  DouYU
//
//  Created by 贾倍 on 2019/1/10.
//  Copyright © 2019 贾倍. All rights reserved.
//

import UIKit

class JClassificationController: JBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Kwhite
        setUpAllView()
        // Do any additional setup after loading the view.
    }
    
    private lazy var testLabel : UILabel = {
        let testLabel = UILabel()
        testLabel.text = "分类";
        testLabel.textColor = KmainTextColor
        testLabel.font = BoldFontSize(18)
        return testLabel
    }()
}

extension JClassificationController {
    private func setUpAllView() {
        view.addSubview(testLabel)
        testLabel.snp.makeConstraints { (make) in
            make.left.equalTo(40)
            make.top.equalTo(90)
            make.height.equalTo(44)
            make.width.equalTo(100)
        }
    }
}
