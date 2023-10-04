//
//  GalleryView.swift
//  MomentCam
//
//  Created by kimsangwoo on 2023/09/06.
//

import SwiftUI

struct GalleryView: View {
    @Binding var isShowingGallery: Bool
    
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            VStack(spacing: 0) {
                HStack {
                    Button(action: {
                        isShowingGallery.toggle()
                    }, label: {
                        ZStack {
                            Rectangle()
                                .frame(width: 44, height: 44)
                                .foregroundStyle(.clear)
                            Image(systemName: "xmark")
                                .resizable()
                                .frame(width: 16, height: 16)
                                .foregroundStyle(.white)
                        }
                    })
                    
                    Spacer()
                    
                    Text("Gallery")
                        .font(.system(size: 17, weight: .bold))
                        .foregroundStyle(.white)
                    
                    Spacer()
                    
                    Rectangle()
                        .frame(width: 44, height: 44)
                        .foregroundStyle(.clear)
                }
                .padding(.horizontal, 20)
                
                Spacer()
            }
        }
    }
}

#Preview {
    GalleryView(isShowingGallery: .constant(true))
}
