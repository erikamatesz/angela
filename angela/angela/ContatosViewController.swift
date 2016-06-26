//
//  ContatosViewController.swift
//  angela
//
//  Created by Tamyres Freitas on 6/25/16.
//  Copyright © 2016 Maria Carolina Marinho Séves Santos. All rights reserved.
//

import UIKit
import Contacts
import ContactsUI

class ContatosViewController: UIViewController, CNContactPickerDelegate {

    @IBOutlet weak var acompLabel1: UILabel!
    @IBOutlet weak var acompLabel2: UILabel!
    @IBOutlet weak var acompLabel3: UILabel!
    @IBOutlet weak var addAcompButton: UIButton!
    
    @IBOutlet weak var contatoLabel1: UILabel!
    @IBOutlet weak var contatoLabel2: UILabel!
    @IBOutlet weak var contatoLabel3: UILabel!
    @IBOutlet weak var addContatoButton: UIButton!
    
    @IBOutlet weak var criarEventoButton: UIButton!
    
    
    var statePick = 0
    var numPickAcomp = 0
    var numPickContato = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func contactPicker(picker: CNContactPickerViewController, didSelectContact contact: CNContact) {
        
        let phoneNumber = contact.phoneNumbers.first
        let phoneNumberValue = phoneNumber!.value as! CNPhoneNumber
        let number = phoneNumberValue.stringValue
        
        let email = contact.emailAddresses.first!.value
        let name = contact.givenName;
        let surname = contact.familyName;
        let completeName = name + " " + surname
        let contato = Pessoa(pNome: completeName, pEmail: email as! String, pTelefone: number)
        
        if(statePick == 1)
        {
            numPickAcomp += 1
            if(numPickAcomp == 1){
                acompLabel1.text = completeName
            }
            else if(numPickAcomp == 2){
                acompLabel2.text = completeName
            }
            else{
                acompLabel3.text = completeName
                addAcompButton.removeFromSuperview()
            }
        }
        else if(statePick == 2)
        {
            numPickContato += 1
            if(numPickContato == 1){
                contatoLabel1.text = completeName
            }
            else if(numPickContato == 2){
                contatoLabel2.text = completeName
            }
            else{
                contatoLabel3.text = completeName
                addContatoButton.removeFromSuperview()
            }
        }
        
        
    }
    
    func displayContacts() {
        let contactPicker = CNContactPickerViewController()
        contactPicker.delegate = self // we want to take a contact after coming back
        contactPicker.displayedPropertyKeys = [CNContactGivenNameKey, CNContactEmailAddressesKey, CNContactPhoneNumbersKey] // We are interested in phone numbers
        presentViewController(contactPicker, animated: true, completion: nil)
    }
    
    @IBAction func addAcomp(sender: AnyObject) {
        statePick = 1
        displayContacts()
    }
    
    @IBAction func addContato(sender: AnyObject) {
        statePick = 2
        displayContacts()
    }
    
    @IBAction func criarEvento(sender: AnyObject) {
        
            
                    let vc = EventoViewController(nibName:"EventoViewController", bundle: nil)
                            presentViewController(vc, animated: true, completion: nil)
            
         
        }


    
    
   //    @IBAction func criarEvento(sender: AnyObject) {
//        let vc = EventoViewController(nibName:"EventoViewController", bundle: nil)
//        presentViewController(vc, animated: true, completion: nil)
//    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
