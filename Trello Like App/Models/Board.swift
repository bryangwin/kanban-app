//
//  Board.swift
//  Trello Like App
//
//  Created by Bryan Gwin on 5/22/23.
//

import Foundation

class Board: ObservableObject, Identifiable {
    
    private(set) var id = UUID()
    @Published var name: String
    @Published var lists: [BoardList]
    
    init(name: String, lists: [BoardList] = []) {
        self.name = name
        self.lists = lists
    }
    
}
