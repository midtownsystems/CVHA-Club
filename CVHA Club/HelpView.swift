//
//  HelpView.swift
//  CVHA Club
//
//  Created by Steve Craig on 25/06/2023.
//

import SwiftUI

struct HelpResultView: View {
    var choice: String
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Text(
"""
                    
Here is a sample Markdown Post with examples of the various types of markup available.  The Header is sectioned off and used to build the post.

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
\\*\\*Bold\\*\\*, \\_cursive\\_ and
\\[link](https://cvha.club/)

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
\\!\\[imagen](/_images/ClydeValleyHorseArchersMain.png)


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
"""
)
                .monospaced()
                .font(.system(size: 12))
            }
        }
        .navigationTitle("Markdown Examples")
        .navigationBarTitleDisplayMode(.inline)
    }
}
