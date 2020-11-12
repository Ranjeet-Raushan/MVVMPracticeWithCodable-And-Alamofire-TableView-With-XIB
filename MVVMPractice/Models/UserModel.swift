//  Models.swift
//  MVVMPractice
//  Created by Ranjeet Raushan on 10/09/20.
//  Copyright © 2020 Ranjeet Raushan. All rights reserved.

import Foundation
import UIKit

struct UserModel : Codable {
    let uid : Int?
    let id : Int?
    let title : String?
    let completed : Bool?

    enum CodingKeys: String, CodingKey {

        case uid = "userId"
        case id = "id"
        case title = "title"
        case completed = "completed"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        uid = try values.decodeIfPresent(Int.self, forKey: .uid)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        title = try values.decodeIfPresent(String.self, forKey: .title)
        completed = try values.decodeIfPresent(Bool.self, forKey: .completed)
    }
    
    func getStatusAndColor() -> (String, UIColor){
        if completed ?? true{
            return ("Completed", .systemGreen)
        }
        else{
            return ("Not Completed", .systemPink)
        }
    }
}
