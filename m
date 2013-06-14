From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [PATCH flasher 1/4] Convert build script to argparse
Date: Fri, 14 Jun 2013 13:52:21 -0600
Message-ID: <1371239544-26165-1-git-send-email-swarren@wwwdotorg.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Future patches will add some options. This will be easier with argparse.

Unfortunately, argparse doesn't support a default sub-command. Hence, the
shortcut "./build" for "./build build" is no longer supported. There are
ways to work around this by treating the command name as an optional
argument rather than sub-commands. However, this limits future
flexibility, since the fake sub-commands won't be able to accept sub
command- specific options.

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 README-developer.txt |  2 +-
 build                | 51 ++++++++++++++++++++++++---------------------------
 2 files changed, 25 insertions(+), 28 deletions(-)

diff --git a/README-developer.txt b/README-developer.txt
index 89fcd2c..d59ec07 100644
--- a/README-developer.txt
+++ b/README-developer.txt
@@ -84,7 +84,7 @@ script assumes a value of arm-linux-gnueabi-.
 cd to the scripts sub-directory (i.e. the directory containing this README),
 and execute:
 
-./build
+./build build
 
 Flashing Devices
 ================
diff --git a/build b/build
index 2a3bf7e..d14231f 100755
--- a/build
+++ b/build
@@ -20,6 +20,7 @@
 # FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
 # DEALINGS IN THE SOFTWARE.
 
+import argparse
 import multiprocessing
 import os
 import shutil
@@ -172,32 +173,28 @@ def cmd_help():
     for cmd in sorted(cmdmap.keys()):
         print ' ', cmd
 
-def cmd_help_error_exit():
-    print 'ERROR:',
-    cmd_help()
-    sys.exit(1)
-
-cmdmap = {
-    '-h':              cmd_help,
-    '--help':          cmd_help,
-    'help':            cmd_help,
-    'help-error-exit': cmd_help_error_exit,
-    'build-uboots':    cmd_build_uboots,
-    'build-bcts-imgs': cmd_build_bcts_imgs,
-    'build-configs':   cmd_build_configs,
-    'build':           cmd_build,
-}
+parser = argparse.ArgumentParser(description='Build U-Boot, BCT, and flash ' +
+    'images for Tegra boards.')
+
+subparsers = parser.add_subparsers()
+
+parser_list_configs = subparsers.add_parser('build-uboots',
+    help='Build U-Boot binaries')
+parser_list_configs.set_defaults(func = cmd_build_uboots)
+
+parser_list_configs = subparsers.add_parser('build-bcts-imgs',
+    help='Build BCT and flash images')
+parser_list_configs.set_defaults(func = cmd_build_bcts_imgs)
+
+parser_list_configs = subparsers.add_parser('build-configs',
+    help='Build config files')
+parser_list_configs.set_defaults(func = cmd_build_configs)
+
+parser_list_configs = subparsers.add_parser('build',
+    help='Build everything')
+parser_list_configs.set_defaults(func = cmd_build)
 
 if __name__ == '__main__':
-    app = sys.argv.pop(0)
-    if len(sys.argv) == 0:
-        cmdname = 'build'
-    elif len(sys.argv) == 1:
-        cmdname = sys.argv.pop(0)
-    else:
-        cmdname = 'help-error-exit'
-    if not cmdmap.has_key(cmdname):
-        cmdname = 'help-error-exit'
-    load_configs('configs')
-    cmd = cmdmap[cmdname]
-    cmd()
+    args = parser.parse_args()
+    load_configs(os.path.join(scripts_dir, 'configs'))
+    args.func()
-- 
1.8.1.5
