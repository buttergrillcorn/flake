local settings = require "settings"
local downloads = require "downloads"
local modes = require "modes"

settings.webview.default_font_family = "Noto Sans CJK SC"
settings.webview.sans_serif_font_family = "Noto Sans CJK SC"
settings.webview.serif_font_family = "Noto Serif CJK SC"
settings.webview.monospace_font_family = "Maple Mono NF CN"
settings.webview.enable_smooth_scrolling = true
settings.application.prefer_dark_mode = true
settings.session.always_save = true
-- settings.window.tablist.always_visible = true
settings.webview.allow_file_access_from_file_urls = true
settings.webview.allow_universal_access_from_file_urls = true
settings.webview.allow_modal_dialogs = true
settings.webview.auto_load_images = true
settings.webview.enable_accelerated_2d_canvas = true
settings.webview.enable_java = true
settings.webview.enable_javascript = true
settings.webview.enable_media_stream = true
settings.webview.enable_mediasource = true
settings.webview.enable_page_cache = true
settings.webview.enable_webaudio = true
settings.webview.enable_webgl = true
settings.webview.media_playback_requires_gesture = true

-- Downloads
downloads.default_dir = os.getenv("HOME") .. "/Downloads"

-- Privacy
-- settings.webkit.enable_developer_extras = true
-- settings.webkit.enable_dns_prefetching = true

-- Search Engines
local engines = settings.window.search_engines
engines.default = engines.g

engines.g   = "https://www.google.com/search?q=%s"
engines.mar = "https://marginalia-search.com/search?query=%s"
engines.yt  = "https://www.youtube.com/results?search_queary=%s"
engines.r   = "https://old.reddit.com/search?q=%s"
engines.rd  = "https://www.reddit.com/search?q=%s"
engines.ghr = "https://www.github.com/search?q=%s&type=repositories"
engines.ghc = "https://www.github.com/search?q=%s&type=code"
engines.img = "https://www.google.com/search?tbm=isch&q=%s"
engines.map = "https://www.google.com/maps/search/%s"
engines.wk  = "https://en.wikipedia.org/wiki/%s"
engines.tr  = "https://translate.google.com/?sl=auto&tl=en&text=%s"

-- Edit with Emacs
local function edit_with_emacs(w)
    local cmd = {"emacsclient", "-c", "-a", " ", "+%l:%c", w.view.uri}
    luakit.spawn(cmd)
end

modes.add_binds("insert", {
    {"<C-e>", "Edit with Emacs", edit_with_emacs}, -- Example keybinding: Ctrl+e
})

-- Adblock
local adblock = require "adblock"
