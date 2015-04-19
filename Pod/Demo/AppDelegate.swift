import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?

  func application(
    application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {

      window = UIWindow(frame: UIScreen.mainScreen().bounds)
      let viewController = ViewController()
      let navigationController = UINavigationController(rootViewController: viewController)

      window?.rootViewController = navigationController
      window?.makeKeyAndVisible()

      return true
  }
}

