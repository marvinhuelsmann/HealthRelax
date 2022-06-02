//
//  ImageMerger.swift
//  
//
//  Created by Marvin Hülsmann on 13.04.22.
//

import Foundation
import SwiftUI


/// Merge user image with a template photo with smileys
/// - Returns: User image with Smileys
/// - Parameter id: Image overlay ID
func mergeImage(bottomImage: UIImage, topImage: UIImage) -> UIImage {
    let size = CGSize(width: topImage.size.width, height: topImage.size.height)
    UIGraphicsBeginImageContext(size)
    
    let areaSize = CGRect(x: 0, y: 0, width: size.width, height: size.height)
    bottomImage.draw(in: areaSize)
    
    /// Set the image over the user photo
    topImage.draw(in: areaSize, blendMode: .hardLight, alpha: 0.6)
    
    let newImage:UIImage = UIGraphicsGetImageFromCurrentImageContext()!
    UIGraphicsEndImageContext()
    
    return newImage
}
