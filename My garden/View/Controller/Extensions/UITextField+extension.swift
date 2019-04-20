//
//  UITextField+extension.swift
//  My garden
//
//  Created by Ivan Nikitin on 20/04/2019.
//  Copyright © 2019 Ivan Nikitin. All rights reserved.
//

import UIKit

extension UITextField {
    var isEmpty: Bool {
        return text?.isEmpty ?? true
    }
}
