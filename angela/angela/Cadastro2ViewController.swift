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
        
        
        // Espaço do placeholder da borda do textfield
//        let senhaPaddingView = UIView(frame: CGRectMake(0, 0, 15, self.senhaOkTextfield.frame.height))
//        senhaOkTextfield.leftView = senhaPaddingView
//        senhaOkTextfield.leftViewMode = UITextFieldViewMode.Always
//        
//        let confirmaPaddingView = UIView(frame: CGRectMake(0, 0, 15, self.confirmaOkTextfield.frame.height))
//        confirmaOkTextfield.leftView = confirmaPaddingView
//        confirmaOkTextfield.leftViewMode = UITextFieldViewMode.Always
        
        let deuRuimPaddingView = UIView(frame: CGRectMake(0, 0, 15, self.senhaDeuRuimTextfield.frame.height))
        senhaDeuRuimTextfield.leftView = deuRuimPaddingView
        senhaDeuRuimTextfield.leftViewMode = UITextFieldViewMode.Always
        
        let confirmaRuimPaddingView = UIView(frame: CGRectMake(0, 0, 15, self.confirmarDeuRuimTextfield.frame.height))
        confirmarDeuRuimTextfield.leftView = confirmaRuimPaddingView
        confirmarDeuRuimTextfield.leftViewMode = UITextFieldViewMode.Always
        
        
        
        
        // Do any additional setup after loading the view.
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
    
    
    
    @IBAction func cadastrarClicked(sender: AnyObject) {
        
        let defaults = NSUserDefaults.standardUserDefaults()
        
        let cadNome = defaults.stringForKey("cadNome")
        
        let cadEmail = defaults.stringForKey("cadEmail")
        
        let cadSenha = defaults.stringForKey("cadSenha")
        
        let cadTelefone = defaults.stringForKey("cadTelefone")
        
        if DAO.isConnected() {
            
            if DAO.createUser(cadNome!, email: cadEmail!, password: cadSenha!, emergpass: self.senhaDeuRuimTextfield.text!, mobile: cadTelefone!) {
            
                let vc = LoginViewController(nibName:"LoginViewController", bundle: nil)
                presentViewController(vc, animated: true, completion: nil)
                
            } else {
            
                // colocar alerta sobre NÃO ter feito o cadastro com sucesso
                print("deu ruim no cadastro")
                
            }
            
        } else {
            
            // colocar alerta sobre NÃO estar conectado à internet
            print("deu ruim na internet")
            
        }
        
    }
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
