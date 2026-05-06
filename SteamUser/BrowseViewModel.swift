//
//  BrowseViewModel.swift
//  SteamUser
//
//  Created by GRAY, VIKTOR on 4/27/26.
//
//  

import Combine
import SwiftUI

class BrowseViewModel: ObservableObject, Identifiable {
    @Published var users: [String: Player] = [:]

    func fetchData(userID: String) {
        guard let playerURL = URL(string: "https://playerdb.co/api/player/steam/\(userID)") else {
            print("Invalid URL")
            return
        }

        URLSession.shared.dataTask(with: playerURL) { data, response, error in
            if let error = error {
                print("Request failed: \(error.localizedDescription)")
                return
            }

            guard let data = data else {
                print("No data returned")
                return
            }

            do {
                let user = try JSONDecoder().decode(UserModel.self, from: data)

                DispatchQueue.main.async {
                    self.users[userID] = user.data.player
                }
            } catch {
                print("Decoding failed: \(error)")
            }
        }.resume()
    }
}
