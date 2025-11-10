//
//  CarouselViwe.swift
//  AIChatCourse
//
//  Created by YEN-JU HUANG on 2025/11/10.
//

import SwiftUI

struct CarouselViwe<Content: View, T: Hashable>: View {
    
    var items: [T]
    @ViewBuilder var content: (T) -> Content
    @State private var selection: T?
    
    var body: some View {
        VStack(spacing: 8) {
            ScrollView(.horizontal) {
                LazyHStack(spacing: 0) {
                    ForEach(items, id: \.self) { item in
                        content(item)
                            .scrollTransition(.interactive.threshold(.visible(0.95)), transition: { content, phase in
                            content
                                .scaleEffect(phase.isIdentity ? 1 : 0.8)
                        })
                            .containerRelativeFrame(.horizontal, alignment: .center)
                            .id(item)
                    }
                }
            }
            .frame(height: 200)
            .scrollIndicators(.hidden)
            .scrollTargetLayout()
            .scrollTargetBehavior(.paging)
            .scrollPosition(id: $selection)
            .onChange(of: items.count, { _, _ in
                updateSelectionIfNeeded()
            })
            .onAppear {
                updateSelectionIfNeeded()
            }
            
            HStack(spacing: 8) {
                ForEach(items, id: \.self) { item in
                    Circle()
                        .fill(item == selection ? .accent : .secondary)
                        .frame(width: 8, height: 8)
                }
            }
            .animation(.linear, value: selection)
        }
    }
    
    private func updateSelectionIfNeeded() {
        if selection == nil || selection == items.last {
            selection = items.first
        }
    }
}

#Preview {
    CarouselViwe(items: AvataModel.mocks) { item in
        HeroCellView(
            title: item.name,
            subtitle: item.characterDescription,
            imageName: item.profileImageName
        )
    }
    .padding()
}
