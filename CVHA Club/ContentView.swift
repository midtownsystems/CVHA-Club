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
                NavigationLink(destination: ComposeFormView(choice: "Compose Post")){
                    Image(systemName: "square.and.pencil")
                        .imageScale(.large)
                    Text("Compose Form")
                        .navigationTitle("Compose")
                        .navigationBarTitleDisplayMode(.inline)
                }
                NavigationLink(destination: WebResultView(choice: "Document Editor")){
                    Image(systemName: "doc.text")
                        .imageScale(.large)
                    Text("Document Editor")
                        .navigationTitle("Document Editor")
                        .navigationBarTitleDisplayMode(.inline)
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

struct HelpResultView: View {
    var choice: String
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Text("Markdown Examples")
                Text("""
                    
Here are all the examples of a Markdown Post with examples of the various types of markup available.
---
layout: post.njk
title: Example Post with Content Types of Bulma CSS
tags: ['Temporary', 'Example']
description: Post with a selection of styles and options shown in Markdown
featuredImage: /_images/cvha-badge-default.png
date: 2023-04-24
---

# Title H1
## Title H2
### Title H3
#### Title H4
##### Title H5
###### Title H6

## Paragraphs

Note: Bulma CSS is the main formatting engine for the site

Etiam ut risus sagittis, posuere mi at, congue dui. Sed in turpis ut felis bibendum blandit non sit amet ipsum. Etiam mattis metus sed felis cursus ultricies. Donec varius lectus maximus orci mattis sagittis.

Donec quis turpis eu justo suscipit eleifend in at mi. Nulla at lectus molestie, blandit elit eu, eleifend sem. Nunc suscipit tincidunt consectetur.

## Bold, cursive and link
\\*\\*Bold\\*\\*, \\_cursive\\_ and \\[link](https://cvha.club/)

## Lists

- Donec quis turpis eu justo suscipit eleifend in at mi.
  - Nulla at lectus molestie, blandit elit eu, eleifend sem.
  - Nunc suscipit tincidunt consectetur.
- Integer et neque in purus pulvinar consequat vel quis arcu.
- Morbi porttitor blandit justo quis commodo.

1. Element 1
2. Element 2
3. Element 3
4. Element 4

## Images
![imagen](/_images/ClydeValleyHorseArchersMain.png)


## Table

| Item         | Price     | # In stock |
|--------------|-----------|------------|
| Juicy Apples | 1.99      | 7          |
| Bananas      | 1.89      | 5234       |

## Quotes

> Donec quis turpis eu justo suscipit eleifend in at mi. Nulla at lectus molestie, blandit elit eu, eleifend sem. Nunc suscipit tincidunt consectetur.

## Code

`console.log('Hello World')`

```
// tag <pre>
console.log('Hello World')
```

                    """)
                    .monospaced()
                    .font(.system(size: 12))
            }
        }
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
                    Picker("Tag", selection: $selectedPost) {
                        Text("Post").tag(TagType.post)
                        Text("Results").tag(TagType.results)
                        Text("About").tag(TagType.about)
                        Text("News").tag(TagType.news)
                    }
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
            }
        }
    }
}
