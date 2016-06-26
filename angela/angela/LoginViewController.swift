//
//  LoginViewController.swift
//  angela
//
//  Created by Maria Carolina Santos on 25/06/16.
//  Copyright © 2016 Maria Carolina Marinho Séves Santos. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var imagemBackground: UIImageView!
    
    //textfields
    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var senhaTextfield: UITextField!
    
    //buttons
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var criarButton: UIButton!
    @IBOutlet weak var esqueciSenhaButton: UIButton!
    
    let defaults = NSUserDefaults.standardUserDefaults()
    
    override func viewDidLoad() {
    super.viewDidLoad()
    
    emailTextfield.delegate = self
    senhaTextfield.delegate = self
        
    let emailPaddingView = UIView(frame: CGRectMake(0, 0, 15, self.emailTextfield.frame.height))
    emailTextfield.leftView = emailPaddingView
    emailTextfield.leftViewMode = UITextFieldViewMode.Always
        
    let senhaPaddingView = UIView(frame: CGRectMake(0, 0, 15, self.senhaTextfield.frame.height))
    senhaTextfield.leftView = senhaPaddingView
    senhaTextfield.leftViewMode = UITextFieldViewMode.Always
        
    defaults.setObject(1234, forKey: "senha")

    
    // Do any additional setup after loading the view, typically from a nib.
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
    textField.resignFirstResponder()
    return true
    }
    
    // Teclado sumir com toque
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }

    
    // Clique para logar
    @IBAction func loginClicked(sender: AnyObject) {
        
        if DAO.isConnected() {
            
            defaults.setObject(self.emailTextfield.text, forKey: "loginEmail")
            
            if DAO.userLogin(self.emailTextfield.text!, password: self.senhaTextfield.text!) {
                
                let vc = EventoViewController(nibName:"EventoViewController", bundle: nil)
                presentViewController(vc, animated: true, completion: nil)
            
            } else {
                print("Falha no login")
            }
            
        } else {
            print("Falha na conexao com a internet")
        }
        
    }
    
    @IBAction func criarClicked(sender: AnyObject) {
        let vc = CadastroViewController(nibName:"CadastroViewController", bundle: nil)
        presentViewController(vc, animated: true, completion: nil)
    
    }
    
    override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
}

}