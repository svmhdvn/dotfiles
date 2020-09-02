config.load_autoconfig()

c.colors.webpage.prefers_color_scheme_dark = True
c.content.autoplay = False
c.content.default_encoding = "utf-8"
c.downloads.location.prompt = False
c.fonts.default_size = "12pt"
c.hints.chars = "arstdhneio"
c.tabs.wrap = False
c.url.default_page = "about:blank"
c.url.searchengines = {"DEFAULT": "https://google.com/search?q={}"}
c.url.start_pages = "about:blank"
c.zoom.default = "150%"

# Colemak bindings

# Disable default key remappings for more flexibility
c.bindings.key_mappings = {}

# TODO file an issue about this
def safeUnbind(key):
    if key in c.bindings.default:
        config.unbind(key)

# Unbind the keys that I rarely use
safeUnbind("<Ctrl-B>") # scroll-page 0 -1
safeUnbind("<Ctrl-F>") # scroll-page 0 1
safeUnbind("<Ctrl-Q>") # quit
safeUnbind("<Ctrl-T>") # open -t
safeUnbind("D") # tab-close -o
safeUnbind("d") # tab-close
safeUnbind("u") # undo
safeUnbind("v") # enter-mode caret
safeUnbind("sf") # save
safeUnbind("sk") # set-cmd-text -s :bind
safeUnbind("sl") # set-cmd-text -s :set -t
safeUnbind("ss") # set-cmd-text -s :set

def rebind(orig, new, command):
    safeUnbind(orig)
    safeUnbind(new)
    config.bind(new, command)

rebind("<Ctrl-D>", "<Ctrl-N>", "scroll-page 0 0.5")
rebind("<Ctrl-U>", "<Ctrl-E>", "scroll-page 0 -0.5")
rebind("L", "I", "forward")
rebind("K", "<Ctrl-H>", "tab-prev")
rebind("J", "<Ctrl-I>", "tab-next")
rebind("j", "n", "scroll down")
rebind("k", "e", "scroll up")
rebind("l", "i", "scroll right")
rebind("n", "k", "search-next")
rebind("N", "K", "search-prev")
rebind("i", "s", "enter-mode insert")

# custom commands
config.bind(";m", "hint links spawn mpv {hint-url}")
