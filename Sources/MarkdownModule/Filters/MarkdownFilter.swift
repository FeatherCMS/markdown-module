//
//  File.swift
//  
//
//  Created by Tibor Bodecs on 2021. 12. 21..
//

import FeatherCore
import Vapor
import Ink

/// markdown filter
struct MarkdownFilter: FeatherFilter {

    /// unique key for the filter
    var key: String { "markdown" }
    /// label for the filter
    var label: String { "Markdown (Ink)" }

    /// render markdown content using the MarkdownParser method, then place the result into a center aligned div
    func filter(_ input: String, _ req: Request) async throws -> String {
        var parser = MarkdownParser()
        /// add support for blank links
        let linkModifier = Modifier(target: .links) { html, markdown in
            guard markdown.contains("|blank") else {
                return html
            }
            return html.replacingOccurrences(of: "|blank\">", with: "\" target=\"_blank\">")
        }
        parser.addModifier(linkModifier)
//        let modifier = Modifier(target: .images) { html, markdown in
//            return html.replacingOccurrences(of: "<img src", with: "<img class=\"\" src")
//        }
//        parser.addModifier(modifier)
        return parser.html(from: input.replacingOccurrences(of: "\r", with: "\n"))
    }
}
