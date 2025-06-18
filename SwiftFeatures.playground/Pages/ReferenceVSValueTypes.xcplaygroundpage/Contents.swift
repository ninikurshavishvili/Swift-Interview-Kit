import UIKit

var greeting = "Hello, playground"

//Value Types & Reference Types

// ზოგადად Swift-ში, მონაცმეთა ორი ტიპი არსებობს value და reference type.

/*
 Value type არის მონაცემთა ისეთი ტიპი რომლის მნიშვნელობაც ინახება პირდაპირ მეხსიერებაში.
 
 Referece type არის მონაცემთა ისეთი ტიპი, რომლის მნიშვნელობაც ინახება, როგორც Reference-ი მეხსიერებაში, იმ ადგილას სადაც მისი Actual value არის შენახული.
 */

// 🔶 REFERENCE TYPES
//Reference Type-ები არიან Class-ები და Closure-ები.
// Reference types share the same memory reference when assigned or passed around.

class Dog {
    var name: String
    init(name: String) {
        self.name = name
    }
}

var dog1 = Dog(name: "Bobo")
var dog2 = dog1           // No copy, just another reference to same object
dog2.name = "Coco"        // Changes affect both

print(dog1.name) // Coco ⚠️
print(dog2.name) // Coco ✅

// 👉 dog1 and dog2 are both pointing to the same **shared** object in memory


// 🔷 VALUE TYPES
// Structs, Enums, and basic types like Int, Double, Bool, String are value types.
// Value types are copied when assigned to a new variable or passed into a function.

struct User {
    var name: String
}

var user1 = User(name: "Nini")
var user2 = user1         // A copy is created here
user2.name = "Anna"       // Changes user2 only

print(user1.name) // Nini ✅
print(user2.name) // Anna ✅

// 👉 user1 and user2 are now two **independent** copies
