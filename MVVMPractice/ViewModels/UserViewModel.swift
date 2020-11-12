//  UserViewModel.swift
//  MVVMPractice
//  Created by Ranjeet Raushan on 10/09/20.
//  Copyright © 2020 Ranjeet Raushan. All rights reserved.

import Foundation
import UIKit
import Alamofire

class UserViewModel{
    weak var vc: ViewController?
    var arrUser = [UserModel]()
    
    func getAllUsersDataAF(){
        AF.request("https://jsonplaceholder.typicode.com/todos/").response{ response in
            if let data = response.data {
                do{
                    let userResponse = try JSONDecoder().decode([UserModel].self, from: data)
                    print("User Response:\(userResponse)")
                    self.arrUser.append(contentsOf: userResponse)
                    DispatchQueue.main.async {
                        self.vc?.tableView.reloadData()
                    }
                }catch let err{
                    print(err.localizedDescription)
                }
            }
        }
    }
    func getAllUserData(){
        URLSession.shared.dataTask(with: URL(string: "https://jsonplaceholder.typicode.com/todos/")!) { (data, response, error) in
            if error == nil{
                if let data = data {
                    do{
                        let userResponse = try JSONDecoder().decode([UserModel].self, from: data)
                         print("User Response:\(userResponse)")
                        self.arrUser.append(contentsOf: userResponse)
                        DispatchQueue.main.async {
                            self.vc?.tableView.reloadData()
                        }
                    }catch let err{
                        print(err.localizedDescription)
                    }
                }
            }else{
                print(error?.localizedDescription as Any)
            }
        }.resume()
    }
}
