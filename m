From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [pinmux scripts PATCH 3/4] Board CSV import: Support either 0- or 1-based RSVD numbers
Date: Tue, 14 Oct 2014 11:11:19 -0600
Message-ID: <1413306680-27330-3-git-send-email-swarren@wwwdotorg.org>
References: <1413306680-27330-1-git-send-email-swarren@wwwdotorg.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1413306680-27330-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

The public Jetson TK1 pinmux spreadsheet will use 1-based RSVD numbers
whereas the other internal board spreadsheets aren't (currently?)
updated, and hence will continue to use 0-based RSVD numbering. Support
either numbering scheme in the import script.

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 csv-to-board-tegra124-xlsx.py | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/csv-to-board-tegra124-xlsx.py b/csv-to-board-tegra124-xlsx.py
index d5a8f2f3f645..a4d414c3e991 100755
--- a/csv-to-board-tegra124-xlsx.py
+++ b/csv-to-board-tegra124-xlsx.py
@@ -47,6 +47,7 @@ supported_boards = {
         # T124_customer_pinmux.xlsm worksheet Jetson TK1 Configuration
         # Jetson_TK1_customer_pinmux_release.xlsm worksheet Jetson TK1 Configuration
         'filename': 'csv/jetson-tk1.csv', # worksheet PM375Beaver_Configuration
+        'rsvd_0based': False,
     },
     'norrin': {
         # PM370_T124_customer_pinmux_1.1.xlsm worksheet Customer_Configuration
@@ -62,6 +63,9 @@ if not args.board in supported_boards:
     print('ERROR: Unsupported board %s' % args.board, file=sys.stderr)
     sys.exit(1)
 board_conf = supported_boards[args.board]
+if not 'rsvd_0based' in board_conf:
+    # FIXME: This should default to False for some future chip
+    board_conf['rsvd_0based'] = True
 
 soc = tegra_pmx_soc_parser.load_soc('tegra124')
 
@@ -108,7 +112,9 @@ def func_munge(f):
         return 'sdmmc2'
     if f in ('ir3_rxd', 'ir3_txd'):
         return 'irda'
-    return rsvd_0base_to_1base(f)
+    if board_conf['rsvd_0based']:
+        return rsvd_0base_to_1base(f)
+    return f
 
 def pupd_munge(d):
     return {
-- 
1.9.1
