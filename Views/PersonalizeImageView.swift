//
//  PersonalizeImageView.swift
//  
//
//  Created by Marvin Hülsmann on 09.04.22.
//

import SwiftUI

struct PersonalizeImageView: View {
    var image: UIImage
    
    @State private var waterMark = false
    @State private var healthRelaxLogo = false
    
    var body: some View {
        VStack {
            let finalImage: UIImage = waterMark ? mergeImage(bottomImage: image, topImage: UIImage(named: "WWDC2022")!) : healthRelaxLogo ? mergeImage(bottomImage: image, topImage: UIImage(named: "HealthRelax")!) : image
            
            NavigationLink(destination: HealthImageView(image: finalImage)) {
                Image(uiImage: finalImage)
            }
            HStack {
                VStack(alignment: .leading) {
                    Text("WWDC2022 Watermark").font(.system(size: 15, weight: .semibold)).lineLimit(2)
                    HStack {
                        if self.waterMark {
                            Text("On")
                        } else {
                            Text("Off")
                        }
                        Spacer()
                        Toggle("", isOn: $waterMark)
                    }
                }
                .frame(width: 100)
                .padding()
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(self.waterMark ? Color.green: Color.gray, lineWidth: 2)
                )
                VStack(alignment: .leading) {
                    Text("Health Relax Logo").font(.system(size: 15, weight: .semibold)).lineLimit(2)
                    HStack {
                        if self.healthRelaxLogo {
                            Text("On")
                        } else {
                            Text("Off")
                        }
                        Spacer()
                        Toggle("", isOn: $healthRelaxLogo)
                    }
                }
                .frame(width: 100)
                .padding()
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(self.healthRelaxLogo ? Color.green: Color.gray, lineWidth: 2) // <7>
                )
            }
            .onChange(of: self.waterMark) { newValue in
                if newValue {
                    if healthRelaxLogo {
                        healthRelaxLogo = false
                    }
                }
            }
            .onChange(of: self.healthRelaxLogo) { newValue in
                if newValue {
                    if waterMark {
                        waterMark = false
                    }
                }
            }
            .padding(.top)
        }
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
        
    }
}



