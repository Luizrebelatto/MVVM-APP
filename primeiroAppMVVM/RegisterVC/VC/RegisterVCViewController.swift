//
//  RegisterVCViewController.swift
//  primeiroAppMVVM
//
//  Created by Luiz Gabriel Rebelatto Bianchi on 28/05/24.
//

import UIKit

class RegisterVC: UIViewController {
    private var registerScreen: RegisterScreen?
    private var viewModel: RegisterViewModel = RegisterViewModel()
    
    override func loadView() {
        registerScreen = RegisterScreen()
        view = registerScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerScreen?.delegate(delegate: self)
        registerScreen?.configTextFieldDelegate(delegate: self)
        viewModel.delegate(delegate: self)
    }


}

extension RegisterVC: RegisterScreenProtocol {
    func tappedBackButton() {
        print(#function)
        navigationController?.popViewController(animated: true)
    }
    
    func tappedRegisterButton() {
        print("chegou na VC")
        viewModel.createUser(email: registerScreen?.emailTextField.text ?? ""  , password: registerScreen?.passwordTextField.text ?? "")
    }
 
}

extension RegisterVC: registerViewModelProtocol {
    func successRegister() {
        let vc: HomeVC = HomeVC()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }
    
    func errorRegister(errorMessage: String) {
        print(#function)
        Alert(controller: self).showAlertInformation(title: "Ops, erro Register", message: errorMessage)
    }
}

extension RegisterVC: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print(#function)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        print(#function)
        let email: String = registerScreen?.emailTextField.text ?? ""
        let passwordTextField: String = registerScreen?.passwordTextField.text ?? ""
        
        if !email.isEmpty && !passwordTextField.isEmpty {
            print("Botao habilitado")
            registerScreen?.registerButton.isEnabled = true
            registerScreen?.registerButton.backgroundColor = .black
        } else {
            print("Botao desabilitado")
            registerScreen?.registerButton.isEnabled = false
            registerScreen?.registerButton.backgroundColor = .black.withAlphaComponent(0.6)
        }
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print(#function)
        textField.resignFirstResponder()
        return false
    }
    
}
