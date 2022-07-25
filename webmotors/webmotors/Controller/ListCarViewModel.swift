//
//  ListCarController.swift
//  webmotors
//
//  Created by Nadilson Santana on 7/24/22.
//

import Foundation

enum ListCarString: String {
    case xibCellName = "ListCarTableViewCell"
    case cellReuse = "cell"
    case detailCarViewController = "detailCar"
}

class ListCarViewModel: NSObject {
    
    private let request = Request()
    private var carModel: [CarModel]?
    private var page = 1
    private var isLockRequest = false
    
    var numberOfRow: Int {
        return carModel?.count ?? 0
    }
    
    func addPage() {
        page = page + 1
    }
    
    func getCarModel(indexPath: IndexPath) -> CarModel? {
        return carModel?[indexPath.row]
    }
    
    func getCarList(completion: @escaping (Bool) -> Void) {
        request.getListCar(page: 1) { carModel, success in
            self.carModel = carModel
            completion(success)
        }
    }
    
    func getCarPageList(page: Int, completion: @escaping (Bool) -> Void) {
        request.getListCar(page: page) { carModel, success in
            if success {
                if let carModel = carModel {
                    self.carModel?.append(contentsOf: carModel)
                }
            }
            completion(success)
        }
    }
    
    func getMoreContent(completion: @escaping (Bool) -> Void) {
        if !isLockRequest {
            isLockRequest = true
            addPage()
            getCarPageList(page: page) { success in
                self.isLockRequest = false
                completion(success)
            }
        }
    }
}
