//
//  Model.swift
//  33_MVC
//
//  Created by apple on 13.05.2023.
//

import Foundation

struct User {
    let firstName, lastName, email: String
    let age: Int
    let location: Location
}

struct Location {
    let lat: Double
    let lng: Double
}
