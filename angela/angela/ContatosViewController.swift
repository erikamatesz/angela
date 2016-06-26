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
    
    var timer:NSTimer!
    var timerNotAnswered:NSTimer!
    
    var statePick = 0
    var numPickAcomp = 0
    var numPickContato = 0
    
    let defaults = NSUserDefaults.standardUserDefaults()

    
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
//        let contato = Pessoa(pNome: completeName, pEmail: email as! String, pTelefone: number)
        
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
    
    func scheduleNotification(tinicial: Int, tfinal: Int, intervalo: Int) {
        let now: NSDateComponents = NSCalendar.currentCalendar().components([.Hour, .Minute], fromDate: NSDate())
        var hourInicial = tinicial / 100
        var minuteInicial = tinicial % 100
        var hourFinal = tfinal / 100
        var minuteFinal = tfinal % 100
        
        hourInicial = hourInicial - now.hour
        while(hourFinal >= hourInicial || minuteFinal >= minuteInicial)
        {
            minuteInicial = minuteInicial + intervalo
            if(minuteInicial >= 60)
            {
                hourInicial += 1
                minuteInicial = minuteInicial - 60
            }
            
            let cal = NSCalendar(calendarIdentifier: NSCalendarIdentifierGregorian)!
            let date = cal.dateBySettingHour(hourInicial, minute: minuteInicial, second: 0, ofDate: NSDate(), options: NSCalendarOptions())

            let reminder = UILocalNotification()
            reminder.fireDate = date
            reminder.alertBody = "You can now reply with text"
            reminder.alertAction = "Cool"
            reminder.soundName = "sound.aif"
            reminder.category = "CATEGORY_ID"
            
            UIApplication.sharedApplication().scheduleLocalNotification(reminder)
        }
        
    }
    func scheduleNotificationMVP(intervalo : Int)
    {
//        var i = 1
//        let now: NSDateComponents = NSCalendar.currentCalendar().components([.Hour, .Minute], fromDate: NSDate())
//        
//        for(i = 1; i < 10; i += 1)
//        {
//            let cal = NSCalendar(calendarIdentifier: NSCalendarIdentifierGregorian)!
//            let date = cal.dateBySettingHour(now.hour, minute: now.minute + intervalo * i, second: 0, ofDate: NSDate(), options: NSCalendarOptions())
//            
//            print(date)
//            let reminder = UILocalNotification()
//            reminder.fireDate = date
//            reminder.alertBody = "Angela says Hi!"
//            reminder.alertAction = "Angela"
//            reminder.soundName = "sound.aif"
//            reminder.category = "CATEGORY_ID"
//            
//            UIApplication.sharedApplication().scheduleLocalNotification(reminder)
//        }
        timer = NSTimer.scheduledTimerWithTimeInterval(15, target: self, selector: #selector(timerAction), userInfo: nil, repeats: true)
        
        timerNotAnswered = NSTimer.scheduledTimerWithTimeInterval(40, target: self, selector: #selector(timerDeuRuim), userInfo: nil, repeats: true)
    
    }
    
    func timerAction(){
        
        var frases = ["Miga sua loooca, cade você?",
                      "Migaaa sua looca, ta de zoa né?",
                      "Oi amiga! Me responde?",
                      "Oiii",
                      "Pode falar?",
                      "UP UP UP",
                      "Saudades :)",
                      "Migaa responde plzz",
                      "Fala comigo!",
                      "HORA DA FOFOCAAA",
                      "Você não sabe da maior",
                      "Preciso de ajuda!!!"]
        var numRand = Int(arc4random_uniform(12))
        
        let reminder = UILocalNotification()
        reminder.alertBody = "Angela disse: " + frases[numRand]
        reminder.alertAction = "Angela"
        reminder.soundName = "sound.aif"
        reminder.category = "CATEGORY_ID"

        UIApplication.sharedApplication().scheduleLocalNotification(reminder)
        
    }
    
    func timerDeuRuim(){
        
        if(defaults.integerForKey("deuRuim") == 2)
        {
            defaults.setInteger(0, forKey: "deuRuim")
        }
        else{
            print("deu ruim")
            timer.invalidate()
            let userEmail = defaults.stringForKey("loginEmail")
            
            if DAO.sendAlert(userEmail!) {
                print("mandou email")
                timerNotAnswered.invalidate()
            }
            
            defaults.setInteger(0, forKey: "deuRuim")
        }
        
    }
////   viagem da maria 
//    func checkSenha(){
//        if defaults.integerForKey("deuRuim") == 0 {
//            timer = NSTimer.scheduledTimerWithTimeInterval(10, target: self, selector: #selector(timerAction), userInfo: nil, repeats: false)
//        }
//        else {
//            timerNotAnswered = NSTimer.scheduledTimerWithTimeInterval(21, target: self, selector: #selector(timerDeuRuim), userInfo: nil, repeats: true)
//        }
//    }
    
    @IBAction func criarEvento(sender: AnyObject) {
        
        let tinicial = defaults.integerForKey("inicio")
        let tfinal = defaults.integerForKey("fim")
        let intervalo = defaults.integerForKey("intervalo")

        scheduleNotificationMVP(intervalo)
        
        let eventName = defaults.stringForKey("nome")
        let eventAddress = defaults.stringForKey("lugar")
        let userEmail = defaults.stringForKey("loginEmail")
        
        if DAO.createEvent(eventName!, eventAddress: eventAddress!, startTime: 10, endTime: 12, frequency: 15, contacts: "teste@projetotutoras.com", friends: "teste@projetotutoras.com", userEmail: userEmail!) {
        
            let vc = EventoViewController(nibName:"EventoViewController", bundle: nil)
            presentViewController(vc, animated: true, completion: nil)
            
        }
            
         
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
