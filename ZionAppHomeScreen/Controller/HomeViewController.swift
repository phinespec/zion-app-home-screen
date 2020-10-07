//
//  HomeView.swift
//  ZionAppHomeScreen
//
//  Created by App Dev on 9/28/20.
//

import Foundation

import UIKit

@IBDesignable
class HomeViewController: UIViewController {
    
    // Number of images per stackview
    private var leftStackCount = 3
    private var rightStackCount = 9
    
    // Title label frame configuration
    private var titleLabelPositionX = 10
    private var titleLabelPositionY = 145
    private var titleLabelWidth = 200
    private var titleLabelHeight = 50
    
    // Weather label frame configuration
    private var weatherLabelPositionX = 170
    private var weatherLabelPositionY = 65
    private var weatherLabelWidth = 20
    private var weatherLabelHeight = 20
    
    // Weather image frame configuration
    private var weatherImagePositionX = 170
    private var weatherImagePositionY = 50
    private var weatherImageWidth = 20
    private var weatherImageHeight = 20
    
    
    // Live feed image frame configuration
    private var liveFeedImagePositionX = 145
    private var liveFeedImagePositionY = 5
    private var liveFeedImageWidth = 50
    private var liveFeedImageHeight = 20
    
    // Getting data from our model
    private var model = AppData()
    lazy private var data = model.homeImageHeadings
    
    @IBOutlet weak var header: RectangleView!
    
    fileprivate let leftStackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.spacing = 5
        stack.distribution = .fillEqually
        return stack
    }()
    
    fileprivate let rightStackView: UIStackView = {
       let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.spacing = 5
        stack.distribution = .fillEqually
        return stack
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        view.isUserInteractionEnabled = true
        configureLeftStackView()
        configureRightStackView()
        configureHeader()
    }
    
//
// <-- Functions for configuring the subviews go here --> //
//
    
    private func configureLeftStackView() {
        view.addSubview(leftStackView)
        leftStackView.topAnchor.constraint(equalTo: header.bottomAnchor, constant: 5).isActive = true
        leftStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5).isActive = true
        leftStackView.widthAnchor.constraint(equalToConstant: (view.frame.width / 2) - 7).isActive = true
        leftStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -5).isActive = true
        
        // Add imageViews to leftStackview
        for index in 0..<leftStackCount {
            let view = RectangleView()
            leftStackView.addArrangedSubview(view)
            
            // Add main image
            let imageView = view.getImage(named: data[index])
            view.addSubview(imageView)
            let titleLabel = view.getLabel(x: titleLabelPositionX, y: titleLabelPositionY, width: titleLabelWidth, height: titleLabelHeight, text: data[index], fontSize: 19)
            view.addSubview(titleLabel)
        }
    }
        
        
    private func configureRightStackView() {
        view.addSubview(rightStackView)
        rightStackView.topAnchor.constraint(equalTo: header.bottomAnchor, constant: 5).isActive = true
        rightStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -5).isActive = true
        rightStackView.widthAnchor.constraint(equalToConstant: (view.frame.width / 2) - 7).isActive = true
        rightStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -5).isActive = true
        
        // Add imageViews to rightStackview
        for index in 3..<rightStackCount {
            let view = RectangleView()
            rightStackView.addArrangedSubview(view)
            let imageView = view.getImage(named: data[index])
            view.addSubview(imageView)
            let titleLabel = view.getLabel(x: titleLabelPositionX, y: titleLabelPositionY / 3, width: titleLabelWidth, height: titleLabelHeight, text: data[index], fontSize: 19)
            view.addSubview(titleLabel)
            
            // Add live feed image
            let liveFeed = view.getClearImage(named: "Livefeed", x: liveFeedImagePositionX, y: liveFeedImagePositionY, width: liveFeedImageWidth, height: liveFeedImageHeight)
            view.addSubview(liveFeed)
            
            if data[index] == "Weather" {
                let weatherImage = view.getClearImage(named: "cloud.sun.rain", x: weatherImagePositionX, y: weatherImagePositionY, width: weatherImageWidth, height: weatherImageHeight)
                view.addSubview(weatherImage)
                let weatherLabel = view.getLabel(x: weatherLabelPositionX, y: weatherLabelPositionY, width: weatherLabelWidth, height: weatherLabelHeight, text: "75°", fontSize: 14)
                view.addSubview(weatherLabel)
            }
        }
    }
        
    private func configureHeader() {
        let headerLabel = header.getLabel(x: titleLabelPositionX, y: titleLabelPositionY / 2, width: titleLabelWidth * 2, height: titleLabelHeight, text: "Greater Zion Region", fontSize: 24)
        view.addSubview(headerLabel)
        
    }

}


extension RectangleView {
    
    func getClearImage(named name: String, x: Int, y: Int, width: Int, height: Int) -> UIImageView {
            let image = UIImage(named: name)
            let iv = UIImageView(image: image)
            iv.frame = CGRect(x: x, y: y, width: width, height: height)
            iv.contentMode = .scaleToFill
            self.clipsToBounds = true
            
            return iv
    }
}
