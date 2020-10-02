//
//  RectangleView.swift
//  ZionAppHomeScreen
//
//  Created by App Dev on 10/1/20.
//

import UIKit

class RectangleView: UIView {
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    func addLabel(x: Int, y: Int, width: Int, height: Int, text: String, fontSize: Int) {
        let label = UILabel(frame: CGRect(x: x, y: y, width: width, height: height))
        self.addSubview(label)
        label.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0)
        label.text = text.uppercased()
        label.textColor = .white
        label.adjustsFontSizeToFitWidth = true
        label.font = .boldSystemFont(ofSize: CGFloat(fontSize))
        label.textAlignment = .left

    }
    
   func addImage(named name: String) {
        if let image = UIImage(named: name) {
            let image = image
            let iv = UIImageView(image: image)
            self.addSubview(iv)
            iv.contentMode = .scaleToFill
            self.clipsToBounds = true
            
        } else {
            print("No such image file")
        }
        
    }
    
    
}
