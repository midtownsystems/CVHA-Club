//
//  ContentView.swift
//  CVHA Club
//
//  Created by Steve Craig on 24/06/2023.
//

import SwiftUI
import WebKit

struct WebResultView: View {
    var choice: String
    
    var body: some View {
        Text("Placeholder: Selection is \(choice)")
            .navigationTitle("\(choice)")
            .navigationBarTitleDisplayMode(.inline)
    }
}

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack(spacing: 60) {
                AdaptiveImage(light: Image("ClydeValleyHorseArchers Logo Black Small"), dark: Image("ClydeValleyHorseArchers Logo Orange Small")
                )
                NavigationLink(destination: WebSiteView()){
                    Image(systemName: "globe")
                        .imageScale(.large)
                    Text("Website")
                        .navigationTitle("Clyde Valley Horse Archers Club")
                }
                NavigationLink(destination: ComposeFormView(choice: "Write a Post")){
                    Image(systemName: "square.and.pencil")
                        .imageScale(.large)
                    Text("Write a Post")

                }
                NavigationLink(destination: WebResultView(choice: "Upload  Picture")){
                    Image(systemName: "camera")
                        .imageScale(.large)
                    Text("Upload Picture")
                }
                NavigationLink(destination: WebResultView(choice: "Document Editor")){
                    Image(systemName: "doc.text")
                        .imageScale(.large)
                    Text("Document Editor")
                }
                NavigationLink(destination: HelpResultView(choice: "Markdown Help")){
                    Image(systemName: "questionmark")
                        .imageScale(.large)
                    Text("Help Page")
                        .navigationTitle("Markdown Help")
                        .navigationBarTitleDisplayMode(.inline)
                }
                NavigationLink(destination: MerchSiteView()){
                    Image(systemName: "cart.fill")
                        .imageScale(.large)
                    Text("Merch")
                        .navigationTitle("Clyde Valley Horse Archers Merch")
                }
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct WebSiteView: UIViewRepresentable {

    func makeUIView(context: Context) -> WKWebView {
        WKWebView(frame: .zero)
    }

    func updateUIView(_ view: WKWebView, context: UIViewRepresentableContext<WebSiteView>) {

        let request = URLRequest(url: URL(string: "https://clydevalleyhorsearchers.org")!)

        view.load(request)
    }
}

struct MerchSiteView: UIViewRepresentable {

    func makeUIView(context: Context) -> WKWebView {
        WKWebView(frame: .zero)
    }

    func updateUIView(_ view: WKWebView, context: UIViewRepresentableContext<MerchSiteView>) {

        let request = URLRequest(url: URL(string: "https://clydevalleyhorsearchers.org")!)

        view.load(request)
    }
}

struct AdaptiveImage: View {
    @Environment(\.colorScheme) var colorScheme
    let light: Image
    let dark: Image

    @ViewBuilder var body: some View {
        if colorScheme == .light {
            light
        } else {
            dark
        }
    }
}

struct ComposeFormView: View {
    var choice: String
    enum TagType: String, CaseIterable, Identifiable {
        case post, results, about, news
        var id: Self { self }
    }
    @State private var selectedPost: TagType = .post
    
    @State private var layout = ""
    @State private var title = ""

    @State private var description = ""
    @State private var featuredImage = "/_images/cvha-badge-default.png"
    @State private var postDate = "2023-06-23"
    @State private var postBody = ""
    
    var body: some View {
        NavigationView {
            Form {
                Section{
                    Picker("Post Type", selection: $selectedPost) {
                        Text("Post").tag(TagType.post)
                        Text("Results").tag(TagType.results)
                        Text("About").tag(TagType.about)
                        Text("News").tag(TagType.news)
                    }
                    .pickerStyle(.segmented)
                } header: {
                    Text("Type of post")
                }
                Section {
                    TextField("Title", text: $title)
                    TextField("Description", text: $description)
                    TextField("Featured Image", text: $featuredImage)
                    TextField("Date", text: $postDate)
                }
                Section {
                    TextField("Post Body", text: $postBody, axis: .vertical)
                        .lineLimit(10...25)
                        
                }
                .navigationTitle("Write a Post (does not save)")
                .navigationBarTitleDisplayMode(.inline)
            }
        }
    }
}
