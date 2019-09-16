//
//  NetworkClient.swift
//  HouseRentingAssignment
//
//  Created by Aung Ko Ko on 9/12/19.
//  Copyright © 2019 Phone Zaw Myint. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class NetworkClient {
    private let baseUrl: String
    private init(baseUrl: String){
        self.baseUrl = baseUrl
    }
    private static var sharedNetworkClient: NetworkClient = {
        let url = SharedConstants.BASE_URL + "house_list"
        return NetworkClient(baseUrl: url)
    }()
    
    class func shared() -> NetworkClient {
        return sharedNetworkClient
    }
    
    public func getData(success:@escaping(Any) -> Void,failure:@escaping(String)-> Void){
        Alamofire.request(baseUrl).responseData { (response) in
            switch response.result {
            case .success:
                guard let data = response.result.value else {return}
                success(data)
                break
            case .failure(let err):
                failure(err.localizedDescription)
                break
            }
        }
    }
    
    public func getDataByHeaders(route: String,
                                 header: HTTPHeaders,
                                 parameters: Parameters,
                                 success:@escaping(Any) -> Void,
                                 failure:@escaping(String) -> Void){
        
        Alamofire.request(SharedConstants.BASE_URL + route, method: .get, parameters: parameters,headers: header).responseData { (response) in
            guard let data = response.result.value else {return}
            switch response.result {
            case .success:
                do {
                    let decoder = JSONDecoder()
                    decoder.keyDecodingStrategy = .convertFromSnakeCase
                    let baseResponse = try decoder.decode(BaseResponse.self, from: data)
                    if baseResponse.isResponseOK() {
                        let json = JSON(response.result.value!)
                        let data = json["data"]
                        success(data)
                    }else {
                        failure(baseResponse.error?.message ?? "")
                    }
                }catch let jsonErr {
                    failure(jsonErr.localizedDescription)
                }
                // success(data)
                break
            case .failure(let err):
                failure(err.localizedDescription)
                break
            }
        }
    }
    
    
    public func postFormData(route: String,
                             header: HTTPHeaders,
                             parameters: Parameters,
                             success:@escaping(Any) -> Void,
                             failure:@escaping(String) -> Void){
        
        Alamofire.request(SharedConstants.BASE_URL + route, method: .post, parameters: parameters,headers: header).responseData { (response) in
            guard let data = response.result.value else {return}
            switch response.result {
            case .success:
                do {
                    let decoder = JSONDecoder()
                    decoder.keyDecodingStrategy = .convertFromSnakeCase
                    let baseResponse = try decoder.decode(BaseResponse.self, from: data)
                    if baseResponse.isResponseOK() {
                        let json = JSON(response.result.value!)
                        let data = json["data"]
                        success(data)
                    }else {
                        failure(baseResponse.error?.message ?? "")
                    }
                }catch let jsonErr {
                    failure(jsonErr.localizedDescription)
                }
                break
            case .failure(let err):
                failure(err.localizedDescription)
                break
            }
        }
    }
    
    
    public func postRawData(request:URLRequest,
                            success:@escaping(Any) -> Void,
                            failure:@escaping(String) -> Void){
        Alamofire.request(request).responseData { (response) in
            guard let data = response.result.value else {return}
            switch response.result {
            case .success:
                do {
                    let decoder = JSONDecoder()
                    decoder.keyDecodingStrategy = .convertFromSnakeCase
                    let baseResponse = try decoder.decode(BaseResponse.self, from: data)
                    if baseResponse.isResponseOK() {
                        let json = JSON(response.result.value!)
                        let data = json["data"]
                        success(data)
                    }else {
                        failure(baseResponse.error?.message ?? "")
                    }
                }catch let jsonErr {
                    failure(jsonErr.localizedDescription)
                }
                break
            case .failure(let err):
                failure(err.localizedDescription)
                break
            }
        }
        
    }
    
}
