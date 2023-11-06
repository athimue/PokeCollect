//
//  DatabaseManager.swift
//  PokeCollect
//
//  Created by Clusel Mathieu on 26/10/2023.
//

import Foundation
import GRDB
import Combine

struct DatabaseManager {
    
    private let privateWriter: DatabaseWriter

    init(_ writer: DatabaseWriter) throws {
        self.privateWriter = writer
        try migrator.migrate(writer)
    }

    var reader: DatabaseReader {
        privateWriter
    }
    
    var writer: DatabaseWriter {
        privateWriter
    }
}
