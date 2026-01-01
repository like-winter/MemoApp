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
    
    var body: some View {
        VStack(spacing: 30) {
            
            TextField("Title", text: $title)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            TextField("Content", text: $content)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            Button {
                viewModel.add(title: title, content: content)
                dismiss()
            } label: {
                Text("Add Memo")
            }
            .buttonStyle(.borderedProminent)
        }
    }
}

#Preview {
    MemoAddView(viewModel: MemoViewModel())
}
