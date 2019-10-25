//
//  TouristAccount.swift
//  GuideFinder(Test)
//
//  Created by Nathan on 22/09/2019.
//  Copyright © 2019 Nathan. All rights reserved.
//

import RealmSwift
import Foundation

class Tourist : Object {
    @objc dynamic var name = ""
    @objc dynamic var password = ""
    @objc dynamic var imageName : String?
    
    func saveTourist() {
        let newTourist = Tourist()

        

        newTourist.name = name
        newTourist.password = password
        newTourist.imageName = imageName
    }
}
