//
//  CadastroViewController.swift
//  angela
//
//  Created by Maria Carolina Santos on 25/06/16.
//  Copyright © 2016 Maria Carolina Marinho Séves Santos. All rights reserved.
//

import UIKit

class CadastroViewController: UIViewController, UITextFieldDelegate {
    
    //Imagem perfil
    @IBOutlet weak var profilePicture: UIImageView!
    
    
    //Textfields
    @IBOutlet weak var nomeTextfield: UITextField!
    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var telefoneTextfield: UITextField!
    @IBOutlet weak var senhaTextfield: UITextField!
    @IBOutlet weak var ajudaTextfield: UITextField!
    
    //Botoes
    @IBOutlet weak var criarButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nomeTextfield.delegate = self
        emailTextfield.delegate = self
        telefoneTextfield.delegate = self
        senhaTextfield.delegate = self
        ajudaTextfield.delegate = self
        
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    @IBAction func criarClicked(sender: AnyObject) {
        
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

