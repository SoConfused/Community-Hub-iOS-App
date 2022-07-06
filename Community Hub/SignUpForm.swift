//
//  SignUpForm.swift
//  Community Hub
//
//  Created by Alan Guan on 6/20/22.
//

import Foundation
import SwiftUI

struct SignUpForm: View {
    @SceneStorage("username") var username: String = ""
    @SceneStorage("password") var password: String = ""
    @SceneStorage("firstName") var firstName: String = ""
    @SceneStorage("lastName") var lastName: String = ""
    @SceneStorage("email") var email: String = ""
    @SceneStorage("address") var address: String = ""
    @SceneStorage("type") var type: String = ""
    @EnvironmentObject var user: UserList
    @State private var isShowingDetailView = false
    @Environment(\.presentationMode) var presentationMode // Used to go back to the previous view
    @State var signUpSuccess: String = ""

    var body: some View {
        VStack {
            Text("Sign Up Page")
            Text("Please fill in the following information").padding()
            HStack {
                Text("Username: ")
                TextField("", text: $username).modifier(TextFieldUnderLines())
            }
            HStack {
                Text("Password: ")
                TextField("", text: $password).modifier(TextFieldUnderLines())
            }
            HStack {
                Text("First Name: ")
                TextField("", text: $firstName).modifier(TextFieldUnderLines())
            }
            HStack {
                Text("Last Name: ")
                TextField("", text: $lastName).modifier(TextFieldUnderLines())
            }
            HStack {
                Text("Email Address: ")
                TextField("", text: $email).modifier(TextFieldUnderLines())
            }
            HStack {
                Text("Address: ")
                TextField("", text: $address).modifier(TextFieldUnderLines())
            }

            HStack {
                Text("Volunteer/Recruiter: ")
                TextField("", text: $type).modifier(TextFieldUnderLines())
            }

        }.padding()

        Spacer()
        VStack(alignment: .center) {
            Button("Complete Sign Up") {
                user.addUsers(username, password, firstName, lastName, email, address, type)
                username = ""
                password = ""
                firstName = ""
                lastName = ""
                email = ""
                address = ""
                type = ""
                signUpSuccess = "Successfully signed up!"
                // This line makes the current view go back to the previous view, in this case we go back to LogInPage()
                self.presentationMode.wrappedValue.dismiss()
            }.modifier(ButtonDesign())

            Text("\(signUpSuccess)").padding()

            Spacer()
        }
    }
}

struct SignUpComplete: View {
    var body: some View {
        VStack {
            Text("Your all set!")

            NavigationLink(destination: LogInPage()) {
                Text("Login in here")
            }
        }
    }
}
