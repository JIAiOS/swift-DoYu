//
//  JDateExtension.swift
//  DouYU
//
//  Created by 贾倍 on 2019/1/9.
//  Copyright © 2019 贾倍. All rights reserved.
//

import UIKit

/// 获取当前 秒级 时间戳 - 10位
func getTimeStamp() -> String {
    //获取当前时间
    let now = NSDate()
    //当前时间的时间戳
    let timeInterval : TimeInterval = now.timeIntervalSince1970
    let timeStamp = Int(timeInterval)
    return "\(timeStamp)"
}

func getMilliStamp() -> String {
    //获取当前时间
    let now = NSDate()
    //当前时间的时间戳
    let timeInterval : TimeInterval = now.timeIntervalSince1970
    let millisecond = CLongLong(round(timeInterval*1000))
    return "\(millisecond)"
}
