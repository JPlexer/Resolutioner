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
        self.borderStyle = .roundedRect
//        self.layer.backgroundColor = UIColor(named: "Background")?.cgColor
        self.backgroundColor = UIColor(named: "Background")
//        self.backgroundColor = .clear
        self.layer.borderWidth = 1.5
        self.layer.borderColor = UIColor(named: "AccentColor")?.cgColor
        self.layer.cornerRadius = 10
        self.layer.cornerCurve = .continuous
        self.layer.masksToBounds = true
    }
}

class StandardTextField: UITextField {
    override func draw(_ rect: CGRect) {
//        self.font = UIFont.monospacedSystemFont(ofSize: self.font!.pointSize, weight: .regular)
        self.borderStyle = .roundedRect
//        self.layer.backgroundColor = UIColor(named: "Background")?.cgColor
        self.backgroundColor = UIColor(named: "Background")
//        self.backgroundColor = .clear
        self.layer.borderWidth = 1.5
        self.layer.borderColor = UIColor(named: "AccentColor")?.cgColor
        self.layer.cornerRadius = 10
        self.layer.cornerCurve = .continuous
        self.layer.masksToBounds = true
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
        
        if self.frame.height == self.frame.width {
            self.layer.cornerRadius = self.frame.height / 2
        } else if self.frame.height > 49 {
            self.layer.cornerRadius = 20
            self.layer.cornerCurve = .continuous
        } else {
            self.layer.cornerRadius = 10
            self.layer.cornerCurve = .continuous
        }
        
        self.layer.borderWidth = 1.5
        self.layer.borderColor = UIColor.label.withAlphaComponent(0.075).cgColor
    }
}

class ButtonCell: UITableViewCell {
    override func draw(_ rect: CGRect) {
//        self.layer.masksToBounds = true
        
//        if self.frame.height != self.frame.width {
//            self.layer.cornerRadius = 10
//            self.layer.cornerCurve = .continuous
//        } else if self.frame.height > 49 {
//            self.layer.cornerRadius = 20
//        } else {
//            self.layer.cornerRadius = self.frame.height / 2
//        }
        
        self.layer.borderWidth = 1.5
        self.layer.borderColor = UIColor.label.withAlphaComponent(0.075).cgColor
        
        self.textLabel?.textColor = UIColor(named: "AccentColor")
        self.accessoryView?.tintColor = UIColor(named: "AccentColor")
//        let mask = CALayer()
//        mask.contents =  [ UIView().backgroundColor = UIColor(named: "AccentColor") ] as Any
//        mask.frame = CGRect(x: 0, y: 0, width:  (self.accessoryView?.frame.size.width)!, height:  (self.accessoryView?.frame.size.height)!)
//        self.accessoryView?.layer.mask = mask
//        self.accessoryView?.layer.masksToBounds = true
    }
}


//
//class ShadowHeader: UIView {
//    override func draw(_ rect: CGRect) {
////        self.layer.cornerRadius = 20
////        self.layer.cornerCurve = .continuous
//////        self.layer.masksToBounds = true
////        self.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
////        self.layer.shadowColor = UIColor.black.cgColor
////        self.layer.shadowOffset = CGSize(width: 0, height: 1)
////        self.layer.shadowRadius = 5
////        self.layer.shadowOpacity = 0.4
//
//
//        // corner radius
//        self.layer.cornerRadius = 20
//        self.layer.cornerCurve = .continuous
//
//        // border
//        self.layer.borderWidth = 1.0
//        self.layer.borderColor = UIColor.systemBlue.cgColor
//
//        // shadow
//        self.layer.shadowColor = UIColor.black.cgColor
//        self.layer.shadowOffset = CGSize(width: 0, height: 1)
//        self.layer.shadowOpacity = 0.4
//        self.layer.shadowRadius = 5
//    }
//}

class CustomHeaderView: UIViewController {
    
    @IBOutlet weak var shadowView: UIView!
    @IBOutlet weak var fakeBackgroundView: UIView!
    
    @IBAction func dismiss(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        shadowView.layer.cornerRadius = 20
        shadowView.layer.cornerCurve = .continuous
        shadowView.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMaxXMinYCorner, .layerMinXMaxYCorner, .layerMinXMinYCorner]
        
        
        fakeBackgroundView.layer.cornerRadius = 20
        fakeBackgroundView.layer.cornerCurve = .continuous
        fakeBackgroundView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
      
        shadowView.layer.shadowColor = UIColor.black.cgColor
        shadowView.layer.shadowOffset = CGSize(width: 0, height: 1)
        shadowView.layer.shadowRadius = 5
        shadowView.layer.shadowOpacity = 0.4
    }
}
