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
    var summary : Summary!
    var reportName : String!
    init(withFiles files : [File],andReportSummary summary : Summary) {
        self.files = files
        self.summary = summary
        self.reportName = getReportName()
        generateReport(atPath: "/Users/wassim/Desktop/")
        
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
        self.path = self.path + self.reportName!
        writeFileHeaders()
        writeSummary()
    }
    private func writeFileHeaders(){
        let header = "<!DOCTYPE html> \n <html>\n<head>\n <title>Tailor Report</title>\n<!-- Latest compiled and minified CSS -->\n<link rel='stylesheet' href='ohttps://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css' integrity='sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs' crossorigin='anonymous'> \n <!-- Optional theme -->\n<link rel='stylesheet'href='https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap-theme.min.css' integrity='sha384-fLW2N01lMqjakBkx3l/M9EahuwpSfeNvV63J5ezn3uZzapT0u7EYsXMjQV+0En5r' crossorigin='anonymous'>\n <!-- Latest compiled and minified JavaScript -->\n <script src='https:/maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js' integrity='sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS' crossorigin='anonymous'>\n</script>\n </head>\n<body>\n <div class='container'>\n <h2>TAILOR REPORT</h2>  \n <h3>Summary</h3>"
        
        Printer.write(toFileWithName: path, content: header)
    }
    
    private func writeSummary(){
        print(Printer.write(toFileWithName: path, content: "\n<p>Analyzed : \(summary.analyzedCount!)</p>\n"))
        print(Printer.write(toFileWithName: path, content: "\n<p>Skipped : \(summary.skippedCount!)</p>\n"))
        print(Printer.write(toFileWithName: path, content: "\n<p>Violations : \(summary.violationsCount!)</p>\n"))
        print(Printer.write(toFileWithName: path, content: "\n<p>Errors : \(summary.errorsCount!)</p>\n"))
        print(Printer.write(toFileWithName: path, content: "\n<p>Warnings : \(summary.warningsCount!)</p>\n"))
    }
    
}
