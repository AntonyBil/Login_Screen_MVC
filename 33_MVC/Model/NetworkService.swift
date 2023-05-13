//
//  NetworkService.swift
//  33_MVC
//
//  Created by apple on 13.05.2023.
//

import Foundation

class NetworkService {
    static let shared = NetworkService()
    private init() { }
    
    private var user: User?
    
    func login(email: String, password: String, completion: @escaping(Bool) -> Void) {
        DispatchQueue.global().async {
            sleep(2)
            DispatchQueue.main.async {
                if email == "test@test.com" && password == "password" {
                    self.user = User(firstName: "Antony", lastName: "Bill", email: "test@test.co", age: 34, location: Location(lat: 3.13344, lng: 2.58575))
                    completion(true)
                } else {
                    self.user = nil
                    completion(false)
                }
            }
        }
    }
    
    func getLoggedInUser() -> User? {
        return user
    }
}
