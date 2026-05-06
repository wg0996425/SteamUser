//
//  BrowseView.swift
//  SteamUser
//
//  Created by GRAY, VIKTOR on 4/27/26.
//

import SwiftUI

struct BrowseView: View {
    @StateObject private var viewModel = BrowseViewModel()
    @State var users: [String] = ["76561198311863239", "76561198354688087", "76561198862400763", "76561198994196927", "n3kodashdev", "76561198834652405"]
    
    @State var userIDInput: String = ""
    @State var selectedUser: Player? = nil
    
    
    var body: some View {
        TabView{
            NavigationStack {
                Text("BEST Steam Users")
                    .bold(true)
                    .font(.largeTitle)
                ScrollView {
                    VStack {
                        LazyVGrid(columns: Array(repeating: GridItem(), count: 1)) {
                            ForEach(users, id: \.self) { uid in
                                UserIcon(viewModel: viewModel, uid: uid)
                                    .contentShape(Rectangle())
                                    .onTapGesture {
                                        selectedUser = viewModel.users[uid]
                                    }
                            }
                        }
                    }
                    .padding()
                    
                }
//                VStack {
//                    TextField("Enter SteamID...", text: $userIDInput)
//                        .padding(.leading, 10)
//                        .padding(.trailing, 10)
//                    Button("Search & Add") {
//                        if !userIDInput.isEmpty[{
//                            users.append(userIDInput)
//                            userIDInput = ""
//                        }
//                    }
//                    .padding(10)
//                }
            }
            .fullScreenCover(item: $selectedUser) { user in
                DetailView(viewModel: viewModel, user: user)
            }
            .tabItem {
                Label("Browse", systemImage: "house")
            }
            
            DeveloperView()
                .tabItem {
                    Label("Developer", systemImage: "person.text.rectangle.fill")
                }
            
            APIInfoView()
                .tabItem {
                    Label("API Info", systemImage: "info.circle")
                }
        }
    }
}

#Preview {
    BrowseView()
}
