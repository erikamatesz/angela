//
//  NovoEventoViewController.swift
//  angela
//
//  Created by Maria Carolina Santos on 25/06/16.
//  Copyright © 2016 Maria Carolina Marinho Séves Santos. All rights reserved.
//

import UIKit

class NovoEventoViewController: UIViewController, UITextFieldDelegate, UICollectionViewDelegate, UIPickerViewDataSource, UIPickerViewDelegate {
    
    
    @IBOutlet weak var inicialLabel: UILabel!
    @IBOutlet weak var finalLabel: UILabel!
    //textfield
    @IBOutlet weak var nomeTextfield: UITextField!
    @IBOutlet weak var lugarTextfield: UITextField!
    
    //datepicker
    @IBOutlet weak var horaInicial: UIDatePicker!
    @IBOutlet weak var horaFinal: UIDatePicker!
    
    @IBOutlet weak var notificacaoPicker: UIPickerView!
  
    @IBOutlet weak var proximoButton: UIButton!
    
    var notificacao = ["15m", "30m ", "1h", "2h", "3h"];
    
    var contacts = ["joao", "maria"];
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nomeTextfield.delegate = self
        lugarTextfield.delegate = self
        self.notificacaoPicker.dataSource = self;
        self.notificacaoPicker.delegate = self;
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func InicialClicked(sender: AnyObject) {
        
        
        let dateFormatter = NSDateFormatter()
        
        dateFormatter.dateStyle = NSDateFormatterStyle.ShortStyle
        dateFormatter.timeStyle = NSDateFormatterStyle.ShortStyle
        
        let textLabel = dateFormatter.stringFromDate(horaInicial.date)
        inicialLabel.text = textLabel
        
        
    }
    
    @IBAction func finalClicked(sender: AnyObject) {
        
        let dateFormatter = NSDateFormatter()
        
        dateFormatter.dateStyle = NSDateFormatterStyle.ShortStyle
        dateFormatter.timeStyle = NSDateFormatterStyle.ShortStyle
        
        let textLabel = dateFormatter.stringFromDate(horaInicial.date)
        finalLabel.text = textLabel
        
    }
    
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return notificacao.count;
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return notificacao[row]
        
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        if(row == 0)
        {
            
        }
        else if(row == 1)
        {
            
        }
        else if(row == 2)
        {
            
        }
        else if(row == 3)
        {
            
        }
        else
        {
            
        }
        
    }
    @IBAction func proximoClicked(sender: AnyObject) {
        let vc = ContatosViewController(nibName:"ContatosViewController", bundle: nil)
        presentViewController(vc, animated: true, completion: nil)
        
        
    }
}