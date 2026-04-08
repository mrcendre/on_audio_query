import MediaPlayer
import Flutter

class PermissionController {
    public static func checkPermission() -> Bool {
        let permissionStatus = MPMediaLibrary.authorizationStatus()
        if permissionStatus == MPMediaLibraryAuthorizationStatus.authorized {
            return true
        } else {
            return false
        }
    }
    
    public static func requestPermission(_ result : @escaping FlutterResult) {
        Log.type.debug("Requesting permissions.")
        Log.type.debug("iOS Version: \(ProcessInfo().operatingSystemVersion.majorVersion)")
        
        var isPermissionGranted: Bool = false
        MPMediaLibrary.requestAuthorization { status in
            isPermissionGranted = status == .authorized
            Log.type.debug("Permission accepted: \(isPermissionGranted)")
            result(isPermissionGranted)
        }
    }
}
