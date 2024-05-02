//
//  ModelData.swift
//  Landmarks
//
//  Created by MacBook Pro on 25/04/24.
//

import Foundation

@Observable
class ModelData{
    var landmarks: [Landmark] = load("landmarkData.json")
    var hikes: [Hike] = load("hikeData.json")
}


//unsure what T is, ill just assume it can mean anything
//so T: Decodable means anything with the Decodable protocol inherited
//and it'll just return whatever u put in as the output
func load<T: Decodable>(_ filename: String) -> T {
    let data: Data
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else{
        fatalError("Couldn't find \(filename) in main bundle.")
    }
    
    do{
        data = try Data(contentsOf:file)
    }catch{
        fatalError("Couldn't load \(filename) from the main bundle.\n\(error)")
    }
    
    do{
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    }catch{
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
    
}
