import Foundation

/**
    Implements the main functions providing constants values and computed ones
*/
extension ScrollingNavigationController {

    // MARK: - View sizing

    func fullNavbarHeight() -> CGFloat {
        return navbarHeight() + statusBar()
    }

    func navbarHeight() -> CGFloat {
        let isPortrait = UIInterfaceOrientationIsPortrait(UIApplication.sharedApplication().statusBarOrientation)
        if UIDevice().userInterfaceIdiom == .Pad || UIScreen.mainScreen().scale == 3 {
            return portraitNavbar()
        } else {
            return (isPortrait ? portraitNavbar() : landscapeNavbar())
        }
    }

    func portraitNavbar() -> CGFloat {
        if let topViewController = self.topViewController {
            return 44 + ((topViewController.navigationItem.prompt != nil) ? 30 : 0)
        }
        return 0
    }

    func landscapeNavbar() -> CGFloat {
        if let topViewController = self.topViewController {
            return 32 + ((topViewController.navigationItem.prompt != nil) ? 22 : 0)
        }
        return 0
    }

    func statusBar() -> CGFloat {
        return UIApplication.sharedApplication().statusBarHidden ? 0 : 20
    }
}
