//
//  NewPresetViewController.swift
//  Resolutioner
//
//  Created by Dylan McDonald on 4/19/21.
//

import UIKit

var senderIsEditor: Bool = false
var selectedIndex: IndexPath = [0,0]

class NewPresetViewController: UIViewController {

    @IBOutlet weak var shadowView: UIView!
    @IBOutlet weak var fakeBackgroundView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var sideOneField: SFMonoTextField!
    @IBOutlet weak var sideTwoField: SFMonoTextField!
    @IBOutlet weak var nameField: SFMonoTextField!
    
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
        
        if senderIsEditor {
            titleLabel.text = "Edit Preset"
        } else {
            titleLabel.text = "New Preset"
        }
        
        sideOneField.becomeFirstResponder()
    }

    @IBAction func cancel(_ sender: Any) {
        lightHaptics()
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func save(_ sender: Any) {
        if (!(sideOneField.text == "") && !(sideTwoField.text == "") && !(nameField.text == "")) == true {
            if senderIsEditor == false {
                var allIDs = allPresetsIDs()
                allIDs.append(generateRandomIdentifier())
                SaveAllIDs(with: allIDs)
                SaveName(with: nameField.text ?? "", forIndex: allIDs.count - 1)
                SaveResSideOne(with: sideOneField.text ?? "", forIndex: allIDs.count - 1)
                SaveResSideTwo(with: sideTwoField.text ?? "", forIndex: allIDs.count - 1)
            } else {
                SaveName(with: nameField.text ?? "", forIndex: selectedIndex.section)
                SaveResSideOne(with: sideOneField.text ?? "", forIndex: selectedIndex.section)
                SaveResSideTwo(with: sideTwoField.text ?? "", forIndex: selectedIndex.section)
            }
            successHaptics()
            dismiss(animated: true, completion: nil)
        } else {
            errorHaptics()
        }
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        senderIsEditor = false
    }
    
}
