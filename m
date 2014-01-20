From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [PATCH flasher] Make all paths absolute
Date: Mon, 20 Jan 2014 15:25:40 -0700
Message-ID: <1390256740-15326-1-git-send-email-swarren@wwwdotorg.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Convert all file and path names from the command line to absolute paths.
This helps when running tegra-uboot-flasher out-of-tree with a local
bootloader or flash image. This is needed, since tegra-uboot-flasher
cd's to a temporary work directory when executing most commands, which
causes relative path names to no longer be valid.

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 tegra-uboot-flasher | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/tegra-uboot-flasher b/tegra-uboot-flasher
index 5f68d40c0fc4..8c6a21c54510 100755
--- a/tegra-uboot-flasher
+++ b/tegra-uboot-flasher
@@ -182,7 +182,6 @@ def func_flash():
     gen_flashcmd = gen_flashcmds[flash_type]
 
     if args.work_dir:
-        workdir = os.path.abspath(args.work_dir)
         mkdir(workdir)
     else:
         workdir = tempfile.mkdtemp()
@@ -326,14 +325,24 @@ if args.debug: print args
 scripts_dir = os.path.dirname(os.path.abspath(__file__))
 scripts_parent_dir = os.path.dirname(scripts_dir)
 
+path_args = (
+    'bootloader',
+    'data_dir',
+    'flash_image',
+    'work_dir',
+)
+for path_arg in path_args:
+    if args.__dict__.has_key(path_arg) and args.__dict__[path_arg]:
+        args.__dict__[path_arg] = os.path.abspath(args.__dict__[path_arg])
+
 if not args.force_no_out_dir:
-    out_tools_dir = os.path.abspath(os.path.join(scripts_parent_dir, '_out_tools'))
+    out_tools_dir = os.path.join(scripts_parent_dir, '_out_tools')
     if os.path.exists(out_tools_dir):
         if args.debug: print 'Detected build tree; adding ' + out_tools_dir + ' to $PATH'
         os.environ['PATH'] = out_tools_dir + ':' + os.environ['PATH']
 
 if not args.data_dir and not args.force_no_out_dir:
-    out_data_dir = os.path.abspath(os.path.join(scripts_parent_dir, '_out'))
+    out_data_dir = os.path.join(scripts_parent_dir, '_out')
     if os.path.exists(out_data_dir):
         if args.debug: print 'Detected build tree; using ' + out_data_dir + ' as data dir'
         args.data_dir = out_data_dir
-- 
1.8.1.5
