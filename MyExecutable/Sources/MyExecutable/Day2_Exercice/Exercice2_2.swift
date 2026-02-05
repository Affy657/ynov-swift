// Système de hiérarchie de formes avec classes

// 1. Classe de base Shape avec :
// - Property name (String)
// - Method area() -> Double (avec une valeure par defaut)

// 2. Classe Circle héritant de Shape :
// - Property radius (Double)
// - Override area() pour calculer l'aire d'un cercle

// 3. Classe RectangleShape héritant de Shape :
// - Properties width, height (Double)
// - Override area() pour calculer l'aire d'un rectangle

// 4. Fonction displayShapes(_ shapes: [Shape]) qui print le nom et l'aire de chaque forme

//Test : Créer un array avec Circle(radius: 5) et RectangleShape(width: 4, height: 6), appeler displayShapes().

class Shape {
    let name: String
    
    init(name: String) {
        self.name = name
    }
    
    func area() -> Double {
        return 0.0
    }
}

final class Circle: Shape {
    let radius: Double
    
    init(radius: Double) {
        self.radius = radius
        super.init(name: "Circle")
    }
    
    override func area() -> Double {
        return Double.pi * radius * radius
    }
}

final class RectangleShape: Shape {
    let width: Double
    let height: Double
    
    init(width: Double, height: Double) {
        self.width = width
        self.height = height
        super.init(name: "Rectangle")
    }
    
    override func area() -> Double {
        return width * height
    }
}

func displayShapes(_ shapes: [Shape]) {
    for shape in shapes {
        if let circle = shape as? Circle {
            print("\(circle.name): radius = \(circle.radius), area = \(circle.area())")
        } else if let rectangle = shape as? RectangleShape {
            print("\(rectangle.name): width = \(rectangle.width), height = \(rectangle.height), area = \(rectangle.area())")
        }
    }
}

func exercice2_2() {
    let circle = Circle(radius: 5)
    let rectangle = RectangleShape(width: 4, height: 6)
    let shapes: [Shape] = [circle, rectangle]
    displayShapes(shapes)
}
