//
//  Plant.swift
//  My garden
//
//  Created by Ivan Nikitin on 11/04/2019.
//  Copyright © 2019 Ivan Nikitin. All rights reserved.
//

import UIKit

enum PlantClass: String {
    case vegetable = "овощи", fruit = "фрукты", berry = "ягода", grass = "трава"
}

struct Plant {
    var name: String
    var sort: String
    var photo: UIImage?
    var description: String
    var plantClass: PlantClass
    var maturationTime: Double // in days
    var landingDate: Date
    var squareOfPlant: Double // * 100 m square
    var yield: Double
}

// MARK: - Computed properties
extension Plant {
    var maturationDate: Date {
        let timeInterval = Double(60 * 60 * 24) * maturationTime
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
        return squareOfPlant * yield
    }
}

extension Plant {
    static func loadSample() -> [Plant] {
        return [
            Plant(name: "Морковь", sort: "Витаминная", photo: UIImage(named: "carrots"), description: "Двулетнее растение, подвид вида морковь дикая. Обычно в быту под словом «морковь» подразумевается широко распространенный корнеплод именно этого растения", plantClass: .vegetable, maturationTime: 60, landingDate: Date(), squareOfPlant: 0.3, yield: 200),
            Plant(name: "Огурец", sort: "Блорусский", photo: UIImage(named: "cucumber"), description: "Однолетнее травянистое растение, вид рода Огурец (Cucumis) семейства Тыквенные (Cucurbitaceae), овощная культура.", plantClass: .vegetable, maturationTime: 85, landingDate: Date(), squareOfPlant: 0.5, yield: 270),
            Plant(name: "Укроп", sort: "Кудрявый", photo: UIImage(named: "ukrop"), description: "В диком виде произрастает в Малой Азии, Северной Африке, Иране, Гималаях. Как культивируемое и сорное растение — повсеместно на всех континентах.", plantClass: .grass, maturationTime: 45, landingDate: Date(), squareOfPlant: 0.1, yield: 65),
            Plant(name: "Картофель", sort: "Андрета", photo: UIImage(named: "potatoes"), description: "Вид многолетних клубненосных травянистых растений из рода Паслён (Solanum) семейства Паслёновые (Solanaceae). Клубни картофеля являются важным пищевым продуктом. Плоды ядовиты, в связи с содержанием в них соланина.", plantClass: .vegetable, maturationTime: 75, landingDate: Date(), squareOfPlant: 10, yield: 320),
            Plant(name: "Редис", sort: "Круглый", photo: UIImage(named: "redis"), description: "Редис — съедобное растение и выращивается как овощ во многих странах мира. Его название происходит от лат. radix — корень.", plantClass: .vegetable, maturationTime: 50, landingDate: Date(), squareOfPlant: 0.1, yield: 120),
            Plant(name: "Баклажан", sort: "Ракета", photo: UIImage(named: "baklajan"), description: "Вид многолетних травянистых растений рода Паслён (Solanum). Возделывается как однолетнее растение. Съедобен только плод. В ботаническом смысле это ягода, в кулинарном рассматривается как овощ.", plantClass: .vegetable, maturationTime: 67, landingDate: Date(), squareOfPlant: 0.3, yield: 220),
            Plant(name: "Клубника", sort: "Украинская", photo: UIImage(named: "strawberry"), description: "Сладкая ягода крассного цвета, растет на кустах.", plantClass: .berry, maturationTime: 79, landingDate: Date(), squareOfPlant: 0.6, yield: 8)
        ]
    }
}
