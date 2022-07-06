//
//  signup_login.swift
//  Community Hub
//
//  Created by Alan Guan on 6/8/22.
//

import Foundation

class UserList: ObservableObject, Identifiable {
    @Published var userList: [SignUpInformation] = []

    @Published var currentUser: SignUpInformation

    init() {
        currentUser = SignUpInformation(username: "123",
                                        password: "abc",
                                        firstName: "Tuffy",
                                        lastName: "Titan",
                                        email: "123@csu.fullerton.edu",
                                        address: "9801 N Colima Rd",
                                        type: "Volunteer")

        userList.append(SignUpInformation(username: "tuffytitan",
                                          password: "123456abc",
                                          firstName: "Alan",
                                          lastName: "Guan",
                                          email: "tuffytitan@csu.fullerton.edu",
                                          address: "123 Fullerton Rd",
                                          type: "Volunteer"))

        userList.append(SignUpInformation(username: "x12345",
                                          password: "abcd",
                                          firstName: "Joe",
                                          lastName: "Wlliams",
                                          email: "jwilliams@csu.fullerton.edu",
                                          address: "8279 Broadway Ave.",
                                          type: "Recruiter"))
    }

    func addUsers(_ newUsername: String,
                  _ newPassword: String,
                  _ newFirstName: String,
                  _ newLastName: String,
                  _ newEmail: String,
                  _ newAddress: String,
                  _ newType: String)
    {
        // Adds a new user with their information to the users list.
        userList.append(SignUpInformation(username: newUsername,
                                          password: newPassword,
                                          firstName: newFirstName,
                                          lastName: newLastName,
                                          email: newEmail,
                                          address: newAddress,
                                          type: newType))

        print("addUsers() has be called.") // For debugging purposes, delete this line later
    }

    func loginValidation(_ inputUsername: String, _ inputPassword: String) -> Bool {
        // Loops through the users list and compare the username and passwords
        // that the user inputs, if they both exist within the same user in the users list
        // then the user is successfully validated and returns true.
        // Else just return false indicating the user is not registered,
        // or has entered an incorrect username or password.
        for user in userList {
            currentUser = user
            if user.username == inputUsername, user.password == inputPassword {
                currentUser = user
                return true
            }
        }
        return false
    }

    // For debugging purposes, delete this function later
    func printList() {
        for user in userList {
            print(user.username)
        }
    }
}

// Asks the user for their basic information
struct SignUpInformation: Identifiable {
    var id = UUID() // UUID() must be included as it conforms to the Identifiable protocol
    var username: String
    var password: String
    var firstName: String
    var lastName: String
    var email: String
    var address: String
    var type: String
}
