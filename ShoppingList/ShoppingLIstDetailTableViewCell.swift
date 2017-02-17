//
//  ShoppingLIstDetailTableViewCell.swift
//  ShoppingList
//
//  Created by Clay Mills on 2/17/17.
//  Copyright © 2017 Clay Mills. All rights reserved.
//

import UIKit
// set up IBOutlets
// Set up IBActions for button
// Set up delegate
// set up a variable? for Entity name
// Set up protocol func
// create fun updating
// create image views

class ShoppingLIstDetailTableViewCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var checkButton: UIButton!
    
    
    weak var delegate: ShoppingLIstDetailTableViewCellDelegate?
    
    var item: List? {
        didSet{
            updateView()
        }
    }
    private func updateView() {
        guard let name = item else { nameLabel.text = ""; return }
        nameLabel.text = name.name
        
        let image = name.viewed ? #imageLiteral(resourceName: "complete") : #imageLiteral(resourceName: "incomplete")
        checkButton.setImage(image, for: .normal)
    }
    
    @IBAction func checkbuttonTapped(_ sender: Any) {
        delegate?.listNameCellButtonTapped(sender: self)
    }
}
protocol ShoppingLIstDetailTableViewCellDelegate: class {
    func listNameCellButtonTapped(sender: ShoppingLIstDetailTableViewCell)
}
