config.load_autoconfig(False)
config.set("content.cookies.accept", "all", "chrome-devtools://*")
config.set("content.cookies.accept", "all", "devtools://*")
config.set("content.headers.accept_language", "", "https://matchmaker.krunker.io/*")
config.set(
    "content.headers.user_agent",
    "Mozilla/5.0 ({os_info}) AppleWebKit/{webkit_version} (KHTML, like Gecko) {upstream_browser_key}/{upstream_browser_version} Safari/{webkit_version}",
    "https://web.whatsapp.com/",
)
config.set(
    "content.headers.user_agent",
    "Mozilla/5.0 ({os_info}; rv:90.0) Gecko/20100101 Firefox/90.0",
    "https://accounts.google.com/*",
)
config.set("content.images", True, "chrome-devtools://*")
config.set("content.images", True, "devtools://*")
config.set("content.javascript.enabled", True, "chrome-devtools://*")
config.set("content.javascript.enabled", True, "devtools://*")
config.set("content.javascript.enabled", True, "chrome://*/*")
config.set("content.javascript.enabled", True, "qute://*/*")
config.set(
    "content.local_content_can_access_remote_urls",
    True,
    "file:///home/james/.local/share/qutebrowser/userscripts/*",
)
config.set(
    "content.local_content_can_access_file_urls",
    True,
    "file:///home/james/.local/share/qutebrowser/userscripts/*",
)

# Session management
c.auto_save.session = True
c.session.lazy_restore = True

# Start page
c.content.local_content_can_access_file_urls = True
c.content.local_content_can_access_remote_urls = True

# Content blocking (requires: python-adblock from extra repo)
c.content.blocking.enabled = True
c.content.blocking.method = "both"  # Use both hosts and brave's adblock
c.content.blocking.hosts.lists = [
    "https://raw.githubusercontent.com/StevenBlack/hosts/master/hosts",
]
c.content.blocking.adblock.lists = [
    "https://easylist.to/easylist/easylist.txt",
    "https://easylist.to/easylist/easyprivacy.txt",
    "https://secure.fanboy.co.nz/fanboy-annoyance.txt",
    "https://easylist-downloads.adblockplus.org/antiadblockfilters.txt",
]

# Privacy
c.content.cookies.accept = "no-3rdparty"
c.content.headers.do_not_track = True

# Downloads
c.downloads.location.directory = "~/Downloads"
c.downloads.location.prompt = True
c.downloads.remove_finished = 5000

# Zoom
c.zoom.default = "110%"

# Performance
c.qt.workarounds.disable_accelerated_2d_canvas = "never"
c.scrolling.smooth = False
c.content.webgl = True

# Force GPU hardware acceleration and rasterization
c.qt.args = [
    "ignore-gpu-blocklist",
    "enable-gpu-rasterization",
    "enable-zero-copy",
    "enable-accelerated-2d-canvas",
    # 'use-gl=desktop',
    "enable-webgl",
    "enable-webgl2",
    "canvas-msaa-sample-count=0",  # Lower quality canvas for speed
    # Wayland
    "ozone-platform-hint=wayland",  # Use Wayland natively
    "enable-features=UseOzonePlatform",  # Force Ozone platform
    "enable-accelerated-video-decode",
    "enable-features=VaapiVideoDecoder",
    # 'disable-features=UseChromeOSDirectVideoDecoder', # Often needed on Linux
]

# Font configuration
c.fonts.default_family = "Noto Sans CJK SC"
c.fonts.default_size = "10pt"
c.fonts.web.family.sans_serif = "Noto Sans CJK SC"
c.fonts.web.family.serif = "Noto Serif CJK SC"
c.fonts.web.family.fixed = "Maple Mono NF CN"
c.fonts.web.size.default = 16
c.fonts.hints = "bold 12pt Maple Mono NF CN"

# Hints
c.hints.border = "2px solid"
c.hints.padding = {"bottom": 3, "top": 3, "left": 3, "right": 3}
c.hints.radius = 0
c.hints.uppercase = True

# Tabs
c.tabs.position = "top"
c.tabs.background = True
c.tabs.select_on_remove = "prev"
c.tabs.favicons.show = "always"
c.tabs.show = "always"
c.tabs.show_switching_delay = 900
c.tabs.width = "25%"
c.tabs.padding = {"bottom": 5, "left": 10, "right": 10, "top": 5}
c.tabs.indicator.padding = {"bottom": 0, "left": 0, "right": 5, "top": 0}
c.tabs.indicator.width = 0
c.tabs.last_close = "default-page"
c.tabs.min_width = 150

# Status bar
c.statusbar.show = "in-mode"
c.statusbar.padding = {"bottom": 5, "left": 10, "right": 10, "top": 5}

# Scrollbar
c.scrolling.bar = "always"

# Completion
c.completion.height = "30%"
c.completion.show = "always"
c.completion.shrink = True
c.completion.quick = True

# External editor
c.editor.command = ["emacsclient", "-c", "-a", " ", "+{line}:{column}", "{}"]

# Custom search engines
c.url.searchengines["DEFAULT"] = "https://www.google.com/search?q={}"
# c.url.searchengines['DEFAULT'] = 'https://kagi.com/search?q={}'
# c.url.searchengines['DEFAULT'] = 'https://www.startpage.com/sp/search?q={}'
c.url.searchengines["g"] = "https://www.google.com/search?q={}"
c.url.searchengines["gem"] = "https://gemini.google.com/app?q={}"
c.url.searchengines["mar"] = "https://marginalia-search.com/search?query={}"
c.url.searchengines["am"] = "https://www.amazon.co.uk/s?k={}"
c.url.searchengines["yt"] = "https://www.youtube.com/results?search_query={}"
c.url.searchengines["aur"] = "https://aur.archlinux.org/packages?O=0&K={}"
c.url.searchengines["arp"] = (
    "https://archlinux.org/packages/?sort=&q={}&maintainer=&flagged="
)
c.url.searchengines["ar"] = "https://wiki.archlinux.org/index.php?search={}"
c.url.searchengines["r"] = "https://old.reddit.com/search?q={}"
c.url.searchengines["rd"] = "https://www.reddit.com/search/?q={}"
c.url.searchengines["ghr"] = "https://github.com/search?q={}&type=repositories"
c.url.searchengines["ghc"] = "https://github.com/search?q={}&type=code"
c.url.searchengines["man"] = "https://man.archlinux.org/search?q={}"
c.url.searchengines["img"] = "https://www.google.com/search?tbm=isch&q={}"
c.url.searchengines["maps"] = "https://www.google.com/maps/search/{}"
c.url.searchengines["wiki"] = "https://en.wikipedia.org/wiki/{}"
c.url.searchengines["trans"] = "https://translate.google.com/?sl=auto&tl=en&text={}"

# General keybinds
config.bind("t.", "config-source")
config.bind("pv", "hint links spawn mpv --title=Picture-in-Picture {hint-url}")
config.bind("pV", "spawn mpv --title=Picture-in-Picture {url}")
# config.bind('pV', 'hint links spawn mpv {hint-url}')
config.bind("gh", "home")
config.bind("gp", "open -p")
config.bind("pp", "hint links run open -p {hint-url}")

# Tabs
config.bind(",tp", 'config-cycle tabs.position "top" "left"')
config.bind(",ts", 'config-cycle tabs.show "always" "switching"')
config.bind("tt", 'config-cycle tabs.show "always" "switching"')
config.bind("tpo", 'config-cycle tabs.position "top" "left"')

# Dark mode toggle
config.bind("td", 'config-cycle colors.webpage.darkmode.enabled "true" "false"')

# Userscripts
# config.bind("zv", "spawn --userscript video-download")
# config.bind("zr", "spawn --userscript reading-mode")
# config.bind("zt", "spawn --userscript translate-page")
# config.bind("za", "spawn --userscript paywall-bypass")

# Vim-style navigation for completion/prompts
config.bind("<Ctrl-j>", "completion-item-focus next", mode="command")
config.bind("<Ctrl-k>", "completion-item-focus prev", mode="command")
config.bind("<Ctrl-j>", "prompt-item-focus next", mode="prompt")
config.bind("<Ctrl-k>", "prompt-item-focus prev", mode="prompt")
