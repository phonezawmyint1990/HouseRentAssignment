//
//  HouseRentingViewController.swift
//  HouseRentingAssignment
//
//  Created by Aung Ko Ko on 9/11/19.
//  Copyright © 2019 Phone Zaw Myint. All rights reserved.
//

import UIKit

class HouseRentingViewController: BaseViewController {
    
    @IBOutlet weak var houseRentingTableView: UITableView!
    @IBOutlet weak var vTopCollection: UIView!
    
    
    var refreshControl = UIRefreshControl()
    override func viewDidLoad() {
        super.viewDidLoad()
        houseRentingTableView.dataSource = self
        houseRentingTableView.delegate = self
        houseRentingTableView.registerForTableViewCell(strID: String(describing: HouseRentingTableViewCell.self))
        houseRentingTableView.separatorColor = UIColor.clear
        getHouseRentingList()
        refreshControl.addTarget(self, action: #selector(onRefresh), for: .valueChanged)
        houseRentingTableView.addSubview(refreshControl)
        vTopCollection.layer.cornerRadius = vTopCollection.frame.width/2
        houseRentingTableView.rowHeight = 300
        
//        HouseModel.shared().apiGetHouseById(houseId: 1, success: {
//            let tt = HouseModel.shared().house
//            print("tt",tt)
//        }) { (err) in
//            print(err)
//        }
//
//        HouseModel.shared().apiGetHouseByIdWithFormData(houseId: 1, success: {
//            let ss = HouseModel.shared().house
//            print("ss",ss)
//        }) { (err) in
//            print(err)
//        }
//
//        HouseModel.shared().apiGetHouseByIdWithRequestObject(houseRequest: HouseRequest(houseId: 1), success: {
//            let pp = HouseModel.shared().house
//            print("pp",pp)
//        }) { (err) in
//            print(err)
//        }
    }
    
    @objc func onRefresh(){
        getHouseRentingList()
    }
    
    
    private func getHouseRentingList(){
        
        self.showProgress(message: "Loading")
        HouseModel.shared().apiGetHouseRentingList(success: {
            self.hideProgress()
            self.houseRentingTableView.reloadData()
            self.refreshControl.endRefreshing()
        }) { (err) in
            self.hideProgress()
            self.refreshControl.endRefreshing()
           // print(err)
            self.showAlertDialog(message: err)
        }
    }
}

extension HouseRentingViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let count = HouseModel.shared().houseRespone?.data?.count {
            return count
        }
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing:  HouseRentingTableViewCell.self), for: indexPath) as! HouseRentingTableViewCell
        cell.house = HouseModel.shared().houseRespone?.data?[indexPath.row]
        cell.delegate = self
        return cell
    }
}

extension HouseRentingViewController: UITableViewDelegate {
}

extension HouseRentingViewController: HouseDetailActionDelegate {
    func onClickHouseDetails(objHouse: HouseVO) {
                let storboard = UIStoryboard(name: "Main", bundle: nil)
                let vc = storboard.instantiateViewController(withIdentifier: String(describing: HouseDetailsViewController.self)) as! HouseDetailsViewController
                        vc.house = objHouse
                self.present(vc, animated: true, completion: nil)
    }
}
