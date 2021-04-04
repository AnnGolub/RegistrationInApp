//
//  AboutViewController.swift
//  RegistrationInApp
//
//  Created by Анна Голубева on 03.04.2021.
//

import UIKit

class AboutViewController: UIViewController {
    @IBOutlet weak var aboutText: UILabel!
    
    var aboutUser = ""
    
    let person = Person.init()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        aboutText.text = person.about
    }

}
