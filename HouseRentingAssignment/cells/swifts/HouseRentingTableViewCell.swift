//
//  HouseRentingTableViewCell.swift
//  HouseRentingAssignment
//
//  Created by Aung Ko Ko on 9/11/19.
//  Copyright © 2019 Phone Zaw Myint. All rights reserved.
//

import UIKit
import SDWebImage

class HouseRentingTableViewCell: UITableViewCell {

    @IBOutlet weak var ivHousePoster: UIImageView!
    @IBOutlet weak var lblAddress: UILabel!
    @IBOutlet weak var lblPrice: UILabel!
    @IBOutlet weak var lblSquareFeet: UILabel!
    @IBOutlet weak var vMain: UIView!
    @IBOutlet weak var vPrice: UIView!
    
    var delegate : HouseDetailActionDelegate?
    
    var house:HouseVO? {
        didSet{
            if let house = house {
                let posterString = house.house_image_url ?? ""
                ivHousePoster.sd_setImage(with: URL(string: posterString), placeholderImage: UIImage(named: "img_house"))
                lblAddress.text = house.address?.toMMFont()
                lblPrice.text = "$ \(house.price!)"
                lblSquareFeet.text = "\(house.square_feet!) sqft"
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
        initGestureRecognizer()
        vPrice.layer.cornerRadius = 15
        vMain.layer.cornerRadius = 10
        ivHousePoster.layer.maskedCorners = [.layerMinXMinYCorner,.layerMaxXMinYCorner]
        ivHousePoster.layer.cornerRadius = 10
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func initGestureRecognizer(){
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(onclickViewDetails))
        vMain.isUserInteractionEnabled = true
        vMain.addGestureRecognizer(tapGesture)
    }
    
    @objc func onclickViewDetails(){
        delegate?.onClickHouseDetails(objHouse: house!)
    }
}
