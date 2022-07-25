//
//  Request.swift
//  webmotors
//
//  Created by Nadilson Santana on 7/24/22.
//

import UIKit
import Alamofire

class Request: NSObject {
    
    func getListCar(page: Int, completion: @escaping ([CarModel]?, Bool) -> Void) {
        let param = ["Page":page]
        
        AF.request("https://desafioonline.webmotors.com.br/api/OnlineChallenge/Vehicles", method: .get, parameters: param).response { response in
            do {
                let carModel = try JSONDecoder().decode([CarModel].self, from: response.data ?? Data())
                completion(carModel, true)
            } catch {
                print("error")
                completion(nil, false)
            }
        }
    }
}
