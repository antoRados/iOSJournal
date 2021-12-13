//
//  EntryController.swift
//  iOSJournal
//
//  Created by Anto Rados on 11/24/21.
//

import Foundation

class EntryController {
    
    // Shared property
    static let shared = EntryController()
    // Source of Truth
    var entries: [Entry] = []
    
    // Create entry
    func createEntryWith(title: String, body: String) {
        let newEntry = Entry(title: title, body: body)
        entries.append(newEntry)
        saveToPersistentStorage()
    }
    
    // Delete entry
    func deleteEntry(entry: Entry) {
        guard let index = entries.firstIndex(of: entry) else { return }
        entries.remove(at: index)
        saveToPersistentStorage()
    }
    
    private func fileURL() -> URL {
        let urls = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documentsDirectoryURL = urls[0].appendingPathComponent("Journal.json")
        return documentsDirectoryURL
    }
    
    func saveToPersistentStorage() {
        do {
            let data = try JSONEncoder().encode(entries)
            try data.write(to: fileURL())
        } catch {
            print("======= ERROR =======")
            print("Function: \(#function)")
            print("Error: \(error)")
            print("Description: \(error.localizedDescription)")
            print("======= ERROR =======")
        }
    }
    
    func loadFromPersistentStorage() {
        do {
            let data = try Data(contentsOf: fileURL())
            let entries = try JSONDecoder().decode([Entry].self, from: data)
            self.entries = entries
        } catch {
            print("======= ERROR =======")
            print("Function: \(#function)")
            print("Error: \(error)")
            print("Description: \(error.localizedDescription)")
            print("======= ERROR =======")
        }
    }
    
} //End of "EntryController" class
