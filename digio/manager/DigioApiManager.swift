//
//  DigioApiManager.swift
//  digio
//
//  Created by Cesar Nalio on 10/12/21.
//

import Foundation
import UIKit

enum CustomError: Error {
    case invalidUrl
    case urlEmpty
    case unsupportedUrl
}

func validateUrl(urlString: String) throws -> Bool {

    guard !urlString.isEmpty else {
        throw CustomError.urlEmpty
    }

    guard let urlToValidate = URL(string: urlString) else {
        throw CustomError.invalidUrl
    }

    guard UIApplication.shared.canOpenURL(urlToValidate as URL) else {
        throw CustomError.unsupportedUrl
    }

    return true

}

class DigioApiManager {
    private static let defaultSession = URLSession(configuration: .default)

    static func getData(completion: @escaping (Digio?, String?) -> Void) throws {

        let urlString = "https://7hgi9vtkdc.execute-api.sa-east-1.amazonaws.com/sandbox/products"
        var checkValid: Bool = true

        do {
            checkValid = try validateUrl(urlString: urlString)
        } catch {
            print(error)
            throw CustomError.invalidUrl
        }

        guard let apiUrl = URL(string: urlString), checkValid == true else {
            throw CustomError.unsupportedUrl
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
