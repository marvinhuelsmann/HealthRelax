//
//  MergeImagesView.swift
//  
//
//  Created by Marvin Hülsmann on 12.04.22.
//

import SwiftUI

struct MergeImagesView: View {
    /// the photo taken by the user
    var image: UIImage
    
    @State private var currentID: Int = 1
    @State private var avaibleIDs: [Int] = [1,2,3,4,5,6]
    
    var body: some View {
        VStack {
            NavigationLink(destination: PersonalizeImageView(image: mergeImage(id: currentID)), label: {
                Image(uiImage: mergeImage(id: currentID))
            })
            
            VStack {
                HStack {
                    
                    Button(action: {
                        nextImage(forward: false)
                    }, label: {
                        VStack {
                            HStack {
                                Image(systemName: "arrow.left")
                                    .font(.title)
                                    .foregroundColor(.white)
                            }
                            .padding()
                        }
                        .padding(0.1)
                        .background(avaibleIDs.contains(currentID-1) ? .blue : .red)
                        .cornerRadius(3)
                    })
                    
                    NavigationLink(destination:
                                    PersonalizeImageView(image: mergeImage(id: currentID)), label: {
                        VStack {
                            HStack {
                                Text("Next View")
                                    .font(.title)
                                    .foregroundColor(.white)
                            }
                            .padding()
                        }
                        .padding(0.1)
                        .background(.black)
                        .cornerRadius(3)
                    })
                    
                    Button(action: {
                        nextImage(forward: true)
                    }, label: {
                        VStack {
                            HStack {
                                Image(systemName: "arrow.right")
                                    .font(.title)
                                    .foregroundColor(.white)
                            }
                            .padding()
                        }
                        .padding(0.1)
                        .background(avaibleIDs.contains(currentID+1) ? .blue : .red)
                        .cornerRadius(3)
                    })
                }
                Text("To go to the next page, press in the middle")
                    .foregroundColor(.gray)
                    .font(.body)
            }
        }
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
    
    func nextImage(forward: Bool) {
        let nextID: Int = forward ? currentID+1 : currentID-1
        
        if avaibleIDs.contains(nextID) {
            currentID = nextID
            playSound(sound: "Success")
        } else {
            playSound(sound: "Alert")
        }
    }
    
    /// Merge user image with a template photo with smileys
    /// - Returns: User image with Smileys
    /// - Parameter id: Image overlay ID
    func mergeImage(id: Int) -> UIImage {
        let bottomImage = image
        let topImage = UIImage(named: "HealthRelax-\(id).png")
        
        let size = CGSize(width: topImage!.size.width, height: topImage!.size.height)
        UIGraphicsBeginImageContext(size)
        
        let areaSize = CGRect(x: 0, y: 0, width: size.width, height: size.height)
        bottomImage.draw(in: areaSize)
        
        /// Set the image over the user photo
        topImage?.draw(in: areaSize, blendMode: .hardLight, alpha: 0.4)
        
        let newImage:UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        
        return newImage
    }
}


struct MergeImagesView_Preview: PreviewProvider {
    static var previews: some View {
        MergeImagesView(image: UIImage(named: "HealthRelax-2")!)
    }
}
