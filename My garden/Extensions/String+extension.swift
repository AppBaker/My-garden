//
//  String+extension.swift
//  My garden
//
//  Created by Ivan Nikitin on 21/04/2019.
//  Copyright © 2019 Ivan Nikitin. All rights reserved.
//

import Foundation

extension String {
    func setDotInsteadOfComma() -> String {
        return self.replacingOccurrences(of: ",", with: ".", options: .literal, range: nil)
    }
}
