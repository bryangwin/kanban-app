//
//  BoardList.swift
//  Trello Like App
//
//  Created by Bryan Gwin on 5/22/23.
//

import Foundation

class BoardList: NSObject, ObservableObject, Identifiable, Codable {
    
    private(set) var id = UUID()
    var boardId: UUID
    
    @Published var name: String
    @Published var cards: [Card]
    
    enum CodingKeys: String, CodingKey {
        case id, boardId, name, cards
    }
    
    init(name: String, cards: [Card] = [], boardId: UUID) {
        self.name = name
        self.cards = cards
        self.boardId = boardId
        super.init()
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(UUID.self, forKey: .id)
        self.boardId = try container.decode(UUID.self, forKey: .boardId)
        self.name = try container.decode(String.self, forKey: .name)
        self.cards = try container.decode([Card].self, forKey: .cards)
        super.init()
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(name, forKey: .name)
        try container.encode(boardId, forKey: .boardId)
        try container.encode(cards, forKey: .cards)
        
    }
    
}

extension BoardList: NSItemProviderWriting {
    
    static let typeIdentifier = "com.bryangwin.Trello-Like-App.BoardList"
    
    static var writableTypeIdentifiersForItemProvider: [String] {
        [typeIdentifier]
    }
    
    func loadData(withTypeIdentifier typeIdentifier: String, forItemProviderCompletionHandler completionHandler: @escaping (Data?, Error?) -> Void) -> Progress? {
        do {
            
            let encoder = JSONEncoder()
            encoder.outputFormatting = .prettyPrinted
            completionHandler(try encoder.encode(self), nil)
            
        }catch {
            completionHandler(nil, error)
            
        }
        return nil
    }

}

extension BoardList: NSItemProviderReading {
    
    static var readableTypeIdentifiersForItemProvider: [String] {
        [typeIdentifier]
    }
    
    static func object(withItemProviderData data: Data, typeIdentifier: String) throws -> Self {
        try JSONDecoder().decode(Self.self, from: data)
    }
    
    
}

