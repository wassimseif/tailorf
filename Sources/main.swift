import Foundation


func parseJSON () -> [String : AnyObject]?{
    
    guard let url = Bundle.main.url(forResource: "test", withExtension: "json") else {
        return nil
    }
    guard let data = try? Data(contentsOf: url) else {
        return nil
    }
    do {
        let json = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String:AnyObject]
        return json
    }catch{
        print("Error")
        return nil
    }
    
}


let json = parseJSON()


print(json!["summary"]!)
