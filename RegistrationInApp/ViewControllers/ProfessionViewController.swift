//
//  ProfessionViewController.swift
//  RegistrationInApp
//
//  Created by Анна Голубева on 03.04.2021.
//

import UIKit

class ProfessionViewController: UIViewController {
    @IBOutlet weak var professionText: UILabel!
    
    var profession = ""
    let person = Person.init()
    
    private let primaryColor = UIColor(
        red: 0,
        green: 0.812,
        blue: 0.973,
        alpha: 1
    )
    private let secondaryColor = UIColor(
        red: 0.784,
        green: 0,
        blue: 1,
        alpha: 1
    )
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addVerticalGradientLayer(topColor: primaryColor, bottomColor: secondaryColor)
        professionText.text = person.profession
    }
    
}

// MARK: - Set background color
extension UIView {
    func addVerticalGradientLayer(topColor: UIColor, bottomColor: UIColor) {
        let gradient = CAGradientLayer()
        gradient.frame = bounds
        gradient.colors = [topColor.cgColor, bottomColor.cgColor]
        gradient.locations = [0.0, 1.0]
        gradient.startPoint = CGPoint(x: 0, y: 0)
        gradient.endPoint = CGPoint(x: 0, y: 1)
        layer.insertSublayer(gradient, at: 0)
    }
}
