//
//  DetailCarViewModel.swift
//  webmotors
//
//  Created by Nadilson Santana on 7/25/22.
//

import UIKit

class DetailCarViewModel: NSObject {

    var carModel: CarModel?
    
    var carImage: String {
        return carModel?.image.replacingOccurrences(of: "http", with: "https") ?? ""
    }
    
    var amountCar: String {
        return carModel?.price ?? ""
    }
    
    var titleCar: String {
        return carModel?.make ?? ""
    }
    
    var descritionCar: String {
        return carModel?.version ?? ""
    }
    
    var yearCar: String {
        return "\(carModel?.yearFab ?? 0)/\(carModel?.yearModel ?? 0)"
    }
    
    var kmCar: String {
        return "\(carModel?.km.description ?? "")km"
    }
    
    var colorCar: String {
        return carModel?.color ?? ""
    }

    func setCarModel(carModel: CarModel?) {
        self.carModel = carModel
    }
    
}
