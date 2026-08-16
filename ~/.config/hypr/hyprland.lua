-- ╔══════════════════════════════════════════════════════════════╗
-- ║         Hyprland Lua Konfigürasyonu (hyprland.lua)          ║
-- ║     Hyprlang → Lua çevirisi | Hyprland 0.55+               ║
-- ╚══════════════════════════════════════════════════════════════╝

-- ═══════════════════════════════════════════════════════════════
-- DEĞİŞKENLER
-- ═══════════════════════════════════════════════════════════════
local mainMod = "SUPER"
local term    = "kitty"
local files   = "thunar"
local browser = "firefox"

-- ═══════════════════════════════════════════════════════════════
-- MONİTÖRLER
-- ═══════════════════════════════════════════════════════════════
hl.monitor({
    output   = "0.80",
    mode     = "1366x768",
    position = "auto",
    scale    = 1.25,
})
-- ═══════════════════════════════════════════════════════════════
-- BAŞLANGIÇ (STARTUP)
-- ═══════════════════════════════════════════════════════════════
hl.on("hyprland.start", function()
    hl.exec_cmd("awww-daemon &")
    hl.exec_cmd("nm-applet --indicator &")
    hl.exec_cmd("dunst &")
    hl.exec_cmd("waybar &")
    hl.exec_cmd("sleep 1 && awww img /home/wurh/İndirilenler/hebelle2.jpg")
    hl.exec_cmd("hyprctl setcursor Adwaita 24")
end)

-- ═══════════════════════════════════════════════════════════════
-- GENEL AYARLAR (hl.config)
-- ═══════════════════════════════════════════════════════════════
hl.config({

    -- Girdi (Input)
    input = {
        kb_layout = "tr",
        follow_mouse = 1,
        sensitivity = 0,
        touchpad = {
            natural_scroll = false,
            disable_while_typing = true,
        },
    },

    -- Genel (General)
    general = {
        gaps_in = 4,
        gaps_out = 6,
--     border_size = 2,
--     no_border_on_floating = true,
       layout = "dwindle",
        col = {
--          active_border   = "rgba(33ccffee) rgba(00ff99ee) 45deg",
            inactive_border = "rgba(595959aa)",
        },
    },

    -- Dekorasyon (Decoration)
    decoration = {
        rounding = 0,
        active_opacity = 1.0,
        inactive_opacity = 0.9,
        shadow = {
            enabled = true,
            range = 4,
            render_power = 3,
            color = "rgba(1a1a1aee)",
        },
        blur = {
            enabled = true,
            size = 3,
            passes = 1,
        },
    },

    -- Animasyonlar (Animations)
    animations = {
        enabled = true,
        bezier = {
            md3_decel = { 0.05, 0.7, 0.1, 1 },
        },
        animation = {
            { name = "windows",    enabled = 1, speed = 2, curve = "md3_decel", style = "popin 90%" },
            { name = "windowsIn",  enabled = 1, speed = 2, curve = "md3_decel", style = "popin 90%" },
            { name = "windowsOut", enabled = 1, speed = 2, curve = "md3_decel", style = "popin 80%" },
            { name = "border",     enabled = 1, speed = 2, curve = "default" },
            { name = "fade",       enabled = 1, speed = 2, curve = "default" },
            { name = "workspaces", enabled = 1, speed = 3, curve = "md3_decel", style = "slide" },
        },
    },

    -- Çeşitli (Misc)
    misc = {
        disable_hyprland_logo = true,
        disable_splash_rendering = true,
        mouse_move_enables_dpms = true,
        enable_swallow = true,
    },

    -- Dwindle Layout
    dwindle = {
--      pseudotile = true,
        preserve_split = true,
    },
})

-- ═══════════════════════════════════════════════════════════════
-- TUŞ ATAMALARI (Keybinds)
-- ═══════════════════════════════════════════════════════════════

-- Uygulamalar
hl.bind(mainMod .. " + Return", hl.dsp.exec_cmd(term))
hl.bind(mainMod .. " + Q",      hl.dsp.window.close())
hl.bind(mainMod .. " + E",      hl.dsp.exec_cmd(files))
hl.bind(mainMod .. " + B",      hl.dsp.exec_cmd(browser))
hl.bind(mainMod .. " + D",      hl.dsp.exec_cmd("pkill rofi || rofi -show drun -show-icons"))
hl.bind(mainMod .. " + SPACE",  hl.dsp.window.float({ action = "toggle" }))
hl.bind("CTRL + ALT + Delete",  hl.dsp.exit())
hl.bind(mainMod .. " + F",      hl.dsp.window.float({ action = "toggle" }))

-- Parlaklık (binde → repeating flag)
hl.bind("XF86MonBrightnessUp",   hl.dsp.exec_cmd("brightnessctl set +5%"),   { repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl set 5%-"),   { repeating = true })

-- Diğer
hl.bind(mainMod .. " + R",           hl.dsp.exec_cmd("hyprctl reload"))
hl.bind("Print",                     hl.dsp.exec_cmd("grim - | wl-copy"))
hl.bind(mainMod .. " + SHIFT + S",   hl.dsp.exec_cmd('grim -g "$(slurp)" - | wl-copy'))

-- Odaklanma (Focus)
hl.bind(mainMod .. " + left",  hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + up",    hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + down",  hl.dsp.focus({ direction = "down" }))

-- Çalışma Alanları (Workspaces)
hl.bind(mainMod .. " + 1", hl.dsp.focus({ workspace = 1 }))
hl.bind(mainMod .. " + 2", hl.dsp.focus({ workspace = 2 }))
hl.bind(mainMod .. " + 3", hl.dsp.focus({ workspace = 3 }))
hl.bind(mainMod .. " + 4", hl.dsp.focus({ workspace = 4 }))
hl.bind(mainMod .. " + 5", hl.dsp.focus({ workspace = 5 }))

-- Pencereyi Çalışma Alanına Taşıma
hl.bind(mainMod .. " + SHIFT + 1", hl.dsp.window.move({ workspace = 1 }))
hl.bind(mainMod .. " + SHIFT + 2", hl.dsp.window.move({ workspace = 2 }))
hl.bind(mainMod .. " + SHIFT + 3", hl.dsp.window.move({ workspace = 3 }))
hl.bind(mainMod .. " + SHIFT + 4", hl.dsp.window.move({ workspace = 4 }))

-- Fare (Mouse)
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag())
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize())
