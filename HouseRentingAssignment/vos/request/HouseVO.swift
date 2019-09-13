//
//  HouseVO.swift
//  HouseRentingAssignment
//
//  Created by Aung Ko Ko on 9/12/19.
//  Copyright © 2019 Phone Zaw Myint. All rights reserved.
//

import Foundation

//struct HouseVO : Codable {
//    var id: Int?
//    var house_image_url: String?
//    var name: String?
//    var description: String?
//    var price: Int?
//    var address: String?
//    var square_feet: Int?
//    var latitude: Double?
//    var longitude: Double?
//}

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

    enum CodingKeys: String, CodingKey {

        case id = "id"
        case house_image_url = "house_image_url"
        case name = "name"
        case description = "description"
        case price = "price"
        case address = "address"
        case square_feet = "square_feet"
        case latitude = "latitude"
        case longitude = "longitude"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        house_image_url = try values.decodeIfPresent(String.self, forKey: .house_image_url)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        description = try values.decodeIfPresent(String.self, forKey: .description)
        price = try values.decodeIfPresent(Int.self, forKey: .price)
        address = try values.decodeIfPresent(String.self, forKey: .address)
        square_feet = try values.decodeIfPresent(Int.self, forKey: .square_feet)
        latitude = try values.decodeIfPresent(Double.self, forKey: .latitude)
        longitude = try values.decodeIfPresent(Double.self, forKey: .longitude)
    }

}
