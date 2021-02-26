//
//  ViewController.swift
//  NavigatorBar
//
//  Created by 付文华 on 2021/2/26.
//

import UIKit

class ViewController: UIViewController, NavigatorBarDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
    }
    
    func leftBtnClick() {
        print("please override this method")
    }
    
    func rightBtnClick() {
        print("please override this method")
    }


}

