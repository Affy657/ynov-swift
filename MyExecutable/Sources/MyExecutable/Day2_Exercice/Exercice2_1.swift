// Créer un système de rectangles avec points 2D
// 1. Struct Point2D avec properties x, y (Double)
// 2. Struct Rectangle avec :
//    - Properties : origin (Point2D), width, height (Double)
//    - Computed property area : retourne l'aire (width × height)
//    - Computed property perimeter : retourne le périmètre
//    - Method contains(_ point: Point2D) -> Bool : vérifie si le point est dans les limites du rectangle
//    - Mutating method move(by delta: Point2D) : déplace le rectangle en ajoutant delta à origin
// Test : Créer un rectangle à (0, 0) de 10×5, vérifier si (5, 2.5) est dedans, puis le déplacer de (5, 5).

struct Point2D {
    var x: Double
    var y: Double
}

struct Rectangle {
    var origin: Point2D
    
    var width: Double{
        didSet { if width < 0 { width = oldValue } }
    }

    var height: Double{
        didSet { if height < 0 { height = oldValue } }
    }

    var area: Double {
        return width * height
    }

    var perimeter: Double {
        return 2 * (width + height)
    }

    func contains(_ point: Point2D) -> Bool {
        let inX = point.x >= origin.x && point.x <= origin.x + width
        let inY = point.y >= origin.y && point.y <= origin.y + height
        return inX && inY
    }

    mutating func move(by delta: Point2D) {
        origin.x += delta.x
        origin.y += delta.y
    }
}

func exercice2_1() {
    var rectangle = Rectangle(origin: Point2D(x: 0, y: 0), width: 10, height: 5)
    print("Rectangle: \(rectangle)")
    print("Area: \(rectangle.area)")
    print("Perimeter: \(rectangle.perimeter)")
    print("Contains (5, 2.5): \(rectangle.contains(Point2D(x: 5, y: 2.5)))")
    rectangle.move(by: Point2D(x: 5, y: 5))
    print("Moved rectangle: \(rectangle)")
}
