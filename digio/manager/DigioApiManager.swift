//
//  DigioApiManager.swift
//  digio
//
//  Created by Cesar Nalio on 10/12/21.
//

import Foundation

class DigioApiManager {
    private static let defaultSession = URLSession(configuration: .default)

    static func getData(completion: @escaping (Digio?, String?) -> Void) {
        guard let apiUrl = URL(string: "https://7hgi9vtkdc.execute-api.sa-east-1.amazonaws.com/sandbox/products") else {
            return
        }

        defaultSession.digioTask(with: apiUrl) { (data, response, error) in
            guard let data = data, error == nil else {
                print(response as Any)
                print(error as Any)
                return
            }

            DispatchQueue.main.async {
                completion(data, error?.localizedDescription)
            }
        }.resume()
    }
}
