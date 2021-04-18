//
//  StandardViews.swift
//  Resolutioner
//
//  Created by Dylan McDonald on 4/17/21.
//

import UIKit

class SFMonoTextField: UITextField {
    override func draw(_ rect: CGRect) {
        self.font = UIFont.monospacedSystemFont(ofSize: self.font!.pointSize, weight: .regular)
    }
}

class SFMonoLabel: UILabel {
    override func draw(_ rect: CGRect) {
        self.font = UIFont.monospacedSystemFont(ofSize: self.font!.pointSize, weight: .regular)
    }
}

func applySFMonoFont(forLabel: UILabel, withWeight: UIFont.Weight) {
    forLabel.font = UIFont.monospacedSystemFont(ofSize: forLabel.font!.pointSize, weight: withWeight)
}

class StandardButton: UIButton {
    override func draw(_ rect: CGRect) {
        self.layer.masksToBounds = true
        
        if self.frame.height != self.frame.width {
            self.layer.cornerRadius = 10
            self.layer.cornerCurve = .continuous
        } else {
            self.layer.cornerRadius = self.frame.height / 2
        }
        
        self.layer.borderWidth = 1.5
        self.layer.borderColor = UIColor.label.withAlphaComponent(0.075).cgColor
    }
    
    override class func didChangeValue(forKey key: String) {
        print("changed!!")
    }
}
