//
//  HomeView.swift
//  ZionAppHomeScreen
//
//  Created by App Dev on 9/28/20.
//

import Foundation

import UIKit

class HomeViewController: UIViewController {
    
    let homeView = HomeMainView(frame: CGRect(x: 0, y: 0, width: 414, height: 611))
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(homeView)
        homeView.configureHeaderView()
//        homeView.configureLeftStackView()
//        configureRightStackView()
    }

}
