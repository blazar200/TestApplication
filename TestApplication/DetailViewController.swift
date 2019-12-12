//
//  DetailViewController.swift
//  TestApplication
//
//  Created by Baron Lazar on 12/11/19.
//  Copyright © 2019 Baron Lazar. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var passwordLabel: UILabel!
    @IBOutlet weak var userTypeLabel: UILabel!
    
    var userName: String?
    var password: String?
    var userType: String?
    
    static func createViewController(userName: String?, password: String?, userType: String?) -> DetailViewController? {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "detailVC") as? DetailViewController
        vc?.userName = userName
        vc?.password = password
        vc?.userType = userType
        
        return vc
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameLabel.text = "UserName: \(userName ?? "Whoops")"
        passwordLabel.text = "Password: \(password ?? "Whoops")"
        userTypeLabel.text = "UserType: \(userType ?? "Whoops")"
    }
    
}
