//
//  CardView.swift
//  Trello Like App
//
//  Created by Bryan Gwin on 5/26/23.
//

import SwiftUI

struct CardView: View {
    
    @ObservedObject var boardList: BoardList
    @StateObject var card: Card
    
    var body: some View {
        HStack {
            Text(card.content).lineLimit(3)
            
            Spacer ()
            
            Menu {
                Button("Rename") {
                    
                }
                Button("Delete", role: .destructive) {
                    
                }
                
                
            } label: {
                Image(systemName: "ellipsis.rectangle")
            }

        }
        .padding(8)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color.white)
        .cornerRadius(4)
        .shadow(radius: 1, y: 1)
        
    }
}

struct CardView_Previews: PreviewProvider {
    
    @StateObject static var boardList = Board.stub.lists[0]
    
    static var previews: some View {
        CardView(boardList: boardList, card: boardList.cards[0])
    }
}
