//
//  CVHA_EditorDocument.swift
//  CVHA Editor
//
//  Created by Steve Craig on 23/06/2023.
//

import SwiftUI
import UniformTypeIdentifiers

extension UTType {
    static var exampleText: UTType {
        UTType(importedAs: "com.example.plain-text")
    }
}

struct CVHA_EditorDocument: FileDocument {
    var text: String

    init(text: String = """
---
layout: post.njk
title: Your Post Title
tags: ['Post']
description: Edit this to give a post description
featuredImage: /_images/cvha-badge-default.png
date: 2023-07-24
---

Edit the rest of this to put in what you want.

# Title H1

**Bold**, _cursive_ and [link](https://www.11ty.dev/)

## Lists

- Donec quis turpis eu justo suscipit eleifend in at mi.
  - Nulla at lectus molestie, blandit elit eu, eleifend sem.
  - Nunc suscipit tincidunt consectetur.
- Integer et neque in purus pulvinar consequat vel quis arcu.
- Morbi porttitor blandit justo quis commodo.

## Images
![imagen](/_images/ClydeValleyHorseArchersMain.png)

""") {
        self.text = text
    }

    static var readableContentTypes: [UTType] { [.exampleText] }

    init(configuration: ReadConfiguration) throws {
        guard let data = configuration.file.regularFileContents,
              let string = String(data: data, encoding: .utf8)
        else {
            throw CocoaError(.fileReadCorruptFile)
        }
        text = string
    }
    
    func fileWrapper(configuration: WriteConfiguration) throws -> FileWrapper {
        let data = text.data(using: .utf8)!
        return .init(regularFileWithContents: data)
    }
}
