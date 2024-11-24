import sys, os, subprocess
from PyQt5.QtWidgets import QApplication, QSystemTrayIcon, QMenu, QAction
from PyQt5.QtGui import QIcon

class SystemTrayIcon(QSystemTrayIcon):
    def __init__(self):
        # Create the application
        app = QApplication.instance()
        if app is None:
            app = QApplication(sys.argv)
        self.app = app
        super().__init__()
        self.setIcon(QIcon(os.path.abspath("ClipboardToSpeech.png")))
        self.setToolTip("ClipboardToSpeech")
        menu = QMenu()

        # Add actions to the menu
        read_clipboard_action = QAction("Read my clipboard", self)
        read_clipboard_action.triggered.connect(self.read_clipboard)
        menu.addAction(read_clipboard_action)

        stop_reading_action = QAction("Stop reading", self)
        stop_reading_action.triggered.connect(self.stop_reading)
        menu.addAction(stop_reading_action)

        # Add quit action
        quit_action = QAction("Quit", self)
        quit_action.triggered.connect(self.quit)
        menu.addAction(quit_action)

        self.setContextMenu(menu)
        self.activated.connect(self.on_tray_icon_activated)
        self.show()
        app.exec_()
    
    def on_tray_icon_activated(self, reason):
        if reason == QSystemTrayIcon.Trigger:  # Left click
            self.read_clipboard()
    
    def read_clipboard(self):
        with open("input/paste.txt", "w") as file:
            file.write(QApplication.clipboard().text())
    
    def stop_reading(self):
        with open("action/stop", "w") as file:
            file.write("stop")
    
    def quit(self):
        subprocess.Popen(os.path.dirname(os.path.realpath(__file__)) + '/stop.sh')
        self.app.quit()

tray_icon = SystemTrayIcon()