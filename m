From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [flasher PATCH 1/2] allow --boards/--socs to undisable boards
Date: Wed, 11 Sep 2013 17:48:55 -0600
Message-ID: <1378943336-9263-1-git-send-email-swarren@wwwdotorg.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Before this change, --boards/--socs only disabled more boards than were
disabled in their configuration files. Now, those options explicitly set
all boards/socs disabled state to match the --boards/socs option, if
given.

This is useful so that configurations may be added for boards that are
not yet fully supported by projects such as U-Boot; the configuration
can be added, but marked as disabled by default so that builds are not
broken, but then explicitly re-enabled by those who wish to test local
patches to enable that board in the other projects.

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 build | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/build b/build
index 8f86d32..b0587f5 100755
--- a/build
+++ b/build
@@ -83,7 +83,7 @@ def run(dir, cmd):
 
 def all_enabled_confignames():
     for configname in configs.keys():
-        if configs[configname].has_key('disabled'):
+        if configs[configname].get('disabled', False):
             continue
         yield configname
 
@@ -105,23 +105,21 @@ def all_enabled_boardnames():
 def user_restrict_socs(enabled_socs):
     enabled_socs = enabled_socs.split(',')
     for socname in socs.keys():
-        if not socname in enabled_socs:
-            socs[socname]['disabled'] = True
+        socs[socname]['disabled'] = not socname in enabled_socs
 
 def user_restrict_boards(enabled_boards):
     enabled_boards = enabled_boards.split(',')
     for boardname in boards.keys():
-        if not boardname in enabled_boards:
-            boards[boardname]['disabled'] = True
+        boards[boardname]['disabled'] = not boardname in enabled_boards
 
 def restrict_boards():
     for board in boards.values():
-        if socs[board['soc']].has_key('disabled'):
+        if socs[board['soc']].get('disabled', False):
             board['disabled'] = True
 
 def restrict_configs():
     for config in configs.values():
-        if boards[config['board']].has_key('disabled'):
+        if boards[config['board']].get('disabled', False):
             config['disabled'] = True
 
 def dtb_filename(config):
-- 
1.8.1.5
