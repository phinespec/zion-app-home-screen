//
//  HomeView.swift
//  ZionAppHomeScreen
//
//  Created by App Dev on 9/28/20.
//

import Foundation

import UIKit

class HomeViewController: UIViewController {
    
    private var leftStackCount = 3
    private var rightStackCount = 6
    
    private var labelPositionX = 10
    private var labelPositionY = 140
    private var labelWidth = 150
    private var labelHeight = 50
    
    private var model = AppData()
    lazy private var data = model.homeImageHeadings
    
    @IBOutlet weak var header: RectangleView!
    
    fileprivate let leftStackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.spacing = 10
        stack.distribution = .fillEqually
        return stack
    }()
    
    fileprivate let rightStackView: UIStackView = {
       let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.spacing = 10
        stack.distribution = .fillEqually
        return stack
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        
        view.addSubview(leftStackView)
        leftStackView.topAnchor.constraint(equalTo: header.bottomAnchor, constant: 10).isActive = true
        leftStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        leftStackView.widthAnchor.constraint(equalToConstant: (view.frame.width / 2) - 15).isActive = true
        leftStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10).isActive = true
        
        // Add imageViews to leftStackview
        for index in 0..<leftStackCount {
            let view = RectangleView()
            view.backgroundColor = #colorLiteral(red: 0.1019607857, green: 0.2784313858, blue: 0.400000006, alpha: 1)
            leftStackView.addArrangedSubview(view)
            view.addImage(named: data[index])
            view.addLabel(x: labelPositionX, y: labelPositionY, width: labelWidth, height: labelHeight, text: data.remove(at: index - index), fontSize: 18)
            
            
        }
        
        view.addSubview(rightStackView)
        rightStackView.topAnchor.constraint(equalTo: header.bottomAnchor, constant: 10).isActive = true
        rightStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
        rightStackView.widthAnchor.constraint(equalToConstant: (view.frame.width / 2) - 15).isActive = true
        rightStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10).isActive = true
        
        // Add imageViews to rightStackview
        for index in 0..<rightStackCount {
            let view = RectangleView()
            view.backgroundColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
            rightStackView.addArrangedSubview(view)
            view.addImage(named: data[index])
            view.addLabel(x: labelPositionX, y: labelPositionY / 3, width: labelWidth, height: labelHeight, text: data[index], fontSize: 18)
        }
        
        header.addLabel(x: labelPositionX, y: labelPositionY / 2, width: labelWidth * 2, height: labelHeight, text: "Greater Zion Region", fontSize: 24)
        
    }

        
}

extension RectangleView {
    
    
}
