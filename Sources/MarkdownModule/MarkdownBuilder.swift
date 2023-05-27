//
//  File.swift
//  
//
//  Created by Tibor Bodecs on 2021. 12. 27..
//

import FeatherCore

@_cdecl("createMarkdownModule")
public func createMarkdownModule() -> UnsafeMutableRawPointer {
    return Unmanaged.passRetained(MarkdownBuilder()).toOpaque()
}

public final class MarkdownBuilder: FeatherModuleBuilder {

    public override func build() -> FeatherModule {
        MarkdownModule()
    }
}
