//
//  BarGraph.swift
//  BakingUI
//
//  Created by Caio Castro on 25/05/2022.
//

import SwiftUI

struct BarGraph: View {
    
    var downloads: [Download]
    @GestureState var isDragging: Bool = false
    @State var offest: CGFloat = 0
    @State var currentDownloadID: String = ""
    
    
    var body: some View {
        HStack(spacing: 10) {
            ForEach(downloads) {download in
                CardView(download: download)
            }
        }
        .frame(height: 150)
        .animation(.easeOut, value: isDragging)
        .gesture(
            DragGesture()
                .updating($isDragging, body: {_, out, _ in
                    out = true
                })
                .onChanged({value in
                    offest = isDragging ? value.location.x : 0
                    let draggingSpace = UIScreen.main.bounds.width - 60
                    let eachBlock = draggingSpace / CGFloat(downloads.count)
                    let temp = Int(offest / eachBlock)
                    let index = max(min(temp, downloads.count - 1), 0)
                    self.currentDownloadID = downloads[index].id
                })
                .onEnded( {value in
                    withAnimation {
                        offest = .zero
                        currentDownloadID = ""
                }
            })
        )
    }
    @ViewBuilder
    func CardView(download: Download) -> some View {
        VStack(spacing: 20) {
            GeometryReader {proxy in
                let size = proxy.size
                RoundedRectangle(cornerRadius: 6)
                    .fill(download.color)
                    .opacity(isDragging ? (currentDownloadID == download.id ? 1 : 0.35) : 1)
                    .frame(height: (download.downloads / getMax()) * (size.height))
                    .overlay(
                        Text("\(Int(download.downloads))")
                            .font(.callout)
                            .foregroundColor(download.color)
                            .opacity(isDragging && currentDownloadID == download.id ? 1 : 0)
                            .offset(y: -30)
                        ,alignment: .top
                        )
                    .frame(maxHeight: .infinity, alignment: .bottom)
            }
            Text(download.day)
                .font(.callout)
                .foregroundColor(isDragging && currentDownloadID == download.id ? download.color : .gray)
        }
    }
    func getMax() -> CGFloat {
        let max = downloads.max { first, second in
            return second.downloads > first.downloads
        }
        return max?.downloads ?? 0
    }
}

