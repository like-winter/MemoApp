//
//  MemoDetailView.swift
//  MemoApp
//
//  Created by Min on 12/30/25.
//

import SwiftUI

struct MemoDetailView: View {
    var memo: Memo
    
    var body: some View {
        VStack(spacing: 30) {
            
            Text(memo.title)
            
            Text(memo.content)
            
            Text(memo.date, style: .date)
        }
    }
}

#Preview {
    MemoDetailView(memo: Memo(title: "제목", content: "내용", date: Date()))
}
