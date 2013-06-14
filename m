From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [PATCH flasher 3/4] build: restrict cmd_build_configs() to enabled objects
Date: Fri, 14 Jun 2013 13:52:23 -0600
Message-ID: <1371239544-26165-3-git-send-email-swarren@wwwdotorg.org>
References: <1371239544-26165-1-git-send-email-swarren@wwwdotorg.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1371239544-26165-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Only install enabled SoC/board/config files in _out/configs. This may
be useful if you want to create a _out directory containing a limited
set of binaries; this way, only the relevant limited set of config
files are installed too.

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 build | 21 ++++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/build b/build
index 924ac88..8f86d32 100755
--- a/build
+++ b/build
@@ -183,7 +183,26 @@ def cmd_build_bcts_imgs():
         build_bct_img_one_board(boardname)
 
 def cmd_build_configs():
-    run(scripts_dir, 'cp -rp configs ' + out_dir)
+    mkdir(os.path.join(out_dir, 'configs'))
+    boardnames = {}
+    for configname in all_enabled_confignames():
+        fn = configname + '.config'
+        src = os.path.join(scripts_dir, 'configs', fn)
+        dst = os.path.join(out_dir, 'configs', fn)
+        cp(src, dst)
+        boardnames[configs[configname]['board']] = True
+    socnames = {}
+    for boardname in boardnames:
+        fn = boardname + '.board'
+        src = os.path.join(scripts_dir, 'configs', fn)
+        dst = os.path.join(out_dir, 'configs', fn)
+        cp(src, dst)
+        socnames[boards[boardname]['soc']] = True
+    for socname in socnames:
+        fn = socname + '.soc'
+        src = os.path.join(scripts_dir, 'configs', fn)
+        dst = os.path.join(out_dir, 'configs', fn)
+        cp(src, dst)
 
 def cmd_build():
     cmd_build_uboots()
-- 
1.8.1.5
