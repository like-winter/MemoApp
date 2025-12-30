//
//  MemoListView.swift
//  MemoApp
//
//  Created by Min on 12/26/25.
//

import SwiftUI
import Combine

struct MemoListView: View {
    @StateObject var viewModel = MemoViewModel()
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(viewModel.memos) { memo in
                    MemoRowView(memo: memo)
                }
            }
            .navigationTitle("Memo")
        }
    }
}

#Preview {
    let previewViewModel = MemoViewModel()
    previewViewModel.memos = [
        Memo(title: "첫 번째 메모", content: "내용 1", date: .now),
        Memo(title: "두 번째 메모", content: "내용 2", date: .now)
    ]
    
    return MemoListView(viewModel: previewViewModel)
}
