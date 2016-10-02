//
//  Printer.swift
//  tailorf
//
//  Created by Wassim Seifeddine on 10/2/16.
//
//

import Foundation

class Printer {
    
    
    class func exists(fileWithPath  path: String) -> Bool {
        return FileManager().fileExists(atPath: path)
    }
    
    //MARK:- WRITING
    class func write (path: String, content: String, encoding: String.Encoding = String.Encoding.utf8) -> Bool  {
        do {
          try  content.write(toFile: path, atomically: true, encoding: encoding)
        }catch{
            return false
        }
        return true
    }
}
