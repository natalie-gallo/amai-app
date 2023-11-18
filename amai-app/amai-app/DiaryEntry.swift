//
//  DiaryEntry.swift
//  amai-app
//
//  Created by Natalie Gallo on 11/17/23.
//

import UIKit

//The Diary Entry Model
struct DiaryEntry: Codable {
    
    //title
    var title: String
    
    //blood glucose level (optional)
    var bloodGlucoseLevel: String?
    
    //heart rate (optional)
    var heartRate: String?
    
    //blood pressure (optional)
    var bloodPressure: String?
    
    //mood not sure how to save (optional)
    //var mood: String?
    
    //diary note
    var note: String?
    
    //initalize new entry
    init(title: String, bloodGlucoseLevel: String? = nil, heartRate: String? = nil, bloodPressure: String? = nil, note: String? = nil) {
        self.title = title
        self.bloodGlucoseLevel = bloodGlucoseLevel
        self.heartRate = heartRate
        self.bloodPressure = bloodPressure
        self.note = note
    }
    
    // The date the entry was created
    // This property is set as the current date whenever the task is initially created.
    var createdDate: Date = Date()
    
    //id used to identify entry
    var id: String = UUID().uuidString
    
}

//setting up user defaults
extension DiaryEntry {
    
    static let diaryKey = "Diary"
    
    //given an array of diary entries, encode them to data and save to UserDefaults
    static func save(_ diary: [DiaryEntry]) {
        //save array of entries
        let defaults = UserDefaults.standard
        let encodedData = try! JSONEncoder().encode(diary)
        defaults.set(encodedData, forKey: diaryKey)
    }
    
    //retrieve an array of saved diary entries (the diary) from UserDefaults
    static func getDiary() -> [DiaryEntry] {
        let defaults = UserDefaults.standard
        if let data = defaults.data(forKey: diaryKey){
            let decodedData = try! JSONDecoder().decode([DiaryEntry].self, from: data)
            return decodedData
        } else {
            return []
        }
    }
    
    //add a new entry or updating existing
    func save() {
        var currentEntries = DiaryEntry.getDiary()
        if let indexOfExistingEntry = currentEntries.firstIndex(where: {$0.id == self.id}) {
            //update existing
            currentEntries.remove(at: indexOfExistingEntry)
            currentEntries.insert(self, at: indexOfExistingEntry)
        } else {
            //add new entry to end of the array
            currentEntries.append(self)
        }
        DiaryEntry.save(currentEntries)
    }
    
}
