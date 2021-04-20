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
    
    @IBOutlet weak var insideMainView: UIView!
    @IBOutlet weak var descLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        insideMainView.layer.cornerRadius = 20
        insideMainView.layer.cornerCurve = .continuous
        
        
        insideMainView.layer.shadowColor = UIColor.black.cgColor
        insideMainView.layer.shadowOffset = CGSize(width: 0, height: 1)
        insideMainView.layer.shadowRadius = 5
        insideMainView.layer.shadowOpacity = 0.4
        
        
        sideOneField.text = "\(sideOne())"
        sideTwoField.text = "\(sideTwo())"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        sideOneField.becomeFirstResponder()
    }
    
    
    @IBAction func dismiss(_ sender: Any) {
        successHaptics()
       dismiss(animated: true, completion: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        saveSideOne(with: Double(sideOneField.text ?? "1") ?? 1)
        saveSideTwo(with: Double(sideTwoField.text ?? "1") ?? 1)
    }
    
}
