From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [pinmux 2/2] csv-to-board: allow 'Ball Name' in an abitrary column
Date: Tue, 21 Jul 2015 16:30:33 -0600
Message-ID: <1437517833-721-2-git-send-email-swarren@wwwdotorg.org>
References: <1437517833-721-1-git-send-email-swarren@wwwdotorg.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1437517833-721-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

csv-to-board currently parses the header row to find out which column
each desired piece of data is located in. However, it checks a hard-coded
column to determine which row is the header row. Enhance the script to
allow the header row identification data to be in an arbitrary column.

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 csv-to-board.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/csv-to-board.py b/csv-to-board.py
index 1d98cfa74a7a..2f99f4afa48f 100755
--- a/csv-to-board.py
+++ b/csv-to-board.py
@@ -193,7 +193,7 @@ with open(board_conf['filename'], newline='') as fh:
 
         # Header rows
         if not found_header:
-            if row[0] != 'Ball Name':
+            if 'Ball Name' not in row:
                 if lnum > 25:
                     print('ERROR: Header row not found', file=sys.stderr)
                     sys.exit(1)
-- 
1.9.1
