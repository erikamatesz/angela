//
//  Acompanhantes.swift
//  angela
//
//  Created by Maria Carolina Santos on 25/06/16.
//  Copyright © 2016 Maria Carolina Marinho Séves Santos. All rights reserved.
//

import Foundation

class Pessoa{
    
    var nome: String
    var email: String
    var telefone: String    //so numeros dd + num
    
    init (pNome:String, pEmail:String, pTelefone:String){
        self.nome = pNome
        self.email = pEmail
        self.telefone = pTelefone
    }
    
}