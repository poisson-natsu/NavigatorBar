//
//  HomeViewController.swift
//  NavigatorBar
//
//  Created by 付文华 on 2021/2/26.
//

import UIKit

class HomeViewController: ViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let navigationBar = NavigatorBar(bottomHeight: 50)
        navigationBar.delegate = self
        navigationBar.title = "首页"
        navigationBar.rightButton.setTitle("收藏", for: .normal)
        view.addSubview(navigationBar)
        
        let bottomView = UIView()
        bottomView.backgroundColor = .orange
        navigationBar.addBottomView(bottomView)
    }
    
    override func leftBtnClick() {
        print("---------------------------")
    }
}
