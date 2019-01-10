//
//  JColor.swift
//  DouYU
//
//  Created by 贾倍 on 2019/1/9.
//  Copyright © 2019 贾倍. All rights reserved.
//

import UIKit

let Kwhite = UIColor.white
let Kred = UIColor.red
let KoRANGE = UIColor.orange
let Kblack = UIColor.black
let Kgreen = UIColor.green
let KpURPLE = UIColor.purple
let Kblue = UIColor.blue

//主颜色
let KmainOrangeColor = UIColor(red: colorValue(238.0), green: colorValue(120.0), blue: colorValue(59), alpha: 1.0)

let KlowOrangeColor = UIColor(red: colorValue(239), green: colorValue(130), blue: colorValue(62), alpha: 1.0)

let KhighOrangeColor = UIColor(red: colorValue(237), green: colorValue(105), blue: colorValue(57), alpha: 1.0)

let KgradientColors : [CGColor] = [KlowOrangeColor.cgColor,KhighOrangeColor.cgColor]

//搜索框背景颜色
let KsearchBgColor = UIColor(red: colorValue(237), green: colorValue(143), blue: colorValue(90), alpha: 1.0)

//渐变色
let KwhiteColors : [CGColor] = [Kwhite.cgColor,Kred.cgColor]

//分割线颜色
let KlineColor : UIColor = colorWithRGBA(230, 230, 230, 1.0)
//主文字颜色
let KmainTextColor : UIColor = colorWithRGBA(33, 33, 33, 1.0)
//副文字颜色
let KgrayTextColor : UIColor = colorWithRGBA(99, 99, 99, 1.0)
//
let KlowGrayColor : UIColor = colorWithRGBA(150, 150, 150, 1.0)

let KbgGrayColor : UIColor = colorWithRGBA(247, 247, 247, 1.0)

func colorValue(_ value : CGFloat) -> CGFloat {
    return value / 255.0
}

func colorWithRGBA(_ red : CGFloat, _ green : CGFloat, _ blue : CGFloat, _ alpha : CGFloat) -> UIColor {
    return UIColor(red: colorValue(red), green: colorValue(green), blue: colorValue(blue), alpha: alpha)
}

