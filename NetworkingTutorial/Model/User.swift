//
//  User.swift
//  NetworkingTutorial
//
//  Created by Fernando Martín Ortiz on 06/01/2021.
//

import Foundation

final class User: Codable {
    var id: Int?
    var name: String?
    var username: String?
    var email: String?
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case username = "username"
        case email = "email"
    }
}

