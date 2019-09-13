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
    var houseVO: HouseVO?
    override func viewDidLoad() {
        super.viewDidLoad()
        houseRentingTableView.dataSource = self
        houseRentingTableView.delegate = self
        houseRentingTableView.registerForTableViewCell(strID: String(describing: HouseRentingTableViewCell.self))
        houseRentingTableView.separatorColor = UIColor.clear
  //      houseRentingTableView.contentInset = UIEdgeInsets(top: 30, left: 0, bottom: 0, right: 0)
        getHouseRentingList()
        refreshControl.addTarget(self, action: #selector(onRefresh), for: .valueChanged)
        houseRentingTableView.addSubview(refreshControl)
        vTopCollection.layer.cornerRadius = vTopCollection.frame.width/2
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
            print(err)
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
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
    }
}

extension HouseRentingViewController: HouseDetailActionDelegate {
    func onClickHouseDetails() {
        let storboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storboard.instantiateViewController(withIdentifier: String(describing: HouseDetailsViewController.self)) as! HouseDetailsViewController
        vc.house = self.houseVO
        self.present(vc, animated: true, completion: nil)
    }
}
