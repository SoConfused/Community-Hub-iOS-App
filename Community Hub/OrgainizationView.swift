//
//  OrgainizationView.swift
//  Community Hub
//
//  Created by csuftitan on 6/19/22.
//

import SwiftUI

struct OrgainizationView: View {
    var body: some View {
        GeometryReader { geometry in
            VStack {
                Image("profile")
                    .resizable()
                    .scaledToFit()
                Text("Profile Name")
                    .modifier(G7Text())
            }.frame(
                width: geometry.size.width,
                height: geometry.size.height/4,
                alignment: Alignment.center
            )

            VStack {
                Spacer()
                Text("This is Org name")
                    .modifier(G7Text())
                Text("This is location")
                    .modifier(G7Text())
                Text("This is About Org")
                    .modifier(G7Text())
            }.frame(
                width: geometry.size.width,
                height: geometry.size.height/2,
                alignment: Alignment.center
            )
        }
    }
}

struct OrgainizationView_Previews: PreviewProvider {
    static var previews: some View {
        OrgainizationView()
    }
}
