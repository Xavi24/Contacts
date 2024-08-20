//
//  ContactViewModel.swift
//  ContactsProject
//
//  Created by Xavier Joseph on 20/08/24.
//

import UIKit
import SwiftUI
import Combine

class ContactViewModel: ObservableObject, ContactService {
    internal var apiSession: APIService
    
    @Published var contacts: [ContactModel] = []
    @Published var showAlert = false
    
    private var cancellables = Set<AnyCancellable>()
    var alertMessage = "Unknown error"
    
    init(apiSession: APIService = APISession()) {
        self.apiSession = apiSession
    }
    
    func getContactList() {
        let cancellable = self.getContactList()
            .sink(receiveCompletion: {[weak self] result in
                switch result {
                case .failure(let error):
                    self?.alertMessage = "\((error as NSError).localizedDescription)"
                    self?.showAlert = true
                case .finished:
                    break
                }
            }) { (contact) in
                self.contacts = contact
            }
        cancellables.insert(cancellable)
    }
}
