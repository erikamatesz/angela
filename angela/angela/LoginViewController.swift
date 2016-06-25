//
//  LoginViewController.swift
//  angela
//
//  Created by Maria Carolina Santos on 25/06/16.
//  Copyright © 2016 Maria Carolina Marinho Séves Santos. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate{
    
    @IBOutlet weak var imagemBackground: UIImageView!
    
    //textfields
    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var senhaTextfield: UITextField!
    
    //buttons
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var criarButton: UIButton!
    @IBOutlet weak var esqueciSenhaButton: UIButton!
    
    override func viewDidLoad() {
    super.viewDidLoad()
    
    emailTextfield.delegate = self
    senhaTextfield.delegate = self
    
    // Do any additional setup after loading the view, typically from a nib.
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
    textField.resignFirstResponder()
    return true
    }
    
    
    @IBAction func loginClicked(sender: AnyObject) {
        
        let vc = EventoViewController(nibName:"EventoViewController", bundle: nil)
           presentViewController(vc, animated: true, completion: nil)
    }
    
    @IBAction func criarClicked(sender: AnyObject) {
    
    }
    
    override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
}

}