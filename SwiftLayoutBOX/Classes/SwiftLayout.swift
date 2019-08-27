//
//  SwiftLayout.swift
//  Pods-SwiftLayoutBOX_Tests
//
//  Created by Gavin Olsen on 8/26/19.
//
import UIKit

@available(iOS 9.0, *)
public extension UIView {
  var layout: Layout {
    return Layout(view: self)
  }
  
  struct Layout {
    var view: UIView
    var constraints: Constraints {
      return Constraints(view: self.view)
    }
    
    struct Constraints {
      var view: UIView
      
      init(view: UIView) {
        self.view = view
      }
      
      var superview: UIView? {
        return self.view.superview
      }
      
      // Pin Top
      func top(_ offset: CGFloat = 0, anchor: NSLayoutYAxisAnchor? = nil) -> NSLayoutConstraint? {
        guard let otherAnchor = anchor ?? self.superview?.topAnchor else {
          return nil
        }
        return self.view.topAnchor.constraint(equalTo: otherAnchor, constant: offset)
      }
      
      // Pin Right
      func right(_ offset: CGFloat = 0, anchor: NSLayoutXAxisAnchor? = nil) -> NSLayoutConstraint? {
        guard let otherAnchor = anchor ?? self.superview?.trailingAnchor else {
          return nil
        }
        
        return self.view.trailingAnchor.constraint(equalTo: otherAnchor, constant: -offset)
      }
      
      // Pin Bottom
      func bottom(_ offset: CGFloat = 0, anchor: NSLayoutYAxisAnchor? = nil) -> NSLayoutConstraint? {
        guard let otherAnchor = anchor ?? self.superview?.bottomAnchor else {
          return nil
        }
        return self.view.bottomAnchor.constraint(equalTo: otherAnchor, constant: -offset)
      }
      
      // Pin Left
      func left(_ offset: CGFloat = 0, anchor: NSLayoutXAxisAnchor? = nil) -> NSLayoutConstraint? {
        guard let otherAnchor = anchor ?? self.superview?.leadingAnchor else {
          return nil
        }
        return self.view.leadingAnchor.constraint(equalTo: otherAnchor, constant: offset)
      }
      
      // Center X
      @discardableResult func centerX(_ offset: CGFloat = 0, anchor: NSLayoutXAxisAnchor? = nil, _ equality: Equality = .equalTo) -> NSLayoutConstraint? {
        guard let otherAnchor = anchor ?? self.superview?.centerXAnchor else {
          return nil
        }
        
        if equality == .greaterThanOrEqualTo {
          return self.view.centerXAnchor.constraint(greaterThanOrEqualTo: otherAnchor, constant: offset)
        } else if equality == .lessThanOrEqualTo {
          return self.view.centerXAnchor.constraint(lessThanOrEqualTo: otherAnchor, constant: offset)
        } else {
          return self.view.centerXAnchor.constraint(equalTo: otherAnchor, constant: offset)
        }
      }
      
      // Center Y
      @discardableResult func centerY(_ offset: CGFloat = 0, anchor: NSLayoutYAxisAnchor? = nil, _ equality: Equality = .equalTo) -> NSLayoutConstraint? {
        guard let otherAnchor = anchor ?? self.superview?.centerYAnchor else {
          return nil
        }
        
        if equality == .greaterThanOrEqualTo {
          return self.view.centerYAnchor.constraint(greaterThanOrEqualTo: otherAnchor, constant: offset)
        } else if equality == .lessThanOrEqualTo {
          return self.view.centerYAnchor.constraint(lessThanOrEqualTo: otherAnchor, constant: offset)
        } else {
          return self.view.centerYAnchor.constraint(equalTo: otherAnchor, constant: offset)
        }
      }
      
      // Set Width
      @discardableResult func width(_ value: CGFloat, _ equality: Equality = .equalTo) -> NSLayoutConstraint? {
        if equality == .greaterThanOrEqualTo {
          return self.view.widthAnchor.constraint(greaterThanOrEqualToConstant: value)
        } else if equality == .lessThanOrEqualTo {
          return self.view.widthAnchor.constraint(lessThanOrEqualToConstant: value)
        } else {
          return self.view.widthAnchor.constraint(equalToConstant: value)
        }
      }
      
      // Set Height
      @discardableResult func height(_ value: CGFloat, _ equality: Equality = .equalTo) -> NSLayoutConstraint? {
        if equality == .greaterThanOrEqualTo {
          return self.view.heightAnchor.constraint(greaterThanOrEqualToConstant: value)
        } else if equality == .lessThanOrEqualTo {
          return self.view.heightAnchor.constraint(lessThanOrEqualToConstant: value)
        } else {
          return self.view.heightAnchor.constraint(equalToConstant: value)
        }
      }
    }
    
    init(view: UIView) {
      self.view = view
      self.view.translatesAutoresizingMaskIntoConstraints = false
    }
    
    var superview: UIView? {
      return self.view.superview
    }
    
    // Pin Top
    @discardableResult public func top(_ offset: CGFloat = 0, anchor: NSLayoutYAxisAnchor? = nil) -> Layout {
      self.constraints.top(offset, anchor: anchor)?.isActive = true
      return self
    }
    
    // Pin Right
    @discardableResult public func right(_ offset: CGFloat = 0, anchor: NSLayoutXAxisAnchor? = nil) -> Layout {
      self.constraints.right(offset, anchor: anchor)?.isActive = true
      return self
    }
    
    // Pin Bottom
    @discardableResult public func bottom(_ offset: CGFloat = 0, anchor: NSLayoutYAxisAnchor? = nil) -> Layout {
      self.constraints.bottom(offset, anchor: anchor)?.isActive = true
      return self
    }
    
    // Pin Left
    @discardableResult public func left(_ offset: CGFloat = 0, anchor: NSLayoutXAxisAnchor? = nil) -> Layout {
      self.constraints.left(offset, anchor: anchor)?.isActive = true
      return self
    }
    
    // Center X
    @discardableResult public func centerX(_ offset: CGFloat = 0) -> Layout {
      self.constraints.centerX(offset)?.isActive = true
      return self
    }
    
    // Center Y
    @discardableResult public func centerY(_ offset: CGFloat = 0) -> Layout {
      self.constraints.centerY(offset)?.isActive = true
      return self
    }
    
    // Set Width
    @discardableResult public func width(_ value: CGFloat, _ equality: Equality = .equalTo) -> Layout {
      self.constraints.width(value, equality)?.isActive = true
      return self
    }
    
    // Set Height
    @discardableResult public func height(_ value: CGFloat, _ equality: Equality = .equalTo) -> Layout {
      self.constraints.height(value, equality)?.isActive = true
      return self
    }
    
    public enum Equality {
      case equalTo
      case greaterThanOrEqualTo
      case lessThanOrEqualTo
    }
  }
}

@available(iOS 9.0, *)
public extension UIView {
  var anchors: Anchors {
    return Anchors(view: self)
  }
  
  struct Anchors {
    var view: UIView
    
    init(view: UIView) {
      self.view = view
    }
    
    var top: NSLayoutYAxisAnchor {
      return self.view.topAnchor
    }
    
    var bottom: NSLayoutYAxisAnchor {
      return self.view.bottomAnchor
    }
    
    var left: NSLayoutXAxisAnchor {
      return self.view.leadingAnchor
    }
    
    var right: NSLayoutXAxisAnchor {
      return self.view.trailingAnchor
    }
  }
}

