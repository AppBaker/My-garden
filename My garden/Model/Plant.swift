//
//  Plant.swift
//  My garden
//
//  Created by Ivan Nikitin on 11/04/2019.
//  Copyright © 2019 Ivan Nikitin. All rights reserved.
//

import UIKit

enum PlantClass {
    case vegetable, fruit, berry, grass
}

struct Plant {
    var name: String
    var photo: UIImage?
    var description: String
    var plantClass: PlantClass
    var maturationTime: Double
}

extension Plant {
    func loadSample() -> [Plant] {
        return [
            Plant(name: "Укроп", photo: UIImage(named: "ukrop"), description: "В диком виде произрастает в Малой Азии, Северной Африке, Иране, Гималаях. Как культивируемое и сорное растение — повсеместно на всех континентах.", plantClass: .grass, maturationTime: 1.5),
            Plant(name: "Баклажан", photo: UIImage(named: "baklajan"), description: " Вид многолетних травянистых растений рода Паслён (Solanum). Возделывается как однолетнее растение. Съедобен только плод. В ботаническом смысле это ягода, в кулинарном рассматривается как овощ.", plantClass: .vegetable, maturationTime: 2.3),
            Plant(name: "Морковь", photo: UIImage(named: "carrots"), description: "Двулетнее растение, подвид вида морковь дикая. Обычно в быту под словом «морковь» подразумевается широко распространенный корнеплод именно этого растения", plantClass: .vegetable, maturationTime: 2),
            Plant(name: "Огурец", photo: UIImage(named: "cucumber"), description: "Однолетнее травянистое растение, вид рода Огурец (Cucumis) семейства Тыквенные (Cucurbitaceae), овощная культура.", plantClass: .vegetable, maturationTime: 2.5),
            Plant(name: "Картофель", photo: UIImage(named: "potatoes"), description: "Вид многолетних клубненосных травянистых растений из рода Паслён (Solanum) семейства Паслёновые (Solanaceae). Клубни картофеля являются важным пищевым продуктом. Плоды ядовиты, в связи с содержанием в них соланина.", plantClass: .vegetable, maturationTime: 2.5),
            Plant(name: "Редис", photo: UIImage(named: "redis"), description: "Редис — съедобное растение и выращивается как овощ во многих странах мира. Его название происходит от лат. radix — корень.", plantClass: .vegetable, maturationTime: 1.7),
            Plant(name: "Клубника", photo: UIImage(named: "strawberry"), description: "Сладкая ягода крассного цвета, растет на кустах.", plantClass: .berry, maturationTime: 2.8),
        ]
    }
}
