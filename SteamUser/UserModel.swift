//
//  UserModel.swift
//  SteamUser
//
//  Created by GRAY, VIKTOR on 4/27/26.
//
//  FORMAT: user.data.player.id

import Foundation

struct UserModel: Decodable {
    let data: Data
}

struct Data: Decodable {
    let player: Player
}

struct Player: Identifiable, Decodable {
    let id: String
    let avatar: String
    let username: String
}
