//
//  Collabs.swift
//  BakingUI
//
//  Created by Caio Castro on 25/05/2022.
//

import SwiftUI

struct Collabs: Identifiable {
    var id = UUID().uuidString
    var image: String
    var description: String
    var amount: String
}

var collab: [Collabs] = [

    Collabs(image: "Stella", description: "Collab", amount: "$90"),
    Collabs(image: "CaioI", description: "Collab", amount: "$70"),
    Collabs(image: "CaioII", description: "Collab", amount: "$40"),
    Collabs(image: "Stella", description: "Collab", amount: "$100"),
    Collabs(image: "CaioII", description: "Collab", amount: "$60"),
    Collabs(image: "CaioI", description: "Collab", amount: "$290"),
]
