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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
  
     
   
    @IBAction func criarClicked(sender: AnyObject) {
        
        let vc = NovoEventoViewController(nibName:"NovoEventoViewController", bundle: nil)
        presentViewController(vc, animated: true, completion: nil)

    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
}