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
        loadMeals()
        setupUI()
    }
    
    func saveMeals() {
        //TODO: Save the meals
    }
    func loadMeals() {
        plants = Plant.loadSample()
    }
    
    func setupUI() {
        tableView.dataSource = self
        tableView.delegate = self
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
}
// MARK: - Custom Methods
extension ListViewController {
    func configure(cell: UITableViewCell, with plant: Plant) {

        cell.imageView?.image = plant.photo
        cell.textLabel?.text = plant.name
        cell.detailTextLabel?.text = plant.plantClass.rawValue
    }
}

// MARK: - Navigation
extension ListViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "DetailSegue" else { return }
        let controller = segue.destination as! DetailViewController
        guard let indexPath = tableView.indexPathForSelectedRow else { return }
        controller.plant = plants[indexPath.row]
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension ListViewController: UITableViewDelegate {
    
}
