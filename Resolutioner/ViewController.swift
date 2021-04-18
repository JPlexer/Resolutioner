//
//  ViewController.swift
//  Resolutioner
//
//  Created by Dylan McDonald on 4/16/21.
//

import UIKit

class ViewController: UIViewController {

    var aspectIsLocked = true
    var oneToTwoRatio: Double = 9/16
    var twoToOneRatio: Double = 16/9
    
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var firstResField: SFMonoTextField!
    @IBOutlet weak var secondResField: SFMonoTextField!
    @IBOutlet weak var aspectLockButton: StandardButton!
    
    @IBOutlet weak var internalDismissKeyboardButton: UIButton!
    
    @IBOutlet weak var mainHeaderView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainView.layer.cornerRadius = 20
        mainView.layer.cornerCurve = .continuous
        
        mainHeaderView.layer.cornerRadius = 20
        mainHeaderView.layer.cornerCurve = .continuous
        mainHeaderView.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        
      
        mainHeaderView.layer.shadowColor = UIColor.black.cgColor
        mainHeaderView.layer.shadowOffset = CGSize(width: 0, height: 1)
        mainHeaderView.layer.shadowRadius = 5
        if traitCollection.userInterfaceStyle == .dark {
            mainHeaderView.layer.shadowOpacity = 0
        } else {
            mainHeaderView.layer.shadowOpacity = 0.4
        }

        internalDismissKeyboardButton.isHidden = true
        
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        
        if traitCollection.userInterfaceStyle == .dark {
            mainHeaderView.layer.shadowOpacity = 0
        } else {
            mainHeaderView.layer.shadowOpacity = 0.4
        }
    }

    @IBAction func dismissKeyboards(_ sender: Any) {
        firstResField.resignFirstResponder()
        secondResField.resignFirstResponder()
    }
    
    @IBAction func beganEditing(_ sender: Any) {
//        currentRatio = Double(firstResField.text!)! / Double(secondResField.text!)!
        internalDismissKeyboardButton.isEnabled = true
        internalDismissKeyboardButton.isHidden = false
        self.internalDismissKeyboardButton.alpha = 0
        UIView.animate(withDuration: 0.3) {
            self.internalDismissKeyboardButton.alpha = 1
        }
    }
    
    @IBAction func stoppedEditing(_ sender: Any) {
        internalDismissKeyboardButton.isEnabled = false
        UIView.animate(withDuration: 0.3) {
            self.internalDismissKeyboardButton.alpha = 0
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.31) {
            self.internalDismissKeyboardButton.isHidden = true
        }
    }
    @IBAction func lockAspectRatio(_ sender: Any) {
        aspectIsLocked = !aspectIsLocked
        if aspectIsLocked {
            aspectLockButton.setTitle("Unlock Ratio", for: .normal)
        } else {
            aspectLockButton.setTitle("Lock Ratio", for: .normal)
        }
    }
    
    @IBAction func typedInRes1(_ sender: Any) {
        if aspectIsLocked {
            secondResField.text = "\(Int((Double(firstResField.text ?? "0") ?? 1) * oneToTwoRatio))"
        }
        if firstResField.text == "" {
            secondResField.text = ""
        }
    }
    
    @IBAction func typedInRes2(_ sender: Any) {
        if aspectIsLocked {
            firstResField.text = "\(Int((Double(secondResField.text ?? "0") ?? 1) * twoToOneRatio))"
        }
        if secondResField.text == "" {
            firstResField.text = ""
        }
    }
    
}

