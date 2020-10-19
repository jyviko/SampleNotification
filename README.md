# SampleNotification
WatchOS 7.0 sample notification project that the demonstrates that the response object contains an empty notification that arrives in userNotificationCenter `(_:didReceive:withCompletionHandler:)`

To reproduce the issue, clone the project and compile `SampleNotifcation.xcodeproj` in XCode 12.0.1. Verify that the `SampleNotifcation WatchKit App (Notification)` contains the Notification Payload `PushNotificationPayload.apns` included in the project (Go to Edit Schemes->SampleNotification App (Notification)->Run->Notification Paylaod). 
Run the `SampleNotifcation WatchKit App (Notification)` target and select an Apple Watch from the simulator.. Wait until the simulator opens and then click `Action`. Place a breakpoint in line 41 of the `NotificationProcessor.swift`
to investigate the `response` object of `(_:didReceive:withCompletionHandler:)`.
