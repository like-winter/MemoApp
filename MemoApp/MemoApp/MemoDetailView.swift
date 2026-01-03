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
    
    @FocusState private var isFocused: Bool
    
    init(viewModel: MemoViewModel, memo: Memo) {
        self.viewModel = viewModel
        self.memo = memo
        _title = State(initialValue: memo.title)
        _content = State(initialValue: memo.content)
        
    }
    
    var body: some View {
        ScrollView {
            VStack(spacing: 10) {
                
                TextField("제목", text: $title)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.top, 25)
                    .padding(.horizontal)
                
                //            TextField("Content", text: $content)
                //                .textFieldStyle(RoundedBorderTextFieldStyle())
                //                .padding()
                
                TextEditor(text: $content)
                    .focused($isFocused)
                    .frame(maxWidth: .infinity, minHeight: 400, maxHeight: 400, alignment: .topLeading)
                    .background(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.secondary.opacity(0.3))
                    )
                    .padding(.top, 25)
                    .padding(.horizontal)
                
                VStack(spacing: 10) {
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
                .padding(.top, 20)
            }
        }
        .navigationTitle("메모 수정")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    MemoDetailView(viewModel: MemoViewModel(), memo: Memo(title: "제목", content: "내용", date: Date()))
}
