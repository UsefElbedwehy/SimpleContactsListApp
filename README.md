# SimpleContactsListApp

A simple iOS app built with **Swift** and **UIKit** using the **MVVM architecture**. It displays a list of contacts, allows users to add new contacts, and view details of each contact.

---

## Architecture: MVVM

The app follows the **MVVM (Model-View-ViewModel)** architecture:

### 🧩 Layer Roles

- **Model**: Represents the contact data (`Contact` struct).
- **View**: UIKit Views/ViewControllers (`ContactsViewController`, etc.).
- **ViewModel**: Handles business logic, view state, and communicates with the view.

Each **feature** (e.g., Contacts, AddContact, ContactDetails) has its **own folder** with:

📁 Contacts/
├── ContactViewModel.swift
├── ContactsViewController.swift
└── ContactTableViewCell.swift

This keeps all related logic encapsulated and easy to maintain.

--- 

