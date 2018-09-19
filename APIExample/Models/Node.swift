//
//  Node.swift
//  APIExample
//
//  Created by Justin on 9/18/18.
//  Copyright © 2018 Justin. All rights reserved.
//

import Foundation

struct Node {
    let entry: String?
    let cylinders: String?
    let engineLocation: String?
    let engineSize: String?
    let HP: String?
    let manufacturer: String?
    let model: String?
    let modelYear: String?
    let TQ: String?
    let trim: String?
    let wheelDrive: String?
    let id: String?
    
    init(id:String? = UUID().uuidString,
         entry: String? = nil,
         cylinders: String? = nil,
         engineLocation: String? = nil,
         engineSize: String? = nil,
         HP: String? = nil,
         manufacturer: String? = nil,
         model: String? = nil,
         modelYear: String? = nil,
         TQ: String? = nil,
         trim: String? = nil,
         wheelDrive: String? = nil) {
        self.entry = entry
        self.cylinders = cylinders
        self.engineLocation = engineLocation
        self.engineSize = engineSize
        self.HP = HP
        self.manufacturer = manufacturer
        self.model = model
        self.modelYear = modelYear
        self.TQ = TQ
        self.trim = trim
        self.wheelDrive = wheelDrive
        self.id = id
    }
}
