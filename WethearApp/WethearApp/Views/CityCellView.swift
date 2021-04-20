//
//  CityCellView.swift
//  WethearApp
//
//  Created by Hiram Castro on 19/04/21.
//

import SwiftUI

struct CityCellView: View {
    
    var locationResult:LocationModel?
    
    @Binding var selectedLocation: LocationModel?
    
    var body: some View {
        
        VStack(alignment: .leading) {
            Text(locationResult?.localizedName ?? "")
                .foregroundColor(.primary)
            
            Text("\(locationResult?.administrativeArea.localizedName ?? "") , \(locationResult?.country.localizedName ?? "")")
                .font(.callout)
                .foregroundColor(.secondary)
        }
        .onTapGesture {
            selectedLocation = locationResult
        }
        .padding(.horizontal, 10)
        
    }
}

struct CityCellView_Previews: PreviewProvider {
    @State static var location: LocationModel?
    
    static var previews: some View {
        CityCellView(locationResult: LocationModel.mock(), selectedLocation: $location)
    }
}
