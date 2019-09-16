//
//  BaseResponse.swift
//  HouseRentingAssignment
//
//  Created by Aung Ko Ko on 9/14/19.
//  Copyright © 2019 Phone Zaw Myint. All rights reserved.
//

import Foundation
struct BaseResponse : Codable {
    var code: Int?
    var message: String?
    var error:ErrorVO?
    
    func isResponseOK() -> Bool{
        if let code = code, code > 0 {
            if code == 200 {
                return true
            }else {
                return false
            }
        }
        return false
    }
}

//{
//    "error":{
//        "name":
//        "message"
//    }
//}
