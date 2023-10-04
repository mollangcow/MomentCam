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
    @State private var isFlash: Bool = false
    @State private var isChangeCamera: Bool = false
    @State private var isShowingGallery: Bool = false
    @State private var isShowingSetting: Bool = false
    
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            
            VStack(spacing: 0) {
                HStack {
                    Button(action: {
                        // flash light
                        isFlash.toggle()
                    }, label: {
                        ZStack {
                            Circle()
                                .fill(.white.opacity(0.2))
                                .frame(width: 44, height: 44)
                            Image(systemName: isFlash ? "bolt.fill" : "bolt.slash.fill")
                                .foregroundColor(isFlash ? .yellow : .white)
                        }
                    })
                    
                    Button(action: {
                        // change camera
                        withAnimation(.spring()) {
                            isChangeCamera.toggle()
                        }
                    }, label: {
                        ZStack {
                            Circle()
                                .fill(.white.opacity(0.2))
                                .frame(width: 44, height: 44)
                            Image(systemName: "arrow.triangle.2.circlepath")
                                .rotationEffect(.degrees(isChangeCamera ? 180 : 0))
                                .foregroundColor(.white)
                        }
                    })
                    
                    Spacer()
                    
                    ZStack {
                        RoundedRectangle(cornerRadius: 22)
                            .frame(height: 44)
                            .foregroundColor(.white.opacity(0.2))
                        Text("00:00:00")
                            .font(.system(size: 22))
                            .foregroundColor(.white)
                            .monospaced()
                    }
                    
                    Spacer()
                    
                    Button(action: {
                        isShowingSetting.toggle()
                    }, label: {
                        ZStack {
                            Circle()
                                .fill(.white.opacity(0.2))
                                .frame(width: 44, height: 44)
                            Image(systemName: "gear")
                                .foregroundColor(.white)
                        }
                    })
                    .fullScreenCover(isPresented: $isShowingSetting) {
                        SettingView(isShowingSetting: $isShowingSetting)
                    }
                }
                .padding(.horizontal, 20)
                
                Spacer()
                
                HStack {
                    // Gallery Button
                    ZStack {
                        Circle()
                            .fill(.gray.opacity(0.2))
                            .frame(width: 68, height: 68)
                        Button(action: {
                            isShowingGallery.toggle()
                        }, label: {
                            ZStack {
                                Circle()
                                    .fill(.gray.opacity(0.3))
                                    .frame(width: 62, height: 62)
                                Image(systemName: "photo.stack.fill")
                                    .foregroundColor(.white)
                            }
                        })
                        .fullScreenCover(isPresented: $isShowingGallery) {
                            GalleryView(isShowingGallery: $isShowingGallery)
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
                .padding(.bottom, 20)
            }
        }
    }
}

#Preview {
    MainView()
}
