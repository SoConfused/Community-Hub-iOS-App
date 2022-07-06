//
//  Profile.swift
//  Community Hub
//
//  Created by csuftitan on 6/8/22.
//

import Foundation

struct Profile {
    var name: String
    var email: String

    init() {
        self.name = ""
        self.email = ""
    }

    init(name: String, email: String) {
        self.name = name
        self.email = email
    }
}
