#!/usr/bin/python

import i3ipc

i3 = i3ipc.Connection()

def on_window_focus(i3, e):
    focused = i3.get_tree().find_focused()
    i3.command('[class="^.*"] border pixel 0')
    if focused.name:
        i3.command("border pixel 3")

i3.on("window::focus", on_window_focus)

i3.main()
