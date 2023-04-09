//
//  HeroViewModel.swift
//  SuperHeroGuide
//
//  Created by Muharrem Köroğlu on 2.04.2023.
//

import Foundation


class HeroViewModel : ObservableObject{

    @Published var name : String = ""
    @Published var intelligence : String = ""
    @Published var strenght : String = ""
    @Published var speed : String = ""
    @Published var durability : String = ""
    @Published var power : String = ""
    @Published var combat : String = ""
    @Published var realName : String = ""
    @Published var birthPlace : String = ""
    @Published var gender : String = ""
    @Published var weight : String = ""
    @Published var height : String = ""
    @Published var image : String = ""
    
    let heroService = HeroWebService()
    
    func getHeroData (path : HeroPath) {
        heroService.fetchHeroDataWithAF(path: path, isSuccess: { model in
            DispatchQueue.main.async {
                self.name = model.name
                self.intelligence = model.powerstats.intelligence
                self.strenght = model.powerstats.strength
                self.speed = model.powerstats.speed
                self.durability = model.powerstats.durability
                self.power = model.powerstats.power
                self.combat = model.powerstats.combat
                self.realName = model.biography.fullName
                self.birthPlace = model.biography.placeOfBirth
                self.gender = model.appearance.gender
                self.weight = model.appearance.weight[1]
                self.height = model.appearance.height[1]
                self.image = model.image.url

            }
        }) 
    }
    
}

