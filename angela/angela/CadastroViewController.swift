//
//  CadastroViewController.swift
//  angela
//
//  Created by Maria Carolina Santos on 25/06/16.
//  Copyright © 2016 Maria Carolina Marinho Séves Santos. All rights reserved.
//

import UIKit

class CadastroViewController: UIViewController, UITextFieldDelegate {
    
    let defaults = NSUserDefaults.standardUserDefaults()
    
    
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
        
        
        // Espaço do placeholder da borda do textfield
        let nomePaddingView = UIView(frame: CGRectMake(0, 0, 15, self.nomeTextfield.frame.height))
        nomeTextfield.leftView = nomePaddingView
        nomeTextfield.leftViewMode = UITextFieldViewMode.Always
        
        let emailPaddingView = UIView(frame: CGRectMake(0, 0, 15, self.emailTextfield.frame.height))
        emailTextfield.leftView = emailPaddingView
        emailTextfield.leftViewMode = UITextFieldViewMode.Always
        
        let telefonePaddingView = UIView(frame: CGRectMake(0, 0, 15, self.telefoneTextfield.frame.height))
        telefoneTextfield.leftView = telefonePaddingView
        telefoneTextfield.leftViewMode = UITextFieldViewMode.Always
        
        let senhaPaddingView = UIView(frame: CGRectMake(0, 0, 15, self.senhaTextfield.frame.height))
        senhaTextfield.leftView = senhaPaddingView
        senhaTextfield.leftViewMode = UITextFieldViewMode.Always
        
        let confirmaPaddingView = UIView(frame: CGRectMake(0, 0, 15,
            self.confirmaTextfield.frame.height))
        confirmaTextfield.leftView = confirmaPaddingView
        confirmaTextfield.leftViewMode = UITextFieldViewMode.Always

}
    
    // Teclado sumir
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    
    // Clique para proxima tela
    @IBAction func proximoClicked(sender: AnyObject) {
        
        // Salva valores
        defaults.setValue(self.nomeTextfield.text, forKey: "cadNome")
        defaults.setValue(self.emailTextfield.text, forKey: "cadEmail")
        defaults.setValue(self.telefoneTextfield.text, forKey: "cadTelefone")
        defaults.setValue(self.senhaTextfield.text, forKey: "cadSenha")
        
        let vc = Cadastro2ViewController(nibName:"Cadastro2ViewController", bundle: nil)
        presentViewController(vc, animated: true, completion: nil)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

