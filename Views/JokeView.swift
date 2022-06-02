//
//  SwiftUIView.swift
//  
//
//  Created by Marvin Hülsmann on 14.04.22.
//

import SwiftUI

struct JokeView: View {
    var image: UIImage
    
    let jokes: (key: String, value: String) = ["Why did the programmer quit his job?": "Because he didnt get arrays.", "0 is false and 1 is true, right?" : "1!", "What do computers and air conditioners have in common?" : "They both become useless when you open windows."].randomElement()!
    
    var body: some View {
        VStack {
            NavigationLink(destination: MergeImagesView(image: image), label: {
                VStack {
                    Text("A joke to help you relax.")
                        .foregroundColor(.black)
                        .font(.system(size: 50))
                        .fontWeight(.heavy)
                    VStack {
                        Text(jokes.key)
                            .foregroundColor(.black)
                            .font(.system(size: 30))
                            .fontWeight(.heavy)
                            .multilineTextAlignment(.center)
                        Text(jokes.value)
                            .foregroundColor(.gray)
                            .font(.system(size: 30))
                            .fontWeight(.heavy)
                            .multilineTextAlignment(.center)
                            .padding(.top, 0.2)
                    }
                    .padding(.top)
                }
                .onAppear {
                    playSound(sound: "Correct")
                }
                
            })
        }
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
}

struct JokeView_Previews: PreviewProvider {
    static var previews: some View {
        JokeView(image: UIImage(named: "WWDC2022")!)
    }
}
