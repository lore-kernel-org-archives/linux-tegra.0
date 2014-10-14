From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [pinmux scripts PATCH 2/4] Board CSV import: Put full CSV filename in data structure
Date: Tue, 14 Oct 2014 11:11:18 -0600
Message-ID: <1413306680-27330-2-git-send-email-swarren@wwwdotorg.org>
References: <1413306680-27330-1-git-send-email-swarren@wwwdotorg.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1413306680-27330-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Putting the whole filename in to the data structure allows us to keep
different CSV files in different directories. This will allow explicit
separation of public and private CSV files.

The per-board data is also modified to be a dictionary so that additional
fields can be stored in the future.

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 csv-to-board-tegra124-xlsx.py | 21 ++++++++++++++++-----
 1 file changed, 16 insertions(+), 5 deletions(-)

diff --git a/csv-to-board-tegra124-xlsx.py b/csv-to-board-tegra124-xlsx.py
index c150fface9d2..d5a8f2f3f645 100755
--- a/csv-to-board-tegra124-xlsx.py
+++ b/csv-to-board-tegra124-xlsx.py
@@ -42,15 +42,26 @@ if args.debug:
 if dbg: print(args)
 
 supported_boards = {
-    'jetson-tk1': 'T124_customer_pinmux_PM375_30Apr2014_v2.csv', # worksheet PM375Beaver_Configuration
-    'norrin': 'PM370_T124_customer_pinmux_1.1.csv', # worksheet Customer_Configuration
-    'venice2': 'Venice2_T124_customer_pinmux_based_on_P4_rev47_2013-07-12.csv', # worksheet Customer_Configuration
+    'jetson-tk1': {
+        # T124_customer_pinmux_PM375_30Apr2014_v2.xlsm worksheet PM375Beaver_Configuration
+        # T124_customer_pinmux.xlsm worksheet Jetson TK1 Configuration
+        # Jetson_TK1_customer_pinmux_release.xlsm worksheet Jetson TK1 Configuration
+        'filename': 'csv/jetson-tk1.csv', # worksheet PM375Beaver_Configuration
+    },
+    'norrin': {
+        # PM370_T124_customer_pinmux_1.1.xlsm worksheet Customer_Configuration
+        'filename': 'nv-internal-data/PM370_T124_customer_pinmux_1.1.csv',
+    },
+    'venice2': {
+        # Venice2_T124_customer_pinmux_based_on_P4_rev47_2013-07-12.xlsm worksheet Customer_Configuration
+        'filename': 'nv-internal-data/Venice2_T124_customer_pinmux_based_on_P4_rev47_2013-07-12.csv',
+    },
 }
 
 if not args.board in supported_boards:
     print('ERROR: Unsupported board %s' % args.board, file=sys.stderr)
     sys.exit(1)
-csvfile = os.path.join('nv-internal-data', supported_boards[args.board])
+board_conf = supported_boards[args.board]
 
 soc = tegra_pmx_soc_parser.load_soc('tegra124')
 
@@ -136,7 +147,7 @@ def rcv_sel_munge(d):
 
 found_header = False
 pin_table = []
-with open(csvfile, newline='') as fh:
+with open(board_conf['filename'], newline='') as fh:
     csv = csv.reader(fh)
     lnum = 0
     for row in csv:
-- 
1.9.1
