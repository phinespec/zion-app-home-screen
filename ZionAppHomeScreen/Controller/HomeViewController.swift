//
//  HomeView.swift
//  ZionAppHomeScreen
//
//  Created by App Dev on 9/28/20.
//

import Foundation

import UIKit

class HomeViewController: UIViewController {
    
    let homeView = HomeMainView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(homeView)
        homeView.configureHeaderView()
        homeView.configureLeftStackView()
//        configureRightStackView()
    }

}
