//
//  FileManagerExample.swift
//  DataPersistenceOptions
//
//  Created by Nino Kurshavishvili on 26.06.25.
//

//რა არის FileManager
import Foundation

/*
 
 FileManagerარის Apple-ის API, რომელიც საშუალებას აძლევს თქვენს აპლიკაციას შექმნას, წაიკითხოს, გადაიტანოს, დააკოპიროს და წაშალოს ფაილები და საქაღალდეები თქვენი აპლიკაციის sandbox-ში.

 ეს Foundation-ის ნაწილია , ამიტომ დამატებითი არაფრის იმპორტი არ გჭირდებათ.
 
 FileManager - ეხმარება დეველოპერებს ფაილების და ფოლდერების მართვაში iOS და macOS მოწყობილობებში. ეს აუცილებელია, რადგან ბევრ აპლიკაციაში ჩვენ გვჭირდება მონაცემების შენახვა და მართვა, მაგალითად, მომხმარებლის პარამეტრების, დოკუმენტების ან სურათების შენახვა.
 
 FileManager არის Swift-ში ჩაშენებული ინსტრუმენტი, რომელიც თქვენს მოწყობილობაზე არსებული ფაილებისა და საქაღალდეების მენეჯერის ფუნქციას ასრულებს. ეს არის კლასი, რომელიც დეველოპერებს ფაილურ სისტემასთან ურთიერთქმედების მარტივ გზას სთავაზობს.
 */

/**
 | Feature                             | Use FileManager? |
 | ----------------------------------- | ---------------- |
 | Download and save a PDF             | ✅                |
 | Cache image thumbnails              | ✅                |
 | Export CSV/log file from app        | ✅                |
 | Accessing large JSON config offline | ✅                |
 | Temp files for video processing     | ✅                |
*/

/*
 ძირითადი Concept
 
 File Paths: Absolute vs. Relative Paths

 •  absolute path - არის ფაილის ან დირექტორიის სრული გზა, რომელიც იწყება ფაილური სისტემის ძირეული სისტემიდან. მაგალითად, /Users/yourname/Documents/file.txt.
 •  relative path - რის უფრო მოკლე გზა, რომელიც ფარდობითია საწყის წერტილთან. მაგალითად, Documents/file.txt
 */

//საერთო დირექტორიები - Common Directories

/*
 Documents: This is where you store files that the user might need to access or that should be backed up by iCloud.
 
 Caches: This is for storing temporary data that your app can recreate, so it doesn’t need to be backed up.
 
 Temporary: This is for files that your app only needs temporarily. The system may delete these files when your app isn’t using them anymore.
 */

//დირექტორიების შექმნა
func createDirectory() {
    let fileManager = FileManager.default
    
    let documentsURL = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first!
    let cachesURL = fileManager.urls(for: .cachesDirectory, in: .userDomainMask).first!
    let tempURL = fileManager.temporaryDirectory
    
    print("📂 Documents: \(documentsURL)")
    print("📂 Caches: \(cachesURL)")
    print("📂 Temp: \(tempURL)")
}

//folder-ის შექმნა

func createFolder(named folderName: String) {
    let folderURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0].appendingPathComponent(folderName)

    if !FileManager.default.fileExists(atPath: folderURL.path) {
        do {
            try FileManager.default.createDirectory(at: folderURL, withIntermediateDirectories: true)
            print("✅ Folder created at \(folderURL)")
        } catch {
            print("❌ Error creating folder: \(error)")
        }
    } else {
        print("📁 Folder already exists")
    }
}

//writeTextFile
func writeTextFile() {
    let fileURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0].appendingPathComponent("example.txt")
    
    let content = "Hello from Nini! ❤️"
    
    do {
        try content.write(to: fileURL, atomically: true, encoding: .utf8)
        print("📄 File written to: \(fileURL)")
    } catch {
        print("❌ Error writing file: \(error)")
    }
}

func readTextFile() {
    let fileURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0].appendingPathComponent("example.txt")
    
    do {
        let savedText = try String(contentsOf: fileURL, encoding: .utf8)
        print("📄 Read file content: \(savedText)")
    } catch {
        print("❌ Error reading file: \(error)")
    }
}

func deleteFile(named fileName: String) {
    let fileURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0].appendingPathComponent(fileName)
    
    if FileManager.default.fileExists(atPath: fileURL.path) {
        do {
            try FileManager.default.removeItem(at: fileURL)
            print("🗑️ File deleted")
        } catch {
            print("❌ Could not delete file: \(error)")
        }
    } else {
        print("⚠️ File not found")
    }
}
