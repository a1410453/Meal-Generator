//
//  ContentView.swift
//  Meal Generator
//
//  Created by Rustem Orazbayev on 7/3/23.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @StateObject private var mealGenerator = MealGenerator()
    
    var actionButton: some View {
        Button("Get Random Meal"){
            mealGenerator.fetchRandomMeal()
        }.foregroundColor(.white)
            .padding()
            .background(Color.blue)
            .cornerRadius(16)
            .onAppear{
                mealGenerator.fetchRandomMeal()
            }
    }
    
    var body: some View{
        ScrollView{
            VStack{
                actionButton
                if let name = mealGenerator.currentMeal?.name{
                    Text(name).font(.largeTitle)
                }
                AsyncImageView(urlString: $mealGenerator.currentImageURLString)
                
                
                if let ingredients = mealGenerator.currentMeal?.ingredients {
                    HStack{
                        Text("Ingredients:").font(.title2)
                        Spacer()
                    }
                    ForEach(ingredients, id: \.self) { ingredient in
                        HStack{
                            Text(ingredient.name + " - " + ingredient.measure)
                            Spacer()
                        }
                    }
                }
                
                Divider()
                
                if let instructions = mealGenerator.currentMeal?.instructions {
                    HStack{
                        
                        Text("Instructions:").font(.title2)
                        Spacer()
                    }
                    Text(instructions)
                    
                }
                
            }.padding()
        }
    }
  
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
