//
//  ChatCellModel.swift
//  DeclarativeTextureDemo
//
//  Created by Андрей Ведищев on 25.12.2023.
//

import Foundation

struct ChatCellModel {
    
    struct ReplyOnMessage {
        
        let name: String
        let message: String
    }
    
    let reply: ReplyOnMessage?
    let avatar: Avatar.Model
    let name: String
    let message: String
    let time: String
    let isEdited: Bool
    let direction: Direction
}