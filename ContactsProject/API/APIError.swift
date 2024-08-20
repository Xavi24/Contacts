//
//  APIError.swift
//  ContactsProject
//
//  Created by Xavier Joseph on 20/08/24.
//

import Foundation

enum APIError: Error {
    case decodingError
    case httpError(Int)
    case unknown
}
