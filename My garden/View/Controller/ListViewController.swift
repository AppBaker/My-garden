//
//  ListViewController.swift
//  My garden
//
//  Created by Ivan Nikitin on 11/04/2019.
//  Copyright © 2019 Ivan Nikitin. All rights reserved.
//

import UIKit

class ListViewController: UIViewController, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    var plants = Plants.loadSample()
    
    //save
    let save = SaveToPlist()
    //    var isEditingOn: Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        navigationItem.leftBarButtonItem = editButtonItem
        title = plants.title
         
        if let data = try? Data(contentsOf: save.archiveURL) {
            if let decodetPlants = Plants(from: data) {
                plants = decodetPlants
            }
        }
    }
    override func setEditing(_ editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
        tableView.setEditing(editing, animated: true)
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "PlantCell", for: indexPath)
        configure(cell: cell, with: plant)
        return cell
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        
        let movedPlant = plants.remove(at: sourceIndexPath.row)
        plants.insert(movedPlant, at: destinationIndexPath.row)
        tableView.reloadData()
    }
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let deleteAction = UITableViewRowAction(style: .destructive, title: "Delete") { (action, indexPath) in
            self.plants.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            //            tableView.reloadData()
        }
        return [deleteAction]
    }
}
// MARK: - Custom Methods
extension ListViewController {
    
    func setupUI() {
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    /// Cell configurator
    ///
    /// - Parameters:
    ///   - cell: Cell for confing
    ///   - plant: Data for confing
    func configure(cell: UITableViewCell, with plant: Plant) {
        guard let cell = cell as? PlantListTableViewCell else { return }
        if plant.image == plant.id.description {
            cell.plantImageView.image = save.loadImageWithName(plant.image)
        } else {
            cell.plantImageView.image = UIImage(named: plant.image)
        }
        
        cell.nameLabel.text = plant.name + " (\(plant.plantClass.rawValue))"
        cell.sortLabel.text = "сорт - \"\(plant.sort)\""
        cell.dateOfPlantLabel.text = "Дата посева " + plant.displayLandingDate
        cell.harwestTimeLable.text = "Сбор урожая " + plant.displayMaturationDate
        cell.squareOfPlantLable.text = "Площадь: \(plant.squareOfPlant) соток"
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
        try? plants.encoded?.write(to: save.archiveURL, options: .noFileProtection)
    }
}
