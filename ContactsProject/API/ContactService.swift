//
//  ContactService.swift
//  ContactsProject
//
//  Created by Xavier Joseph on 20/08/24.
//

import UIKit
import Combine

protocol ContactService {
    var apiSession: APIService {get}
    
    func getContactList() -> AnyPublisher<[ContactModel], APIError>
}

extension ContactService {
    func getContactList() -> AnyPublisher<[ContactModel], APIError> {
        let urlString = "https://jsonplaceholder.typicode.com/users"
        
        guard let url = URL(string: urlString) else { preconditionFailure("Invalid URL format")}
        let request = URLRequest(url: url)
        return apiSession.request(with: request)
            .eraseToAnyPublisher()
    }
}
