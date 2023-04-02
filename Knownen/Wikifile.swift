//
//  Wikifile.swift
//  Knownen
//
//  Created by Romi on 14/01/2023.
//

import Foundation

struct WikiFile {
    static let fileName = "WikipediaPages"
    static let fileExt = "txt"
    static let dir = try? FileManager.default.url(for: .documentDirectory,
          in: .userDomainMask, appropriateFor: nil, create: true)
    
    /*static var saveStatistics = false*/
    
    static func addEntry(url: URL, interest: String) {
        print("addEntry called")
        if (url.absoluteString != "https://fr.wikipedia.org/wiki/Special:Random" && url.absoluteString != "https://fr.wikipedia.org/wiki/Sp%C3%A9cial:Page_au_hasard") {
            do {
                /*if (saveStatistics == false) {
                 saveStatistics = true
                 return
                 }*/
                guard let fileURL = dir?.appendingPathComponent(fileName).appendingPathExtension(fileExt) else {
                    fatalError("Not able to create URL")
                }
                print(fileURL)
                
                let dataToAppend = createContentToAppend(url: url, interest: interest).data(using: .utf8)!
                
                if let handle = try? FileHandle(forWritingTo: fileURL) {
                    try handle.seekToEnd()
                    try handle.write(contentsOf: dataToAppend)
                    try handle.close()
                }
                else {
                    try dataToAppend.write(to: fileURL, options: .atomic)
                }
            }
            catch {
                print("Unexpected error: \(error).")
            }
        }
    }
    
    static func createContentToAppend(url: URL, interest: String) -> String {
        let date = Date().formatted(Date.ISO8601FormatStyle())
        return date + "," + url.absoluteString + "," + interest + "\n"
    }
}
