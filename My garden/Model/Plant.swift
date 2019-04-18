//
//  Plant.swift
//  My garden
//
//  Created by Ivan Nikitin on 11/04/2019.
//  Copyright © 2019 Ivan Nikitin. All rights reserved.
//

import UIKit

enum PlantClass: String, CaseIterable, Codable {
    case vegetable = "овощи"
    case fruit = "фрукты"
    case berry = "ягода"
    case grass = "трава"
    case flowers = "цветы"
    case none = ""
}

struct Plant {
    var name: String
    var sort: String
    var photo: String
    var image: UIImage?
    var description: String
    var plantClass: PlantClass
    var maturationTime: Int // in days
    var landingDate: Date
    var squareOfPlant: Double // * 100 m square
    var harvest: Double
    
    init(name: String = "", sort: String = "", photo: String = "addPhoto", description: String = "", plantClass: PlantClass = .none, maturationTime: Int = 0, landingDate: Date = Date(), squareOfPlant: Double = 0, harvest: Double = 0) {
        self.name = name
        self.sort = sort
        self.photo = photo
        self.description = description
        self.plantClass = plantClass
        self.maturationTime = maturationTime
        self.landingDate = landingDate
        self.squareOfPlant = squareOfPlant
        self.harvest = harvest
    }
}
// MARK: - Computed properties
extension Plant {
    var maturationDate: Date {
        let timeInterval = Double(60 * 60 * 24 * maturationTime)
        let date = landingDate.addingTimeInterval(timeInterval)
        return date
    }
    var displayMaturationDate: String {
        let dateFormater = DateFormatter()
        dateFormater.dateFormat = "dd/M/YYYY"
        return dateFormater.string(from: maturationDate)
    }
    var displayLandingDate: String {
        let dateFormater = DateFormatter()
        dateFormater.dateFormat = "dd/M/YYYY"
        return dateFormater.string(from: landingDate)
    }
    var expectedYield: Double { //*100 kg / squareOfPlant
        return squareOfPlant * harvest
    }
}

