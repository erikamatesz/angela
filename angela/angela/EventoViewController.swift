//
//  EventoViewController.swift
//  angela
//
//  Created by Maria Carolina Santos on 25/06/16.
//  Copyright © 2016 Maria Carolina Marinho Séves Santos. All rights reserved.
//

import UIKit

class EventoViewController: UITableViewController {
    
    var items: [String] = ["Eventos", "Criar Eventos"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 1
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return (self.view.frame.height)
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell:UITableViewCell = self.tableView.dequeueReusableCellWithIdentifier("cell")! as UITableViewCell
        
        if indexPath.row == 0 {
            
            cell.textLabel?.text = "Voce nao criou um evento ainda. Crie um agora!"
            cell.textLabel?.textAlignment = .Center
            
            let button = UIButton(frame: CGRect(x: 100, y: 50, width: 100, height: 50))
            button.backgroundColor = .grayColor()
            button.setTitle("Criar", forState: .Normal)
            button.addTarget(self, action: #selector(EventoViewController.buttonAction(_:)), forControlEvents: UIControlEvents.TouchUpInside)
            
            self.view.addSubview(button)
            
            
            
            
        }
        
        
        return cell
    }
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        
        
        if indexPath.row == 0 {
            
            
            
            
            
            
        }
        
    }
    
    func buttonAction(sender: UIButton!) {
        print("Button tapped")
        
        let vc = self.storyboard!.instantiateViewControllerWithIdentifier("EventoVC")
        self.showViewController(vc as UIViewController, sender: vc)
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
}