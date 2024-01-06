//
//  ChatCellModel.swift
//

import Foundation

struct ChatCellModel {
    
    let reply: Reply.Model?
    let avatar: Avatar.Model
    let name: String
    let message: String
    let time: String
    let isEdited: Bool
    let direction: Direction
}
