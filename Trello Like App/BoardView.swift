//
//  BoardView.swift
//  Trello Like App
//
//  Created by Bryan Gwin on 5/26/23.
//

import SwiftUI

let boardListBackgroundColor = Color.green


struct BoardView: View {
    
    @State private var board: Board = Board.stub
    
    var body: some View {
        NavigationView {
            ScrollView(.horizontal) {
                LazyHStack(alignment: .top, spacing: 24) {
                    ForEach(board.lists) { boardList in
                        BoardListView(board: board, boardList: boardList)
                        
                    }
                    Button("Add List") {
                        
                    }
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background()
                    .frame(width: 300)
                }
                
            }
            .padding(.horizontal, 5)
            .background(boardListBackgroundColor)
            .navigationTitle(board.name)
        
        }
        .navigationViewStyle(.stack)
    }
}

struct BoardView_Previews: PreviewProvider {
    static var previews: some View {
        BoardView()
    }
}
