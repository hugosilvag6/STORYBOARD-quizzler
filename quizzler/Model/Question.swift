//
//  Question.swift
//  quizzler
//
//  Created by Hugo Silva on 05/05/22.
//

import Foundation

struct Question {
    let text: String
    let answer: String
    let options: [String]?
    
    init(q: String, o: [String]? = nil, a: String) {
        text = q
        answer = a
        options = o
    }
}
