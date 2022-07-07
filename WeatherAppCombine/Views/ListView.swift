//
//  ListView.swift
//  WeatherAppCombine
//
//  Created by Chandrachudh on 06/07/22.
//

import SwiftUI
import Combine

struct ListView: View {
    @Binding var citiesToShow: [CityViewModel]
    
    var body: some View {
        // MARK: ListView
        List {
            // MARK: List Rows
            ForEach(citiesToShow, id: \.self) { cityViewModel in
                ListViewRow(cityViewModel: cityViewModel)
            }
        }
        .listStyle(.plain)
    }
}

struct ListViewRow: View {
    @ObservedObject var cityViewModel: CityViewModel
    
    var body: some View {
        ZStack {
            // MARK: Row background shape
            Trapezoid()
                .fill(Color.weatherWidgetBackground)
                .frame(height: 145)
                .overlay{
                    Trapezoid()
                        .stroke(Color.clear, lineWidth: 1)
                }
            
            // MARK: Wather Infromation
            HStack {
                VStack(alignment: .leading, spacing: 5) {
                    // MARK: Temperature Labels
                    Text(cityViewModel.temperature)
                        .foregroundColor(.white)
                        .font(.system(size: 57, weight: .medium, design: .default))
                    HStack {
                        Text(cityViewModel.temperatureHigh)
                            .foregroundColor(.white.opacity(0.8))
                            .font(.system(size: 16, weight: .regular, design: .default))
                        Spacer()
                            .frame(width: 10)
                        Text(cityViewModel.temperatureLow)
                            .foregroundColor(.white.opacity(0.8))
                            .font(.system(size: 16, weight: .regular, design: .default))
                    }
                    
                    // MARK: City Name
                    Text(cityViewModel.cityInfo)
                        .foregroundColor(.white)
                        .font(.system(size: 17, weight: .medium, design: .default))
                }
                .padding()
                
                Spacer()
                // MARK: Weather Info
                VStack(spacing: -5, content: {
                    // MARK: Weather Image
                    AsyncImage(url: URL(string: cityViewModel.weatherPicURL)) { image in
                        image
                            .resizable()
                            .frame(maxWidth: 93)
                            .scaleEffect(CGSize(width: 1.9, height: 1.9))
                    } placeholder: {
                        ProgressView()
                            .progressViewStyle(.circular)
                            .frame(width: 93)
                    }
                    
                    Spacer()
                    
                    // MARK: Weather type
                    Text(cityViewModel.weatherDescription)
                        .foregroundColor(.white)
                        .font(.system(size: 17, weight: .medium, design: .default))
                })
                .padding()
                
            }
        }
        .listRowBackground(Color.clear)
        .listRowSeparator(.hidden)
    }
}

