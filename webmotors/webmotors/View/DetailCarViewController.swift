//
//  DetailCarViewController.swift
//  webmotors
//
//  Created by Nadilson Santana on 7/25/22.
//

import UIKit

class DetailCarViewController: UIViewController {

    @IBOutlet weak var carImage: UIImageView!
    @IBOutlet weak var amountCar: UILabel!
    @IBOutlet weak var titleCar: UILabel!
    @IBOutlet weak var descritionCar: UILabel!
    @IBOutlet weak var yearCar: UILabel!
    @IBOutlet weak var kmCar: UILabel!
    @IBOutlet weak var colorCar: UILabel!
    
    let  viewModel = DetailCarViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    func setupView() {
        carImage.sd_setImage(with: URL(string: viewModel.carImage))
        amountCar.text = viewModel.amountCar
        titleCar.text = viewModel.titleCar
        descritionCar.text = viewModel.descritionCar
        yearCar.text = viewModel.yearCar
        kmCar.text = viewModel.kmCar
        colorCar.text = viewModel.colorCar
    }
}
