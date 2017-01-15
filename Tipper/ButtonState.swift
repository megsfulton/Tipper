//
//  ButtonState.swift
//  Tipper2
//
//  Created by Megs Fulton on 1/2/17.
//  Copyright © 2017 Megs Fulton. All rights reserved.
//

import UIKit

class ButtonState: UIButton {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    
    override var isHighlighted: Bool {
        didSet {
            switch isHighlighted {
            case true:
                backgroundColor = UIColor.white
            case false:
                backgroundColor = UIColor.black
            }
        }
    }

}
