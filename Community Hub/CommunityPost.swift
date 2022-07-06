//
//  CommunityPost.swift
//  Community Hub
//
//  Created by csuftitan on 6/8/22.
//

import Foundation

class CommunityPost: ObservableObject {
    @Published var posts: [Post] = []

    init() {
        posts.append(Post(title: "Titan hall", body: "Help out at the Titan Hall!", time: "January 10, 2022 - 10:00AM", location: "800 N State College Blvd., Fullerton CA 92831"))
        posts.append(Post(title: "Titan gym", body: "Recruiting new manager position at the Titan gym!", time: "May 20, 2022 - 12:00PM", location: "Gymnasium Campus Dr. Fullerton, CA 92831"))
    }
}

struct Post: Identifiable {
    /// The Identifiable protocol requires an id property that should be a unique value
    /// UUID generates a unique random hexadecimal string
    var id = UUID()
    var title: String
    var body: String
    var time: String
    var location: String
}
