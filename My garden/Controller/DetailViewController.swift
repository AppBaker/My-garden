//
//  DetailViewController.swift
//  My garden
//
//  Created by Ivan Nikitin on 11/04/2019.
//  Copyright © 2019 Ivan Nikitin. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    
    @IBOutlet weak var plantImage: UIImageView!
    @IBOutlet weak var sortLabel: UILabel!
    @IBOutlet weak var dateLable: UILabel!
    @IBOutlet weak var expectedYieldLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    @IBOutlet weak var topStackView: UIStackView!
    
    var plant: Plant?
    var plantIndex: IndexPath?
    let save = SaveToPlist()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        updateUI(with: size)
    }
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if view.frame.height > view.frame.width {
            topStackView.axis = .vertical
        } else {
            topStackView.axis = .horizontal
        }
    }
}
// MARK: - Custom Methods
extension DetailViewController {
    func setupUI() {
        
        guard let plant = plant else { return }
        title = plant.name
        
        if plant.image == plant.id.description {
            plantImage.image = save.loadImageWithName(plant.image)
        } else if plant.image == "addPhoto" {
            plantImage.image = UIImage(named: "noPhoto")
        } else {
            plantImage.image = UIImage(named: plant.image)
        }
        
        sortLabel.text = "sort - \"\(plant.sort)\""
        dateLable.text = """
        Sowing date: \(plant.displayLandingDate)
        Harvesting: \(plant.displayMaturationDate)
        """
        expectedYieldLabel.text = """
        Expected yield \(plant.expectedYield.toString()) kg
        From the square \(plant.squareOfPlant.toString()) sq.м
        """
        descriptionLabel.text = plant.description
        
        
    }
    func updateUI(with size: CGSize){
        topStackView.axis = size.width < size.height ? .vertical :  .horizontal
    }
}


// MARK: - Navigation
extension DetailViewController {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let plant = plant else { return }
        guard segue.identifier == "editPlantSegue" else { return }
        guard let plantIndex = plantIndex else { return }
        let controller = segue.destination as! AddNewPlantViewController
        
        controller.plant = plant
        controller.plantIndex = plantIndex
    }
}
