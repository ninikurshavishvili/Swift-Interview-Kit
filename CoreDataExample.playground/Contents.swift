import Foundation
import CoreData

// Step 1: Define the model programmatically
class Person: NSManagedObject {
    @NSManaged var name: String
}

// Step 2: Set up Core Data stack (in-memory for Playground)
let model = NSManagedObjectModel()

let personEntity = NSEntityDescription()
personEntity.name = "Person"
personEntity.managedObjectClassName = NSStringFromClass(Person.self)

let nameAttribute = NSAttributeDescription()
nameAttribute.name = "name"
nameAttribute.attributeType = .stringAttributeType
nameAttribute.isOptional = false

personEntity.properties = [nameAttribute]
model.entities = [personEntity]

let container = NSPersistentContainer(name: "PlaygroundModel", managedObjectModel: model)

let description = NSPersistentStoreDescription()
description.type = NSInMemoryStoreType
container.persistentStoreDescriptions = [description]

// Load persistent stores
container.loadPersistentStores { (desc, error) in
    if let error = error {
        fatalError("Failed to load store: \(error)")
    }
}

// Step 3: Create and save data
let context = container.viewContext

let person = Person(entity: personEntity, insertInto: context)
person.name = "Nini"

do {
    try context.save()
    print("Saved successfully ✅")
} catch {
    print("Failed to save ❌: \(error)")
}

// Step 4: Fetch and print data
let fetchRequest = NSFetchRequest<Person>(entityName: "Person")

do {
    let results = try context.fetch(fetchRequest)
    for person in results {
        print("👤 Name: \(person.name)")
    }
} catch {
    print("Fetch failed: \(error)")
}
