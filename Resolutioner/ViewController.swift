//
//  ViewController.swift
//  Resolutioner
//
//  Created by Dylan McDonald on 4/16/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var firstResField: SFMonoTextField!
    @IBOutlet weak var secondResField: SFMonoTextField!
    
    @IBOutlet weak var internalDismissKeyboardButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainView.layer.cornerRadius = 20
        mainView.layer.cornerCurve = .continuous
    }

    @IBAction func dismissKeyboards(_ sender: Any) {
        firstResField.resignFirstResponder()
        secondResField.resignFirstResponder()
    }
    
    @IBAction func beganEditing(_ sender: Any) {
        internalDismissKeyboardButton.isEnabled = true
    }
    
    @IBAction func stoppedEditing(_ sender: Any) {
        internalDismissKeyboardButton.isEnabled = false
    }
    
}

