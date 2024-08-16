//
//  WelcomeViewController.swift
//  AboutMeApp
//
//  Created by Lex Koby on 11.08.2024.
//

import UIKit

final class WelcomeViewController: UIViewController {
    
    @IBOutlet var welcomeLabel: UILabel!
    
    var userName: String!

    override func viewDidLoad() {
        super.viewDidLoad()
        welcomeLabel.text = "Welcome, \(userName ?? "")!"
    }
    
    @IBAction func logOutButtonTapped() {
        dismiss(animated: true)
        // я помню что ещё был способ сделать выход на предыдущую страницу, но я решил сделать тут вот так 🤷‍♂️
    }
}
