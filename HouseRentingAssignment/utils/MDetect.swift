//
//  MDetect.swift
//  HouseRentingAssignment
//
//  Created by Aung Ko Ko on 9/13/19.
//  Copyright © 2019 Phone Zaw Myint. All rights reserved.
//

import Foundation
import UIKit
public struct MDetect {
    public static func isUnicode() -> Bool {
        let label1 = UILabel()
        let label2 = UILabel()
        label1.text = "က"
        label2.text = "က္က"
        label1.sizeToFit()
        label2.sizeToFit()
        return label2.frame.width == label1.frame.width
    }
}
