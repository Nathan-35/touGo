//
//  StorageManager.swift
//  GuideFinder(Test)
//
//  Created by Nathan on 22/09/2019.
//  Copyright © 2019 Nathan. All rights reserved.
//

import RealmSwift

let realm = try! Realm()


class StorageManager {
    static func saveTourist(_ tourist : Tourist){
        try! realm.write {
            realm.add(tourist)
        }
    }
}
