//
//  DeveloperView.swift
//  SteamUser
//
//  Created by GRAY, VIKTOR on 4/27/26.
//

import SwiftUI

struct DeveloperView: View {
    var body: some View {
        VStack {
            Text("About the developer!")
                .bold()
                .font(.largeTitle)
            
            Text("W. Viktor Gray. Class of 2026!")
                .padding(.bottom, 20)
            
            VStack {
                ForEach(Developer.allCases) { dev in
                    ZStack {
                        Image(dev.icon)
                            .resizable()
                            .frame(width: 30, height: 30)
                            .padding(.trailing, 325)
                        Text(dev.rawValue + ": ")
                            .frame(maxWidth: 280, alignment: .leading)
                            .bold()
                        Text(dev.user)
                            .frame(maxWidth: 340, alignment: .trailing)
                    }
                    .padding(5)
                }
            }
        }
    }
}

#Preview {
    DeveloperView()
}
