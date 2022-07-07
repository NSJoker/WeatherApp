//
//  SearchView.swift
//  WeatherAppCombine
//
//  Created by Chandrachudh on 06/07/22.
//

import SwiftUI

struct SearchView: View {
    @Binding var searchtext: String
    let placeHolder: String
    
    @State private var isEditing = false
    
    var body: some View {
        HStack {
            // MARK: Textfield for search
            SearchEditorView(searchtext: $searchtext, isEditing: $isEditing, placeHolder: placeHolder)
                .frame(maxWidth: .infinity, maxHeight: 44)
                .background(Color("Search Background"))
                .cornerRadius(12.0)
            
            // MARK: Cancel Button
            if isEditing || !searchtext.trimmingCharacters(in: .whitespaces).isEmpty {
                Button("Cancel") {
                    searchtext = ""
                    UIApplication.endEditing()
                }
                .foregroundColor(.white)
            }
        }
    }
}

struct SearchEditorView: View {
    @Binding var searchtext: String
    @Binding var isEditing: Bool
    let placeHolder: String
    
    var body: some View {
        ZStack(alignment: .leading, content: {
            if searchtext.isEmpty {
                Text(placeHolder)
                    .foregroundColor(.white.opacity(0.7))
                    .padding(.leading, 50)
            }
            
            HStack(spacing: 0, content: {
                // MARK: Search icon
                Image(systemName: "magnifyingglass")
                    .padding(.leading)
                    .foregroundColor(.white)
                
                // MARK: Search Textfield
                TextField("",
                          text: $searchtext,
                          onEditingChanged: { changed in
                    self.isEditing = changed
                })
                .padding()
                .foregroundColor(.white)
            })
        })
    }
}
