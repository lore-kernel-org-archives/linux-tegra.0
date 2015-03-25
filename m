From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [pinmux scripts PATCH 3/5] csv-to-board: handle missing package columns
Date: Wed, 25 Mar 2015 12:06:15 -0600
Message-ID: <1427306777-17669-3-git-send-email-swarren@wwwdotorg.org>
References: <1427306777-17669-1-git-send-email-swarren@wwwdotorg.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1427306777-17669-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Some board spreadsheets may have irrelevant package columns removed,
leaving only the package column that the specific board uses. Update
csv-to-board to handle missing package columns.

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 csv-to-board.py | 23 ++++++++++++++++-------
 1 file changed, 16 insertions(+), 7 deletions(-)

diff --git a/csv-to-board.py b/csv-to-board.py
index 2860c029b9f3..b2d1c46ec302 100755
--- a/csv-to-board.py
+++ b/csv-to-board.py
@@ -190,18 +190,27 @@ with open(board_conf['filename'], newline='') as fh:
                 try:
                     cols[colid] = row.index(coltext)
                 except:
-                    if board_conf['soc'] != 'tegra124':
-                        raise
-                    if colid != COL_RCV_SEL:
-                        print('ERROR: Header column "%s" not found' % coltext, file=sys.stderr)
-                        sys.exit(1)
+                    if colid in (COL_BALL_MID, COL_BALL_DSC):
+                        pass
+                    else:
+                        if board_conf['soc'] != 'tegra124':
+                            raise
+                        if colid != COL_RCV_SEL:
+                            print('ERROR: Header column "%s" not found' % coltext, file=sys.stderr)
+                            sys.exit(1)
                     cols[colid] = None
             found_header = True
             continue
 
         ball_name = row[cols[COL_BALL_NAME]].lower()
-        ball_mid = row[cols[COL_BALL_MID]]
-        ball_dsc = row[cols[COL_BALL_DSC]]
+        if cols[COL_BALL_MID]:
+            ball_mid = row[cols[COL_BALL_MID]]
+        else:
+            ball_mid = None
+        if cols[COL_BALL_DSC]:
+            ball_dsc = row[cols[COL_BALL_DSC]]
+        else:
+            ball_dsc = None
 
         # Section title row
         if not ball_mid and not ball_dsc:
-- 
1.9.1
