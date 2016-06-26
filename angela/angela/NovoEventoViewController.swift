//
//  NovoEventoViewController.swift
//  angela
//
//  Created by Maria Carolina Santos on 25/06/16.
//  Copyright © 2016 Maria Carolina Marinho Séves Santos. All rights reserved.
//

import UIKit
import Contacts
import ContactsUI

class NovoEventoViewController: UIViewController, UITextFieldDelegate, CNContactPickerDelegate {
    
    var InicialSalva: String!
    
    //textfield
    @IBOutlet weak var nomeTextfield: UITextField!
    @IBOutlet weak var lugarTextfield: UITextField!
    
    @IBOutlet weak var inicioTextfield: UITextField!
    @IBOutlet weak var fimTextfield: UITextField!
    @IBOutlet weak var notificacoesTextfield: UITextField!
    //datepicker
   
  
    @IBOutlet weak var proximoButton: UIButton!
    
    
    let defaults = NSUserDefaults.standardUserDefaults()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nomeTextfield.delegate = self
        lugarTextfield.delegate = self
        inicioTextfield.delegate = self
        fimTextfield.delegate = self
        notificacoesTextfield.delegate = self
    
        
        
        let nomePaddingView = UIView(frame: CGRectMake(0, 0, 15, self.nomeTextfield.frame.height))
        nomeTextfield.leftView = nomePaddingView
        nomeTextfield.leftViewMode = UITextFieldViewMode.Always
        
        let lugarPaddingView = UIView(frame: CGRectMake(0, 0, 15, self.lugarTextfield.frame.height))
        lugarTextfield.leftView = lugarPaddingView
        lugarTextfield.leftViewMode = UITextFieldViewMode.Always
        
        let inicioPaddingView = UIView(frame: CGRectMake(0, 0, 15, self.inicioTextfield.frame.height))
        inicioTextfield.leftView = inicioPaddingView
        inicioTextfield.leftViewMode = UITextFieldViewMode.Always
        let fimPaddingView = UIView(frame: CGRectMake(0, 0, 15, self.fimTextfield.frame.height))
        fimTextfield.leftView = fimPaddingView
        fimTextfield.leftViewMode = UITextFieldViewMode.Always
        
        let notificacoesPaddingView = UIView(frame: CGRectMake(0, 0, 15, self.fimTextfield.frame.height))
        notificacoesTextfield.leftView = notificacoesPaddingView
        notificacoesTextfield.leftViewMode = UITextFieldViewMode.Always

        
        
        
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

    
    @IBAction func InicialClicked(sender: AnyObject) {
        
        
    
    }
    
    @IBAction func finalClicked(sender: AnyObject) {
        
        

        
    }
    
    
       
    
    @IBAction func proximoClicked(sender: AnyObject) {
        
        defaults.setObject(nomeTextfield.text, forKey: "nome")
        defaults.setObject(lugarTextfield.text, forKey: "lugar")
        defaults.setObject(inicioTextfield.text, forKey: "inicio")
        defaults.setObject(fimTextfield.text, forKey: "fim")
        defaults.setObject(notificacoesTextfield.text, forKey: "intervalo")

        let email = defaults.stringForKey("loginEmail")
        print(email)
        
        let vc = ContatosViewController(nibName:"ContatosViewController", bundle: nil)
        presentViewController(vc, animated: true, completion: nil)
        
        let nameSaved = defaults.stringForKey("nome")
        let lugarSaved = defaults.stringForKey("lugar")
        
        print(nameSaved)
        print(lugarSaved)
        
    }
    
    
}