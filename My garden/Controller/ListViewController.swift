//
//  ListViewController.swift
//  My garden
//
//  Created by Ivan Nikitin on 11/04/2019.
//  Copyright © 2019 Ivan Nikitin. All rights reserved.
//

import UIKit

class ListViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var plants = [Plant]()

    override func viewDidLoad() {
        super.viewDidLoad()
        plants = Plant.loadSample()
        setupUI()
    }
}

// MARK: - UITableViewDataSource
extension ListViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return plants.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = indexPath.row
        let plant = plants[row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "PlantCell", for: indexPath) as! PlantListTableViewCell
        cell.backgroundColor = indexPath.row % 2 == 0 ? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1) : #colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1)
        configure(cell: cell, with: plant)
        return cell
    }
    
}
// MARK: - Custom Methods
extension ListViewController {
    
    func setupUI() {
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    func configure(cell: PlantListTableViewCell, with plant: Plant) {
        if let image = plant.image {
            cell.plantImageView.image = image
        } else {
            cell.plantImageView.image = UIImage(named: plant.photo)
        }
        let formatter = NumberFormatter()
        formatter.usesSignificantDigits = true
        formatter.decimalSeparator = ","
        
        cell.nameLabel.text = plant.name + " (\(plant.plantClass.rawValue))"
        cell.sortLabel.text = "сорт - \"\(plant.sort)\""
        cell.dateOfPlantLabel.text = "Дата посева " + plant.displayLandingDate
        cell.harwestTimeLable.text = "Сбор урожая " + plant.displayMaturationDate
        cell.squareOfPlantLable.text = "Площадь посевов: \(plant.squareOfPlant) соток"
        cell.showsReorderControl = true
        
        
    }
}

// MARK: - Navigation
extension ListViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "DetailSegue" else { return }
        let controller = segue.destination as! DetailViewController
        guard let indexPath = tableView.indexPathForSelectedRow else { return }
        controller.plant = plants[indexPath.row]
        controller.plantIndex = indexPath
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    @IBAction func unwind(segue: UIStoryboardSegue) {
        guard segue.identifier == "addNewPlant" else { return }
        guard let controller = segue.source as? AddNewPlantViewController else { return }
        let plant = controller.plant
        if let plantIndex = controller.plantIndex {
            plants[plantIndex.row] = plant
            tableView.reloadRows(at: [plantIndex], with: .automatic)
        } else {
            let indexPath = IndexPath(row: plants.count, section: 0)
            plants.append(plant)
            tableView.insertRows(at: [indexPath], with: .automatic)
        }
    }
}

extension ListViewController: UITableViewDelegate {
    
}
