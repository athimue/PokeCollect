//
//  DatabaseManager.swift
//  PokeCollect
//
//  Created by Clusel Mathieu on 26/10/2023.
//

import Combine
import Foundation
import GRDB

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
