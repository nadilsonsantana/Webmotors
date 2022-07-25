//
//  ListCarTableViewCell.swift
//  webmotors
//
//  Created by Nadilson Santana on 7/24/22.
//

import UIKit
import SDWebImage

class ListCarTableViewCell: UITableViewCell {

    @IBOutlet weak var backgroundCarView: UIView!
    @IBOutlet weak var carImage: UIImageView!
    @IBOutlet weak var amountCar: UILabel!
    @IBOutlet weak var titleCar: UILabel!
    @IBOutlet weak var descritionCar: UILabel!
    @IBOutlet weak var yearCar: UILabel!
    @IBOutlet weak var kmCar: UILabel!
    @IBOutlet weak var colorCar: UILabel!
        
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        backgroundCarView.layer.cornerRadius = 10
        backgroundCarView.layer.shadowRadius = 5
        backgroundCarView.layer.shadowOpacity = 0.6
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        
    }
    
    func setupCell(carModel: CarModel?) {
        carImage.sd_setImage(with: URL(string: carModel?.image.replacingOccurrences(of: "http", with: "https") ?? ""), placeholderImage: UIImage(named: "carImagePlaceHolder"))
        amountCar.text = carModel?.price
        titleCar.text = carModel?.make
        descritionCar.text = carModel?.version
        yearCar.text = "\(carModel?.yearFab ?? 0)/\(carModel?.yearModel ?? 0)"
        kmCar.text = "\(carModel?.km.description ?? "") km" 
        colorCar.text = carModel?.color
    }
}
