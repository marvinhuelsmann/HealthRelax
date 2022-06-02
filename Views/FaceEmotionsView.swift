//
//  FaceEmotionsView.swift
//  
//
//  Created by Marvin Hülsmann on 12.04.22.
//

import SwiftUI

struct FaceEmotionsView: View {
    /// the photo taken by the user
    var image: UIImage
    
    var body: some View {
        VStack {
            if checkImage() {
                NavigationLink(destination: MergeImagesView(image: image), label: {
                    VStack {
                        Text("You are 😀!")
                            .foregroundColor(.black)
                            .font(.system(size: 70))
                            .fontWeight(.bold)
                        withAnimation(.easeIn(duration: 2.4).delay(4)) {
                            Text("That means you are healthy and relaxed.")
                                .foregroundColor(.gray)
                                .font(.largeTitle)
                                .fontWeight(.bold)
                        }
                    }
                })
            } else {
                NavigationLink(destination: JokeView(image: image), label: {
                    VStack {
                        Text("Nooo!")
                            .foregroundColor(.black)
                            .font(.system(size: 70))
                            .fontWeight(.bold)
                        withAnimation(.easeIn(duration: 2.4).delay(4)) {
                            Text("You need to 🧘🏽 more because you're not smiling.")
                                .foregroundColor(.gray)
                                .font(.largeTitle)
                                .fontWeight(.bold)
                        }
                    }
                })
            }
        }
        .onAppear {
            playSound(sound: checkImage() ? "Success" : "Alert")
        }
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
    
    /// Check if the user is smiling on the photo
    /// - Returns: if he is smiling
    func checkImage() -> Bool {
        let ciImage = CIImage(cgImage: image.cgImage!)
        
        let options = [CIDetectorAccuracy: CIDetectorAccuracyHigh]
        let faceDetector = CIDetector(ofType: CIDetectorTypeFace, context: nil, options: options)!
        
        let faces = faceDetector.features(in: ciImage, options: [CIDetectorSmile: true])
        
        if let face = faces.first as? CIFaceFeature {
            /// See if there is a smile in the picture
            
            if face.hasSmile {
                return true
            }
        }
        return false
    }
}
