//
//  CommunityPostView.swift
//  Community Hub
//
//  Created by csuftitan on 6/18/22.
//

import SwiftUI

struct CommunityPostList: View {
    @EnvironmentObject var manager: CommunityPost
    var body: some View {
        VStack {
            List {
                ForEach(manager.posts) {
                    posts in
                    VStack(alignment: .leading) {
                        Text(posts.title)
                            .font(.largeTitle)
                        Text(posts.location)
                            .font(.caption)
                        Text(posts.time)
                    }
                }.onDelete {
                    offset in
                    manager.posts.remove(atOffsets: offset)
                }
                .onMove {
                    offset, index in
                    manager.posts.move(fromOffsets: offset,
                                       toOffset: index)
                }
            }
            EditButton()
        }
    }
}

struct CommunityPostView: View {
    @SceneStorage("titleText") var titleText: String = ""
    @SceneStorage("bodyText") var bodyText: String = ""
    @SceneStorage("timeText") var timeText: String = ""
    @SceneStorage("locationText") var locationText: String = ""
    @EnvironmentObject var manager: CommunityPost

    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Text("Community Post Submission")
                        .bold()
                        .font(.system(size: 20))
                }
                .padding(.bottom, 30)
                HStack {
                    Text("Title")
                        .bold()
                    Spacer()
                }
                .padding(.bottom, 5)
                HStack {
                    TextField("Title", text: $titleText)
                        .border(Color.black)
                }
                .padding(.bottom, 20)
                HStack {
                    Text("Body")
                        .bold()
                    Spacer()
                }
                TextEditor(text: $bodyText)
                    .border(Color.black)
                HStack {
                    Text("Time")
                        .bold()
                    Spacer()
                }
                .padding(.bottom, 5)
                HStack {
                    TextField("Time", text: $timeText)
                        .border(Color.black)
                }
                .padding(.bottom, 20)
                HStack {
                    Text("Location")
                        .bold()
                    Spacer()
                }
                .padding(.bottom, 5)
                HStack {
                    TextField("Location", text: $locationText)
                        .border(Color.black)
                }
                .padding(.bottom, 20)
                Button(action: {
                    manager.posts.append(Post(title: titleText, body: bodyText, time: timeText, location: locationText))
                    titleText = ""
                    bodyText = ""
                    timeText = ""
                    locationText = ""
                }) {
                    Text("Submit")
                        .modifier(ButtonDesign())
                }
                .padding()
            }
        }
    }
}

struct CommunityPostView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            CommunityPostView()
                .previewInterfaceOrientation(.portraitUpsideDown)
        }
    }
}
