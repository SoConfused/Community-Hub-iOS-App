//
//  Profile_UI.swift
//  Community Hub
//
//  Created by csuftitan on 6/13/22.
//

import SwiftUI

struct ProfileView: View {
    @State private var selection: String? = nil

    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                Text("Are you a Volunteer or an Orgainzation?")
                Spacer()

                NavigationLink(destination: VolunteerView(), tag: "A", selection: $selection) { EmptyView() }
                NavigationLink(destination: OrgainizationView(), tag: "B", selection: $selection) { EmptyView() }

                Button("Volunteer") {
                    selection = "A"
                }.padding().modifier(FM3Text())
                Button("Orgainization") {
                    selection = "B"
                }
                Spacer()
                Spacer()
                Spacer()
            }
//            .navigationTitle("Navigation")
        }.navigationBarHidden(true)
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}

struct FM3Text: ViewModifier {
    func body(content: Content) -> some View {
        content
        /*
            .border(Color.black)
            .foregroundColor(Color.black)
            .background(Color.green)
            .cornerRadius(1)
         */
    }
}
