    //  ViewController.swift
    //  MVVMPractice
    //  Created by Ranjeet Raushan on 09/09/20.
    //  Copyright © 2020 Ranjeet Raushan. All rights reserved.
    
    import UIKit
    import  Alamofire
    class ViewController: UIViewController {
        @IBOutlet weak var tableView: UITableView!
        var viewModelUser = UserViewModel()
        override func viewDidLoad(){
            super.viewDidLoad()
            viewModelUser.vc = self
           //  viewModelUser.getAllUserData() //  To Use Codable , Uncomment this line
               viewModelUser.getAllUsersDataAF() //  To Use Alamofire  , Uncomment this line
            tableView.register(UINib(nibName: "UserCell", bundle: nil), forCellReuseIdentifier: "UserCell")
        }
    }
    
    extension ViewController: UITableViewDataSource{
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            viewModelUser.arrUser.count
        }
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "UserCell", for: indexPath) as! UserCell
            let modelUserForCell = viewModelUser.arrUser[indexPath.row]
            cell.modelUserForCell = modelUserForCell
            cell.userConfiguration()
            return cell
        }
    }
