import UIKit
import Mixpanel

Mixpanel.initialize(token: "a2dd54d0aa99bf6b0fe8df3edb0ff469", trackAutomaticEvents: false)
Mixpanel.mainInstance().distinctId = "1"
Mixpanel.mainInstance().identify(distinctId: "1")
Mixpanel.mainInstance().loggingEnabled = true

Mixpanel.mainInstance().track(event: "Event 1")
Mixpanel.mainInstance().track(event: "Event 2")
Mixpanel.mainInstance().track(event: "Event 3")

print("BEFORE UIApplicationMain()")

DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
    Mixpanel.mainInstance().track(event: "Event 4")
    
    print("Force flush")
    
    Mixpanel.mainInstance().flush()
}

UIApplicationMain(
    CommandLine.argc,
    CommandLine.unsafeArgv,
    nil,
    NSStringFromClass(AppDelegate.self)
)
