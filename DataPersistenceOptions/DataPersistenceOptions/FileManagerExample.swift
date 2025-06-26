//
//  FileManagerExample.swift
//  DataPersistenceOptions
//
//  Created by Nino Kurshavishvili on 26.06.25.
//

//რა არის FileManager

/*
 FileManager არის Swift-ის tool-ი, რომელიც ეხმარება დეველოპერებს ფაილების და ფოლდერების მართვაში iOS და macOS მოწყობილობებში. ეს აუცილებელია, რადგან ბევრ აპლიკაციაში ჩვენ გვჭირდება მონაცემების შენახვა და მართვა, მაგალითად, მომხმარებლის პარამეტრების, დოკუმენტების ან სურათების შენახვა.
 
 FileManager არის Swift-ში ჩაშენებული ინსტრუმენტი, რომელიც თქვენს მოწყობილობაზე არსებული ფაილებისა და საქაღალდეების მენეჯერის ფუნქციას ასრულებს. ეს არის კლასი, რომელიც დეველოპერებს ფაილურ სისტემასთან ურთიერთქმედების მარტივ გზას სთავაზობს.
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
