//
//  HeroService.swift
//  SuperHeroGuide
//
//  Created by Muharrem Köroğlu on 2.04.2023.
//

import Foundation
import Alamofire

class HeroWebService {
    
    private let baseUrl : String = "https://www.superheroapi.com/api.php/2075508925975907/"
    
    func fetchHeroDataWithAF (path : HeroPath, isSuccess : @escaping (HeroModel) -> Void) {
        AF.request(baseUrl + path.rawValue).responseDecodable(of:HeroModel.self) { response in
            switch response.result {
            case.failure(let error):
                print(error)
            case.success(let model):
                isSuccess(model)
            }
        }
    }
     
}

enum HeroPath : String {
    case falcon = "251"
    case flash = "263"
    case aquaman = "38"
    case punisher = "530"
    case batman = "69"
    case hellcat = "323"
    case ironMan = "346"
    case spiderMan = "620"
    case captainAmerica = "149"
    case superMan = "644"
    case thor = "659"
    case venom = "687"
    case deadPool = "213"
    case doctorStrange = "226"
    case wolverine = "717"
    case wonderWoman = "720"
}

