//
//  TCUtility.swift
//  TringConnect
//
//  Created by Bhagya on 01/05/22.
//

import Foundation

struct TCParserUtility {
    
    private static let kTypeJosn = "json"
    
    enum ParserError: Error {
        case fileNotFound
        case parsingError
    }
    
    static func getDataFromJson<T>(_ name: String, _ bundle: Bundle? = nil) -> Result<T, Error> where T: Decodable {
                
        let dataBundle = (bundle != nil) ? bundle : Bundle.main
        
        guard let url = dataBundle?.url(forResource: name, withExtension: kTypeJosn) else {
            return .failure(ParserError.fileNotFound)
        }
        do {
            let data = try Data(contentsOf: url, options: .alwaysMapped)
            let decoder = JSONDecoder()
            let decodedData = try decoder.decode(T.self, from: data)
            return .success(decodedData)
        } catch {
            return .failure(ParserError.parsingError)
        }
    }
}
