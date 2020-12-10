//
//  NetworkManager.swift
//  TMDb Movies
//
//  Created by eyup cimen on 29.11.2020.
//

import Foundation
import Alamofire


class NetworkManager {
    
    static var shared = NetworkManager()
    
    var isLoading : Bool = false {
        didSet {
            if self.isLoading {
                Util.shared.showHud()
            }else {
                Util.shared.removeHud()
            }
        }
    }
    
    func requestForArray<T: Codable>(_ url: String,_ parameters: [String : Any] = [:], _ method: HTTPMethod = .get,_ httpHeaders: HTTPHeaders? = nil, encoding: ParameterEncoding = URLEncoding.default, success: @escaping (BaseResult<T>) -> Void, failure: @escaping (String) -> () ) {
        
        self.isLoading = true
        let newUrl = url.encodeUrl()
        
        AF.request(newUrl, method:method, parameters:parameters, encoding:encoding, headers: httpHeaders)
            .responseString { (response) -> Void in
                print("-------------------------------------------------")
                print("url : \(newUrl) - res:\(response)")
                print("-------------------------------------------------")
            }
            .responseJSON { response in
                
                self.isLoading = false
                switch response.result {
                case .success( _ ) :
                    if response.value != nil {
                        do {
                            let responseObject = try JSONDecoder().decode(BaseResult<T>.self, from: response.data!)
                            success(responseObject)
                        }
                        catch let error as NSError {
                            print("failed reason : \(error.localizedDescription)")
                            failure(error.localizedDescription)
                        }
                    }
                case .failure(let error) :
                    print("failed reason : \(error.localizedDescription)")
                    failure(error.localizedDescription)
                    break
                }
            }
    }
    
    func requestForObject<T: Codable>(_ url: String,_ parameters: [String : Any] = [:], _ method: HTTPMethod = .get,_ httpHeaders: HTTPHeaders? = nil, encoding: ParameterEncoding = URLEncoding.default, success: @escaping (T) -> Void, failure: @escaping (String) -> () ) {
        
        self.isLoading = true
        let newUrl = url.encodeUrl()
        AF.request(newUrl, method:method, parameters:parameters, encoding:encoding, headers: httpHeaders)
            .responseString { (response) -> Void in
                print("-------------------------------------------------")
                print("url : \(newUrl) - res:\(response)")
                print("-------------------------------------------------")
            }
            .responseJSON { response in
                
                self.isLoading = false
                switch response.result {
                case .success( _ ) :
                    if response.value != nil {
                        do {
                            let responseObject = try JSONDecoder().decode(T.self, from: response.data!)
                            success(responseObject)
                        }
                        catch let error as NSError {
                            print("failed reason : \(error.localizedDescription)")
                            failure(error.localizedDescription)
                        }
                    }
                case .failure(let error) :
                    print("failed reason : \(error.localizedDescription)")
                    failure(error.localizedDescription)
                    break
                }
            }
    }
}




