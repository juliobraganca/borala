//
//  Alert.swift
//  borala
//
//  Created by Luana Mattana Damin on 28/11/23.
//

import UIKit
import Foundation

enum AlertStrings: String {
    case errorMessage = "Erro ao logar"
    case errorIncorrect = "Dados incorretos"
    case atention = "Atenção"
    case errorRegister = "Erro ao cadastrar. Verifique seus dados"
    case sucessRegister = "Registro realizado com sucesso!"
    case congratulations = "Parabéns"
    case characters = "Inserir um nome com no mínimo 2 caractéries"
    
}

class Alert: NSObject {

        var controller: UIViewController


        init(controller: UIViewController) {
            self.controller = controller

        }

        func getAlert(title: String, message: String, completion: (() -> Void)? = nil ) {

            let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
            let cancel = UIAlertAction(title: "Ok", style: .cancel) { share in
                completion?()
            }

            alertController.addAction(cancel)
            self.controller.present(alertController, animated: true, completion: nil)

        }

    }


