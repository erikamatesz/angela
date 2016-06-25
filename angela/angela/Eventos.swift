//
//  Eventos.swift
//  angela
//
//  Created by Maria Carolina Santos on 25/06/16.
//  Copyright © 2016 Maria Carolina Marinho Séves Santos. All rights reserved.
//

import Foundation


class Eventos {
    
    var nome: String
    var lugar: String
    var tInicial: String
    var tFinal: String
    var frequencia: Int
    var contatos: [Pessoa]
    var amigos: [Pessoa]
    
    init(pNome:String, pLugar:String, pTInicial:String, pTFinal:String, pFrequencia:Int, pContatos:[Pessoa], pAmigos:[Pessoa]){
        self.nome = pNome
        self.lugar = pLugar
        self.tInicial = pTInicial
        self.tFinal = pTFinal
        self.frequencia = pFrequencia
        self.contatos = pContatos
        self.amigos = pAmigos
    }

}