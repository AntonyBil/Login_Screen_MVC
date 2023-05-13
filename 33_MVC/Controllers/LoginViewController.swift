//
//  LoginViewController.swift
//  33_MVC
//
//  Created by apple on 13.05.2023.
//

import UIKit

class LoginViewController: UIViewController {
    
    
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var loginBtn: UIButton!
    @IBOutlet weak var errorLbl: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        emailField.addTarget(self, action: #selector(self.validateFields), for: .editingChanged)
        passwordField.addTarget(self, action: #selector(self.validateFields), for: .editingChanged)
    }
    
    @objc private func validateFields() {
        loginBtn.isEnabled = emailField.text != "" && passwordField.text != ""
    }
    
    @IBAction func loginButtonClicked(_ sender: UIButton) {
        NetworkService.shared.login(email: emailField.text ?? "", password: passwordField.text ?? "") { success in
            if success {
                self.goToHomePage()
            } else {
                self.errorLbl.text = "Incorrect login or passeord, try again!"
            }
        }
    }
    
    private func goToHomePage() {
    let controller = storyboard?.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
        present(controller, animated: true)
    }
    
    //dismiss keyboard when we touch the screen
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    

}
