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
    @State private var isShowingAddView = false
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(viewModel.sortedMemos) { memo in
                    NavigationLink(value: memo) {
                        MemoRowView(memo: memo)
                    }
                }
                .onDelete { indexSet in
                    viewModel.delete(at: indexSet)
                }
            }
            .navigationTitle("Memo")
            .navigationDestination(for: Memo.self) { memo in
                MemoDetailView(viewModel: viewModel, memo: memo)
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        isShowingAddView = true
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(isPresented: $isShowingAddView) {
                MemoAddView(viewModel: viewModel)
            }
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
