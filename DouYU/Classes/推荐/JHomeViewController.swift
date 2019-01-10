//
//  JHomeViewController.swift
//  DouYU
//
//  Created by 贾倍 on 2019/1/9.
//  Copyright © 2019 贾倍. All rights reserved.
//

import UIKit
import Alamofire
import SnapKit

private var isNavHidden : Bool = false

class JHomeViewController: JBaseViewController {
    

    override func viewDidLoad() {
        super.viewDidLoad()
        //设置UI
        setUpAllView()
        NotificationCenter.default.addObserver(self, selector: #selector(self.refreshNavBar), name: NSNotification.Name(rawValue: JNotiRefreshHomeNavBar), object: nil)
        
        // Do any additional setup after loading the view.
    }
    // MARK: 导航栏隐藏与现实
    @objc func refreshNavBar(noti:Notification) {
        let isHidden : String = noti.userInfo!["isHidden"] as! String
        if isHidden == "true" {
            if isNavHidden {return}
            isNavHidden = true
            self.navigationController?.setNavigationBarHidden(true, animated: true)
            UIView.animate(withDuration: 0.15) {
                self.pageTitleView.frame = CGRect(x: 0, y: KstatusHeight, width: KscreenWidth, height: KcateTitleHeight)
                let height : CGFloat = KscreenHeight - KstatusHeight - KcateTitleHeight - KtabBarHeight
                let frame = CGRect(x: 0, y: KcateTitleHeight + KstatusHeight, width: KscreenWidth, height: height)
                self.pageContenView.frame = frame
                self.pageContenView.refreshColllectionView(height: self.pageContenView.frame.size.height)
            }
        } else {
            if !isNavHidden { return }
            isNavHidden = false
            self.navigationController?.setNavigationBarHidden(false, animated: true)
            UIView.animate(withDuration: 0.15) {
                self.pageTitleView.frame = CGRect(x: 0, y: 0, width: KscreenWidth, height: KcateTitleHeight)
                let height : CGFloat = KscreenHeight - KstatusHeight - KnavgationBarHeight - KcateTitleHeight - KtabBarHeight
                let frame = CGRect(x: 0, y: KcateTitleHeight, width: KscreenWidth, height: height)
                self.pageContenView.frame = frame
            }
        }
    }
    
    
    
    // MARK: 添加标题
    //标题数组
    private lazy var titles : [String] = ["分类","推荐","全部","LOL","绝地求生","王者荣耀","QQ飞车"]
    //标题数组对应的控制器数组
    private lazy var controllers : [UIViewController] = {
        let controllers = [JClassificationController(),JRecommendedController(),JAllController(),JLOLController(),JJDQSController(),JWZRYController(),JQQFCController()]
        return controllers
    }()
    
    //添加titleView
    private lazy var pageTitleView : ZJPageTitleView = { [weak self] in
        let frame = CGRect(x: 0, y: 0, width: KscreenWidth, height: KcateTitleHeight)
        let option = ZJPageOptions()
        option.kGradColors = KgradientColors
        option.kBotLineColor = Kwhite
        option.kNormalColor = (220, 220, 220)
        option.kSelectColor = (250, 250, 250)
        option.kTitleSelectFontSize = 14
        option.isShowBottomLine = false
        option.kIsShowBottomBorderLine = false
        let pageTitleView = ZJPageTitleView(frame: frame, titles: titles, options: option)
        pageTitleView.delegate = self
        return pageTitleView
    }()
    
    //内容view
    private lazy var pageContenView : ZJPageContentView = { [weak self] in
        let height : CGFloat = KscreenHeight - KstatusHeight - KnavgationBarHeight - KcateTitleHeight - KtabBarHeight
        let frame = CGRect(x: 0, y: KcateTitleHeight, width: KscreenWidth, height: height)
        let contentView = ZJPageContentView(frame: frame, childVCs: controllers, parentViewController: self)
        contentView.delegate = self
        return contentView
    }()
    
}

// MARK: 配置子控件
extension JHomeViewController {
    //配置UI
    func setUpAllView() {
        self.navigationController?.navigationBar.shadowImage = UIImage()
        automaticallyAdjustsScrollViewInsets = false
        view.addSubview(statuView)
        //添加导航栏
        setUpNavigation()
        //添加标题栏
        setUpPageTitleAndContentView()
    }
    func setUpPageTitleAndContentView() {
        //添加titleView
        view.addSubview(pageTitleView)
        //添加ContenView
        view.addSubview(pageContenView)
    }
}


// MARK: 遵守PageTitleViewDelegate,PageContentViewDelegate协议
extension JHomeViewController : PageTitleViewDelegate,ZJPageContentViewDelegate {
    func zj_pageContentView(contentView: ZJPageContentView, progress: CGFloat, sourceIndex: Int, targetIndex: Int) {
        pageTitleView.setPageTitleWithProgress(progress: progress, sourceIndex: sourceIndex, targetIndex: targetIndex)
    }
    
    func pageTitleView(titleView : ZJPageTitleView, selectedIndex index : Int) {
        pageContenView.setCurrentIndex(currentIndex: index)
    }
    
}
