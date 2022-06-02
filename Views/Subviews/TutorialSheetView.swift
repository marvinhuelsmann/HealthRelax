//
//  StartView.swift
//  HealthRelax
//
//  Created by Marvin Hülsmann on 06.04.22.
//

import SwiftUI

struct TutorialSheetView: View {
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    
    var body: some View {
        ScrollView {
            VStack(alignment: .center) {
        
                TitleView()
                
                InformationContainerView()
                
                Spacer(minLength: 30)
                
                Button(action: {
                    mode.wrappedValue.dismiss()
                }) {
                    Text("Lets go!")
                        .customButton()
                }
                .padding(.horizontal)
                
                Text("To get the right atmosphere, turn on the sounds")
                    .font(.body)
                    .padding(.leading)
                    .padding(.trailing)
                    .foregroundColor(.secondary)
                    .fixedSize(horizontal: false, vertical: true)
                
            }
            .padding(.top, 100)
           

        }
    }
}

struct InformationDetailView: View {
    var title: String = "title"
    var subTitle: String = "subTitle"
    var imageName: String = "car"
    
    var body: some View {
        HStack(alignment: .center) {
            Image(systemName: imageName)
                .font(.largeTitle)
                .foregroundColor(.mainColor)
                .padding()
                .accessibility(hidden: true)
            
            VStack(alignment: .leading) {
                Text(title)
                    .font(.headline)
                    .foregroundColor(.primary)
                    .accessibility(addTraits: .isHeader)
                
                Text(subTitle)
                    .font(.body)
                    .foregroundColor(.secondary)
                    .fixedSize(horizontal: false, vertical: true)
            }
        }
        .padding(.top)
    }
}

struct TitleView: View {
    var body: some View {
        VStack {
            Text("Welcome at")
                .customTitleText()
            
            Text("HealthRelax")
                .customTitleText()
                .foregroundColor(.purple)
        }
    }
}

struct ButtonModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundColor(.white)
            .font(.headline)
            .padding()
            .frame(minWidth: 0, maxWidth: .infinity, alignment: .center)
            .background(RoundedRectangle(cornerRadius: 15, style: .continuous)
                            .fill(Color.mainColor))
            .padding(.bottom)
    }
}

extension View {
    func customButton() -> ModifiedContent<Self, ButtonModifier> {
        return modifier(ButtonModifier())
    }
}

extension Text {
    func customTitleText() -> Text {
        self
            .fontWeight(.black)
            .font(.system(size: 36))
    }
}

extension Color {
    static var mainColor = Color(UIColor.systemIndigo)
}

struct InformationContainerView: View {
    var body: some View {
        VStack(alignment: .leading) {
            InformationDetailView(title: "What can you do?", subTitle: "This is a little game about you, only you. You can relax and heal with little jokes", imageName: "list.bullet.rectangle")
            
            InformationDetailView(title: "Who does the Playground help?", subTitle: "Everyone who is stressed and needs a break from for example programming, design work, big Apple documentations or others.", imageName: "book")
            
            InformationDetailView(title: "Where I am?", subTitle: "I'll help you make time for yourself with a few little jokes", imageName: "doc.text.below.ecg")
        }
        .padding(.horizontal)
    }
}


