From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [pinmux scripts PATCH 1/4] Board CSV import: Support all Tegra124 OD pins
Date: Tue, 14 Oct 2014 11:11:17 -0600
Message-ID: <1413306680-27330-1-git-send-email-swarren@wwwdotorg.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Complete the list of OD pins in the CSV -> *.board import script for
Tegra124.

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 csv-to-board-tegra124-xlsx.py | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/csv-to-board-tegra124-xlsx.py b/csv-to-board-tegra124-xlsx.py
index be985c2b83c6..c150fface9d2 100755
--- a/csv-to-board-tegra124-xlsx.py
+++ b/csv-to-board-tegra124-xlsx.py
@@ -219,9 +219,8 @@ with open(csvfile, newline='') as fh:
             print('ERROR: %s: MUX CSV %s not in SOC F0..3 %s' % (ball_name, mux, repr(gpio_pin.funcs)), file=sys.stderr)
             sys.exit(1)
 
-        if ball_name.startswith('ddc_'):
+        if ball_name in ('reset_out_n', 'owr', 'hdmi_int', 'ddc_scl', 'ddc_sda'):
             # These balls' pad type is always OD, so we don't need to set it
-            # FIXME: There are a few other OD type pads to check for
             # FIXME: The SoC data structure should tell us the pad type instead of hard-coding it
             od = False
 
-- 
1.9.1
