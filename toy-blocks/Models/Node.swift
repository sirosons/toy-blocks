//
//  nodes.swift
//  toy-blocks
//
//  Created by James Rhodes on 7/13/20.
//  Copyright © 2020 James Rhodes. All rights reserved.
//

import Foundation

class Node {
    var url: String
    var online:  Bool = false
    var name: String
    var loading: Bool = false
    var open: Bool = false
    var blocks: [Block]

    init(url: String, name: String) {
        self.url = url;
        self.name = name;
        self.blocks = [];
    }
}
