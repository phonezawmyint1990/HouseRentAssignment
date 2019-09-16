//
//  HouseModel.swift
//  HouseRentingAssignment
//
//  Created by Aung Ko Ko on 9/12/19.
//  Copyright © 2019 Phone Zaw Myint. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class HouseModel {
    class func shared() -> HouseModel {
        return sharedHouseModel
    }
    
    private static var sharedHouseModel: HouseModel = {
        let houseModel = HouseModel()
        return houseModel
    }()
    
    var houseRespone: HouseResponse?
    
    var house: HouseVO?
    
    func apiGetHouseRentingList(success:@escaping()-> Void, failure:@escaping(String) -> Void){
        NetworkClient.shared().getData(success: { (data) in
            guard let data = data as? Data else {return}
            do {
                // let decoder = JSONDecoder()
                // decoder.keyDecodingStrategy = .convertFromSnakeCase
                self.houseRespone = try JSONDecoder().decode(HouseResponse.self, from: data)
                success()
            }catch let jsonerr {
                failure(jsonerr.localizedDescription)
            }
        }) { (err) in
            failure(err)
        }
    }
    
    func apiGetHouseById(houseId: Int,
                         success:@escaping()-> Void,
                         failure:@escaping(String) -> Void){
        
        let header: HTTPHeaders = [SharedConstants.PARAM.PARAM_HOUSE_ID: String(houseId)]
        NetworkClient.shared().getDataByHeaders(route: SharedConstants.ApiRoute.GET_HOUSE_BY_ID, header: header, parameters: [:], success: { (data) in
            guard let data = data as? JSON else {return}
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                self.house = try decoder.decode(HouseVO.self, from: Data(data.rawData()))
                success()
            }catch let jsonError{
                failure(jsonError.localizedDescription)
            }
        }) { (err) in
            failure(err)
        }
    }
    
    func apiGetHouseByIdWithFormData(houseId: Int,
                                     success:@escaping()-> Void,
                                     failure:@escaping(String) -> Void){
        let parameter: Parameters = [SharedConstants.PARAM.PARAM_HOUSE_ID:String(houseId)]
        NetworkClient.shared().postFormData(route: SharedConstants.ApiRoute.GET_HOUSE_BY_FORMDATA , header: [:], parameters: parameter, success: { (data) in
            guard let data = data as? JSON else {return}
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                self.house = try decoder.decode(HouseVO.self, from: Data(data.rawData()))
                success()
            }catch let jsonError{
                failure(jsonError.localizedDescription)
            }
        }) { (err) in
            failure(err)
        }
    }
    
    func apiGetHouseByIdWithRequestObject(houseRequest: HouseRequest,
                                          success:@escaping()-> Void,
                                          failure:@escaping(String) -> Void){
        
        var request = URLRequest(url: URL(string: SharedConstants.BASE_URL + SharedConstants.ApiRoute.GET_HOUSE_BYITH_REQUEST_OBJECT)!)
        request.httpMethod = "POST"
        request.setValue(SharedConstants.REQUEST_TYPE.REQUEST_TYPE_FORM_URLENCODED, forHTTPHeaderField: SharedConstants.REQUEST_TYPE.CONTENT_TYPE)
        let encoder = JSONEncoder()
        encoder.keyEncodingStrategy = .convertToSnakeCase
        do {
            request.httpBody = try encoder.encode(houseRequest)
        }catch let jsonErr {
            failure(jsonErr.localizedDescription)}
        
        NetworkClient.shared().postRawData(request: request, success: { (data) in
            guard let data = data as? JSON else {return}
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                self.house = try decoder.decode(HouseVO.self, from: Data(data.rawData()))
                success()
            }catch let jsonError{
                failure(jsonError.localizedDescription)
            }
        }) { (err) in
            failure(err)
        }
    }
    
    
}
