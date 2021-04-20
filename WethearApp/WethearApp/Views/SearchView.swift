//
//  SearchView.swift
//  WethearApp
//
//  Created by Hiram Castro on 16/04/21.
//

import SwiftUI

struct SearchView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    @ObservedObject var locationServices : locationService
    
    var body: some View {
        
        NavigationView {
            VStack {
                SearchBar(locationServices: locationServices)
                
                List(locationServices.searchResults, id: \.key) { result in
                    
                    CityCellView(locationResult: result, selectedLocation: $locationServices.selectedlocation)
                    
                }
                .onTapGesture {
                    presentationMode.wrappedValue.dismiss()
                }
            }
            .navigationBarTitle(Text("Search Location"))
        }
        
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView(locationServices: locationService())
    }
}
