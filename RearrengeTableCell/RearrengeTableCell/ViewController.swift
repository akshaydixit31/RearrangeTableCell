//
//  ViewController.swift
//  RearrengeTableCell
//
//  Created by Appinventiv Technologies on 25/08/17.
//  Copyright © 2017 Appinventiv Technologies. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // ========== variable's =====================
    var rowArray = ["One","Two","Three","Four","Five","Six","Seven","Eight","Nine","Ten"]
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var edit: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        
    }

    @IBAction func editButton(_ sender: UIButton) {
        tableView.isEditing = !tableView.isEditing
        switch tableView.isEditing {
        case true:
            edit.setTitle("Done", for: .normal)
        case false:
            edit.setTitle("Edit", for: .normal)
        }
    }
    

}
//=========== Class extension ================
extension ViewController: UITableViewDataSource,UITableViewDelegate{
    //------------- For number of rows-------------------
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rowArray.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCellEditingStyle.delete {
        rowArray.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: UITableViewRowAnimation.fade)
        }
}
    //============ methode for TableView ----------------------
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CellData", for: indexPath) as? CellData else{
            fatalError()
        }
        cell.dataLabel.text = rowArray[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to toIndexPath: IndexPath) {
        let itemToMove = rowArray[fromIndexPath.row]
        rowArray.remove(at: fromIndexPath.row)
        rowArray.insert(itemToMove, at: toIndexPath.row)
    }
    internal func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
   
    
    
   
     
}
//============= class for cell ==========
class CellData: UITableViewCell {
    @IBOutlet weak var dataLabel: UILabel!
    
}

