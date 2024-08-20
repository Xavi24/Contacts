//
//  APIService.swift
//  ContactsProject
//
//  Created by Xavier Joseph on 20/08/24.
//

import UIKit
import Combine

protocol APIService {
    func request<T: Decodable>(with builder: URLRequest) -> AnyPublisher<T, APIError>
}
