//
//  VolunteerView.swift
//  Community Hub
//
//  Created by csuftitan on 6/19/22.
//

import SwiftUI

struct VolunteerView: View {
    @EnvironmentObject var user: UserList

    var body: some View {
        GeometryReader { geometry in
            VStack {
                Image("profile")
                    .resizable()
                    .scaledToFit()
                    .padding()
                Spacer()

            }.frame(
                width: geometry.size.width,
                height: geometry.size.height,
                alignment: Alignment.center)

            VStack {
                HStack(alignment: .lastTextBaseline) {
                    Text("Profile Name: ")
                    Text(user.currentUser.username)
                }.padding()
                HStack(alignment: .lastTextBaseline) {
                    Text("First Name: ")
                    Text(user.currentUser.firstName)
                }.padding()
                HStack(alignment: .lastTextBaseline) {
                    Text("Last Name: ")
                    Text(user.currentUser.lastName)
                }.padding()
                HStack(alignment: .lastTextBaseline) {
                    Text("Email: ")
                    Text(user.currentUser.email)
                }.padding()

            }.frame(
                width: geometry.size.width,
                height: geometry.size.height,
                alignment: Alignment.bottomLeading)
                .modifier(G7Text())
        }
    }
}

struct VolunteerView_Previews: PreviewProvider {
    static var previews: some View {
        VolunteerView()
    }
}
