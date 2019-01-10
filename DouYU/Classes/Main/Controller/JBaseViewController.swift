//
//  JBaseViewController.swift
//  DouYU
//
//  Created by 贾倍 on 2019/1/9.
//  Copyright © 2019 贾倍. All rights reserved.
//

import UIKit

class JBaseViewController: UIViewController {

    // 状态栏的背景色
    lazy var  statuView : UIView = {
        let view = UIView()
        view.backgroundColor = KmainOrangeColor;
        view.frame = CGRect(x: 0, y: 0, width: KscreenWidth, height: KstatusHeight)
        // 设置背景渐变
        let gradientLayer: CAGradientLayer = CAGradientLayer()
        gradientLayer.colors = KgradientColors
        //(这里的起始和终止位置就是按照坐标系,四个角分别是左上(0,0),左下(0,1),右上(1,0),右下(1,1))
        //渲染的起始位置
        gradientLayer.startPoint = CGPoint.init(x: 0, y: 0)
        //渲染的终止位置
        gradientLayer.endPoint = CGPoint.init(x: 1, y: 0)
        //设置frame和插入view的layer
        gradientLayer.frame = view.frame
        view.layer.insertSublayer(gradientLayer, at: 0)
        return view
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = Kwhite
        automaticallyAdjustsScrollViewInsets = false
        
        
        // Do any additional setup after loading the view.
        //        setStatusBarBackgroundColor()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // 配置 NavigationBar
    func setUpNavigation(){
        // 修改状态栏背景颜色
        self.navigationController?.navigationBar.barTintColor = KmainOrangeColor
        self.navigationController?.navigationBar.tintColor = UIColor.white
        
        // 左边的按钮
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "btn_user_normal"), style:.done ,target: self, action: #selector(self.leftItemClick))
        // 右边的按钮
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "viewHistoryIcon"), style:.done, target: self, action: #selector(self.rightItemClick)) //UIBarButtonItem.createBarButton("search_history", "search_history", size)
        
        let searchView  = JHomeSearchView()
        searchView.layer.cornerRadius = 5
        searchView.backgroundColor = KsearchBgColor
        navigationItem.titleView = searchView
        searchView.snp.makeConstraints { (make) in
            make.center.equalTo((navigationItem.titleView?.snp.center)!)
            make.width.equalTo(AdaptW(230))
            make.height.equalTo(33)
        }
    }
    
    @objc func rightItemClick() {
        //        print("rightItem click")
        //        self.navigationController?.pushViewController(ZJHistoryRecordViewController(), animated: true)
        
        // ZJPopupView 自定义视图
        let customView = ZJCustomView.init(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        let popView = ZJPopupView(size: CGSize(width: 250, height: 200),customView: customView , style: .ZJPopTransition)
        popView.zj_showPopView()
    }
    
    @objc func leftItemClick() {
        self.navigationController?.pushViewController(JProfileViewController(), animated: true)
    }
    
    deinit {
        
    }

}
