//
//  HomeViewController.swift
//  33_MVC
//
//  Created by apple on 13.05.2023.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var welcomeLbl: UILabel!
    
    var user: User!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        user = NetworkService.shared.getLoggedInUser()
        welcomeUser()
    }
    
    private func welcomeUser() {
        welcomeLbl.text = "Hello, \(user.firstName) \(user.lastName)"
    }
  
}
