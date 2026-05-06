//
//  APIInfoView.swift
//  SteamUser
//
//  Created by GRAY, VIKTOR on 4/27/26.
//

import SwiftUI

struct APIInfoView: View {
    var body: some View {
        VStack {
            Text("About the API!")
                .bold()
                .font(.largeTitle)
                .padding(.bottom, 20)
            
            Text("Link: https://playerdb.co/api/player/steam/")
            Text("Where I found the link: https://playerdb.co/")
            
            Text("App Developer: W. Viktor Gray")
                .bold()
                .padding(.top, 20)
        }
    }
}

#Preview {
    APIInfoView()
}
