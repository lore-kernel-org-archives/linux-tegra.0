From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [flasher PATCH] Allow --boards to add to not replace the set of enabled boards
Date: Wed, 30 Apr 2014 13:45:14 -0600
Message-ID: <1398887114-9774-1-git-send-email-swarren@wwwdotorg.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

The following already work:

Build all boards that are enabled by default:
./build build

Build a specific set of boards:
./build --boards beaver,jetson-tk1 build

Sometimes it's nice to build all boards that are enabled by default,
plus a few others which aren't. This patch enables the following syntax
for that:
./build --boards +jetson-tk1 build

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 build | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/build b/build
index 7bfc2d9d0aa8..5e94474de70b 100755
--- a/build
+++ b/build
@@ -108,9 +108,17 @@ def user_restrict_socs(enabled_socs):
         socs[socname]['disabled'] = not socname in enabled_socs
 
 def user_restrict_boards(enabled_boards):
+    if enabled_boards[0] == '+':
+        disable_others = False
+        enabled_boards = enabled_boards[1:]
+    else:
+        disable_others = True
     enabled_boards = enabled_boards.split(',')
     for boardname in boards.keys():
-        boards[boardname]['disabled'] = not boardname in enabled_boards
+        if boardname in enabled_boards:
+            boards[boardname]['disabled'] = False
+        elif disable_others:
+            boards[boardname]['disabled'] = True
 
 def restrict_boards():
     for board in boards.values():
-- 
1.8.1.5
