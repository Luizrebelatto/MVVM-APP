//
//  LoginViewModel.swift
//  primeiroAppMVVM
//
//  Created by Luiz Gabriel Rebelatto Bianchi on 27/05/24.
//

import UIKit
import Firebase

protocol loginViewModelProtocol: AnyObject {
    func successLogin()
    func errorLogin(errorMessage: String)
}

class LoginViewModel {
    private weak var delegate: loginViewModelProtocol?
    private var auth = Auth.auth()
    
    public func delegate(delegate: loginViewModelProtocol) {
        self.delegate = delegate
    }
    
    public func login(email: String, password: String) {
        auth.signIn(withEmail: email, password: password) { authResult, error in
            if error == nil {
                print("Sucesso Login")
                self.delegate?.successLogin()
            } else {
                print("Error login, error: \(error?.localizedDescription ?? "")")
                self.delegate?.errorLogin(errorMessage: error?.localizedDescription ?? "")
            }
        }
    }
}
