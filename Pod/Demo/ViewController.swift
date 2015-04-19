import UIKit

class ViewController: UIViewController, PostmanDelegate {

  var postman: Postman?

  override func viewDidAppear(animated: Bool) {
    super.viewDidAppear(animated)

    self.view.backgroundColor = UIColor.whiteColor()

    let button = UIBarButtonItem(
      title: "Send mail",
      style: .Done,
      target: self,
      action: "sendMailAction")
    navigationItem.leftBarButtonItem = button
  }

  func sendMailAction() {
    postman = Postman()
    postman!.sendMailTo(
      "hi@there.com",
      subject: "What you doing?",
      body: "Of course",
      attachment: nil,
      usingController: self)
    postman!.delegate = self
  }

  func postmanDidFinished(postman: Postman!) {
    println("postmanDidFinished!")
  }
}

