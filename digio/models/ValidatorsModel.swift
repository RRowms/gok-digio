//
//  ValidatorsModel.swift
//  digio
//
//  Created by Cesar Nalio on 12/12/21.
//

import Foundation
import UIKit

enum CustomError: Error {
    case invalidUrl
    case urlEmpty
    case unsupportedUrl
    case notValidContent
}

class ValidatorsModel {

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

}
