//
//  DigioApiManager.swift
//  digio
//
//  Created by Cesar Nalio on 10/12/21.
//

import Foundation
import UIKit

class DigioApiManager {
    private static let defaultSession = URLSession(configuration: .default)

    public static var urlString = "https://7hgi9vtkdc.execute-api.sa-east-1.amazonaws.com/sandbox/products"

    static func getData(completion: @escaping (Digio?, String?) -> Void) throws {

        var checkValid: Bool = true

        do {
            checkValid = try ValidatorsModel().validateUrl(urlString: urlString)
        } catch {
            print(error)
            throw CustomError.invalidUrl
        }

        do {
            guard let apiUrl = URL(string: urlString), checkValid == true else {
                throw CustomError.unsupportedUrl
            }

            try defaultSession.digioTask(with: apiUrl) { (data, response, error) in
                let data = data
                let error = error
                print(response as Any)
                print(error as Any)
                DispatchQueue.main.async {
                    completion(data, error?.localizedDescription)
                }
            }.resume()
        } catch {
            print(error)
            throw CustomError.unsupportedUrl
        }

    }
}
