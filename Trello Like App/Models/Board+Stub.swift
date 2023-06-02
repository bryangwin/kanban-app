//
//  Board+Stub.swift
//  Trello Like App
//
//  Created by Bryan Gwin on 5/22/23.
//

import Foundation

extension Board {
    
    static var stub: Board {
        let board = Board(name: "My New Board")
        
        let backlogBoardList = BoardList(name: "Backlog", boardId: board.id)
        let backlogCards = [
            "Somthing cool",
            "I love that stuff",
            "here is another one",
            "testing testing"
        ].map {Card(content: $0, boardListId: backlogBoardList.id)}
        backlogBoardList.cards = backlogCards
        
        let todoBoardList = BoardList(name: "TODO", boardId: board.id)
        let todoCards = [
            "Eat dick",
            "Smoke grass",
            "Eat ass"
        ].map { Card(content: $0, boardListId: todoBoardList.id)}
        todoBoardList.cards = todoCards
        
        let inProgressList = BoardList(name: "In Progress", boardId: board.id)
        let inProgressCards = [
            "Doing cool things",
            "Yay this is fun",
            "Something is happening"
        ].map {Card(content: $0, boardListId: inProgressList.id)}
        inProgressList.cards = inProgressCards
        
        let doneBoardList = BoardList(name: "Done", boardId: board.id)
        let doneBoardCards = [
            "This thing is done",
            "So is this one"
        ].map{Card(content: $0, boardListId: doneBoardList.id)}
        doneBoardList.cards = doneBoardCards
        
        board.lists = [
            backlogBoardList,
            todoBoardList,
            inProgressList,
            doneBoardList
        ]
        
        return board
    }
}
