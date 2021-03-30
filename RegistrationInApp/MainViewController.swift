//
//  ViewController.swift
//  RegistrationInApp
//
//  Created by Анна Голубева on 30.03.2021.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var userNameTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    
    @IBOutlet weak var logInButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userNameTF.text = ""
        passwordTF.text = ""
       
        logInButton.layer.cornerRadius = 16
    }
    
    @IBAction func forgotUserNameButtonPressed() {
        showAllert(with: "Ooops", message: "Your name is User")
    }
    
    @IBAction func forgotPasswordButtonPressed() {
        showAllert(with: "Ooops", message: "Your password is 12345")
    }
    
    
    @IBAction func logInButtonPressed() {
        guard let inputUserName = userNameTF.text, !inputUserName.isEmpty else {
            forgotUserNameButtonPressed()
            return
        }
        guard let inputPassword = passwordTF.text, !inputPassword.isEmpty else {
            forgotPasswordButtonPressed()
            return
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let personalProfileVC = segue.destination as?
                PersonalProfileViewController else { return }
        personalProfileVC.welcomeUserName = userNameTF.text
        
        userNameTF.text = ""
        passwordTF.text = ""
    }

}

// MARK: - Private Methods

extension MainViewController {
    private func showAllert(with title: String, message: String) {
        let alert = UIAlertController(title: title,
                                      message: message,
                                      preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK", style: .default)
        
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}
