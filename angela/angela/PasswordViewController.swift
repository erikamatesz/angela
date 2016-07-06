//
//  PasswordViewController.swift
//  angela
//
//  Created by Maria Carolina Santos on 05/07/16.
//  Copyright © 2016 Maria Carolina Marinho Séves Santos. All rights reserved.
//

import UIKit

class PasswordViewController: UIViewController {
    @IBOutlet weak var numberOne: UIButton!
    @IBOutlet weak var numberTwo: UIButton!
    @IBOutlet weak var numberThree: UIButton!
    @IBOutlet weak var numberFour: UIButton!
    @IBOutlet weak var numberFive: UIButton!
    @IBOutlet weak var numberSix: UIButton!
    @IBOutlet weak var numberSeven: UIButton!
    @IBOutlet weak var numberEight: UIButton!
    @IBOutlet weak var numberNine: UIButton!
    @IBOutlet weak var numberZero: UIButton!
    
    var passwordTyped: String = ""
    let defaults = NSUserDefaults.standardUserDefaults()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func numberOneAction(sender: AnyObject) {
        checkPassword("1")
    }
    @IBAction func numberTwoAction(sender: AnyObject) {
        checkPassword("2")
    }
    @IBAction func numberThreeAction(sender: AnyObject) {
        checkPassword("3")
    }
    @IBAction func numberFourAction(sender: AnyObject) {
        checkPassword("4")
    }
    @IBAction func numberFiveAction(sender: AnyObject) {
        checkPassword("5")
    }
    @IBAction func numberSixAction(sender: AnyObject) {
        checkPassword("6")
    }
    @IBAction func numberSevenAction(sender: AnyObject) {
        checkPassword("7")
    }
    @IBAction func numberEightAction(sender: AnyObject) {
        checkPassword("8")
    }
    @IBAction func numberNineAction(sender: AnyObject) {
        checkPassword("9")
    }
    @IBAction func numberZeroAction(sender: AnyObject) {
        checkPassword("0")
    }
    
    func checkPassword(valueNum: String){
        if (passwordTyped.characters.count < 4){
            passwordTyped += valueNum
            if(passwordTyped.characters.count == 4){
                let password = defaults.stringForKey("password")
                if(password == passwordTyped)
                {
                    // Mudança de View
                    let vc = EventoViewController(nibName:"EventoViewController", bundle: nil)
                    presentViewController(vc, animated: true, completion: nil)
                }
                else{
                    let wrongPasswordAlert = UIAlertController(title: "OPS", message: "Senha Errada", preferredStyle: UIAlertControllerStyle.Alert)
                    wrongPasswordAlert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Destructive, handler: nil))
                    self.presentViewController(wrongPasswordAlert, animated: true, completion: nil)
                    passwordTyped = ""
                    print("ERREI A SENHA")
                }
            }
        }
        
    }
   
}