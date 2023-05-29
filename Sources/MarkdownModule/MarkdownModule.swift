//
//  File.swift
//  
//
//  Created by Tibor Bodecs on 2021. 12. 21..
//

import FeatherCore
import Vapor

struct MarkdownModule: FeatherModule {
    
    func boot(_ app: Application) throws {
        app.hooks.register(.filters, use: filtersHook)
    }
    
    func filtersHook(args: HookArguments) -> [FeatherFilter] {
        [
            MarkdownFilter()
        ]
    }
}
