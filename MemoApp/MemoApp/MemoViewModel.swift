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
    
    func add(title: String, content: String) {
        _ = Memo(title: title, content: content, date: Date())
    }
    
    func delete(at offsets: IndexSet) {
        memos.remove(atOffsets: offsets)
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
