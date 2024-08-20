//
//  ContentView.swift
//  ContactsProject
//
//  Created by Xavier Joseph on 20/08/24.
//

import SwiftUI
import CoreData

struct ContentView: View {

    @StateObject var contactViewModel = ContactViewModel()

    var body: some View {
        NavigationView {
            List(contactViewModel.contacts) { contact in
                            NavigationLink(destination: ContactDetailView(contact: contact)) {
                                    Text(contact.name)
                                        .font(.headline)
                            }
                            .frame(height: 30)
                        }
                        .navigationTitle("Contacts")
                        .onAppear {
                            contactViewModel.getContactList()
                        }
        }
    }
    
}
