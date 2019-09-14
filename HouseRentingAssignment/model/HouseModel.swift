//
//  HouseModel.swift
//  HouseRentingAssignment
//
//  Created by Aung Ko Ko on 9/12/19.
//  Copyright © 2019 Phone Zaw Myint. All rights reserved.
//

import Foundation
class HouseModel {
    class func shared() -> HouseModel {
        return sharedHouseModel
    }
    
    private static var sharedHouseModel: HouseModel = {
        let houseModel = HouseModel()
        return houseModel
    }()
    
    var houseRespone: HouseResponse?
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
}
