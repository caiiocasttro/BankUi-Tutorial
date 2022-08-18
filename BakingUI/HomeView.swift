//
//  HomeView.swift
//  BakingUI
//
//  Created by Caio Castro on 25/05/2022.
//MARK: 7:22 do tutorial

import SwiftUI

struct HomeView: View {
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: 15) {
                HStack(spacing: 15) {
                    Text("DashBoard")
                        .font(.system(size: 35, weight: .bold))
                        .padding(.leading, 20)
                    Spacer()
                    Button(action: {}, label: {
                        Image(systemName: "person")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 20, height: 20)
                    })
                        .padding(.trailing, 20)
                }
                .foregroundColor(.black)
                .padding(.top, 10)
                
                DownloadStats()
                FollowersStats()
                
                ScrollView(.vertical, showsIndicators: false) {
                    CollabView()
                }
            }
            .padding(10)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("BG").ignoresSafeArea())
    }
    @ViewBuilder
    func FollowersStats()->some View {
        VStack {
            HStack {
                Button(action: {}, label: {
                    Text("Show All")
                        .font(.caption2)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(.vertical, 10)
                        .padding(.horizontal)
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color("Green")))
                })
                    .padding(.trailing, 10)
                
                Image(systemName: "building.columns")
                    .font(.caption.bold())
                    .foregroundColor(Color.white)
                    .padding(6)
                    .background(Color("Green"))
                    .cornerRadius(8)
                
                Text("Bank Transfer")
                    .font(.callout)
                    .foregroundColor(.black)
                    .padding(.trailing, 10)
                
                Image(systemName: "building.2.fill")
                    .font(.caption.bold())
                    .foregroundColor(Color.white)
                    .padding(6)
                    .background(Color("Blue"))
                    .cornerRadius(8)
                
                Text("Via Paypal")
                    .font(.callout)
                    .foregroundColor(.black)
                    .padding(.trailing, 10)
            }
            VStack(spacing: 15){
                Text("$2,500.00")
                    .font(.largeTitle.bold())
                    .foregroundColor(.black)
                    .scaleEffect(1.3)
                Text("Monthly Earings")
                    .font(.callout)
                    .foregroundColor(.black)
            }
            .padding(.top, 25)
            HStack(spacing: 10) {
                Statview(title: "Followers", count: "3K", image: "checkmark", color: "Blue")
                
                Statview(title: "Views", count: "5K", image: "play.fill", color: "Green")
            }
        }
    }
    @ViewBuilder
    func Statview(title: String, count: String, image: String, color: String) -> some View {
        VStack(alignment: .leading, spacing: 25) {
            HStack {
                Image(systemName: image)
                    .font(.caption.bold())
                    .foregroundColor(Color(color))
                    .padding(6)
                    .background(Color.white)
                    .cornerRadius(8)
                Text("Views")
            }
            Text(count)
                .font(.title.bold())
        }
        .foregroundColor(Color.white)
        .padding(.vertical, 22)
        .padding(.horizontal, 18)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color(color))
        .cornerRadius(15)
    }
    func Statviews(title: String, count: String, image: String, color: String) -> some View {
        VStack(alignment: .leading, spacing: 25) {
            HStack {
                Image(systemName: image)
                    .font(.caption.bold())
                    .foregroundColor(Color(color))
                    .padding(6)
                    .background(Color.white)
                    .cornerRadius(8)
                Text("Followers")
            }
            Text(count)
                .font(.title.bold())
        }
        .foregroundColor(Color.white)
        .padding(.vertical, 22)
        .padding(.horizontal, 18)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color(color))
        .cornerRadius(15)
    }
    
    @ViewBuilder
    func DownloadStats()->some View {
        VStack(spacing: 15) {
            HStack {
                VStack(alignment: .leading, spacing: 13) {
                    Text("Balance in Current Account")
                        .font(.title)
                        .fontWeight(.semibold)
                    Menu {} label: {
                        Label {
                            Image(systemName: "cheron.down")
                        } icon: {
                            Text("Last 30 Days")
                        }
                        .font(.callout)
                        .foregroundColor(.gray)
                    }
                }
                Spacer()
                Button(action: {}, label: {
                    Image(systemName: "arrow.up.forward")
                        .font(.title2.bold())
                })
                    .foregroundColor(.white)
                    .offset(y: -10)
            }
            HStack {
                Text("$1,000.00")
                    .font(.largeTitle.bold())
                Spacer()
                Button(action: {}, label: {
                    Text("Complete")
                        .font(.callout)
                        .foregroundColor(.white)
                        .padding(.vertical, 10)
                        .padding(.horizontal)
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color("Blue")))
                })
            }
            .padding(.vertical, 20)
            BarGraph(downloads: weekDownloads)
                .padding(.top, 25)
        }
        .padding(15)
        .background(RoundedRectangle(cornerRadius: 20).fill(Color.white))
        .padding(.vertical, 20)
    }
    @ViewBuilder
    func CollabView() -> some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Collabs")
                .font(.system(size: 35, weight: .bold))
                .padding(.top, 10)
                .padding(.leading, 20)
            
            VStack(spacing: 8) {
                ForEach(collab) {collab in
                    HStack(spacing: 15) {
                        Image(collab.image)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 30, height: 30)
                            .clipShape(Circle())
                            .padding(6)
                            .background(Color("Blue"))
                            .clipShape(Circle())
                            .shadow(color: Color.black.opacity(0.03), radius: 5, x: 5, y: 5)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        Text(collab.description)
                            .font(.callout)
                            .foregroundColor(.gray)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        Text(collab.amount)
                            .font(.callout)
                            .foregroundColor(.gray)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        Spacer()
                        Button(action: {}, label: {
                            Text("Accept")
                                .font(.caption2)
                                .fontWeight(.semibold)
                                .foregroundColor(Color("BG"))
                                .frame(width: 60, height: 40, alignment: .center)
                                .background(RoundedRectangle(cornerRadius: 10).fill(Color("Green")))
                        })
                    }
                    .padding(.trailing, 2)
                    .padding(.vertical, 2)
                    .padding(.horizontal, 2)
                    .cornerRadius(5)
                }
            }
            .padding(.vertical, 25)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
