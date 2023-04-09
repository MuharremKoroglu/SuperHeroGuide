//
//  ContentView.swift
//  SuperHeroGuide
//
//  Created by Muharrem Köroğlu on 2.04.2023.
//
import SwiftUI


struct HomeScreen: View {
    
    @ObservedObject var ironMan = HeroViewModel()
    @ObservedObject var batman = HeroViewModel()
    @ObservedObject var falcon = HeroViewModel()
    @ObservedObject var flash = HeroViewModel()
    @ObservedObject var aquaman = HeroViewModel()
    @ObservedObject var punisher = HeroViewModel()
    @ObservedObject var hellcat = HeroViewModel()
    @ObservedObject var spiderMan = HeroViewModel()
    @ObservedObject var captainAmerica = HeroViewModel()
    @ObservedObject var superMan = HeroViewModel()
    @ObservedObject var thor = HeroViewModel()
    @ObservedObject var venom = HeroViewModel()
    @ObservedObject var deadpool = HeroViewModel()
    @ObservedObject var doctorStrange = HeroViewModel()
    @ObservedObject var wolverine = HeroViewModel()
    @ObservedObject var wonderWoman = HeroViewModel()
    
    
    var body: some View {
        NavigationStack{
            ZStack{
                Color.black
                    .ignoresSafeArea()
                ScrollView{
                        VStack{
                            Text("SuperHero Guide")
                                .foregroundColor(.white)
                                .font(.system(size: 40))
                                .bold()
                            HeroNavigationView(firstHero: ironMan, firstHeroName: ironMan.name, firstHeroImage: ironMan.image, secondHero: batman, secondHeroName: batman.name, secondHeroImage: batman.image)
                            HeroNavigationView(firstHero: falcon, firstHeroName: falcon.name, firstHeroImage: falcon.image, secondHero: flash, secondHeroName: flash.name, secondHeroImage: flash.image)
                            HeroNavigationView(firstHero: aquaman, firstHeroName: aquaman.name, firstHeroImage: aquaman.image, secondHero: punisher, secondHeroName: punisher.name, secondHeroImage: punisher.image)
                            HeroNavigationView(firstHero: hellcat, firstHeroName: hellcat.name, firstHeroImage: hellcat.image, secondHero: spiderMan, secondHeroName: spiderMan.name, secondHeroImage: spiderMan.image)
                            HeroNavigationView(firstHero: captainAmerica, firstHeroName: captainAmerica.name, firstHeroImage: captainAmerica.image, secondHero: superMan, secondHeroName: superMan.name, secondHeroImage: superMan.image)
                            HeroNavigationView(firstHero: thor, firstHeroName: thor.name, firstHeroImage: thor.image, secondHero: venom, secondHeroName: venom.name, secondHeroImage: venom.image)
                            HeroNavigationView(firstHero: deadpool, firstHeroName: deadpool.name, firstHeroImage: deadpool.image, secondHero: doctorStrange, secondHeroName: doctorStrange.name, secondHeroImage: doctorStrange.image)
                            HeroNavigationView(firstHero: wolverine, firstHeroName: wolverine.name, firstHeroImage: wolverine.image, secondHero: wonderWoman, secondHeroName: wonderWoman.name, secondHeroImage: wonderWoman.image)
  
                        }
                }
            }
        }.onAppear(){
            ironMan.getHeroData(path: .ironMan)
            batman.getHeroData(path: .batman)
            falcon.getHeroData(path: .falcon)
            flash.getHeroData(path: .flash)
            aquaman.getHeroData(path: .aquaman)
            punisher.getHeroData(path: .punisher)
            hellcat.getHeroData(path: .hellcat)
            spiderMan.getHeroData(path: .spiderMan)
            captainAmerica.getHeroData(path: .captainAmerica)
            superMan.getHeroData(path: .superMan)
            thor.getHeroData(path: .thor)
            venom.getHeroData(path: .venom)
            deadpool.getHeroData(path: .deadPool)
            doctorStrange.getHeroData(path: .doctorStrange)
            wolverine.getHeroData(path: .wolverine)
            wonderWoman.getHeroData(path: .wonderWoman)
        }
        
    }
    
}

struct HeroNavigationView : View {
    
    var firstHero : HeroViewModel
    var firstHeroName : String
    var firstHeroImage : String
    var secondHero : HeroViewModel
    var secondHeroName : String
    var secondHeroImage : String
    
    var body: some View {
        
        HStack{
            NavigationLink {
                DetailScreen(selectedHero: firstHero)
                
            } label: {
                HeroView(heroName: firstHeroName, heroImage: firstHeroImage)
                
            }
            NavigationLink {
                DetailScreen(selectedHero: secondHero)
            } label: {
                HeroView(heroName: secondHeroName, heroImage: secondHeroImage)
            }
        }
    }
}

struct HeroView : View {
    
    var heroName : String
    var heroImage : String
    
    var body : some View {
            Spacer()
                VStack{
                    AsyncImage(url: URL(string: heroImage)) { Image in
                        Image.resizable()
                            .frame(width: 150, height: 150)
                            .clipShape(Circle())
                            .overlay(Circle().stroke(LinearGradient(colors: [Color.purple,Color.pink], startPoint: .leading, endPoint: .trailing),lineWidth: 5))
                    }placeholder: {
                        ProgressView()
                    }.padding(.bottom)
                    Text(heroName)
                        .font(.title3)
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                        .padding(.bottom,20)
                }
            Spacer()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}




