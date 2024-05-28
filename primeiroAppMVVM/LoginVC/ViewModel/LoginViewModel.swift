//
//  LoginViewModel.swift
//  primeiroAppMVVM
//
//  Created by Luiz Gabriel Rebelatto Bianchi on 27/05/24.
//

import UIKit
import Firebase

class LoginViewModel {
    private var auth = Auth.auth()
    
    public func login(email: String, password: String) {
        auth.signIn(withEmail: email, password: password) { authResult, error in
            if error == nil {
                print("Sucesso Login")
            } else {
                print("Error login, error: \(error?.localizedDescription ?? "")")
            }
        }
    }
    
    public func createUser(email: String, password: String) {
        auth.createUser(withEmail: email, password: password) { authResult , error in
            if error == nil {
                print("Sucesso Register user")
            } else {
                print("Error Register user, error: \(error?.localizedDescription ?? "")")
            }
        }
    }
}
