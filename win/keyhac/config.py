import pyauto
from keyhac import *


def configure(keymap):
    keymap.editor = "code"
    keymap.setFont("HackGen Console NF", 16)
    keymap.setTheme("black")
    keymap.clipboard_history.enableHook(False)

    keymap_global = keymap.defineWindowKeymap()

    def escAndImeOff():
        keymap.getWindow().setImeStatus(0)
        keymap.InputKeyCommand("Esc")()

    keymap_global["Esc"] = escAndImeOff
    keymap_global["BackSlash"] = "S-BackSlash"
    keymap_global["A-Yen"] = keymap.InputTextCommand("¥")

    # DeepL (virtual key code: 124 = F13)
    keymap_global["W-Q"] = "C-A-(124)"  # translate with popup
    keymap_global["A-W-Q"] = "A-W-(124)"  # translate with window
    keymap_global["S-W-Q"] = "S-W-(124)"  # capture and translate
    keymap_global["C-W-Q"] = "C-W-(124)"  # replace with translation
