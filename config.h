/* DWM config.h final adaptado desde bspwm hotkeys */

#include <X11/XF86keysym.h>
#include "movestack.c"   // patch opcional si quieres mover ventanas
//#include "push.c"       // patch opcional para push windows

/* appearance */
static const unsigned int borderpx  = 2;
static const unsigned int snap      = 32;
static const int showbar            = 1;
static const int topbar             = 1;

/* fonts */
static const char *fonts[]          = { "monospace:size=10" };
static const char dmenufont[]       = "monospace:size=10";

/* colors */
static const char col_gray1[]       = "#222222";
static const char col_gray2[]       = "#444444";
static const char col_gray3[]       = "#bbbbbb";
static const char col_gray4[]       = "#eeeeee";
static const char col_cyan[]        = "#005577";
static const char *colors[][3]      = {
    [SchemeNorm] = { col_gray3, col_gray1, col_gray2 },
    [SchemeSel]  = { col_gray4, col_cyan,  col_cyan  },
};

/* tagging (1-9) */
static const char *tags[] = { "1","2","3","4","5","6","7","8","9" };

/* commands */
static const char *termcmd[]  = { "alacritty", NULL };
static const char *roficmd[]  = { "rofi", "-show", "drun", NULL };

/* rules */
static const Rule rules[] = { };

/* layouts */
static const float mfact     = 0.55;
static const int nmaster     = 1;
static const int resizehints = 1;
static const Layout layouts[] = {
    { "[]=",      tile },
    { "><>",      NULL },
    { "[M]",      monocle },
};

/* key definitions */
#define MODKEY Mod4Mask
#define TAGKEYS(KEY,TAG) \
    { MODKEY,                       KEY,      view,           {.ui = 1 << TAG} }, \
    { MODKEY|ShiftMask,             KEY,      tag,            {.ui = 1 << TAG} }

#define SHCMD(cmd) { .v = (const char*[]){ "/bin/sh", "-c", cmd, NULL } }

/* key bindings */
static Key keys[] = {
    /* modifier                     key        function        argument */

    // Launch programs
    { MODKEY,                       XK_Return, spawn,          {.v = termcmd } },
    { MODKEY,                       XK_space,  spawn,          {.v = roficmd } },

    // Close window
    { MODKEY|ShiftMask,             XK_q,      killclient,     {0} },

    // Layouts
    { MODKEY,                       XK_t,      setlayout,      {.v = &layouts[0]} }, // tiled
    { MODKEY,                       XK_f,      setlayout,      {.v = &layouts[1]} }, // floating
    { MODKEY,                       XK_m,      setlayout,      {.v = &layouts[2]} }, // monocle

    // Focus between windows
    { MODKEY,                       XK_j,      focusstack,     {.i = +1 } },
    { MODKEY,                       XK_k,      focusstack,     {.i = -1 } },

    // Move windows in stack
    { MODKEY|ShiftMask,             XK_j,      movestack,      {.i = +1 } },
    { MODKEY|ShiftMask,             XK_k,      movestack,      {.i = -1 } },

    // Tags (desktops)
    TAGKEYS(                        XK_1,                      0)
    TAGKEYS(                        XK_2,                      1)
    TAGKEYS(                        XK_3,                      2)
    TAGKEYS(                        XK_4,                      3)
    TAGKEYS(                        XK_5,                      4)
    TAGKEYS(                        XK_6,                      5)
    TAGKEYS(                        XK_7,                      6)
    TAGKEYS(                        XK_8,                      7)
    TAGKEYS(                        XK_9,                      8)

    // Quit DWM
    { MODKEY|ShiftMask,             XK_Escape, quit,           {0} },
};

