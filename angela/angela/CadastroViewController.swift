//
//  CadastroViewController.swift
//  angela
//
//  Created by Maria Carolina Santos on 25/06/16.
//  Copyright © 2016 Maria Carolina Marinho Séves Santos. All rights reserved.
//

import UIKit

class CadastroViewController: UIViewController, UITextFieldDelegate {
    
    
    
    //Textfields
    @IBOutlet weak var nomeTextfield: UITextField!
    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var telefoneTextfield: UITextField!
    @IBOutlet weak var senhaTextfield: UITextField!
    @IBOutlet weak var confirmaTextfield: UITextField!
    
    //Botoes
    @IBOutlet weak var proximoButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nomeTextfield.delegate = self
        emailTextfield.delegate = self
        telefoneTextfield.delegate = self
        senhaTextfield.delegate = self
        confirmaTextfield.delegate = self
        
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

