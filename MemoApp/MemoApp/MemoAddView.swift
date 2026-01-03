//
//  MemoAddView.swift
//  MemoApp
//
//  Created by Min on 1/2/26.
//

import SwiftUI

struct MemoAddView: View {
    @ObservedObject var viewModel: MemoViewModel
    @Environment(\.dismiss) private var dismiss
    
    @State private var title: String = ""
    @State private var content: String = ""
    
    @FocusState private var isFocused: Bool
    
    var body: some View {
        ScrollView {
            VStack(spacing: 10) {
                
                TextField("Title", text: $title)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.top, 25)
                    .padding(.horizontal)
                
                TextEditor(text: $content)
                    .focused($isFocused)
                    .frame(maxWidth: .infinity, minHeight: 400, maxHeight: 400, alignment: .topLeading)
                    .background(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.secondary.opacity(0.3))
                    )
                    .padding(.top, 25)
                    .padding(.horizontal)
                
                VStack {
                    Button {
                        viewModel.add(title: title, content: content)
                        dismiss()
                    } label: {
                        Text("Add Memo")
                    }
                    .buttonStyle(.borderedProminent)
                }
                .padding(.top, 20)
            }
        }
    }
}

#Preview {
    MemoAddView(viewModel: MemoViewModel())
}
