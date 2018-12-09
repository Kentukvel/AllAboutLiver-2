//
//  Web.swift
//  AllAboutLiver
//
//  Created by Левкутник Дмитрий on 08.12.2018.
//  Copyright © 2018 Левкутник Дмитрий. All rights reserved.
//

import Foundation

struct JSONStructure: Decodable {
    var id: String
    var appMozhno: String
    var appNelza: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case appMozhno = "tv.app_mozhno"
        case appNelza = "tv.app_nelzya"
    }
}

class Web {
    
    
    
    public func getFilePath(_ fileName: String) -> String {
        let path = NSSearchPathForDirectoriesInDomains(.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true)
        let documentsDirectory = URL(fileURLWithPath: path.first!)
        return documentsDirectory.appendingPathComponent(fileName).path
    }
    
    func urlRequest(url: String, fileToWrite: String) {
        let url = URL(string: url)!
        let urlSession = URLSession.shared
        let getRequest = URLRequest(url: url)
        urlSession.dataTask(with: getRequest as URLRequest, completionHandler: { data, response, error in
            
            guard error == nil else {
                return
            }
            
            guard let data = data else {
                return
            }
            
            let filePath = self.getFilePath(fileToWrite)
            NSKeyedArchiver.archiveRootObject(data, toFile: filePath)
            
            
        }).resume()
        
    }
    
    public func getData(from file: String) -> [JSONStructure] {
        var data: Data?
        let filePath = self.getFilePath(file)
        if FileManager().fileExists(atPath: filePath){
            data = NSKeyedUnarchiver.unarchiveObject(withFile: filePath) as? Data
        }
        let json = try! JSONDecoder().decode([JSONStructure].self, from: data!)
        return json
    }
}
