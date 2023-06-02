//
//  BoardListView.swift
//  Trello Like App
//
//  Created by Bryan Gwin on 5/26/23.
//

import SwiftUI

struct BoardListView: View {
    
    @ObservedObject var board: Board
    @StateObject var boardList: BoardList
    
    @State var listHeight: CGFloat = 0
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            
            headerView
            listView
                .listStyle(.plain)
            
            Button("+ Add Card") {
                
            }
            .padding(.horizontal)
            .frame(maxWidth: .infinity, alignment: .center)
            
        }
        .padding(.vertical)
        .background(Color(red: 235/255, green: 235/255, blue: 235/255))
        .frame(width: 300)
        .cornerRadius(8)
        .foregroundColor(.black)
    }
    
    private var headerView: some View {
        HStack(alignment: .top) {
            Text(boardList.name)
                .font(.headline)
                .lineLimit(2)
            Spacer()
            
            Menu {
                
                Button("Rename") {
                    
                }
                
                Button("Delete", role: .destructive) {
                     
                }
                
            } label: {
                Image(systemName: "ellipsis.circle")
            }
        }
        .padding(.horizontal)
        
    }
    
    private var listView: some View {
        LazyVStack {
            ForEach(boardList.cards) { card in
                CardView(boardList: boardList, card: card)
            }
                .listRowSeparator(.hidden)
                .listRowInsets(.init(top: 4, leading: 8, bottom: 4, trailing: 8))
                .listRowBackground(Color.clear)
                .padding(.horizontal, 5)
        }

    }
}

struct BoardListView_Previews: PreviewProvider {
    
    @StateObject static var board = Board.stub
    
    static var previews: some View {
        BoardListView(board: board, boardList: board.lists[0])
    }
}
