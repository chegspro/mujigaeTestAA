//
//  extUIViewController.swift
//  MujigaeTest
//
//  Created by Aslam Azis on 03/12/19.
//  Copyright © 2019 Aslam Azis. All rights reserved.
//

import UIKit

extension UIViewController {
    func exit(exitType: NavigationExitType, index: Int?, animated: Bool) {
        switch exitType {
        case .pop:
            if navigationController?.viewControllers.count ?? 0 > 1 {
                self.navigationController?.popViewController(animated: animated)
            } else {
                if self.navigationController != nil {
                    self.navigationController?.dismiss(animated: true, completion: nil)
                } else {
                    self.dismiss(animated: true, completion: nil)
                }
            }
            break
        case .dismiss:
            self.dismiss(animated: animated)
            break
        case .popToRoot:
            self.navigationController?.popToRootViewController(animated: animated)
            break
        case .popToIndex:
            if let index = index, index >= 0, let destination = self.navigationController?.viewControllers[index] {
                self.navigationController?.popToViewController(destination, animated: animated)
            } else {
                if self.navigationController != nil {
                    self.navigationController?.dismiss(animated: true, completion: nil)
                } else {
                    self.dismiss(animated: true, completion: nil)
                }
            }
            break
        }
    }
}
