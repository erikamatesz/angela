//
//  DAO.swift
//  AngelaDAO
//
//  Created by Erika Bueno on 25/06/16.
//  Copyright :copyright: 2016 Erika Bueno. All rights reserved.
//

import Foundation
import UIKit

class DAO: NSObject {
    
    /* Verifica se está conectado à internet. */
    
    class func isConnected() -> Bool {
        
        print("DAO.isConnected checking internet...")
        
        var status:Bool = false
        
        let url = NSURL(string: "http://www.google.com")
        
        let request = NSMutableURLRequest(URL: url!)
        
        request.HTTPMethod = "HEAD"
        
        request.cachePolicy = NSURLRequestCachePolicy.ReloadIgnoringLocalAndRemoteCacheData
        
        request.timeoutInterval = 10.0
        
        var response:NSURLResponse?
        
        do {
            
            let _ = try NSURLConnection.sendSynchronousRequest(request, returningResponse: &response) as NSData?
            
        }
            
        catch let error as NSError {
            
            print("Ops! We got the following error: \(error.localizedDescription)")
            
        }
        
        if let httpResponse = response as? NSHTTPURLResponse {
            
            if httpResponse.statusCode == 200 {
                
                status = true
            }
        }
        
        return status
    }
    
    
    
    /*
     
     Cria o usuário no banco com os seguintes dados (estou usando a nomenclatura igual à que eu usei no banco):
     
     - Nome --> name
     - Email --> email
     - Senha --> password
     - Senha de emergência --> emergpass
     - Celular --> mobile
     
     */
    
    
    class func createUser (name: String, email: String, password: String, emergpass: String, mobile: String) -> Bool {
        
        print("DAO.createUser is trying to register you!")
        
        let urlString = "http://www.projetotutoras.com/angelapp/register.php"
        
        let parameters = NSString(format: "name=\(name)&email=\(email)&password=\(password)&emergpass=\(emergpass)&mobile=\(mobile)", name, email, password, emergpass, mobile)
        
        let paramData: NSData = parameters.dataUsingEncoding(NSUTF8StringEncoding)!
        
        let url = NSURL(string:urlString)
        
        let request = NSMutableURLRequest(URL: url!)
        
        request.setValue("application/x-www-form-urlencoded; charset=utf-8", forHTTPHeaderField: "Content-Type")
        
        request.HTTPMethod = "POST"
        
        request.HTTPBody = paramData
        
        let response: AutoreleasingUnsafeMutablePointer<NSURLResponse?>=nil
        
        let result: NSData = try! NSURLConnection.sendSynchronousRequest(request, returningResponse: response)
        
        let returnString = String(data: result, encoding: NSUTF8StringEncoding)
        
        let finalResponse = String(returnString!.characters.suffix(7)) // created
        
        print(finalResponse)
        
        if finalResponse == "created" {
            print("Criou o usuário")
            return true
        } else {
            print("Não criou o usuário")
            return false
        }
        
    }
    
    
    /*
     
     Loga o usuário.
     
     */
    
    class func userLogin (email: String, password: String) -> Bool  {
        
        print("DAO.userLogin will try to log you in...")
        
        let urlString = "http://www.projetotutoras.com/angelapp/login.php"
        
        let parameters = NSString(format: "email=\(email)&password=\(password)", email, password)
        
        let paramData: NSData = parameters.dataUsingEncoding(NSUTF8StringEncoding)!
        
        let url = NSURL(string:urlString)
        
        let request = NSMutableURLRequest(URL: url!)
        
        request.setValue("application/x-www-form-urlencoded; charset=utf-8", forHTTPHeaderField: "Content-Type")
        
        request.HTTPMethod = "POST"
        
        request.HTTPBody = paramData
        
        let response: AutoreleasingUnsafeMutablePointer<NSURLResponse?>=nil
        
        let result: NSData = try! NSURLConnection.sendSynchronousRequest(request, returningResponse: response)
        
        let returnString = String(data: result, encoding: NSUTF8StringEncoding)
        
        let finalResponse = String(returnString!.characters.suffix(6)) // created
        
        print(finalResponse)
        
        if finalResponse == "logged" {
            print("Logou")
            return true
        } else {
            print("Não logou")
            return false
        }
        
    }
    
    
    
    /*
     
     Cria o evento com os seguintes dados:
     
     - Nome do evento --> eventName
     - Endereço do evento --> eventAddress
     - Tempo inicial --> startTime
     - Tempo final --> endTime
     - Frequência --> frequency
     - Contatos --> contacts
     - Amigos --> friends
     - E-mail --> userEmail
     
     */
    
    
    class func createEvent (eventName: String, eventAddress: String, startTime: Int, endTime: Int, frequency: Int, contacts: String, friends: String, userEmail: String) -> Bool {
        
        print("DAO.createUser is trying to create this event...")
        
        let urlString = "http://www.projetotutoras.com/angelapp/createevent.php"
        
        let parameters = NSString(format: "eventName=\(eventName)&eventAddress=\(eventAddress)&startTime=\(startTime)&endTime=\(endTime)&frequency=\(frequency)&contacts=\(contacts)&friends=\(friends)&userEmail=\(userEmail)", eventName, eventAddress, startTime, endTime, frequency, contacts, friends, userEmail)
        
        let paramData: NSData = parameters.dataUsingEncoding(NSUTF8StringEncoding)!
        
        let url = NSURL(string:urlString)
        
        let request = NSMutableURLRequest(URL: url!)
        
        request.setValue("application/x-www-form-urlencoded; charset=utf-8", forHTTPHeaderField: "Content-Type")
        
        request.HTTPMethod = "POST"
        
        request.HTTPBody = paramData
        
        let response: AutoreleasingUnsafeMutablePointer<NSURLResponse?>=nil
        
        let result: NSData = try! NSURLConnection.sendSynchronousRequest(request, returningResponse: response)
        
        let returnString = String(data: result, encoding: NSUTF8StringEncoding)
        
        let finalResponse = String(returnString!.characters.suffix(12)) // created
        
        print(finalResponse)
        
        if finalResponse == "eventcreated" {
            print("Criou evento")
            return true
        } else {
            print("Não criou")
            return false
        }
        
    }
    
    
    /*
     
     Envia alerta
     
     Caso o usuário (identificado por userEmail) não digite a senha, envia um email de alerta para o contato de emergência.
     
     */
    
    class func sendAlert (userEmail: String) -> Bool {
        
        print("DAO.sendAlert is sending alerts...")
        
        let urlString = "http://www.projetotutoras.com/angelapp/emailalert.php"
        
        let parameters = NSString(format: "userEmail=\(userEmail)", userEmail)
        let paramData: NSData = parameters.dataUsingEncoding(NSUTF8StringEncoding)!
        
        let url = NSURL(string:urlString)
        
        let request = NSMutableURLRequest(URL: url!)
        
        request.setValue("application/x-www-form-urlencoded; charset=utf-8", forHTTPHeaderField: "Content-Type")
        
        request.HTTPMethod = "POST"
        
        request.HTTPBody = paramData
        
        let response: AutoreleasingUnsafeMutablePointer<NSURLResponse?>=nil
        
        let result: NSData = try! NSURLConnection.sendSynchronousRequest(request, returningResponse: response)
        
        let returnString = String(data: result, encoding: NSUTF8StringEncoding)
        
        let finalResponse = String(returnString!.characters.suffix(4)) // created
        
        print(finalResponse)
        
        if finalResponse == "sent" {
            print("Mandou")
            return true
        } else {
            print("Não mandou")
            return false
        }
    }
    
}