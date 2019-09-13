//
//  HouseDetailsViewController.swift
//  HouseRentingAssignment
//
//  Created by Aung Ko Ko on 9/12/19.
//  Copyright © 2019 Phone Zaw Myint. All rights reserved.
//

import UIKit
import SDWebImage

class HouseDetailsViewController: UIViewController {

    @IBOutlet weak var ivHousePoster: UIImageView!
    @IBOutlet weak var lblPrice: UILabel!
    @IBOutlet weak var lblAddress: UILabel!
    @IBOutlet weak var lblSquareFeet: UILabel!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblDescription: UILabel!
    @IBOutlet weak var btnSeePhotos: UIView!
    @IBOutlet weak var btnAddFavorite: UIView!
    @IBOutlet weak var btnBookNow: UIView!
    
    var house: HouseVO?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        btnSeePhotos.layer.cornerRadius = 20
        btnAddFavorite.layer.cornerRadius = 20
        btnBookNow.layer.cornerRadius = 20
        btnSeePhotos.layer.borderWidth = 1
        btnSeePhotos.layer.borderColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        
        btnAddFavorite.layer.shadowColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        btnAddFavorite.layer.shadowOpacity = 1
        btnAddFavorite.layer.shadowOffset = .zero
        btnAddFavorite.layer.shadowRadius = 50
        
        btnBookNow.layer.shadowColor = #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)
        btnBookNow.layer.shadowOpacity = 1
        btnBookNow.layer.shadowOffset = .zero
        btnBookNow.layer.shadowRadius = 50
        
        if let house = house {
            let posterString = house.house_image_url ?? ""
            ivHousePoster.sd_setImage(with: URL(string: posterString), placeholderImage: UIImage(named: "img_house"))
            lblPrice.text = "$ \(house.price!)"
            lblAddress.text = house.address
            lblSquareFeet.text = "\(house.square_feet!)"
            lblName.text = house.name?.toMMFont()
            lblDescription.text = house.description?.toMMFont()
        }
    }
    
    @IBAction func btnBackAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
