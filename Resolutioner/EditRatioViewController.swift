//
//  EditRatioViewController.swift
//  Resolutioner
//
//  Created by Dylan McDonald on 4/18/21.
//

import UIKit

class EditRatioViewController: UIViewController {

    @IBOutlet weak var sideOneField: SFMonoTextField!
    @IBOutlet weak var sideTwoField: SFMonoTextField!
    
    @IBOutlet weak var mainBlurView: UIVisualEffectView!
    @IBOutlet weak var descLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainBlurView.layer.cornerRadius = 20
        mainBlurView.layer.cornerCurve = .continuous
        
        sideOneField.text = "\(sideOne)"
        sideTwoField.text = "\(sideTwo)"
    }
    
    @IBAction func dismiss(_ sender: Any) {
       dismiss(animated: true, completion: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        sideOne = Double(sideOneField.text ?? "1") ?? 1
        sideTwo = Double(sideTwoField.text ?? "1") ?? 1
    }
    
}
