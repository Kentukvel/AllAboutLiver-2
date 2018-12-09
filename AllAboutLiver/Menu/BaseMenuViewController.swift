//
//  BaseMenuViewController.swift
//  AllAboutLiver
//
//  Created by Левкутник Дмитрий on 09.12.2018.
//  Copyright © 2018 Левкутник Дмитрий. All rights reserved.
//

import UIKit

class BaseMenuViewController: UIViewController {

    var menuVC: MenuViewController!
    override func viewDidLoad() {
        super.viewDidLoad()
        menuVC = self.storyboard?.instantiateViewController(withIdentifier: "MenuVC") as? MenuViewController
        // Do any additional setup after loading the view.
    }
    
    func showMenu() {
        UIView.animate(withDuration: 0.3) {
            self.menuVC.view.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
            self.addChild(self.menuVC)
            self.view.addSubview(self.menuVC.view)
            AppDelegate.isMenuVC = false
        }
    }
    
    func hideMenu() {
        UIView.animate(withDuration: 0.3, animations: {
            self.menuVC.view.frame = CGRect(x: -UIScreen.main.bounds.size.width, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
        }) { (finished) in
            self.menuVC.view.removeFromSuperview()
            AppDelegate.isMenuVC = true
        }
    }

}
