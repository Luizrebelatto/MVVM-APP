//
//  RegisterViewModel.swift
//  primeiroAppMVVM
//
//  Created by Luiz Gabriel Rebelatto Bianchi on 28/05/24.
//

import UIKit
import Firebase

protocol registerViewModelProtocol: AnyObject {
    func successRegister()
    func errorRegister(errorMessage: String)
}

class RegisterViewModel {
    private weak var delegate: registerViewModelProtocol?
    private var auth = Auth.auth()
    
    public func delegate(delegate: registerViewModelProtocol) {
        self.delegate = delegate
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
