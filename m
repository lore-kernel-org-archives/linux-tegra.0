From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [pinmux scripts PATCH] Import latest Venice2 spreadsheet
Date: Tue,  1 Jul 2014 14:28:55 -0600
Message-ID: <1404246535-19690-1-git-send-email-swarren@wwwdotorg.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

A few fixes were made to the spreadsheet, including one that removes the
need for the special-case in the import script.

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
I evidently forgot to send this out when I imported the new data. Since
this data is already included in U-Boot, I'll apply this immediately.

 configs/venice2.board         | 8 ++++----
 csv-to-board-tegra124-xlsx.py | 4 ----
 2 files changed, 4 insertions(+), 8 deletions(-)

diff --git a/configs/venice2.board b/configs/venice2.board
index 49f8bbf31bef..ea888e8879d4 100644
--- a/configs/venice2.board
+++ b/configs/venice2.board
@@ -83,7 +83,7 @@ pins = (
     ('pi3',                    'spi4',        None,      'none', False, False, False, False),
     ('pi6',                    None,          'in',      'none', False, True,  False, False),
     ('pi2',                    None,          'out0',    'none', False, False, False, False),
-    ('pi5',                    'rsvd2',       None,      'up',   True,  False, False, False),
+    ('pi5',                    None,          'out1',    'none', False, False, False, False),
     ('pi1',                    None,          'in',      'none', False, True,  False, False),
     ('pi4',                    None,          'out0',    'none', False, False, False, False),
     ('pi7',                    'rsvd1',       None,      'down', True,  False, False, False),
@@ -125,12 +125,12 @@ pins = (
     ('sdmmc4_dat7_paa7',       'sdmmc4',      None,      'up',   False, True,  False, False),
     ('kb_col0_pq0',            None,          'in',      'none', False, True,  False, False),
     ('kb_col1_pq1',            'rsvd2',       None,      'down', True,  False, False, False),
-    ('kb_col2_pq2',            'rsvd2',       None,      'down', True,  False, False, False),
+    ('kb_col2_pq2',            None,          'in',      'up',   False, True,  False, False),
     ('kb_col3_pq3',            None,          'in',      'none', False, True,  False, False),
     ('kb_col4_pq4',            'sdmmc3',      None,      'up',   False, True,  False, False),
     ('kb_col5_pq5',            'rsvd2',       None,      'down', True,  False, False, False),
-    ('kb_col6_pq6',            'rsvd2',       None,      'down', True,  False, False, False),
-    ('kb_col7_pq7',            'rsvd2',       None,      'down', True,  False, False, False),
+    ('kb_col6_pq6',            None,          'in',      'up',   False, True,  False, False),
+    ('kb_col7_pq7',            None,          'in',      'up',   False, True,  False, False),
     ('kb_row0_pr0',            None,          'out0',    'none', False, False, False, False),
     ('kb_row1_pr1',            None,          'in',      'none', False, True,  False, False),
     ('kb_row10_ps2',           'uarta',       None,      'none', False, True,  False, False),
diff --git a/csv-to-board-tegra124-xlsx.py b/csv-to-board-tegra124-xlsx.py
index b40cf8173136..f99fda18e70e 100755
--- a/csv-to-board-tegra124-xlsx.py
+++ b/csv-to-board-tegra124-xlsx.py
@@ -200,10 +200,6 @@ with open(csvfile, newline='') as fh:
         else:
             gpio_init = None
 
-        # FIXME: The spreadsheet should be fixed...
-        if (args.board == 'venice2') and (ball_name == 'gpio_pi5'):
-            pupd = 'up'
-
         gpio_pin = soc.gpio_or_pin_by_name(ball_name)
         for i, func in enumerate((f0, f1, f2, f3)):
             if func != gpio_pin.funcs[i]:
-- 
1.8.1.5
