//
//  Utility.swift
//  SwiftRun
//
//  Created by 황석현 on 1/10/25.
//

import Foundation

// 중복 사용되는 값들
enum Url {
    static let allCategory = "https://iosvocabulary-default-rtdb.firebaseio.com/categories.json"
    static func getCategory(category: CategoryKeys) -> String {
        return "https://iosvocabulary-default-rtdb.firebaseio.com/categories/\(category).json"
    }
}

enum CategoryKeys: String {
    case builtInFunctions = "cat1"
    case builtInKeywords = "cat2"
    case builtInClassesAndStructs = "cat3"
    case developmentEnglish = "cat4"
    case marketingTerms = "cat5"
}
