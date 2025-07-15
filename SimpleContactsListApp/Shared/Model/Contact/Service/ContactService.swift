//
//  ContactService.swift
//  SimpleContactsListApp
//
//  Created by Usef on 15/07/2025.
//

import Foundation

class ContactService: ContactServiceProtocol {
    func getAllContacts() -> [Contact] {
        UserDefaultsManager.shared.loadContacts()
    }
    
    func addContactFrom(_ name: String, and phone: String) {
        let contact = Contact(name: name, phone: phone)
        UserDefaultsManager.shared.saveContact(contact)
    }
    
    func deleteContact(at index: Int) {
        UserDefaultsManager.shared.removeContact(at: index)
    }
}
