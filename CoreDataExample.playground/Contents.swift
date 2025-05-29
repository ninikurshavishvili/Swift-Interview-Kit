import Foundation
import CoreData

// Step 1: შევქმენით კლასი Person, რომელიც მემკვიდრეობით იღებს NSManagedObject
// რაც ნიშნავს რომ person კლასი გახდა CoreData ობიექტი.
class Person: NSManagedObject {
    @NSManaged var name: String
}

// Step 2: შევქმენით CoreData model ობიექტი (playground-ისთვის დაგვჭირდება ხელით მანუალ
//შექმნა თუმცა აპპები ამას აკეთებენ .xcdatamodeled გამოყენებით
let model = NSManagedObjectModel()
// შევქმენით CoreData entity "person"
let personEntity = NSEntityDescription()
personEntity.name = "Person"
//შემდეგ ეს Entity person კლასს დავუკავშრეთ NSStringFromClass-ის გამოყენებით.
personEntity.managedObjectClassName = NSStringFromClass(Person.self)

//იგივენაირად "name" ატრიბუტი დავუკავშირეთ "name" კლასის ფროფერთის
let nameAttribute = NSAttributeDescription()
nameAttribute.name = "name"
nameAttribute.attributeType = .stringAttributeType
//ნიშნავს რომ სახელი არ შეიძლება 0 იყოს.
nameAttribute.isOptional = false

// დავამატეთ "name" ატრიბუტი person Entity-ის
personEntity.properties = [nameAttribute]
// დავამატეთ Person entity მთლიან დატა მოდელს
model.entities = [personEntity]

//შევქმენით კონტეინერი რომელიც იჭერს Stack-ს
let container = NSPersistentContainer(name: "PlaygroundModel", managedObjectModel: model)

//დავაყენეთ მუდმივი საცავი ანუ Storage მეხსიერებაში [ეს რადგან playground-ში კარგად გამოვიდეს]
//
let description = NSPersistentStoreDescription()
description.type = NSInMemoryStoreType
container.persistentStoreDescriptions = [description]

// სთორიჯის ჩატვირთვა და შეცდომების დამუშავება
container.loadPersistentStores { (desc, error) in
    if let error = error {
        fatalError("Failed to load store: \(error)")
    }
}

// Step 3: შევქმენით კონტერინერი რომელსაც ვიყენებთ მონაცემების მართვისთვის როგორიცაა შენახვა დაფეჩვა..
let context = container.viewContext

// შევქმენით Person კლასის ობიექტი და დავაინსერთეთ ის contex-ში.
//დავაყენეთ სახელო
let person = Person(entity: personEntity, insertInto: context)
person.name = "Nini"

// ახლა ვცადოთ კონტექსტში შევინახოთ ეს ცვლილება
do {
    try context.save()
    print("Saved successfully ✅")
} catch {
    print("Failed to save ❌: \(error)")
}

// Step 4: ვცადოთ ყველა ობიექტის გამოტანა, და თუ არსებობს დავბეჭდავთ.
let fetchRequest = NSFetchRequest<Person>(entityName: "Person")

do {
    let results = try context.fetch(fetchRequest)
    for person in results {
        print("👤 Name: \(person.name)")
    }
} catch {
    print("Fetch failed: \(error)")
}
