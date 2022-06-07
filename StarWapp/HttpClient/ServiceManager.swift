//
//  ServiceManager.swift
//  StarWapp
//
//  Created by Trabalho on 06/06/22.
//

import Foundation

struct ServiceManager {
    func getData<T:Decodable>(endpoint: String, resultType: T.Type, completionHandler: @escaping(_ result: T?) -> Void) {
        do {
            URLSession.shared.dataTask(with: URL(string: GlobalStrings.baseUrl + endpoint)!) { (responseData, httpUrlResponse, error) in
                if(error == nil && responseData != nil && responseData?.count != 0) {
                    let decoder = JSONDecoder()
                    do {
                        let result = try decoder.decode(T.self, from: responseData!)
                        completionHandler(result)
                    }
                    catch let error{
                        debugPrint("error occured while decoding = \(error.localizedDescription)")
                    }
                }
            }.resume()
        } catch let error {
            debugPrint(error)
        }
    }
}
