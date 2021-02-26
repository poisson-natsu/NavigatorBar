//
//  NavigatorBar.swift
//  NavigatorBar
//
//  Created by 付文华 on 2021/2/26.
//  Copyright © 2021 poisson. All rights reserved.
//

import UIKit

protocol NavigatorBarDelegate: NSObjectProtocol {
    func leftBtnClick()
    func rightBtnClick()
}

class NavigatorBar: UIView {
    
    var title: String {
        set {
            navigationBar.pushItem(navigationItem, animated: false)
            (navigationItem.titleView as! UILabel).text = newValue
        }
        get {
            return (navigationItem.titleView as! UILabel).text ?? ""
        }
    }
    
    weak var delegate: NavigatorBarDelegate?
    
    func addBottomView(_ view: UIView) {
        view.frame = CGRect(x: 0, y: bounds.size.height - self.bottomViewHeight - 5, width: bounds.size.width, height: self.bottomViewHeight)
        addSubview(view)
    }
    
    lazy var leftButton: UIButton = {
        let btn = UIButton(type: .custom)
        btn.setImage(UIImage(named: "nav_backwhite"), for: .normal)
        btn.addTarget(self, action: #selector(leftBtnClick), for: .touchUpInside)
        return btn
    }()
    lazy var rightButton: UIButton = {
        let btn = UIButton(type: .custom)
        btn.setTitleColor(.white, for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        btn.addTarget(self, action: #selector(rightBtnClick), for: .touchUpInside)
        return btn
    }()
    
    @objc func leftBtnClick() {
        delegate?.leftBtnClick()
    }
    @objc func rightBtnClick() {
        delegate?.rightBtnClick()
    }
    
    convenience init(bottomHeight: CGFloat = 0) {
        self.init(frame: .zero)
        self.bottomViewHeight = bottomHeight
        
        navigationBar.frame = CGRect(x: 0, y: NavigatorBar.statusBarHeight(), width: UIScreen.main.bounds.size.width, height: 44)
        navigationBar.backgroundColor = .clear
        
        backgroundColor = .blue
        addSubview(navigationBar)
        frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: NavigatorBar.statusBarHeight() + navigationBar.bounds.size.height + bottomHeight)
    }
    
    static func statusBarHeight() -> CGFloat {
        var statusBarHeight: CGFloat = 0;
        if #available(iOS 13.0, *) {
            if let statusBarManager = UIApplication.shared.windows.first?.windowScene?.statusBarManager {
                statusBarHeight = statusBarManager.statusBarFrame.size.height
            }
        } else {
            statusBarHeight = UIApplication.shared.statusBarFrame.size.height
        }
        return statusBarHeight
    }
    
    // *******************下面的方法是私有方法，或者说，平时用不到*******************
    // MARK: - private -- no need to check below
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // 导航栏底部多出来那块的高度
    private var bottomViewHeight: CGFloat = 0
    
    lazy fileprivate var navigationBar: UINavigationBar = {
        var bar = UINavigationBar(frame: .zero)
        UINavigationBar.appearance().isTranslucent = true
        UINavigationBar.appearance().setBackgroundImage(UIImage(), for: .default)
        UINavigationBar.appearance().shadowImage = UIImage()
        
        
        return bar
    }()
    
    lazy private var navigationItem: UINavigationItem = {
        let item = UINavigationItem()
        var view = UILabel()
        view.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        view.textAlignment = .center
        view.textColor = .white
        item.titleView = view
        item.leftBarButtonItem = UIBarButtonItem(customView: leftButton)
        item.rightBarButtonItem = UIBarButtonItem(customView: rightButton)
        return item
    }()
}
