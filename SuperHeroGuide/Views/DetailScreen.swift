//
//  DetailScreen.swift
//  SuperHeroGuide
//
//  Created by Muharrem Köroğlu on 7.04.2023.
//

import SwiftUI

struct DetailScreen: View {
    
    var selectedHero : HeroViewModel
    
    var body: some View {
        NavigationStack{
            ZStack{
                Color.black
                    .ignoresSafeArea()
                ScrollView{
                    VStack{
                        AsyncImage(url: URL(string: selectedHero.image)) { image in
                            image.resizable()
                                .frame(width: 150, height: 150)
                                .clipShape(Circle())
                                .overlay(Circle().stroke(LinearGradient(colors: [Color.purple,Color.pink], startPoint: .leading, endPoint: .trailing),lineWidth: 5))
                        }placeholder: {
                            ProgressView()
                        }.padding(.bottom)
                        Text(selectedHero.name)
                            .font(.largeTitle)
                            .foregroundColor(.white)
                            .fontWeight(.bold)
                            .padding(.bottom)
                            
                        Text(selectedHero.realName)
                            .font(.title3)
                            .foregroundColor(.white)
                            .fontWeight(.bold)
                            .padding(.bottom)
                        Text(selectedHero.birthPlace)
                            .font(.title3)
                            .foregroundColor(.white)
                            .fontWeight(.bold)
                            .padding(.bottom,50)
                        HStack{
                            Spacer()
                            AppearanceSection(sectionName: "Gender", heroAppearance: selectedHero.gender)
                            Spacer()
                            AppearanceSection(sectionName: "Height", heroAppearance: selectedHero.height)
                            Spacer()
                            AppearanceSection(sectionName: "Weight", heroAppearance: selectedHero.weight)
                            Spacer()
                        }
                        VStack{
                            Text("Power Status")
                                .foregroundColor(.white)
                                .font(.title2)
                                .padding(.top,25)
                            Rectangle()
                                .frame(width: 130, height: 1)
                                .foregroundColor(.white)
                                .padding(.bottom,10)
                            
                            HStack{
                                Spacer()
                                PowerStatusSection(sectionName: "Intelligence", powerStatusBarPercentage: selectedHero.intelligence)
                                Spacer()
                                PowerStatusSection(sectionName: "Strenght", powerStatusBarPercentage: selectedHero.strenght)
                                Spacer()
                                PowerStatusSection(sectionName: "Speed", powerStatusBarPercentage: selectedHero.speed)
                                Spacer()
                            }.padding(.bottom,15)
                            HStack{
                                Spacer()
                                PowerStatusSection(sectionName: "Durability", powerStatusBarPercentage: selectedHero.durability)
                                Spacer()
                                PowerStatusSection(sectionName: "Power", powerStatusBarPercentage: selectedHero.power)
                                Spacer()
                                PowerStatusSection(sectionName: "Combat", powerStatusBarPercentage: selectedHero.combat)
                                    
                                Spacer()
                            }
                        }
                    }
                }
            }
        }.toolbarBackground(Color.black, for: .navigationBar)
           
    }
}


struct AppearanceSection : View {
    
    var sectionName : String
    var heroAppearance : String
    
    var body: some View{
        VStack{
            Text(sectionName)
                .font(.title2)
                .foregroundColor(.white)
            Rectangle()
                .frame(width: 70, height: 1)
                .foregroundColor(.white)
            Text(heroAppearance)
                .font(.title3)
                .foregroundColor(.white)
                .fontWeight(.bold)
        }
    }
}

struct PowerStatusSection : View {
    
    var sectionName : String
    var powerStatusBarPercentage : String
    
    var body : some View {
        VStack{
            Text(sectionName)
                .font(.system(size: 20))
                .foregroundColor(.white)
                .fontWeight(.bold)
            Rectangle()
                .frame(width: 100, height: 1)
                .foregroundColor(.white)
                .padding(.bottom,10)
            PowerStatusBar(percent: Double(powerStatusBarPercentage)!,textSize: 20, textColor: .white, strokeLineWidth: 10,color1: .purple, color2: .pink)
                .frame(width: 70,height: 70)
            
        }
    }
}



struct DetailScreen_Previews: PreviewProvider {
    static var previews: some View {
        DetailScreen(selectedHero: HeroViewModel())
    }
}
