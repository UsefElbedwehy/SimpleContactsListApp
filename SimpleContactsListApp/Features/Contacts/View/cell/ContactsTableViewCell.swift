//
//  ContactsTableViewCell.swift
//  SimpleContactsListApp
//
//  Created by Usef on 15/07/2025.
//

import UIKit

class ContactsTableViewCell: UITableViewCell {

    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var phoneLB: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configure(with contact: Contact) {
        name.text = contact.name
        phoneLB.text = contact.phone
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
