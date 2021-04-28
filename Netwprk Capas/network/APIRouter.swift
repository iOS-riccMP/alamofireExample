//
//  APIRouter.swift
//  NetworkCapas
//
//  Created by Riccardo Mija Padilla on 28/04/21.
//

import Alamofire


enum APIRouter: URLRequestConvertible {
    
    
    //Filter
    case getCharacter (id : String)
    case listCharacter
    
    
    
    // MARK: - HTTPMethod
    private var method: HTTPMethod {
        switch self {
        
        //Filter
        case .getCharacter:
            return .get
            
        case .listCharacter:
            return .post
            
            
        }
        
    }
    
    // MARK: - Path
    
    
    private var path: URL {
        
        
        switch self {
        
        
        case .getCharacter(let id) :
            
            let path = "https://rickandmortyapi.com/api/character/\(id)"
            let urlComponents = URLComponents(string: path)!
            
            print(urlComponents.url!)
            return urlComponents.url!
            
            
        case .listCharacter :
            
            let path = "https://rickandmortyapi.com/api/character/"
            var urlComponents = URLComponents(string: path)!
            
            urlComponents.queryItems = [
                URLQueryItem(name: "name", value: "rick"),
                URLQueryItem(name: "status", value: "alive")
            ]
            
            print(urlComponents.url!)
            return urlComponents.url!
            
            
        }
    }
    
    // MARK: - Parameters
    private var parameters: Parameters? {
        
        switch self {
        
        
        case .getCharacter:
            return nil
            
        case .listCharacter:
            return [
                "token": "token",
                "password": "password",
                "id": "id"
            ]
            
            
            
            
        }
        
    }
    
    // MARK: - URLRequestConvertible
    func asURLRequest() throws -> URLRequest {
        
        var urlRequest = URLRequest(url: path)
        
        // HTTP Method
        urlRequest.httpMethod = method.rawValue
        
        
        // Common Headers
        urlRequest.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.acceptType.rawValue)
        urlRequest.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.contentType.rawValue)
        
        
        // Parameters
        if let parameters = parameters {
            do {
                
                let data = try JSONSerialization.data(withJSONObject: parameters, options: [])
                let dataString = NSString(data: data, encoding: String.Encoding.utf8.rawValue)!
                print(dataString)
                
                urlRequest.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: [])
                
                
            } catch {
                
                throw AFError.parameterEncodingFailed(reason: .jsonEncodingFailed(error: error))
            }
        }
        
        
        print(urlRequest.description)
        
        
        return urlRequest
    }
}


