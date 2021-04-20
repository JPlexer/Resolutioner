
//
//  AboutTableViewController.swift
//  School Assistant
//
//  Created by Dylan McDonald on 6/14/20.
//  Copyright © 2020 Dylan McDonald. All rights reserved.
//

import UIKit

import SafariServices

class AboutTableViewController: UITableViewController, SFSafariViewControllerDelegate {
    
    @IBOutlet weak var headerCell: UITableViewCell!
    @IBOutlet weak var secondBorderView: UIView!
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 4
    }
    
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 4
    }
    
    override func viewWillAppear(_ animated: Bool) {
//        if let selectionIndexPath = self.tableView.indexPathForSelectedRow {
//            self.tableView.deselectRow(at: selectionIndexPath, animated: animated)
//        }
        tableView.tintColor = UIColor(named: "AccentColor")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationController?.navigationBar.sizeToFit()
        
        headerCell.layer.borderWidth = 10
        headerCell.layer.borderColor = UIColor.gray.cgColor
        headerCell.layer.masksToBounds = true
        
        secondBorderView.layer.shadowPath = UIBezierPath(roundedRect: secondBorderView.bounds, cornerRadius: 10).cgPath
        secondBorderView.layer.shouldRasterize = true
        secondBorderView.layer.rasterizationScale = UIScreen.main.scale
        // corner radius
        secondBorderView.layer.cornerRadius = 10
        secondBorderView.layer.cornerCurve = .continuous

        // border
        secondBorderView.layer.borderWidth = 20
        secondBorderView.layer.borderColor = UIColor.black.cgColor
        secondBorderView.backgroundColor = #colorLiteral(red: 0.1489980221, green: 0.1490316689, blue: 0.1489984095, alpha: 1)

        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        if indexPath.section == 5 {
            let urlString = "https://sunapps.org"
            if let url = URL(string: urlString) {
                let vc = SFSafariViewController(url: url)
                vc.preferredControlTintColor = UIColor(named: "AccentColor")
                vc.view.tintColor = UIColor(named: "AccentColor")
                vc.delegate = self
                present(vc, animated: true)
            }
        }
        
        if indexPath.section == 8 {
            
            let urlString = "https://sunapps.org/privacypolicy"
            if let url = URL(string: urlString) {
                let vc = SFSafariViewController(url: url)
                vc.preferredControlTintColor = UIColor(named: "AccentColor")
                vc.view.tintColor = UIColor(named: "AccentColor")
                vc.delegate = self
                present(vc, animated: true)
            }
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}
