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
    @IBOutlet weak var sortLabel: UILabel!
    @IBOutlet weak var dateLable: UILabel!
    @IBOutlet weak var expectedYieldLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    @IBOutlet weak var topStackView: UIStackView!
    
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
        plantImage.image = plant.photo
        sortLabel.text = "Сорт - \"\(plant.sort)\""
        dateLable.text = """
        Дата посадки: \(plant.displayLandingDate)
        Дата сбора урожая: \(plant.displayMaturationDate)
        """
        expectedYieldLabel.text = """
            Ожидаемый урожай \(plant.expectedYield) Kg
            С площади \(plant.squareOfPlant) соток
        """
        descriptionLabel.text = plant.description

        
    }
    func updateUI(with size: CGSize){
        topStackView.axis = size.width < size.height ? .vertical :  .horizontal

    }
}
