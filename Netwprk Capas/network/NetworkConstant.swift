//
//  NetworkConstant.swift
//  NetworkCapas
//
//  Created by Riccardo Mija Padilla on 28/04/21.
//

import Foundation

struct SP {
    struct ProductionServer {
       
        static let baseURL = ""

    }
    
    struct HTTP_CODE {
        static var BAD_REQUEST = 400
        static var NOT_FOUND = 404
        static var INT_SRV_ERROR = 500
        static var UNAUTHORIZED = 401
        static var NOT_INTERNET = 1024
    }
    

    
  


}

enum HTTPHeaderField: String {
    case authentication = "Authorization"
    case contentType = "Content-Type"
    case acceptType = "Accept"
    case acceptEncoding = "Accept-Encoding"
    case documentNumber = "documentNumber"
    
    
    
    
}

enum ContentType: String {
    case json = "application/json"
}

