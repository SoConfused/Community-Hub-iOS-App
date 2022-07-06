//
//  SignUpPage.swift
//  Community Hub
//
//  Created by Alan Guan on 6/20/22.
//

import Foundation
import SwiftUI

struct LogInPage: View {
    @EnvironmentObject var users: UserList
    @State var userName: String = ""
    @State var password: String = ""
    @State private var isShowingDetailView = false
    @State var displayLoginError: String = ""
    
    var body: some View {
        NavigationView {
            VStack {
                VStack {
                    Text("User Login").padding()
                    
                    HStack {
                        Spacer()
                        Text("Username: ")
                        TextField("Enter your username", text: $userName).modifier(TextFieldUnderLines())
                        Spacer()
                    }
                    HStack {
                        Spacer()
                        Text("Password:  ")
                        // SecureField() blurs out the characters for security
                        SecureField("Enter your password", text: $password).modifier(TextFieldUnderLines())
                        Spacer()
                    }
                    
                    // This text will pop up if a validation error occurs, otherwise it's just an empty string
                    Text("\(displayLoginError)").padding()
                    
                    HStack {
                        Spacer()

                        //                        NavigationLink(destination: LogInSuccess()) {
                        //                            Text("Log In").bold().padding() // Log in button directs user to their home page
                        //                        }
                        VStack {
                            // Version 2 for login navigation - if the username and password is correct,
                            // it redirects the user to the profile view,
                            // otherwise an error message will appear

                            NavigationLink(destination: CommunityTabView(), isActive: $isShowingDetailView) { EmptyView() }
                            Button("Login") {
                                if users.loginValidation(userName, password) == true {
                                    isShowingDetailView = true
                                }
                                else {
                                    users.printList()
                                    displayLoginError = "Validation failed, please try again."
                                }
                            }.modifier(ButtonDesign())
                       
                            //                            ///Version #1 for login validation - Login button is grayed out and will be unresponsive
                            //                            // until the user enters the correct username and password, then the button will turn blue
                            //                            // and is clickable for login.
                            //                            NavigationLink(destination: CommunityTabView(), isActive: $isShowingDetailView) {
                            //                                Text("Login")
                            //                            }.disabled(users.loginValidation(userName, password) == false)
                            //                             //.modifier(ButtonDesign())
                            
                        }.padding()
                        Spacer()
                    }
                    HStack {
                        Text("Don't have an account?")
                        NavigationLink(destination: SignUpForm()) {
                            Text("Sign Up").bold() // Sign up button directs the user to the sign up form
                        }
                    }
                    Spacer()
                }
            }
        }.navigationBarHidden(true)
    }
}
