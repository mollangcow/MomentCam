//
//  MainView.swift
//  MomentCam
//
//  Created by kimsangwoo on 2023/08/30.
//

import SwiftUI

struct MainView: View {
    @State private var isRecording: Bool = false
    @State private var isPicturing: Bool = false
    @State private var isShowingGallery: Bool = false
    
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            
            VStack(spacing: 0) {
                HStack {
                    Button(action: {
                        // flash light
                    }, label: {
                        ZStack {
                            Circle()
                                .fill(.white.opacity(0.2))
                                .frame(width: 44, height: 44)
                            Image(systemName: "bolt.fill")
                                .foregroundColor(.yellow)
                        }
                    })
                    
                    Button(action: {
                        // change camera
                    }, label: {
                        ZStack {
                            Circle()
                                .fill(.white.opacity(0.2))
                                .frame(width: 44, height: 44)
                            Image(systemName: "arrow.triangle.2.circlepath")
                                .foregroundColor(.white)
                        }
                    })
                    
                    
                    Button(action: {
                        // setting
                    }, label: {
                        ZStack {
                            Circle()
                                .fill(.white.opacity(0.2))
                                .frame(width: 44, height: 44)
                            Image(systemName: "gear")
                                .foregroundColor(.white)
                        }
                    })
                }
                
                Spacer()
                
                HStack {
                    // Gallery Button
                    ZStack {
                        Circle()
                            .fill(.gray.opacity(0.2))
                            .frame(width: 68, height: 68)
                        Button(action: {
                            // recording logic
                        }, label: {
                            ZStack {
                                Circle()
                                    .fill(.white.opacity(0.3))
                                    .frame(width: 60, height: 60)
                                Image(systemName: "photo.stack.fill")
                                    .foregroundColor(.white)
                            }
                        })
                        .fullScreenCover(isPresented: $isShowingGallery) {
                            GalleryView(isShowingGalleryView: $isShowingGallery)
                        }
                    }
                    
                    Spacer()
                    
                    // Recording Button
                    ZStack {
                        Circle()
                            .fill(.gray.opacity(0.2))
                            .frame(width: 84, height: 84)
                        Button(action: {
                            // recording logic
                            withAnimation(.bouncy) {
                                isRecording.toggle()
                            }
                        }, label: {
                            ZStack {
                                Circle()
                                    .fill(.clear)
                                    .frame(width: 72, height: 72)
                                AnimationRectangle(cornerRadius: isRecording ? 4 : 36)
                                    .fill(.red)
                                    .frame(
                                        width: isRecording ? 30 : 72,
                                        height: isRecording ? 30: 72
                                    )
                            }
                        })
                    }
                    
                    Spacer()
                    
                    // Picturing Button
                    ZStack {
                        Circle()
                            .fill(.gray.opacity(0.2))
                            .frame(width: 68, height: 68)
                        Button(action: {
                            // recording logic
                        }, label: {
                            Circle()
                                .fill(.white)
                                .frame(width: 60, height: 60)
                        })
                    }
                }
                .padding(.horizontal, 40)
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
