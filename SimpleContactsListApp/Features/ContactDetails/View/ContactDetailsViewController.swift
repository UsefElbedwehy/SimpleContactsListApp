//
//  ContactDetailsViewController.swift
//  SimpleContactsListApp
//
//  Created by Usef on 15/07/2025.
//

import UIKit

class ContactDetailsViewController: UIViewController {
    var name: String = ""
    var phone:String = ""
    
    @IBOutlet weak var detailsNameLB: UILabel!
    
    @IBOutlet weak var detailsPhoneLB: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Contact Details"
        self.detailsNameLB.text = name
        self.detailsPhoneLB.text = phone
    }
    

}
