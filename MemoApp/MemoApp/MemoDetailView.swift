//
//  MemoDetailView.swift
//  MemoApp
//
//  Created by Min on 12/30/25.
//

import SwiftUI

struct MemoDetailView: View {
    @Environment(\.dismiss) private var dismiss
    @ObservedObject var viewModel: MemoViewModel
    var memo: Memo
    
    @State private var title: String
    @State private var content: String
    
    init(viewModel: MemoViewModel, memo: Memo) {
        self.viewModel = viewModel
        self.memo = memo
        _title = State(initialValue: memo.title)
        _content = State(initialValue: memo.content)
        
    }
    
    var body: some View {
        VStack(spacing: 30) {
            
            TextField("제목", text: $title)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            TextField("Content", text: $content)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            Text(memo.date, style: .date)
                
            Button {
                if viewModel.update(
                    id: memo.id,
                    title: title,
                    content: content)
                {
                    dismiss()
                }
            } label: {
                Text("update")
            }
            .buttonStyle(.borderedProminent)
        }
    }
}

#Preview {
    MemoDetailView(viewModel: MemoViewModel(), memo: Memo(title: "제목", content: "내용", date: Date()))
}
