//
//  Downloads.swift
//  BakingUI
//
//  Created by Caio Castro on 25/05/2022.
//

import SwiftUI

struct Download: Identifiable {
    var id = UUID().uuidString
    var downloads: CGFloat
    var day: String
    var color: Color
}

var weekDownloads: [Download] = [
    
    Download(downloads: 160, day: "S", color: Color("Green")),
    Download(downloads: 395, day: "M", color: Color("Blue")),
    Download(downloads: 140, day: "T", color: Color("Green")),
    Download(downloads: 100, day: "W", color: Color("Green")),
    Download(downloads: 240, day: "T", color: Color("Blue")),
    Download(downloads: 195, day: "F", color: Color("Green")),
    Download(downloads: 500, day: "S", color: Color("Blue")),
]
