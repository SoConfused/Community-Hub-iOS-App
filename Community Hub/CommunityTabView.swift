//
//  CommunityTabView.swift
//  Community Hub
//
//  Created by csuftitan on 6/27/22.
//

import SwiftUI

struct CommunityTabView: View {
    @StateObject var manager = CommunityPost()

    var body: some View {
        NavigationView {
            TabView {
                CommunityPostList()
                    .tabItem {
                        Image(systemName: "info")
                        Text("View Post")
                    }
                VolunteerView()
                    .tabItem {
                        Image(systemName: "person")
                        Text("View Profile")
                    }
                CommunityPostView()
                    .tabItem {
                        Image(systemName: "plus")
                        Text("Create Post")
                    }
            }.environmentObject(manager)
        }.navigationBarHidden(true)
    }
}

struct CommunityTabView_Previews: PreviewProvider {
    static var previews: some View {
        CommunityTabView()
    }
}
