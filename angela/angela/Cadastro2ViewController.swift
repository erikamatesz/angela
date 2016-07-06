//
//  Cadastro2ViewController.swift
//  angela
//
//  Created by Tamyres Freitas on 6/25/16.
//  Copyright © 2016 Maria Carolina Marinho Séves Santos. All rights reserved.
//

import UIKit

class Cadastro2ViewController: UIViewController {
    
    @IBOutlet weak var senhaOkTextfield: UITextField!
    @IBOutlet weak var confirmaOkTextfield: UITextField!
    @IBOutlet weak var senhaDeuRuimTextfield: UITextField!
    @IBOutlet weak var confirmarDeuRuimTextfield: UITextField!
    @IBOutlet weak var cadastrarButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let deuRuimPaddingView = UIView(frame: CGRectMake(0, 0, 15, self.senhaDeuRuimTextfield.frame.height))
        senhaDeuRuimTextfield.leftView = deuRuimPaddingView
        senhaDeuRuimTextfield.leftViewMode = UITextFieldViewMode.Always
        
        let confirmaRuimPaddingView = UIView(frame: CGRectMake(0, 0, 15, self.confirmarDeuRuimTextfield.frame.height))
        confirmarDeuRuimTextfield.leftView = confirmaRuimPaddingView
        confirmarDeuRuimTextfield.leftViewMode = UITextFieldViewMode.Always
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Teclado sumir
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    
    // Cloque para cadastrar usuario
    @IBAction func cadastrarClicked(sender: AnyObject) {
        
        let defaults = NSUserDefaults.standardUserDefaults()
        
        let cadNome = defaults.stringForKey("cadNome")
        
        let cadEmail = defaults.stringForKey("cadEmail")
        
        let cadSenha = defaults.stringForKey("cadSenha")
        
        let cadTelefone = defaults.stringForKey("cadTelefone")
    

        
//        if DAO.isConnected() {
//            
//            if DAO.createUser(cadNome!, email: cadEmail!, password: cadSenha!, emergpass: self.senhaDeuRuimTextfield.text!, mobile: cadTelefone!) {
        
                defaults.setObject("1", forKey: "loggedIn")
                let vc = LoginViewController(nibName:"LoginViewController", bundle: nil)
                presentViewController(vc, animated: true, completion: nil)
//
//            } else {
//                print("Falha no cadastro")
//            }
//            
//        } else {
//            print("Falha na conexao com a internet")
//            
//        }
        
    }
    
}
