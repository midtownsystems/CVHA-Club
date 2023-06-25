//
//  CVHA_ClubApp.swift
//  CVHA Club
//
//  Created by Steve Craig on 24/06/2023.
//

import SwiftUI

@main
struct CVHA_ClubApp: App {
    @StateObject private var dataController = DataController()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
