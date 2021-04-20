//
//  SavedPresetsTableViewController.swift
//  Resolutioner
//
//  Created by Dylan McDonald on 4/19/21.
//

import UIKit

class SavedPresetsTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(UpdatePresetsTable(_:)), name: NSNotification.Name(rawValue: "UpdatePresetsTable"), object: nil)
    }
    
   
    @objc func UpdatePresetsTable(_ notification: Notification) {
        tableView.reloadData()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        //        if let selectionIndexPath = self.tableView.indexPathForSelectedRow {
        //            self.tableView.deselectRow(at: selectionIndexPath, animated: animated)
        //        }
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 4
    }
    
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 4
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return allPresetsIDs().count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "identifier", for: indexPath)
        
        cell.textLabel?.text = PresetName(forIndex: indexPath.section)
        cell.detailTextLabel?.text = "\(PresetResSideOne(forIndex: indexPath.section)) x \(PresetResSideTwo(forIndex: indexPath.section))"
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        selectedIndex = indexPath
//        if self.splitViewController?.traitCollection.horizontalSizeClass != .compact {
//            let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "PresetDetails")
//            self.splitViewController?.showDetailViewController(vc, sender: self)
//        } else {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "PresetDetails")
        vc.modalPresentationStyle = .overFullScreen
        vc.modalTransitionStyle = .crossDissolve
        self.present(vc, animated: true, completion: nil)
//        }

    }
    
    
    /*
     // Override to support editing the table view.
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
     if editingStyle == .delete {
     // Delete the row from the data source
     tableView.deleteRows(at: [indexPath], with: .fade)
     } else if editingStyle == .insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
     }
     */
    
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        
    }
    
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    
    override func tableView(_ tableView: UITableView,
                            trailingSwipeActionsConfigurationForRowAt selectedIndexPath: IndexPath)
    ->   UISwipeActionsConfiguration? {
        
        let delete = UIContextualAction(style: .destructive, title: "Delete", handler: { (action, view, completionHandler) in
            DeleteResSideOne(forIndex: selectedIndexPath.section)
            DeleteResSideTwo(forIndex: selectedIndexPath.section)
            DeleteName(forIndex: selectedIndexPath.section)
            
            var allIDs = allPresetsIDs()
            allIDs.remove(at: selectedIndexPath.section)
            SaveAllIDs(with: allIDs)
            
            tableView.deleteSections([selectedIndexPath.section], with: .left)
        })
        delete.image = UIImage(systemName: "trash")
        delete.backgroundColor = .systemRed
        
        
        let configuration = UISwipeActionsConfiguration(actions: [delete])
        return configuration
        
        
    }
    
}


class PresetDetailsViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var insideMainView: UIView!
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var resLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        insideMainView.layer.cornerRadius = 20
        insideMainView.layer.cornerCurve = .continuous
        
        headerView.layer.cornerRadius = 20
        headerView.layer.cornerCurve = .continuous
        
        
        insideMainView.layer.shadowColor = UIColor.black.cgColor
        insideMainView.layer.shadowOffset = CGSize(width: 0, height: 1)
        insideMainView.layer.shadowRadius = 5
        insideMainView.layer.shadowOpacity = 0.4
        
        applySFMonoFont(forLabel: resLabel, withWeight: .medium)
        
        setupView()
        
        NotificationCenter.default.addObserver(self, selector: #selector(UpdateDetailsView(_:)), name: NSNotification.Name(rawValue: "UpdateDetailsView"), object: nil)
    }
    
    func setupView() {
        resLabel.text = "\(PresetResSideOne(forIndex: selectedIndex.section)) X \(PresetResSideTwo(forIndex: selectedIndex.section))"
        titleLabel.text = PresetName(forIndex: selectedIndex.section)
    }
    
    @objc func UpdateDetailsView(_ notification: Notification) {
        setupView()
    }
    
    @IBAction func dismiss(_ sender: Any) {
        lightHaptics()
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func edit(_ sender: Any) {
        senderIsEditor = true
        lightHaptics()
    }
    
    
}
