From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [pinmux scripts PATCH] Fix Venice2 sheet name in CSV import script
Date: Tue,  1 Jul 2014 15:05:18 -0600
Message-ID: <1404248718-20941-1-git-send-email-swarren@wwwdotorg.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Fix csv-to-board-tegra124-xlsx.py's comment in supported_boards{} re: the
sheet that the data came from. It should be Customer_Configuration, but
I was confused when I exported as CSV, and Excel renamed the sheet:-/

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 csv-to-board-tegra124-xlsx.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/csv-to-board-tegra124-xlsx.py b/csv-to-board-tegra124-xlsx.py
index f99fda18e70e..e7afda7cd04d 100755
--- a/csv-to-board-tegra124-xlsx.py
+++ b/csv-to-board-tegra124-xlsx.py
@@ -43,7 +43,7 @@ if dbg: print(args)
 
 supported_boards = {
     'jetson-tk1': 'T124_customer_pinmux_PM375_30Apr2014_v2.csv', # worksheet PM375Beaver_Configuration
-    'venice2': 'Venice2_T124_customer_pinmux_based_on_P4_rev47_2013-07-12.csv', # worksheet Venice2_T124_customer_pinmux_ba
+    'venice2': 'Venice2_T124_customer_pinmux_based_on_P4_rev47_2013-07-12.csv', # worksheet Customer_Configuration
 }
 
 if not args.board in supported_boards:
-- 
1.8.1.5
