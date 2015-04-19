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
      "olivia@louise.com",
      subject: "Hi",
      body: "Livy Darling, \n\nI am grateful — grate-fuller than ever before — that you were born, & that your love is mine & our two lives woven & melded together! \n\n- SLC",
      attachment: nil,
      usingController: self)
    postman!.delegate = self
  }

  func postmanDidFinish(postman: Postman!) {
    println("postmanDidFinish!")
  }
}

