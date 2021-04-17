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
