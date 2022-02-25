//
//  CardImageScroller.swift
//  TinderClone
//
//  Created by Truong Thinh on 21/01/2022.
//


import SwiftUI
import Kingfisher

struct CardImageScroller: View {
    // MARK: - PROPERTIES
    var person : Person
    @State private var imageIndex : Int = 0
    @Binding var fullscreenMode : Bool
    func updateImageIndex(additon : Bool){
        var newIndex : Int
        if additon{
            newIndex = imageIndex + 1
        }
        else{
            newIndex = imageIndex - 1
        }
        imageIndex = min(max(0, newIndex), person.imageURLS.count-1)
    }
    let screenCutoff = (UIScreen.main.bounds.width / 2) * 0.4
    // MARK: - BODY
    var body: some View {
            GeometryReader { geo in
            ZStack {
                KFImage(person.imageURLS[imageIndex])
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width : geo.size.width , height: geo.size.height)
                    .clipped()
                VStack{
                    HStack{
                        Image(systemName: "hand.thumbsup.fill")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .foregroundColor(.green)
                            .frame(height : 100)
                            .rotationEffect(Angle(degrees: -20))
                            .opacity(Double(person.x / screenCutoff) - 1)
                            
                        Spacer()
                        Image(systemName: "x.square.fill")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .foregroundColor(.red)
                            .frame(height : 100)
                            .rotationEffect(Angle(degrees: 20))
                            .opacity(Double(person.x / screenCutoff * -1) - 1)
                    }
                    .padding()
                    Spacer()
                }
                HStack{
                    Rectangle()
                        .onTapGesture {
                            updateImageIndex(additon: false)
                        }
                    
                    Rectangle()
                        .onTapGesture {
                            updateImageIndex(additon: true)
                        }
                }
                .foregroundColor(.white.opacity(0.01))
                VStack{
                    HStack{
                        ForEach(0..<person.imageURLS.count){ index in
                            Rectangle()
                                .frame(height:3)
                                .foregroundColor(imageIndex == index ? .white : .gray)
                        }
                    }
                    .padding(.top,6)
                    .padding(.horizontal ,fullscreenMode ? 0 : 12)
                    Spacer()
                    if !fullscreenMode {
                        HStack{
                            VStack(alignment : .leading){
                                HStack {
                                    Text(person.name)
                                        .font(.system(size: 40,weight: .heavy))
                                    Text("\(person.age)")
                                        .font(.system(size: 30,weight : .light))
                                }
                                Text(person.bio)
                                    .font(.system(size: 18,weight: .medium))
                                    .lineLimit(2)
                                
                            }
                            .foregroundColor(.white)
                            Spacer()
                            Button(action: {
                                fullscreenMode = true
                            }, label: {
                                Image(systemName: "info.circle.fill")
                                    .font(.system(size: 30,weight: .medium))
                                    .foregroundColor(.white)
                            })
                        }
                        .padding(16)
                    }
                }
                
            }
            .cornerRadius(6)
            .shadow(radius: 5)
        }
    }
}

struct CardImageScroller_Previews: PreviewProvider {
    static var previews: some View {
        CardImageScroller(person: Person.example,fullscreenMode: .constant(false))
           
            
    }
}
