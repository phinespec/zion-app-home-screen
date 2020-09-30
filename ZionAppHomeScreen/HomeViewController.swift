//
//  HomeView.swift
//  ZionAppHomeScreen
//
//  Created by App Dev on 9/28/20.
//

import Foundation

import UIKit

class HomeViewController: UIViewController {
    
    var titleLabel = UILabel()
    var mainStackView = UIStackView()
    var leftStackView = UIStackView()
    var rightStackView = UIStackView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.1019607857, green: 0.2784313858, blue: 0.400000006, alpha: 1)
        configureTitleLabel()
        configureMainStackView()
        configureLeftStackView()
        configureRightStackView()
    }
    
    func configureMainStackView() {
        view.addSubview(mainStackView)
        mainStackView.axis = .horizontal
        mainStackView.distribution = .fillEqually
        mainStackView.spacing = 10
        
        // Set stackview constraints
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        mainStackView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 100 ).isActive = true
        mainStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10).isActive = true
        mainStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10).isActive = true
        mainStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10).isActive = true
        
        
        // Add our two vertical stackviews
        mainStackView.addArrangedSubview(leftStackView)
        mainStackView.addArrangedSubview(rightStackView)

    }
    
    func configureLeftStackView() {
        leftStackView.axis = .vertical
        leftStackView.distribution = .fillEqually
        leftStackView.spacing = 10
        
        //leftStackViewiew constraints
        leftStackView.translatesAutoresizingMaskIntoConstraints = false
        leftStackView.topAnchor.constraint(equalTo: mainStackView.topAnchor, constant: 10 ).isActive = true
        leftStackView.leadingAnchor.constraint(equalTo: mainStackView.leadingAnchor, constant: 10).isActive = true
        leftStackView.trailingAnchor.constraint(equalTo: rightStackView.leadingAnchor, constant: -10).isActive = true
        leftStackView.bottomAnchor.constraint(equalTo: mainStackView.bottomAnchor, constant: 10).isActive = true
        
        for _ in 1...3 {
            let image = UIImage(named: "zion.jpeg")
            let button = UIButton(type: UIButton.ButtonType.custom)
            button.frame = CGRect(x: 100, y: 100, width: 100, height: 100)
            button.setImage(image, for: .normal)
            leftStackView.addArrangedSubview(button)
        }
    }
    
    func configureRightStackView() {
        rightStackView.axis = .vertical
        rightStackView.distribution = .fillEqually
        rightStackView.spacing = 10
        
        //rightStackView constraints
        rightStackView.translatesAutoresizingMaskIntoConstraints = false
        rightStackView.topAnchor.constraint(equalTo: mainStackView.topAnchor, constant: 10).isActive = true
        rightStackView.leadingAnchor.constraint(equalTo: leftStackView.trailingAnchor, constant: 10).isActive = true
        rightStackView.trailingAnchor.constraint(equalTo: mainStackView.trailingAnchor, constant: -10).isActive = true
        rightStackView.bottomAnchor.constraint(equalTo: mainStackView.bottomAnchor, constant: 10).isActive = true
        
        for _ in 1...6 {
            let image = UIImage(named: "zion.jpeg")
            let button = UIButton(type: UIButton.ButtonType.custom)
            button.frame = CGRect(x: 100, y: 100, width: 100, height: 50)
            button.setImage(image, for: .normal)
            rightStackView.addArrangedSubview(button)
        }
    }
    
    
    func configureTitleLabel() {
        view.addSubview(titleLabel)
        titleLabel.text = "Greater Zion Region"
        titleLabel.font = UIFont.preferredFont(forTextStyle: .body)
        titleLabel.textAlignment = .left
        titleLabel.numberOfLines = 0
        titleLabel.adjustsFontSizeToFitWidth = true
        
        // Set titlelabel constraints
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10).isActive = true
    }
    
}
