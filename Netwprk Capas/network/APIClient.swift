//
//  APIClient.swift
//  NetworkCapas
//
//  Created by Riccardo Mija Padilla on 28/04/21.
//

import Alamofire

class APIClient {
    
    
    
    /*private static let session: Session = {
        
        
        //let manager = ServerTrustManager(allHostsMustBeEvaluated: false,
        //evaluators: ["https://aks-qallarix-ingress-dev.eastus2.cloudapp.azure.com/sami/conversation": DisabledEvaluator()])
        
        let manager = ServerTrustManager(allHostsMustBeEvaluated: true, evaluators:
                                            ["181.176.222.215": DisabledTrustEvaluator()])
        
        var configuration = URLSessionConfiguration.af.default
        
        return Session(startRequestsImmediately: true,
                       serverTrustManager: manager,
                       eventMonitors: [ AlamofireLogger() ])
        
    }()*/
    
    
    
    
    
    @discardableResult
    private static func performRequest<T:Decodable>(route:APIRouter, decoder: JSONDecoder = JSONDecoder(), completion:@escaping (Result<T,NetworkMessage>)->Void) -> DataRequest {
        
        //return session.request(route)
        
        return AF.request(route)
            .validate(statusCode: 200..<300)
            .responseJSON { (response) in
                
                do {
                    
                    guard let jsonData = response.data else {
                        throw NetworkMessage(httpCode:0)
                    }
                    
                    let result = try JSONDecoder().decode(T.self, from: jsonData)
                    completion(.success(result))
                    
                    
                    //print(String(data: response.data!, encoding: String.Encoding.utf8)!)
                    print(response.result)
                    
                } catch {
                    print("ERROR-DECODER: \(error)")
                    
                    if let error = error as? NetworkMessage {
                        return completion(.failure(error))
                    }
                    //completion(.failure(self.parseApiError(data: response.data, httpCode: response.response!.statusCode)))
                    
                }
            }
        
        
    }
    
    
    
    // MARK: - Filter
    static func getCharacter( id : String,  completion:@escaping (Result<RMCharacter, NetworkMessage>)->Void) {
        
        
        performRequest(route: APIRouter.getCharacter(id: id), completion: completion)
        
        
    }
    
    
    
    /*static func listCharacter( id : String,  completion:@escaping (Result<[RMCharacter], NetworkMessage>)->Void) {
     
     performRequest(route: APIRouter.getCharacter(id: id), completion: completion)
     
     }*/
    
    
    
}


