//
//  MemoViewModel.swift
//  MemoApp
//
//  Created by Min on 12/26/25.
//

import Foundation
import Combine
import SwiftUI

final class MemoViewModel: ObservableObject {
    @Published var memos: [Memo] = []
    
    var sortedMemos: [Memo] {
        memos.sorted { $0.date > $1.date }
    }
    
    func add(title: String, content: String) {
        let memo = Memo(title: title, content: content, date: Date())
        memos.append(memo)
    }
    
    func delete(memos: [Memo]) {
        self.memos.removeAll { memo in
            memos.contains(where: { $0.id == memo.id })
        }
    }
    
    func update(id: UUID, title: String, content: String) -> Bool {
        guard let index = memos.firstIndex(where: { $0.id == id}) else {
            return false
        }
        
        memos[index].title = title
        memos[index].content = content
        memos[index].date = Date()
        
        return true
    }
}
