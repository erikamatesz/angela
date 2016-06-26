//
//  EventoViewController.swift
//  angela
//
//  Created by Maria Carolina Santos on 25/06/16.
//  Copyright © 2016 Maria Carolina Marinho Séves Santos. All rights reserved.
//

import UIKit

class EventoViewController: UIViewController{
    
    @IBOutlet weak var criarButton: UIButton!
    @IBOutlet weak var nome: UILabel!
    @IBOutlet weak var lugar: UILabel!
    
    @IBOutlet weak var iconeImage: UIImageView!
    @IBOutlet weak var fraseLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let defaults = NSUserDefaults.standardUserDefaults()
        let nameSaved = defaults.stringForKey("nome")
        let lugarSaved = defaults.stringForKey("lugar")
        
        if nameSaved == nil || lugarSaved == nil{
            nome.hidden = true
            lugar.hidden = true
        }
            
        else {
            nome.text = nameSaved
            lugar.text = lugarSaved
            iconeImage.hidden = true
            fraseLabel.hidden = true
        }
    }
    
    // Clicar para criar novo evento e mudar de tela
    @IBAction func criarClicked(sender: AnyObject) {
        let vc = NovoEventoViewController(nibName:"NovoEventoViewController", bundle: nil)
        presentViewController(vc, animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}