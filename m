From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [pinmux scripts PATCH 4/4] Board CSV Import: Allow board configuration overrides on cmdline
Date: Tue, 14 Oct 2014 11:11:20 -0600
Message-ID: <1413306680-27330-4-git-send-email-swarren@wwwdotorg.org>
References: <1413306680-27330-1-git-send-email-swarren@wwwdotorg.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1413306680-27330-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Add --csv FILENAME, --rsvd-0based, and --rsvd-1based command-line options
to the board CSV import script. This is especially useful for Jetson TK1,
since different spreadsheets use 0- and 1-based RSVD numbering, so the user
may require an option to easily specify which to use.

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 csv-to-board-tegra124-xlsx.py | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/csv-to-board-tegra124-xlsx.py b/csv-to-board-tegra124-xlsx.py
index a4d414c3e991..eb381656e40d 100755
--- a/csv-to-board-tegra124-xlsx.py
+++ b/csv-to-board-tegra124-xlsx.py
@@ -35,6 +35,9 @@ dbg = False
 parser = argparse.ArgumentParser(description='Create a board config' +
     'from a CSV version of the Venice2 pinmux spreadsheet')
 parser.add_argument('--debug', action='store_true', help='Turn on debugging prints')
+parser.add_argument('--csv', default=argparse.SUPPRESS, help='CSV file to parse')
+parser.add_argument('--rsvd-0based', action='store_true', dest='rsvd_0based', default=argparse.SUPPRESS, help='Assume 0-based RSVD numbering')
+parser.add_argument('--rsvd-1based', action='store_false', dest='rsvd_0based', default=argparse.SUPPRESS, help='Assume 1-based RSVD numbering')
 parser.add_argument('board', help='Board name')
 args = parser.parse_args()
 if args.debug:
@@ -66,6 +69,11 @@ board_conf = supported_boards[args.board]
 if not 'rsvd_0based' in board_conf:
     # FIXME: This should default to False for some future chip
     board_conf['rsvd_0based'] = True
+if 'csv' in args:
+    board_conf['filename'] = args.csv
+if 'rsvd_0based' in args:
+    board_conf['rsvd_0based'] = args.rsvd_0based
+if dbg: print(board_conf)
 
 soc = tegra_pmx_soc_parser.load_soc('tegra124')
 
-- 
1.9.1
