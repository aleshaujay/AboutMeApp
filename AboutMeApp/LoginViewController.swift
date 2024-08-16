//
//  LoginViewController.swift
//  AboutMeApp
//
//  Created by Lex Koby on 11.08.2024.
//

import UIKit

final class LoginViewController: UIViewController {
    
    @IBOutlet var userNameField: UITextField!
    @IBOutlet var passwordField: UITextField!
    
    private let user = "Lex"
    private let password = "1111"
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        guard userNameField.text == user, passwordField.text == password else {
            showAlert(
                title: "Invalid login or password",
                message: "Please, enter correct login and password") {
                    self.passwordField.text = ""
                }
            return false
        }
        return true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let welcomeVC = segue.destination as? WelcomeViewController else { return }
        welcomeVC.userName = user
    }
    
    @IBAction func forgotUserName() {
        showAlert(title: "Oops!", message: "Your name is \(user) ✌️")
    }
    
    @IBAction func forgotPassword() {
        showAlert(title: "Oops!", message: "Your password is \(password) 👍")
    }
    
   /*
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        userNameField.text = ""
        passwordField.text = ""
    }
    я ведь правильно понял, что этот метод нужно отключить для Вашего удобства входа?
    */
    
    private func showAlert(title: String, message: String, completion: (() -> Void)? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            completion?()
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}
