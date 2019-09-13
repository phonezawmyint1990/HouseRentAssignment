//
//  HouseResponse.swift
//  HouseRentingAssignment
//
//  Created by Aung Ko Ko on 9/12/19.
//  Copyright © 2019 Phone Zaw Myint. All rights reserved.
//

import Foundation
struct HouseResponse : Codable {
    let code : Int?
    let message : String?
    let data : [HouseVO]?
}
