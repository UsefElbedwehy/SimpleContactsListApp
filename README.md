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

### Contacts (Home Screen)
- Displays a list of all saved contacts.
- Uses `UITableView` for presentation.
- Press the `+` button to add new contact.

![Contacts Screen](images/contacts-screen.png)

### Details Contacts 
- Tapping a contact shows their **name** and **phone number**.
- Navigates using `UINavigationController`.

![Contact Details](images/contact-details.png)

### AddContact Contacts 
- Modal sheet to input a new contact’s name and phone number.
- Input validation enables **Done** only if both fields are filled.
- Uses delegation to pass data back to the contacts list.

![Add Contact](images/add-contact.png)

### delete a contact
- Swipe left on a contact to delete it.
- Updates the contact list immediately.

![Delete Contact](images/delete-contact.png)

##  Project Highlights

- UIKit
- MVVM Architecture
- Modular Structure
- Delegation Pattern
- Navigation Controller & Sheet Presentation
- `UITableView` & Custom Cells
