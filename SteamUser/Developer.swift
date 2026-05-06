//
//  Developer.swift
//  SteamUser
//
//  Created by GRAY, VIKTOR on 5/4/26.
//

import SwiftUI

enum Developer: String, CaseIterable, Identifiable {
    
    var id: Developer { self }
    
    case steam = "Steam friend code"
    case discord = "Discord"
    case snapchat = "Snapchat"
    
    var icon: ImageResource {
        switch self {
        case .steam:
                .steam
        case .discord:
                .discord
        case .snapchat:
                .snapchat
        }
    }
    
    var user: String {
        switch self {
        case .steam:
            "394422359"
        case .discord:
            "___vee___."
        case .snapchat:
            "vee_028"
        }
    }
}
