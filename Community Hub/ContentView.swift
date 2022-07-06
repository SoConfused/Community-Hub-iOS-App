//
//  ContentView.swift
//  Community Hub
//
//  Created by csuftitan on 6/8/22.
//
import SwiftUI

struct ContentView: View {
    @StateObject var manager = CommunityPost()

    var body: some View {
        LogInPage().environmentObject(UserList())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
