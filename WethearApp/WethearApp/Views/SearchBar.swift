//
//  SearchBar.swift
//  WethearApp
//
//  Created by Hiram Castro on 16/04/21.
//

import SwiftUI

struct SearchBar: View {
    
    @ObservedObject var locationServices : locationService
    @State private var searchText: String = ""
    
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .resizable()
                .frame(width: 15, height: 15)
            
            TextField("Enter location",
                      text: $searchText,
                      onEditingChanged: {_ in},
                      onCommit: {
                        locationServices.searchQuery = searchText
                      })
                .onChange(of: searchText) { value in
                    
                    if value.isEmpty {
                        locationServices.searchQuery = ""
                    }
                    
                }
                .foregroundColor(.primary)
            
            Button(action: {
                self.searchText = ""
            }, label: {
                Image(systemName: "xmark.circle.fill")
                    .opacity(searchText == "" ? 0 : 1)
            })
        }
        .padding(EdgeInsets(top: 10, leading: 15, bottom: 10, trailing: 15))
        .foregroundColor(.gray)
        .background(Color(.secondarySystemBackground))
        .cornerRadius(10.0)
        .padding(10)
    }
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        SearchBar(locationServices: locationService())
    }
}
