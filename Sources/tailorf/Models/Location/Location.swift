//
//  Location.swift
//  tailorf
//
//  Created by Wassim on 9/30/16.
//
//

import Foundation
import Mustache
class Location  : NSObject{
    var line : Double!
    var column : Double?
    init(atLine line : Double, atColumn column : Double? ){
        self.line = line
        self.column = column
    }
}
extension Location {
    override var mustacheBox: MustacheBox {
        return Box([
            "line": "\(line!)",
            "column": "\(column!)"
            ])
    }
}
