//
//  OSLogsExample.swift
//  DataPersistenceOptions
//
//  Created by Nino Kurshavishvili on 26.06.25.
//

//რა არის OSLog

/*
 log-ები არის რანთაიმ Activities-ების და event-ების record-ები (ჩანაწერები) რომლებიც
 
 OSLog არის Apple-ის მიერ iOS 10-ში დანერგილი ლოგირების ფრეიმვოკრი, კონფიდენციალურობაზე მორგებული და სტრუქტურირებული logging სისტემა, რომელიც გამოიყენება გამართვისა და დიაგნოსტიკისთვის.
 
 ეფექტურობა: OSLog შექმნილია იმისათვის, რომ იყოს ეფექტური, რაც იმას ნიშნავს, რომ ის მინიმალურ გავლენას ახდენს თქვენი აპლიკაციის წარმადობაზე მაშინაც კი, როდესაც ჩართულია ვრცელი ლოგირება.
 
 ქვესისტემა და კატეგორია: OSLog წარმოგიდგენთ ქვესისტემისა და კატეგორიის ცნებებს ლოგირების შეტყობინებების ორგანიზებისთვის. ქვესისტემა წარმოადგენს თქვენი აპლიკაციის უფრო დიდ კომპონენტს, ხოლო კატეგორია შემდგომში ანაწილებს ლოგირების შეტყობინებებს.
 */
/**
 It’s better than print() because:
 ✅ Logs are categorized by subsystem and category
 ✅ Supports different levels (debug, info, error, fault)
 ✅ Optimized for performance and battery
 ✅ Can be filtered in Console.app or Instruments
 🧩 It replaces older logging approaches like NSLog() or excessive print() usage in production code.
 */
 
 /*
 | Use Case               | Log Level | Example Category |
 | ---------------------- | --------- | ---------------- |
 | Network request status | `info`    | "Network"        |
 | User logged in or out  | `info`    | "Authentication" |
 | JSON decoding failed   | `error`   | "DataParsing"    |
 | Unexpected nil crash   | `fault`   | "ViewLifecycle"  |
 | Debug tap coordinates  | `debug`   | "UIInteraction"  |

 */

//გამოყენება
/**
 | Level    | Description                    |
 | -------- | ------------------------------ |
 | `debug`  | Detailed logs for debugging    |
 | `info`   | General app events             |
 | `notice` | Important but not errors       |
 | `error`  | Recoverable issues             |
 | `fault`  | Serious, system-level problems |
 */

import OSLog
import SwiftUI

let authLogger = Logger(subsystem: "com.ninikurshavishvili.MyApp", category: "Authentication")

struct LoginView: View {
    @State private var username = ""
    @State private var password = ""

    var body: some View {
        VStack {
            TextField("Username", text: $username)
            SecureField("Password", text: $password)
            Button("Login") {
                if username.isEmpty || password.isEmpty {
                    authLogger.error("Login failed – fields are empty")
                } else {
                    authLogger.info("User \(username) attempted login.")
                }
            }
        }
        .padding()
    }
}
/*
 🔍 სად ვნახო OSLog-ის შეტყობინებები?
 გამოიყენეთ Console.app Mac-ზე:

 გაუშვით თქვენი აპლიკაცია მოწყობილობაზე ან სიმულატორზე.

 გახსენით Console→ აირჩიეთ თქვენი მოწყობილობა → მოძებნეთ ქვესისტემის ან კატეგორიის მიხედვით.
 */

