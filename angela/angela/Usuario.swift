//
//  Mulheres.swift
//  angela
//
//  Created by Maria Carolina Santos on 25/06/16.
//  Copyright © 2016 Maria Carolina Marinho Séves Santos. All rights reserved.
//

import Foundation

class Usuario: Pessoa {
    
    var senha: String       //4
    var pedidoAjuda: String
    
    init(pNome:String, pEmail:String, pTelefone:String, pSenha:String, pPedidoAjuda:String)
        {
        senha = pSenha
        pedidoAjuda = pPedidoAjuda
        super.init(pNome: pNome, pEmail: pEmail, pTelefone: pTelefone)
    }
    
    
}
