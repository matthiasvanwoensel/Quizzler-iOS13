//
//  Question.swift
//  Quizzler-iOS13
//
//  Created by Matthias Van Woensel on 22/06/2022.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import Foundation

struct Question{
    let text: String
    let answers: Array<String>
    let correctAnswer: String
    
    init(q: String, a: Array<String>, correctAnswer: String ){
        text = q
        answers = a
        self.correctAnswer = correctAnswer
    }

}
