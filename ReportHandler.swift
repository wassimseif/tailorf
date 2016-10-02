//
//  ReportHandler.swift
//  tailorf
//
//  Created by Wassim Seifeddine on 10/2/16.
//
//

import Foundation


class ReportHandler {
    var path : String?
    var files : [File]!
    init(withFiles files : [File]) {
        self.files = files
     }
    
    func generateReport(atPath path : String){
        self.path = path
        
    }
}
