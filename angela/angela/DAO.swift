//
//  DAO.swift
//  AngelaDAO
//
//  Created by Erika Bueno on 25/06/16.
//  Copyright Â© 2016 Erika Bueno. All rights reserved.
//

import Foundation
import UIKit

class DAO: NSObject {
    
    /* Verifica se estÃ¡ conectado Ã  internet. */
    
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
    
    Cria o usuÃ¡rio no banco com os seguintes dados (estou usando a nomenclatura igual Ã  que eu usei no banco):
    
    - Nome --> name
    - Email --> email
    - Senha --> password
    - Senha de emergÃªncia --> emergpass
    - Celular --> mobile
    
    */
    
    class func createUser (name: String, email: String, password: String, emergpass: String, mobile: String) -> Bool {
        
        print("DAO.createUser is trying to register you!")
        
        var created = false
        
        let myUrl = NSURL(string: "http://www.projetotutoras.com/angelapp/register.php")
        
        let request = NSMutableURLRequest(URL:myUrl!)
        
        request.HTTPMethod = "POST"
        
        let myData:NSString = "name=\(name)&email=\(email)&password=\(password)&emergpass=\(emergpass)&mobile=\(mobile)"
        
        request.HTTPBody = myData.dataUsingEncoding(NSUTF8StringEncoding);
        
        let dataTask = NSURLSession.sharedSession().dataTaskWithRequest(request) {
            
            myData, response, error in
            
            if error != nil { return; }
            
            let responseString = NSString(data: myData!, encoding: NSUTF8StringEncoding)
            
            print(responseString)
            
            if responseString == "created" {
                
                created = true
                
            } else {
                
                created = false
            }
            
        }
        
        dataTask.resume()
        
        if created == true {
            
            return true
            
        } else {
            
            return false
            
        }
    }
    
    
    /*
    
    Loga o usuÃ¡rio.
    
    */
    
    class func userLogin (email: String, password: String) -> Bool  {
        
        print("DAO.userLogin will try to log you in...")
        
        var created = false
        
        let urlString = "http://www.projetotutoras.com/angelapp/login.php"
        
        let parameters = NSString(format: "email=\(email)&password=\(password)", email, password)
        
        let paramData: NSData = parameters.dataUsingEncoding(NSUTF8StringEncoding)!
        
        let url = NSURL(string:urlString)
        
        let request = NSMutableURLRequest(URL: url!)
        
        request.setValue("application/x-www-form-urlencoded; charset=utf-8", forHTTPHeaderField: "Content-Type")
        
        request.HTTPMethod = "POST"
        
        request.HTTPBody = paramData
        
        let dataTask = NSURLSession.sharedSession().dataTaskWithRequest(request) {
            
            myData, response, error in
            
            if error != nil { return; }
            
            let responseString = NSString(data: myData!, encoding: NSUTF8StringEncoding)
            
            print(responseString)
            
            if responseString == "logged" {
                
                created = true
                
            } else {
                
                created = false
            }
            
        }
        
        dataTask.resume()
        
        if created == true {
            
            return true
            
        } else {
            
            return false
            
        }
        
    }
    
    
    
    /*
    
    Cria o evento com os seguintes dados:
    
    - Nome do evento --> eventName
    - EndereÃ§o do evento --> eventAddress
    - Tempo inicial --> startTime
    - Tempo final --> endTime
    - FrequÃªncia --> frequency
    - Contatos --> contacts
    - Amigos --> friends
    - E-mail --> userEmail
    
    */
    
    
    class func createEvent (eventName: String, eventAddress: String, startTime: Int, endTime: Int, frequency: Int, contacts: String, friends: String, userEmail: String) -> Bool {
        
        print("DAO.createUser is trying to create this event...")
        
        var created = false
        
        let myUrl = NSURL(string: "http://www.projetotutoras.com/angelapp/createevent.php")
        
        let request = NSMutableURLRequest(URL:myUrl!)
        
        request.HTTPMethod = "POST"
        
        let myData:NSString = "eventName=\(eventName)&eventAddress=\(eventAddress)&startTime=\(startTime)&endTime=\(endTime)&frequency=\(frequency)&contacts=\(contacts)&friends=\(friends)&userEmail\(userEmail)"
        
        request.HTTPBody = myData.dataUsingEncoding(NSUTF8StringEncoding);
        
        let dataTask = NSURLSession.sharedSession().dataTaskWithRequest(request) {
            
            myData, response, error in
            
            if error != nil { return; }
            
            let responseString = NSString(data: myData!, encoding: NSUTF8StringEncoding)
            
            print(responseString)
            
            if responseString == "eventcreated" {
                
                created = true
                
            } else {
                
                created = false
            }
            
        }
        
        dataTask.resume()
        
        if created == true {
            
            return true
            
        } else {
            
            return false
            
        }
    }
    
    
    
}