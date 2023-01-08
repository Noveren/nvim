import sys
if __name__ == "__main__":
    if sys.platform == "win32":
        try:
            import win32api
            import win32gui
            from win32con import WM_INPUTLANGCHANGEREQUEST
            LANG = {
                "ZH": 0x0804,
                "EN": 0x0409,
            }
            arg    = "EN" if len(sys.argv) == 1 or (len(sys.argv) == 2 and sys.argv[1] == "EN") else "ZH"
            lang   = LANG[arg]
            hwnd   = win32gui.GetForegroundWindow()
            result = win32api.SendMessage(
                hwnd,
                WM_INPUTLANGCHANGEREQUEST,
                0,
                lang,
            )
            if not result:
                print(f"Change input method to {arg}")
            else:
                raise Exception
        except Exception:
            print("Failed to change input method")
