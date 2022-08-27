//
//  PeopleData.swift
//  Taskequest
//
//  Created by Dharmi Patel on 26/08/22.
//

import Foundation
struct PeopleData:Decodable {
    
    let id: Int
    let first_name: String
    let last_name: String
    let email: String
    let gender: String
    let avatar: String
}

