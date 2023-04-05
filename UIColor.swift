import Foundation
import UIKit

extension UIColor {
    func lighterColor(_ amount: CGFloat) -> UIColor{
        return UIColor.blendColors(color: self, destinationColor: UIColor.white, amount: amount)
    }
    
    func darkerColor(_ amount: CGFloat) -> UIColor{
        return UIColor.blendColors(color: self, destinationColor: UIColor.black, amount: amount)
    }
    
    static func blendColors(color: UIColor, destinationColor: UIColor, amount : CGFloat) -> UIColor{
        var amountToBlend = amount;
        if amountToBlend > 1{
            amountToBlend = 1.0
        }
        else if amountToBlend < 0{
            amountToBlend = 0
        }
        
        var r,g,b, alpha : CGFloat
        r = 0
        g = 0
        b = 0
        alpha = 0
        color.getRed(&r, green: &g, blue: &b, alpha: &alpha) //gets the rgba values (0-1)
        
        //Get the destination rgba values
        var dest_r, dest_g, dest_b, dest_alpha : CGFloat
        dest_r = 0
        dest_g = 0
        dest_b = 0
        dest_alpha = 0
        destinationColor.getRed(&dest_r, green: &dest_g, blue: &dest_b, alpha: &dest_alpha)
        
        r = amountToBlend * (dest_r * 255) + (1 - amountToBlend) * (r * 255)
        g = amountToBlend * (dest_g * 255) + (1 - amountToBlend) * (g * 255)
        b = amountToBlend * (dest_b * 255) + (1 - amountToBlend) * (b * 255)
        alpha = abs(alpha / dest_alpha)
        
        return UIColor(red: r/255.0, green: g/255.0, blue: b/255.0, alpha: alpha)
    }
}

extension UIColor {
    convenience init(hexString: String) {
        let hex = hexString.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int = UInt64()
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (255, 0, 0, 0)
        }
        self.init(red: CGFloat(r) / 255, green: CGFloat(g) / 255, blue: CGFloat(b) / 255, alpha: CGFloat(a) / 255)
    }
}

