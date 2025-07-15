//
//  ContactsViewModel.swift
//  SimpleContactsListApp
//
//  Created by Usef on 15/07/2025.
//

import Foundation

class ContactsViewModel {
    var contacts: [Contact] = []
    var isLoading:Bool = false
    let service:ContactServiceProtocol
    let numberOfSections: Int = 1
    
    var didLoadContacts: (() -> Void)?
    
    init(service:ContactServiceProtocol) {
        self.service = service
        loadContacts()
    }
    
    func loadContacts() {
        isLoading = true
        contacts = service.getAllContacts()
        isLoading = false
        didLoadContacts?()
    }
    
    func addContact(_ contact: Contact) {
        service.addContactFrom(contact.name, and: contact.phone)
        didLoadContacts?()
    }
}
