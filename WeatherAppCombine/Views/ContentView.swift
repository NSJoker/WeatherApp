//
//  ContentView.swift
//  WeatherAppCombine
//
//  Created by Chandrachudh on 06/07/22.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var weatherViewModel = WeatherViewModel()
    // MARK: Main Boday
    var body: some View {
        ZStack {
            // MARK: Background Color
            Color.backgroundColor
                .ignoresSafeArea()
            VStack(alignment: .leading) {
                HStack {
                    // MARK: Title
                    Text("Weather")
                        .foregroundColor(.white)
                        .font(.custom("", size: 40))
                        .padding(.leading, 20)
                    Spacer()
                    .frame(width: 44, height: 44, alignment: .center)
                    .padding(.trailing, 20)
                    
                }
                
                // MARK: Search View
                SearchView(searchtext: $weatherViewModel.searchText, placeHolder: "Search your favorite city")
                    .padding([.leading, .trailing], 20)
                
                // MARK: List View
                ListView(citiesToShow: $weatherViewModel.citiesToShow)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
    }
}
