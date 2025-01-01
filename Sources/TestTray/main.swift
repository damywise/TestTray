import AppKit

class AppDelegate: NSObject, NSApplicationDelegate {
    var statusItem: NSStatusItem?

    func applicationDidFinishLaunching(_ notification: Notification) {
        print("Starting tray application...")

        print("Creating status bar item...")
        let statusBar = NSStatusBar.system
        statusItem = statusBar.statusItem(withLength: NSStatusItem.variableLength)
        guard let statusItem = statusItem else {
            print("Error: Failed to create status item")
            return
        }

        let iconPath = URL(fileURLWithPath: FileManager.default.currentDirectoryPath)
            .appendingPathComponent("icon.png")
        if let image = NSImage(contentsOf: iconPath) {
            image.isTemplate = false
            image.size = NSSize(width: 18, height: 18)
            if let button = statusItem.button {
                button.image = image
            }
        } else {
            print("Error: Failed to load custom icon")
        }

        print("Tray application setup complete")
    }
}

// Create and run the application
let app = NSApplication.shared
app.setActivationPolicy(.regular)

let delegate = AppDelegate()
app.delegate = delegate

app.run()
