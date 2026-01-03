//
//  MemoRowView.swift
//  MemoApp
//
//  Created by Min on 12/26/25.
//

import SwiftUI

struct MemoRowView: View {
    let memo: Memo
    
    var body: some View {
        HStack {
            Text(memo.title)
            
            Spacer()
            
            Text(memo.date, style: .date)
        }
    }
}

#Preview {
    MemoRowView(memo: Memo(title: "12312", content: "456456", date: .now))
}
