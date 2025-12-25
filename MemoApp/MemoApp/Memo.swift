//
//  Memo.swift
//  MemoApp
//
//  Created by Min on 12/26/25.
//

import Foundation

struct Memo: Identifiable {
    let id: UUID = UUID()
    var title: String
    var content: String
    var date: Date
}
