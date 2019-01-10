//
//  JBaseCollectionCell.swift
//  DouYU
//
//  Created by 贾倍 on 2019/1/9.
//  Copyright © 2019 贾倍. All rights reserved.
//

import UIKit

class JBaseCollectionCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.contentView.backgroundColor = Kwhite
        j_initWithView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func j_initWithView() {
        
    }
    
    public class func itemHeight() -> CGSize {
        return CGSize(width: 0.0, height: 0.0)
    }
    
    public class func itemHeightWithModel(model : Any) -> CGSize {
        return CGSize(width: 0.0, height: 0.0)
    }
    
    public class func identifier() -> String {
        let name: AnyClass! = object_getClass(self)
        return NSStringFromClass(name)
        
    }
}
