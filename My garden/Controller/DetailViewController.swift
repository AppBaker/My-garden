//
//  DetailViewController.swift
//  My garden
//
//  Created by Ivan Nikitin on 11/04/2019.
//  Copyright © 2019 Ivan Nikitin. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    var plant: Plant?

    @IBOutlet weak var plantImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var infoLabel: UILabel!
    @IBOutlet weak var topStackView: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        descriptionLabel.numberOfLines = 0
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        updateUI(with: size)
    }
    
}
// MARK: - Custom Methods
extension DetailViewController {
    func setupUI() {
        guard let plant = plant else { return }
        plantImage.image = plant.photo
        nameLabel.text = "(\(plant.plantClass.rawValue))"
        descriptionLabel.text = plant.description
        infoLabel.text = "Время созревания: \(plant.maturationTime) месяцев"
        title = "\(plant.name)"
    }
    func updateUI(with size: CGSize){
        topStackView.axis = size.width < size.height ? .vertical :  .horizontal
    }
}
