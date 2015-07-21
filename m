From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [pinmux 1/2] csv-to-board: handle missing gpio_init_vals
Date: Tue, 21 Jul 2015 16:30:32 -0600
Message-ID: <1437517833-721-1-git-send-email-swarren@wwwdotorg.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Some board spreadsheets have missing values in the gpio_init_val column.
This occurs to handle initialization ordering quirks in downstream SW.
Modify csv-to-board to handle such spreadsheets without throwing an
error, but warn the user that they need to fix up the resultant config
file with valid data.

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 csv-to-board.py | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/csv-to-board.py b/csv-to-board.py
index 60493465bfac..1d98cfa74a7a 100755
--- a/csv-to-board.py
+++ b/csv-to-board.py
@@ -159,8 +159,13 @@ def e_input_munge(d):
         'ENABLE': True,
     }[d]
 
+warn_empty_gpio_init_val = False
 def gpio_init_val_munge(d):
+    global warn_empty_gpio_init_val
+    if d == '':
+        warn_empty_gpio_init_val = True
     return {
+        '': 'out?',
         '0': 'out0',
         '1': 'out1',
     }[d]
@@ -326,3 +331,6 @@ with open(cfgfile, 'wt') as fh:
     print('mipi_pad_ctrl_groups = (', file=fh)
     dump_py_table(mipi_headings, mipi_table, file=fh)
     print(')', file=fh)
+
+if warn_empty_gpio_init_val:
+    print('WARNING: Missing gpio_init_vals detected. Manual fixup required', file=sys.stderr)
-- 
1.9.1
