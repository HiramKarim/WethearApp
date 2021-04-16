//
//  WeatherView.swift
//  WethearApp
//
//  Created by Hiram Castro on 16/04/21.
//

import SwiftUI

struct WeatherView: View {
    
    @ObservedObject var locationServices = locationService()
    @State private var showSearchView = false
    
    var body: some View {
        
        NavigationView {
            VStack {
                
            }
            .navigationBarItems(trailing:
                                    Button(action: {
                                        showSearchView.toggle()
                                    }, label: {
                                        Image(systemName: "magnifyingglass")
                                            .resizable()
                                            .frame(width: 20, height: 20)
                                    }))
            .sheet(isPresented: $showSearchView, content: {
                SearchView(locationServices: locationServices)
            })
        }
        
    }
}

struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView()
    }
}
