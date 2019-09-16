//
//  SharedConstants.swift
//  HouseRentingAssignment
//
//  Created by Aung Ko Ko on 9/12/19.
//  Copyright © 2019 Phone Zaw Myint. All rights reserved.
//

import Foundation
class SharedConstants {
  // static let BASE_URL = "https://8c67b0eb-dff5-4aaa-a864-d700f0390d60.mock.pstmn.io/house_list"
    static let BASE_URL = "https://d0996f53-d1ce-47ad-a628-af026825b79c.mock.pstmn.io/"
    
    enum ApiRoute {
        static let GET_HOUSE_LIST = "house_list"
        static let GET_HOUSE_BY_ID = "get_house_by_id"
        static let GET_HOUSE_BY_FORMDATA = "get_house_by_id_with_form_data"
        static let GET_HOUSE_BYITH_REQUEST_OBJECT = "get_house_by_id_with_request_object"
    }
    
    enum PARAM {
        static let PARAM_HOUSE_ID = "house_id"
    }
    
    enum FORM_DATA {
        static let FORM_DATA_HOUSE_ID = "house_id"
    }
    
    enum REQUEST_TYPE {
        static let CONTENT_TYPE = "Content-Type"
        static let REQUEST_TYPE_FORM_URLENCODED =  "application/x-www-form-urlencoded"
    }
    
    
}

