//
//  AddContactViewModel.swift
//  SimpleContactsListApp
//
//  Created by Usef on 15/07/2025.
//

import Foundation

class AddContactViewModel {
    var contactService: ContactServiceProtocol
    
    init(contactService: ContactServiceProtocol) {
        self.contactService = contactService
    }
}
