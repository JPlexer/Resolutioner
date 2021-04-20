//
//  ViewController.swift
//  Resolutioner
//
//  Created by Dylan McDonald on 4/16/21.
//

import UIKit

var aspectIsLocked = true

class ViewController: UIViewController {
    
    //    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var firstResField: SFMonoTextField!
    @IBOutlet weak var secondResField: SFMonoTextField!
    @IBOutlet weak var aspectLockButton: StandardButton!
    
    @IBOutlet weak var shadowView: UIView!
    
    @IBOutlet weak var internalDismissKeyboardButton: UIButton!
    
    
    
    
    @IBOutlet weak var mainHeaderView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
            return (string.containsValidCharacter)
        }
        if UserDefaults.standard.double(forKey: "SideOne") == 0 {
            UserDefaults.standard.set(Double(16), forKey: "SideOne")
        }
        if UserDefaults.standard.double(forKey: "SideTwo") == 0 {
            UserDefaults.standard.set(Double(9), forKey: "SideTwo")
        }
        
        self.splitViewController?.navigationController?.isNavigationBarHidden = true
        
        
        //        mainView.layer.cornerRadius = 20
        //        mainView.layer.cornerCurve = .continuous
        
        shadowView.layer.cornerRadius = 20
        shadowView.layer.cornerCurve = .continuous
        shadowView.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        
        
        shadowView.layer.shadowColor = UIColor.black.cgColor
        shadowView.layer.shadowOffset = CGSize(width: 0, height: 1)
        shadowView.layer.shadowRadius = 5
        shadowView.layer.shadowOpacity = 0.4
        
        
        internalDismissKeyboardButton.isEnabled = false
        internalDismissKeyboardButton.alpha = 0
    }
    
    //    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
    //        super.traitCollectionDidChange(previousTraitCollection)
    //
    //        if traitCollection.userInterfaceStyle == .dark {
    //            shadowView.layer.shadowOpacity = 0.4
    //        } else {
    //            shadowView.layer.shadowOpacity = 0.4
    //        }
    //    }
    
    @IBAction func editRatio(_ sender: Any) {
        lightHaptics()
    }
    
    @IBAction func dismissKeyboards(_ sender: Any) {
        softHaptics()
        firstResField.resignFirstResponder()
        secondResField.resignFirstResponder()
    }
    
    @IBAction func beganEditing(_ sender: Any) {
        //        if internalDismissKeyboardButton.isHidden{
        internalDismissKeyboardButton.isEnabled = true
        //            internalDismissKeyboardButton.isHidden = false
        //            internalDismissKeyboardButton.alpha = 0
        UIView.animate(withDuration: 0.3) {
            self.internalDismissKeyboardButton.alpha = 1
        }
        //        }
    }
    
    @IBAction func stoppedEditing(_ sender: Any) {
        //        if !(firstResField.isEditing || secondResField.isEditing) {
        internalDismissKeyboardButton.isEnabled = false
        UIView.animate(withDuration: 0.3) {
            self.internalDismissKeyboardButton.alpha = 0
        }
        internalDismissKeyboardButton.isEnabled = false
    }
    
    
    @IBAction func lockAspectRatio(_ sender: Any) {
        lightHaptics()
        aspectIsLocked = !aspectIsLocked
        if aspectIsLocked {
            aspectLockButton.setTitle("Unlock Ratio", for: .normal)
        } else {
            aspectLockButton.setTitle("Lock Ratio", for: .normal)
        }
    }
    
    @IBAction func typedInRes1(_ sender: Any) {
        if aspectIsLocked {
            secondResField.text = "\(Int((Double(firstResField.text ?? "0") ?? 1) * (sideTwo() / sideOne())))"
        }
        if firstResField.text == "" {
            secondResField.text = ""
        }
        UserDefaults.standard.set(firstResField.text, forKey: "LastRes1")
    }
    
    @IBAction func typedInRes2(_ sender: Any) {
        if aspectIsLocked {
            firstResField.text = "\(Int((Double(secondResField.text ?? "0") ?? 1) * (sideOne() / sideTwo())))"
        }
        if secondResField.text == "" {
            firstResField.text = ""
        }
        UserDefaults.standard.set(firstResField.text, forKey: "LastRes2")
    }
    
}

extension String {
    var containsValidCharacter: Bool {
        guard self != "" else { return true }
        let hexSet = CharacterSet(charactersIn: "1234567890.")
        let newSet = CharacterSet(charactersIn: self)
        return hexSet.isSuperset(of: newSet)
    }
}


// Implement loading of saved last values
// Create num pad in middle
