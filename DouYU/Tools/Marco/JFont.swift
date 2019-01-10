//
//  JFont.swift
//  DouYU
//
//  Created by 贾倍 on 2019/1/9.
//  Copyright © 2019 贾倍. All rights reserved.
//

import UIKit

//常规字体
func FontSize(_ size : CGFloat) -> UIFont {
    return UIFont.systemFont(ofSize: Adapt(size))
}

//加粗字体
func BoldFontSize(_ size : CGFloat) -> UIFont {
    return UIFont.boldSystemFont(ofSize: Adapt(size))
}
