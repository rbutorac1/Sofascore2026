//
//  Fonts.swift
//  sofascore
//
//  Created by akademija on 17.03.2026..
//

import UIKit

enum Fonts {
    
    static let RobotoBoldTitle12: UIFont? = UIFont(name: "Roboto-Bold", size: 12)
    static let RobotoBoldTitle14: UIFont? = UIFont(name: "Roboto-Bold", size: 14)
    static let RobotoBoldTitle16: UIFont? = UIFont(name: "Roboto-Bold", size: 16)
    static let RobotoBoldTitle20: UIFont? = UIFont(name: "Roboto-Bold", size: 20)
    static let RobotoBoldTitle32: UIFont? = UIFont(name: "Roboto-Bold", size: 32)
    static let RobotoRegularTitle14: UIFont? = UIFont(name: "Roboto-Regular", size: 14)
    static let RobotoCondensedRegularTitle12: UIFont? = UIFont(name: "Roboto-Regular", size: 12)
    static let RobotoCondensedRegularTitle14: UIFont? = UIFont(name: "Roboto-Regular", size: 14)
}

extension UIView {
    func applyFont(_ font: UIFont?){
        subviews.forEach{ subview in
            if let label = subview as? UILabel {
                label.font = font
            } else {
                subview.applyFont(font)
            }
        }
    }
    
    func applyAlignment(_ alignment: NSTextAlignment){
        subviews.forEach{ subview in
            if let label = subview as? UILabel {
                label.textAlignment = alignment
            } else {
                subview.applyAlignment(alignment)
            }
        }
    }
    
    func applyColor(_ color: UIColor){
        subviews.forEach{ subview in
            if let label = subview as? UILabel {
                label.textColor = color
            } else {
                subview.applyColor(color)
            }
        }
    }
}
