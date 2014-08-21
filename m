From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [pinmux PATCH] Warn about unconfigured pins
Date: Thu, 21 Aug 2014 17:26:04 -0600
Message-ID: <1408663564-3281-1-git-send-email-swarren@wwwdotorg.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

When generating a kernel or U-Boot pinmux configuration, complain about
pins that have no configuration. That's probably a bug in the spreadsheet.

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 board-to-kernel-dt.py     | 2 ++
 board-to-uboot.py         | 2 ++
 tegra_pmx_board_parser.py | 8 ++++++++
 3 files changed, 12 insertions(+)

diff --git a/board-to-kernel-dt.py b/board-to-kernel-dt.py
index 966fee29eea9..86739db90bee 100755
--- a/board-to-kernel-dt.py
+++ b/board-to-kernel-dt.py
@@ -63,3 +63,5 @@ for pincfg in board.pincfgs_by_num():
 # FIXME: Handle drive groups
 
 print('		};')
+
+board.warn_about_unconfigured_pins()
diff --git a/board-to-uboot.py b/board-to-uboot.py
index e4df06e2606a..c67919176a3f 100755
--- a/board-to-uboot.py
+++ b/board-to-uboot.py
@@ -168,3 +168,5 @@ print('''\
 
 #endif /* PINMUX_CONFIG_%s_H */
 ''' % board.definename, end='')
+
+board.warn_about_unconfigured_pins()
diff --git a/tegra_pmx_board_parser.py b/tegra_pmx_board_parser.py
index 352bbe0a2499..7b45abe74a00 100644
--- a/tegra_pmx_board_parser.py
+++ b/tegra_pmx_board_parser.py
@@ -19,6 +19,7 @@
 # DEALINGS IN THE SOFTWARE.
 
 import os.path
+import sys
 import tegra_pmx_soc_parser
 from tegra_pmx_parser_utils import *
 
@@ -62,6 +63,13 @@ class Board(TopLevelParsedObj):
     def pincfgs_by_num(self):
         return self._pincfgs_by_num
 
+    def warn_about_unconfigured_pins(self):
+        unconfigured_gpio_pins = {gpio_pin.fullname for gpio_pin in self.soc.gpios_pins_by_num()}
+        for gpio_pin in self.pincfgs_by_num():
+            unconfigured_gpio_pins.remove(gpio_pin.gpio_pin.fullname)
+        for gpio_pin in unconfigured_gpio_pins:
+            print('WARNING: Unconfigured pin ' + gpio_pin, file=sys.stderr)
+
 def load_board(boardname):
     fn = os.path.join(configs_dir, boardname + '.board')
     d = {}
-- 
2.1.0.rc2.3.g67de23d
