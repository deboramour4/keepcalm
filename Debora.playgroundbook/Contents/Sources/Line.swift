import UIKit

class Line {
    var start: CGPoint
    var end: CGPoint
    var color: UIColor
    var width: Float
    
    init (start _start: CGPoint, end _end:CGPoint, color _color: UIColor!, width _width: Float) {
        start = _start
        end = _end
        color = _color
        width = _width
    }
}
