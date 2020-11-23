//
//  BlurTransition.swift
//  TransitionKit
//
//  Created by CP3 on 16/8/10.
//  Copyright © 2016年 CP3. All rights reserved.
//
// Credit: Tristan Himmelman, https://github.com/tristanhimmelman

import UIKit

open class BlurTransition: NSObject, UIViewControllerTransitioningDelegate, UINavigationControllerDelegate {
  fileprivate var animator = BlurAnimatedTransitioning()
  
  public init(duration: TimeInterval = 0.3) {
    super.init()
    animator.duration = duration
  }
  
  open func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
    return animator
  }
  
  open func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
    return animator
  }
  
  open func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationControllerOperation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
    
    if operation == .push, toVC.useCustomTransition {
      return animator
    }
    
    if operation == .pop, fromVC.useCustomTransition {
      return animator
    }
    
    return nil
  }
}
