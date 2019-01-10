//
//  JTabBarController.swift
//  DouYU
//
//  Created by 贾倍 on 2019/1/9.
//  Copyright © 2019 贾倍. All rights reserved.
//

import UIKit

class JTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpAllViewController()
        
        self.tabBar.tintColor = UIColor.orange
        
        // Do any additional setup after loading the view.
    }
    
    func setUpAllViewController() -> Void {
        setUpChildController(JHomeViewController(), "推荐", "tabLive", "tabLiveHL")
        setUpChildController(JRecreationViewController(), "娱乐", "tabYule", "tabYuleHL")
        setUpChildController(JFollowViewController(), "关注", "tabFocus", "tabFocusHL")
        setUpChildController(JFishBarViewController(), "鱼吧", "tabYuba", "tabYubaHL")
        setUpChildController(JDiscoverViewController(), "发现", "tabDiscovery", "tabDiscoveryHL")
    }
    
    private func setUpChildController(_ controller : UIViewController, _ title : String, _ norImage : String, _ selectedImage : String) {
        controller.tabBarItem.title = title
        // 修改TabBar标题位置
        controller.tabBarItem.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: -3)
        controller.tabBarItem.image = UIImage(named: norImage)
        controller.tabBarItem.selectedImage = UIImage(named: selectedImage)
        // 设置 NavigationController
        let nav = JNavigationController(rootViewController: controller)
        controller.title = title
        self.addChild(nav)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
