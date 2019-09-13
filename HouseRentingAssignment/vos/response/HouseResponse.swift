//
//  HouseResponse.swift
//  HouseRentingAssignment
//
//  Created by Aung Ko Ko on 9/12/19.
//  Copyright © 2019 Phone Zaw Myint. All rights reserved.
//

import Foundation
//struct HouseResponse: Codable {
//    var code: String?
//    var message:String?
//    var data: [HouseVO]?
//}

struct HouseResponse : Codable {
    let code : Int?
    let message : String?
    let data : [HouseVO]?

    enum CodingKeys: String, CodingKey {

        case code = "code"
        case message = "message"
        case data = "data"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        code = try values.decodeIfPresent(Int.self, forKey: .code)
        message = try values.decodeIfPresent(String.self, forKey: .message)
        data = try values.decodeIfPresent([HouseVO].self, forKey: .data)
    }

}
