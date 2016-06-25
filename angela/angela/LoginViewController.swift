//
//  LoginViewController.swift
//  angela
//
//  Created by Maria Carolina Santos on 25/06/16.
//  Copyright © 2016 Maria Carolina Marinho Séves Santos. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {
    
    //textfields
    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var senhaTextfield: UITextField!
    
    //buttons
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var criarButton: UIButton!
    
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
    
    }
    
    @IBAction func criarClicked(sender: AnyObject) {
    
    }
    
    override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
}

}