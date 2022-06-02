import SwiftUI

struct CountView: View {
    @AppStorage("showStartSheet") var hasSeeStartView = false
    
    /// Current user count
    @State var counter: Int = 0
    @State var currentBackgroundColor: Color = .white
    
    @State private var sourceType: UIImagePickerController.SourceType = UIImagePickerController.isSourceTypeAvailable(.camera) ? .camera : .photoLibrary
    /// the photo taken by the user
    @State private var selectedImage: UIImage?
    /// if the user is taking a photo now
    @State private var isImagePickerDisplay = false
    
    var body: some View {
        NavigationView {
            VStack {
                if counter <= 0 {
                    VStack {
                        Spacer()
                        Text("I will help you feel better")
                            .foregroundColor(.black)
                            .font(.largeTitle)
                            .bold()
                            .multilineTextAlignment(.center)
                        Text("Always press in the middle to go one page further.")
                            .foregroundColor(.gray)
                            .font(.body)
                        
                        Text("Close your eyes to the white pages")
                            .foregroundColor(.gray)
                            .font(.body)
                            .bold()
                            .padding(.top)
                        Spacer()
                    }.sheet(isPresented: $hasSeeStartView, content: {
                        TutorialSheetView()
                    }).onAppear(perform: {
                        hasSeeStartView = true
                    })
                    .onTapGesture {
                        counter += 1
                        withAnimation(.easeInOut(duration: 0.2)) {
                            currentBackgroundColor = counter % 2 == 0 ? Color.white : Color.black
                        }
                    }
                } else if counter > 0 && counter <= 20 {
                    VStack {
                        Spacer()
                        
                        Text("\(counter)")
                            .foregroundColor(counter % 2 == 0 ? .secondary : .gray)
                            .font(.system(size: 120))
                            .fontWeight(.heavy)
                        Text("\(counter > 6 ? "\(counter < 16 ? "Last Sprint!" : "\(counter == 20 ? "Finish" : "You are almost at the end")")" : "Faster and Better!")")
                            .foregroundColor(counter % 2 == 0 ? .black : .white)
                            .font(.largeTitle)
                            .bold()
                            .multilineTextAlignment(.center)
                        Spacer()
                    }
                    .onTapGesture {
                        counter += 1
                        counter % 2 == 0 ? playSound(sound: "Ping") : nil
                        withAnimation(.easeInOut(duration: 0.2)) {
                            currentBackgroundColor = counter % 2 == 0 ? Color.white : Color.black
                        }
                    }
                } else {
                    Spacer()
                    if selectedImage == nil {
                        withAnimation(.easeInOut(duration: 0.7)) {
                            Text("Show me a selfie where you are relaxed now!?")
                                .foregroundColor(.white)
                                .font(.system(size: 55))
                                .fontWeight(.heavy)
                                .onTapGesture {
                                    self.sourceType = UIImagePickerController.isSourceTypeAvailable(.camera) ? .camera : .photoLibrary
                                    self.isImagePickerDisplay.toggle()
                                }
                        }
                    } else {
                        NavigationLink(destination: FaceEmotionsView(image: selectedImage!), label: {
                            VStack {
                                Text("Is that a relaxing 🤳🏼?")
                                    .foregroundColor(.white)
                                    .font(.system(size: 70))
                                    .fontWeight(.bold)
                                withAnimation(.linear(duration: 1.6)) {
                                    Image(uiImage: selectedImage!)
                                        .resizable()
                                        .cornerRadius(5)
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 500, height: 400)
                                }
                            }
                        })
                    }
                    Spacer()
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(self.currentBackgroundColor)
            .navigationBarHidden(true)
        }
        .navigationBarBackButtonHidden(true)
        .navigationViewStyle(StackNavigationViewStyle())
        .sheet(isPresented: self.$isImagePickerDisplay) {
            ImagePickerView(selectedImage: self.$selectedImage, sourceType: self.sourceType)
        }
    }
}

