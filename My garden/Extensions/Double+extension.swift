//
//  Double+extension.swift
//  My garden
//
//  Created by Ivan Nikitin on 21/04/2019.
//  Copyright © 2019 Ivan Nikitin. All rights reserved.
//

import Foundation

extension Double {
    func toString() -> String {
        if self.rounded() == self {
            let number = Int(self)
            return "\(number)"
        } else {
            return "\((self*100).rounded() / 100)"
        }
    }
}

//extension Double {
//    /// Rounds the double to decimal places value
//    func rounded(toPlaces places:Int) -> Double {
//        let divisor = pow(10.0, Double(places))
//        return (self * divisor).rounded() / divisor
//    }
//}
