//
//  NetworkMessage.swift
//  NetworkCapas
//
//  Created by Riccardo Mija Padilla on 28/04/21.
//

import Foundation

class NetworkMessage: Error {
    
    // MARK: - Vars & Lets
    
    var title = ""
    var body = ""
    var httpCode = SP.HTTP_CODE.BAD_REQUEST
    
    // MARK: - Intialization
    
    init(body:String = "", httpCode:Int) {
        self.title = "lbl_error_title"
        self.httpCode = httpCode
        
        switch httpCode {
        case SP.HTTP_CODE.INT_SRV_ERROR:
            self.body = (body.isEmpty) ? "general_error_500" : body
        case SP.HTTP_CODE.NOT_FOUND:
            self.body = "lbl_error_404"
        case 400:
            self.body = (body.isEmpty) ? "general_error_400" : body
        
        case 405..<500:
            self.body = (body.isEmpty) ? "general_error_500" : body
        default:
            self.body = "general_error_500"
        }
    }
    
    init(body:String) {
        self.title = "general_oops"
        self.body = body
        
    }
    
}

