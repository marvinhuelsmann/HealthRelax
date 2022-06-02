//
//  HealthImage.swift
//  
//
//  Created by Marvin Hülsmann on 15.04.22.
//

import SwiftUI

struct HealthImageView: View {
    var image: UIImage
    var body: some View {
        VStack {
            NavigationLink(destination: NextTimeView(), label: {
                VStack {
                    Text("Your personal relaxing picture")
                        .foregroundColor(.black)
                        .font(.system(size: 50))
                        .fontWeight(.bold)
                    Image(uiImage: image)
                    Button(action: {
                        UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
                    }, label: {
                        VStack {
                            HStack {
                                Text("Save to Photos")
                                    .font(.title)
                                    .foregroundColor(.white)
                            }
                            .padding()
                        }
                        .padding(0.1)
                        .background(.blue)
                        .cornerRadius(3)
                    })
                }
            })
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.white)
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
}

/// End View to restart the game
struct NextTimeView: View {
    var body: some View {
        VStack {
            Text("⚡️")
                .font(.system(size: 70))
            Text("The next time you're stressed, look at the photo and you'll think back to that healthy time.")
                .foregroundColor(.black)
                .font(.system(size: 35))
                .fontWeight(.bold)
                .padding()
            NavigationLink(destination: CountView(), label: {
                VStack {
                    HStack {
                        Text("Try another Session")
                            .font(.title)
                            .foregroundColor(.white)
                    }
                    .padding()
                }
                .padding(0.1)
                .background(.blue)
                .cornerRadius(3)
            })
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.white)
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
}
