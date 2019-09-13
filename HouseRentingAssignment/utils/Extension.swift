//
//  Extension.swift
//  HouseRentingAssignment
//
//  Created by Aung Ko Ko on 9/11/19.
//  Copyright © 2019 Phone Zaw Myint. All rights reserved.
//

import Foundation
import UIKit
import Rabbit_Swift

extension UITableView{
    func registerForTableViewCell(strID: String){
        register(UINib(nibName:strID, bundle: nil), forCellReuseIdentifier: strID)
    }
}

extension String{
    func toMMFont() -> String {
        if UserDefaults.standard.bool(forKey: DEF_IS_UNICODE) {
            return self
        }else {
            return Rabbit.uni2zg(unicode: self)
        }
    }
}
