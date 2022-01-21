//
//  ProfileView.swift
//  TinderClone
//
//  Created by Truong Thinh on 15/01/2022.
//

import SwiftUI


struct ProfileView: View {
    // MARK: - PROPERTIES
    @EnvironmentObject var userMng : UserManager
    @EnvironmentObject var appState : AppStateManager
    var user : User{
        return userMng.currentUser
    }
    // MARK: - BODY
    var body: some View {
        VStack(spacing : 0){
            ZStack(alignment: .topTrailing){
                RoundedImage(url : user.imageURLS.first)
                    .frame(height : 200)
                Button(action: {
                    
                }, label: {
                    Image(systemName: "pencil")
                        .frame(width : 32 , height: 32)
                        .foregroundColor(.gray.opacity(0.5))
                        .background(Color.white)
                        .clipShape(Circle())
                        .shadow(radius : 6)
                })
                    .padding(.vertical,10)
                    .offset(x : -10)
            }
            Spacer()
                .frame(height : 20)
            Group {
                Text("\(user.name),\(user.age)")
                    .font(.system(size : 26 , weight: .medium))
                .foregroundColor(.textTilte)
            Spacer().frame(height:6)
                Text(user.jobTitle)
            Spacer().frame(height : 20)
            }
            HStack(alignment :  .top){
                Spacer()
                    Button(action: {
                        
                    }, label: {
                        VStack {
                            Image(systemName: "gearshape.fill")
                                .foregroundColor(Color.gray.opacity(0.5))
                                .font(.system(size:30))
                                .padding(10)
                                .background(Color.white)
                                .clipShape(Circle())
                            .shadow(radius : 6)
                            Text("settings".uppercased())
                                .font(.system(size : 14 ,  weight: .medium))
                                .foregroundColor(.textSecondary)
                        }
                    })
                Spacer()
                Button(action: {
                    
                }, label: {
                    VStack {
                        Image(systemName: "camera.fill")
                            .foregroundColor(Color.white)
                            .font(.system(size:30))
                            .padding(22)
                            .background(Color.red)
                            .clipShape(Circle())
                        .shadow(radius : 6)
                        Text("add media".uppercased())
                            .font(.system(size : 14 ,  weight: .medium))
                            .foregroundColor(.textSecondary)
                    }
                })
                Spacer()
                Button(action: {
                    
                }, label: {
                    VStack {
                        Image(systemName: "shield.fill")
                            .foregroundColor(Color.gray.opacity(0.5))
                            .font(.system(size:30))
                            .padding(10)
                            .background(Color.white)
                            .clipShape(Circle())
                        .shadow(radius : 6)
                        Text("safety".uppercased())
                            .font(.system(size : 14 ,  weight: .medium))
                            .foregroundColor(.textSecondary)
                    }
                })
                Spacer()
                
            }
            Spacer().frame(height:22)
            HStack{
                Text("Photo tips : Make waves with a big photo and get more likes")
                    .multilineTextAlignment(.leading)
                    .lineLimit(3)
                    .foregroundColor(.white)
                    .font(.system(size:14))
                Button(action: {
                    
                }, label: {
                    Image(systemName: "plus")
                        .foregroundColor(.pink)
                        .font(.system(size: 12,weight: .heavy))
                        .padding(6)
                })
                    .background(.white)
                    .clipShape(Circle())
            }//:HSTACK
            .padding()
            .background(Color.pink)
            .cornerRadius(12)
            if !user.goldSubcriber {
                ZStack {
                    Color.gray.opacity(0.15)
                    ProfileSwipePromo()
                }
                .padding(.top,18)
            }
            Spacer()
        }//:VSTACK
        .foregroundColor(.black.opacity(0.75))
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
            .background(Color.defaultBackground)
            .environmentObject(UserManager())
            .environmentObject(AppStateManager())
    }
}
