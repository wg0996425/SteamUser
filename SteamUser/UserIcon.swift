//
//  UserIcon.swift
//  SteamUser
//
//  Created by GRAY, VIKTOR on 5/1/26.
//

import SwiftUI

struct UserIcon: View {
    @ObservedObject var viewModel = BrowseViewModel()
    let uid: String
    
    var body: some View {
        ZStack {
            if let url = URL(string: viewModel.users[uid]?.avatar ?? ""){
                
                AsyncImage(url: url) { phase in
                    switch phase {
                    case .success(let image):
                        image
                            .resizable()
                            .scaledToFill()
                            .frame(width: 100, height: 100)
                            .clipShape(RoundedRectangle(cornerRadius: 20))
                            .padding(.trailing, 260)
                    case .failure:
                        EmptyView()
                    case .empty:
                        EmptyView()
                    @unknown default:
                        EmptyView()
                    }
                }
            }
            Text(viewModel.users[uid]?.username ?? "")
                .font(.title.bold())
                .padding(.leading, 60)
                .frame(maxWidth: 260, alignment: .leading)
                .foregroundStyle(.white)
                .onAppear {
                    viewModel.fetchData(userID: uid)
                }
        }
        .padding(10)
        .background(Color(.gray))
    }
}

#Preview {
    UserIcon(uid: "76561198354688087")
}
