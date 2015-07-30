From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [pinmux scripts PATCH] board-to-uboot: add comment re: auto-generation
Date: Thu, 30 Jul 2015 14:28:37 -0600
Message-ID: <1438288117-22045-1-git-send-email-swarren@wwwdotorg.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Add a comment block to the top of each generated U-Boot header file
indicating that the file was auto-generated, should not be manually
edited, and with a pointer to the tool and command used to generate it.

Suggested-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 board-to-uboot.py | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/board-to-uboot.py b/board-to-uboot.py
index 7b20f23949bc..d5e2708c6695 100755
--- a/board-to-uboot.py
+++ b/board-to-uboot.py
@@ -48,6 +48,14 @@ print('''\
  * SPDX-License-Identifier: GPL-2.0+
  */
 
+/*
+ * THIS FILE IS AUTO-GENERATED - DO NOT EDIT!
+ *
+ * To generate this file, use the tegra-pinmux-scripts tool available from
+ * https://github.com/NVIDIA/tegra-pinmux-scripts
+ * Run "board-to-uboot.py %(board_name)s".
+ */
+
 #ifndef _PINMUX_CONFIG_%(board_define)s_H_
 #define _PINMUX_CONFIG_%(board_define)s_H_
 
@@ -60,6 +68,7 @@ print('''\
 static const struct tegra_gpio_config %(board_varname)s_gpio_inits[] = {
 ''' % {
     'copyright_year': copyright_year,
+    'board_name': args.board,
     'board_define': board.definename,
     'board_varname': board.varname,
 }, end='')
-- 
1.9.1
