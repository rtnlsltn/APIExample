//  This file was automatically generated and should not be edited.

import AWSAppSync

public final class AllNodesQuery: GraphQLQuery {
  public static let operationString =
    "query AllNodes {\n  listCars {\n    __typename\n    items {\n      __typename\n      Entry\n      Manufacturer\n      Cylinders\n      EngineLocation\n      EngineSize\n      HP\n      Model\n      ModelYear\n      TQ\n      Trim\n      WheelDrive\n    }\n  }\n}"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("listCars", type: .object(ListCar.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(listCars: ListCar? = nil) {
      self.init(snapshot: ["__typename": "Query", "listCars": listCars.flatMap { $0.snapshot }])
    }

    public var listCars: ListCar? {
      get {
        return (snapshot["listCars"] as? Snapshot).flatMap { ListCar(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "listCars")
      }
    }

    public struct ListCar: GraphQLSelectionSet {
      public static let possibleTypes = ["CarsConnection"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("items", type: .list(.object(Item.selections))),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(items: [Item?]? = nil) {
        self.init(snapshot: ["__typename": "CarsConnection", "items": items.flatMap { $0.map { $0.flatMap { $0.snapshot } } }])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var items: [Item?]? {
        get {
          return (snapshot["items"] as? [Snapshot?]).flatMap { $0.map { $0.flatMap { Item(snapshot: $0) } } }
        }
        set {
          snapshot.updateValue(newValue.flatMap { $0.map { $0.flatMap { $0.snapshot } } }, forKey: "items")
        }
      }

      public struct Item: GraphQLSelectionSet {
        public static let possibleTypes = ["Cars"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("Entry", type: .nonNull(.scalar(Int.self))),
          GraphQLField("Manufacturer", type: .nonNull(.scalar(String.self))),
          GraphQLField("Cylinders", type: .nonNull(.scalar(String.self))),
          GraphQLField("EngineLocation", type: .nonNull(.scalar(String.self))),
          GraphQLField("EngineSize", type: .nonNull(.scalar(String.self))),
          GraphQLField("HP", type: .nonNull(.scalar(String.self))),
          GraphQLField("Model", type: .nonNull(.scalar(String.self))),
          GraphQLField("ModelYear", type: .nonNull(.scalar(String.self))),
          GraphQLField("TQ", type: .nonNull(.scalar(String.self))),
          GraphQLField("Trim", type: .nonNull(.scalar(String.self))),
          GraphQLField("WheelDrive", type: .nonNull(.scalar(String.self))),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(entry: Int, manufacturer: String, cylinders: String, engineLocation: String, engineSize: String, hp: String, model: String, modelYear: String, tq: String, trim: String, wheelDrive: String) {
          self.init(snapshot: ["__typename": "Cars", "Entry": entry, "Manufacturer": manufacturer, "Cylinders": cylinders, "EngineLocation": engineLocation, "EngineSize": engineSize, "HP": hp, "Model": model, "ModelYear": modelYear, "TQ": tq, "Trim": trim, "WheelDrive": wheelDrive])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        public var entry: Int {
          get {
            return snapshot["Entry"]! as! Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "Entry")
          }
        }

        public var manufacturer: String {
          get {
            return snapshot["Manufacturer"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "Manufacturer")
          }
        }

        public var cylinders: String {
          get {
            return snapshot["Cylinders"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "Cylinders")
          }
        }

        public var engineLocation: String {
          get {
            return snapshot["EngineLocation"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "EngineLocation")
          }
        }

        public var engineSize: String {
          get {
            return snapshot["EngineSize"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "EngineSize")
          }
        }

        public var hp: String {
          get {
            return snapshot["HP"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "HP")
          }
        }

        public var model: String {
          get {
            return snapshot["Model"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "Model")
          }
        }

        public var modelYear: String {
          get {
            return snapshot["ModelYear"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "ModelYear")
          }
        }

        public var tq: String {
          get {
            return snapshot["TQ"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "TQ")
          }
        }

        public var trim: String {
          get {
            return snapshot["Trim"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "Trim")
          }
        }

        public var wheelDrive: String {
          get {
            return snapshot["WheelDrive"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "WheelDrive")
          }
        }
      }
    }
  }
}