//
//  JHomeSearchView.swift
//  DouYU
//
//  Created by 贾倍 on 2019/1/9.
//  Copyright © 2019 贾倍. All rights reserved.
//

import UIKit

class JHomeSearchView: UIView {
    
    lazy var textField : UITextField = { () -> UITextField in
        let textField = UITextField()
        textField.backgroundColor = UIColor.clear
        textField.borderStyle = .none
        textField.font = FontSize(14.0)
        textField.textColor = Kwhite
        textField.placeholder = "请输入搜索内容"
        //字体大小
        textField.setValue(FontSize(14.0), forKeyPath: "_placeholderLabel.font")
        //字体颜色
        textField.setValue(colorWithRGBA(100, 100, 100, 0.5), forKeyPath: "_placeholderLabel.textColor")
        return textField
    }()
    
    var searchIcon : UIImageView = {
        let searchIcon = UIImageView()
        searchIcon.image = UIImage(named: "home_newSeacrhcon")
        searchIcon.contentMode = .center
        return searchIcon
        
    }()
    
    var qcodeIcon : UIImageView = {
        let qcodeIcon = UIImageView()
        qcodeIcon.image = UIImage(named: "home_newSaoicon")
        qcodeIcon.contentMode = .center
        return qcodeIcon
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.green
        setUpChildView()
    }
    
    func setUpChildView() {
        self.addSubview(textField)
        self.addSubview(searchIcon)
        self.addSubview(qcodeIcon)
        
        textField.snp.makeConstraints { (make) in
            make.left.equalTo(self).offset(AdaptW(35))
            make.right.equalTo(self).offset(AdaptW(-35))
            make.height.equalTo(30)
            make.center.equalTo(self.snp.center)
        }
        
        searchIcon.snp.makeConstraints { (make) in
            make.centerY.equalTo(self)
            make.left.equalTo(5)
            make.width.height.equalTo(AdaptW(30))
        }
        
        qcodeIcon.snp.makeConstraints { (make) in
            make.centerY.equalTo(self)
            make.right.equalTo(AdaptW(-15))
            make.width.height.equalTo(AdaptW(30))
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
