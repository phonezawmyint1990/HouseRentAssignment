//
//  BaseViewController.swift
//  HouseRentingAssignment
//
//  Created by Aung Ko Ko on 9/12/19.
//  Copyright © 2019 Phone Zaw Myint. All rights reserved.
//

import UIKit
import NVActivityIndicatorView

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func showAlertDialog(message:String){
        let alert = UIAlertController(title: "Failed", message: message, preferredStyle: UIAlertController.Style.alert)
        let alertActoion = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
        alert.addAction(alertActoion)
        present(alert, animated: true, completion: nil)
    }

}

extension BaseViewController: NVActivityIndicatorViewable {
    func showProgress(message: String){
        startAnimating(CGSize(width: 30, height: 30), message: message,type: NVActivityIndicatorType.ballZigZagDeflect)
    }
    
    func hideProgress(){
        stopAnimating()
    }
}
