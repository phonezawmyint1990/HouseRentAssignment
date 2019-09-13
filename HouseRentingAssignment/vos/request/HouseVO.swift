//
//  HouseVO.swift
//  HouseRentingAssignment
//
//  Created by Aung Ko Ko on 9/12/19.
//  Copyright © 2019 Phone Zaw Myint. All rights reserved.
//

import Foundation
struct HouseVO : Codable {
    let id : Int?
    let house_image_url : String?
    let name : String?
    let description : String?
    let price : Int?
    let address : String?
    let square_feet : Int?
    let latitude : Double?
    let longitude : Double?

}
