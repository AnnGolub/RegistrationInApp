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
    
    let person = Person.init()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        logInButton.layer.cornerRadius = 16
    }
    
    // MARK: Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        _ = segue.destination as! UITabBarController
        let viewControllers: [UIViewController] = []
        
        for viewController in viewControllers {
            if let personalProfileVC = viewController as? PersonalProfileViewController {
                personalProfileVC.welcomeUserName = person.name
            } else if let aboutProfessionVC = viewController as? ProfessionViewController {
                aboutProfessionVC.profession = person.profession
            } else if let navigationVC = viewController as? UINavigationController {
                guard let aboutUserVC = navigationVC.topViewController as? AboutViewController else { return }
                aboutUserVC.aboutUser = person.about
            }
        }
    }
    
    // MARK: IBActions
    @IBAction func logInButtonPressed() {
        if userNameTF.text != person.userName || passwordTF.text != person.password {
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
            ? showAllert(with: "Oops", message: "Your user name is \(person.userName)")
            : showAllert(with: "Oops", message: "Your password is \(person.password)")
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
