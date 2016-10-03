//
//  Location.swift
//  tailorf
//
//  Created by Wassim on 9/30/16.
//
//

import Foundation
class Location {
    var line : Double!
    var column : Double?
    init(atLine line : Double, atColumn column : Double? ){
        self.line = line
        self.column = column
    }
}
