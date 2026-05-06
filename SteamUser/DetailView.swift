//
//  DetailView.swift
//  SteamUser
//
//  Created by GRAY, VIKTOR on 4/27/26.
//

import SwiftUI

struct DetailView: View {
    @Environment(\.dismiss) var dismiss
    @ObservedObject var viewModel = BrowseViewModel()
    let user: Player
    
    var body: some View {
        VStack {
            Text("Steam ID: " + user.id)
                .bold(true)
            
            Text("Name: " + user.username)
                .bold(true)
                .font(.largeTitle)
            
            if let imageUrl = URL(string: user.avatar){
                AsyncImage(url: imageUrl)
            }
            
        }
        .padding(.bottom, 20)
        
        Button(action: {dismiss()}) {
            Text("Back")
                .font(.largeTitle)
                .foregroundStyle(.white)
                .padding()
                .background(.gray)
                .cornerRadius(20)
        }
    }
}

#Preview {
    DetailView(user: Player(id: "76561198354688087", avatar: "https://avatars.steamstatic.com/83e36d299525e02a065b85f87897e91e292f3de3_full.jpg", username: "Vii"))
}
