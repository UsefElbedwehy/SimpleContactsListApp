//
//  ContactsTableViewController.swift
//  SimpleContactsListApp
//
//  Created by Usef on 15/07/2025.
//

import UIKit

class ContactsTableViewController: UITableViewController {
    private var viewModel = ContactsViewModel(service: ContactService())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(presentAddContact))
        viewModel.didLoadContacts = { [weak self] in
            self?.updateUI()
        }
        
    }
    
    // MARK: Helpers
    func updateUI() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.numberOfSections
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.contacts.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "contactCell", for: indexPath) as! ContactsTableViewCell

        cell.configure(with: viewModel.contacts[indexPath.row])

        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            viewModel.deleteContact(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let name = viewModel.contacts[indexPath.row].name
        let phone = viewModel.contacts[indexPath.row].phone
        navigateToContactDetails(with: name, and: phone)
    }
}

extension ContactsTableViewController {
    @objc func presentAddContact() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let addContactVC = storyboard.instantiateViewController(withIdentifier: "AddContactViewController") as! AddContactViewController
        addContactVC.delegete = self
        let navController = UINavigationController(rootViewController: addContactVC)
        
        navController.modalPresentationStyle = .pageSheet

        if let sheet = navController.sheetPresentationController {
            sheet.detents = [.large()]
            sheet.prefersGrabberVisible = true
        }

        present(navController, animated: true, completion: nil)
    }
    
    func navigateToContactDetails(with name: String, and phone: String) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let contactDetailsVC = storyboard.instantiateViewController(withIdentifier: "contactDetailsViewController") as? ContactDetailsViewController else { return }

        contactDetailsVC.name = name
        contactDetailsVC.phone = phone

        navigationController?.pushViewController(contactDetailsVC, animated: true)
    }
}

extension ContactsTableViewController: ContactDelegete {
    func addContact(_ contact: Contact) {
        viewModel.contacts.append(contact)
        viewModel.addContact(contact)
        self.tableView.reloadData()
    }
}
