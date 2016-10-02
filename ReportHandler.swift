//
//  ReportHandler.swift
//  tailorf
//
//  Created by Wassim Seifeddine on 10/2/16.
//
//

import Foundation


class ReportHandler {
    var path : String!
    var files : [File]!
    var reportName : String!
    init(withFiles files : [File]) {
        self.files = files
        self.reportName = getReportName()
        generateReport(atPath: "/Users/wassimseifeddine/Desktop")
        
    }
    private func getReportName() -> String {
        let todaysDate : Date = Date()
        let dateFormatter:DateFormatter = DateFormatter()
        dateFormatter.dateFormat = Constants.dateFormat
        let todayString:String = dateFormatter.string(from: todaysDate)
        return todayString + ".html"
    }
    func generateReport(atPath path : String){
        self.path = path
        self.path = self.path + "/" + self.reportName!
        
    }
}
