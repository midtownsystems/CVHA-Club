//
//  ContentView.swift
//  CVHA Club
//
//  Created by Steve Craig on 24/06/2023.
//

import SwiftUI

struct WebResultView: View {
    var choice: String
    
    var body: some View {
        Text("text goes here \(choice)")
    }
}

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack(spacing: 30) {
                NavigationLink(destination: WebResultView(choice: "Website View")){
                    Image(systemName: "globe")
                        .imageScale(.large)
                    Text("Website")
                        .navigationTitle("CVHA Website")
                        .navigationBarTitleDisplayMode(.inline)
                }
                NavigationLink(destination: WebResultView(choice: "Compose Post")){
                    Image(systemName: "pencil")
                        .imageScale(.large)
                    Text("Compose Form")
                        .navigationTitle("Compose")
                        .navigationBarTitleDisplayMode(.inline)
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
