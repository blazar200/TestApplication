//
//  ViewController.swift
//  TestApplication
//
//  Created by Baron Lazar on 12/11/19.
//  Copyright © 2019 Baron Lazar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var userNameField: UITextField!
    @IBOutlet weak var passwordLabel: UILabel!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var changeRoleButton: UIButton!
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.dataSource = self
            tableView.delegate = self
            tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        }
    }
    let roles = ["Admin", "Role", "User"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func changeRoleAction(_ sender: Any) {
        toggleDropdown()
    }
    
    func toggleDropdown() {
        changeRoleButton.isHidden.toggle()
        tableView.isHidden.toggle()
    }
    
    @IBAction func submitButtonTapped(_ sender: Any) {
        
        guard let vc = DetailViewController.createViewController(userName: userNameField.text, password: passwordField.text, userType: changeRoleButton.titleLabel?.text) else { return }
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return roles.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = roles[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        changeRoleButton.setTitle(roles[indexPath.row], for: .normal)
        toggleDropdown()
    }
}

