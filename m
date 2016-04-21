From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [pinmux scripts PATCH] Adapt to latest U-Boot driver code changes
Date: Thu, 21 Apr 2016 15:58:48 -0600
Message-ID: <1461275928-3866-1-git-send-email-swarren@wwwdotorg.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

This makes the script generate code that matches U-Boot as of its commit
"ARM: tegra: use DT bindings for GPIO naming".

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 board-to-uboot.py | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/board-to-uboot.py b/board-to-uboot.py
index d5e2708c6695..7c57958c3956 100755
--- a/board-to-uboot.py
+++ b/board-to-uboot.py
@@ -59,9 +59,9 @@ print('''\
 #ifndef _PINMUX_CONFIG_%(board_define)s_H_
 #define _PINMUX_CONFIG_%(board_define)s_H_
 
-#define GPIO_INIT(_gpio, _init)				\\
+#define GPIO_INIT(_port, _gpio, _init)			\\
 	{						\\
-		.gpio	= GPIO_P##_gpio,		\\
+		.gpio	= TEGRA_GPIO(_port, _gpio),	\\
 		.init	= TEGRA_GPIO_INIT_##_init,	\\
 	}
 
@@ -77,12 +77,18 @@ gpio_table = []
 for pincfg in board.pincfgs_by_num():
     if not pincfg.gpio_init:
         continue
+    gpio = pincfg.gpio_pin.gpio.upper()
+    port = gpio[:-1]
+    assert port.isalpha()
+    pin = gpio[-1]
+    assert pin.isdigit()
     row = (
-        pincfg.gpio_pin.gpio.upper(),
+        port,
+        pin,
         pincfg.gpio_init.upper(),
     )
     gpio_table.append(row)
-headings = ('gpio', 'init_val')
+headings = ('port', 'pin', 'init_val')
 dump_c_table(headings, 'GPIO_INIT', gpio_table)
 
 print('''\
-- 
2.8.1
