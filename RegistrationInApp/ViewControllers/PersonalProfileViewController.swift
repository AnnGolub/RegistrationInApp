//
//  PersonalProfileViewController.swift
//  RegistrationInApp
//
//  Created by Анна Голубева on 30.03.2021.
//

import UIKit

class PersonalProfileViewController: UIViewController {
    
    @IBOutlet weak var welcomeMessage: UILabel!
    @IBOutlet weak var logOutButton: UIButton!
    
    var welcomeUserName = ""
   
    let person = Person.init()

    override func viewDidLoad() {
        super.viewDidLoad()
        welcomeMessage.text = person.name
        
        logOutButton.layer.cornerRadius = 16
    }
    
}
