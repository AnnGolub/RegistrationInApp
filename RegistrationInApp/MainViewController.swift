//
//  ViewController.swift
//  RegistrationInApp
//
//  Created by Анна Голубева on 30.03.2021.
//

import UIKit

class MainViewController: UIViewController {
    
    // MARK: - IB Outlets
    @IBOutlet weak var userNameTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var logInButton: UIButton!
    
    // MARK: - Private properties
    private let user = "User"
    private let password = "12345"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        logInButton.layer.cornerRadius = 16
    }
    
    // MARK: Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let personalProfileVC = segue.destination as?
                PersonalProfileViewController else { return }
        personalProfileVC.welcomeUserName = user
    }
    
    // MARK: IBActions
    @IBAction func logInButtonPressed() {
        if userNameTF.text != user || passwordTF.text != password {
            showAllert(
                with: "Invalid login or password",
                message: "Enter correct login and password"
            )
            return
        }
        
        performSegue(withIdentifier: "showPersonalProfileVC", sender: nil)
    }
    
    @IBAction func forgotRegisterData(_ sender: UIButton) {
        sender.tag == 0
            ? showAllert(with: "Oops", message: "Your user name is \(user)")
            : showAllert(with: "Oops", message: "Your password is \(password)")
    }
    
    @IBAction func unwind(for segue: UIStoryboardSegue) {
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
        passwordTF.text = ""
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}

// MARK: - Work with keyboard
extension MainViewController: UITextFieldDelegate {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == userNameTF {
            passwordTF.becomeFirstResponder()
        } else {
            logInButtonPressed()
        }
        return true
    }
}
