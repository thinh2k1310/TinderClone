//
//  FullScreenCardView.swift
//  TinderClone
//
//  Created by Truong Thinh on 07/02/2022.
//

import SwiftUI

struct FullScreenCardView: View {
    // MARK: - PROPERTIES
    var person : Person
    @Binding var fullScreenMode : Bool
    let screen = UIScreen.main.bounds
    @EnvironmentObject var userMng : UserManager
    // MARK: -  FUNCTIONS
    func showActionSheet(){
        let items : [Any] = ["What do you think about \(person.name) ?\n"]
        let av = UIActivityViewController(activityItems: items, applicationActivities: nil)
        UIApplication.shared.windows.first?.rootViewController?
            .present(av , animated: true, completion: nil)
    }
    // MARK: - BODY
    var body: some View {
        ZStack {
            Color.white
                .edgesIgnoringSafeArea(.all)
            ScrollView(showsIndicators : false){
                VStack(spacing : 0){
                    CardImageScroller(person: person, fullscreenMode: $fullScreenMode)
                        .frame(width: screen.width,height: screen.height * 0.6)
                    HStack{
                        VStack(alignment:.leading){
                            HStack{
                                Text(person.name)
                                    .font(.system(size : 32 , weight: .heavy))
                                Text(String(person.age))
                                    .font(.system(size : 28 , weight : .light))
                                Spacer()
                            }
                            .opacity(0.75)
                            Text("\(person.distance) kms away")
                                .font(.system(size: 18, weight: .medium))
                                .opacity(0.75)
                        }
                        .padding([.horizontal,.top] , 16)
                        Button(action: {
                            fullScreenMode = false
                        }, label: {
                            Image(systemName: "arrow.down.circle.fill")
                                .font(.system(size : 42,weight: .medium))
                                .background(Color.white)
                                .clipShape(Circle())
                        })
                            .offset(y : -40)
                            .padding(.trailing,16)
                        }
                    Spacer()
                        .frame(height : 26)
                    HStack{
                        Text(person.bio)
                            .font(.system(size : 18, weight: .medium))
                            .lineLimit(10)
                            .multilineTextAlignment(.leading)
                            .fixedSize(horizontal: false, vertical: true)
                            .opacity(0.75)
                            .padding(.horizontal,16)
                        Spacer()
                    }
                    Spacer().frame(height:32)
                    VStack(spacing : 24){
                        Button(action: {
                            showActionSheet()
                        }, label: {
                            VStack(spacing : 8){
                                
                                Text("Share \(person.name)'s profile".uppercased())
                                    .font(.system(size: 16,weight: .medium))
                                Text("SEE WHAT A FRIEND THINKS")
                                        .font(.system(size: 14,weight: .medium))
                                     
                            }
                            .opacity(0.9)
                        })
                        Button(action: {
                            
                        }, label: {
                            Text("REPORT \(person.name)".uppercased())
                                .font((.system(size: 18,weight: .medium)))
                                .foregroundColor(.black)
                                .opacity(0.75)
                        })
                    }
                    Spacer().frame(height : 200)
                }
            }
            VStack {
                Spacer()
                HStack(spacing : 20){
                    Spacer()
                    CircleButtonView(type: .no, action: {
                        fullScreenMode = false
                        userMng.swipe(person, .no)
                    })
                        .frame(height:50)
                    CircleButtonView(type: .star, action: {
                        fullScreenMode = false
                        userMng.supperLike(person)
                    })
                        .frame(height:45)
                    CircleButtonView(type: .heart, action: {
                        fullScreenMode = false
                        userMng.swipe(person, .like)
                    })
                        .frame(height:50)
                    Spacer()
                }
                .padding(.bottom,45)
                .padding(.top,25)
                .edgesIgnoringSafeArea(.bottom)
                .background(
                    LinearGradient(gradient: Gradient(colors: [.white.opacity(0.2),.white]), startPoint: .top, endPoint: .bottom)
                )
            }
        }
        .edgesIgnoringSafeArea(.bottom)
        .padding(.top,30)
    }
}

struct FullScreenCardView_Previews: PreviewProvider {
    static var previews: some View {
        FullScreenCardView(person: Person.example, fullScreenMode: .constant(true))
            .environmentObject(UserManager())
    }
}
