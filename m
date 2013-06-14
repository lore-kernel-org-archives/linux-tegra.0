From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [PATCH flasher 2/4] build: implement --socs, --boards options
Date: Fri, 14 Jun 2013 13:52:22 -0600
Message-ID: <1371239544-26165-2-git-send-email-swarren@wwwdotorg.org>
References: <1371239544-26165-1-git-send-email-swarren@wwwdotorg.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1371239544-26165-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

This will restrict the build process to a subset of SoCs or boards,
which can be useful if you want to:

./build --boards seaboard build
./tegra-uboot-flasher exec seaboard

... in order to iterate testing on a single board at a time.

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 build | 33 +++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/build b/build
index d14231f..924ac88 100755
--- a/build
+++ b/build
@@ -102,6 +102,28 @@ def all_enabled_boardnames():
         seen[boardname] = True
         yield boardname
 
+def user_restrict_socs(enabled_socs):
+    enabled_socs = enabled_socs.split(',')
+    for socname in socs.keys():
+        if not socname in enabled_socs:
+            socs[socname]['disabled'] = True
+
+def user_restrict_boards(enabled_boards):
+    enabled_boards = enabled_boards.split(',')
+    for boardname in boards.keys():
+        if not boardname in enabled_boards:
+            boards[boardname]['disabled'] = True
+
+def restrict_boards():
+    for board in boards.values():
+        if socs[board['soc']].has_key('disabled'):
+            board['disabled'] = True
+
+def restrict_configs():
+    for config in configs.values():
+        if boards[config['board']].has_key('disabled'):
+            config['disabled'] = True
+
 def dtb_filename(config):
     extra = configs[config]['dtbfn-extra']
     boardname = configs[config]['board']
@@ -176,6 +198,11 @@ def cmd_help():
 parser = argparse.ArgumentParser(description='Build U-Boot, BCT, and flash ' +
     'images for Tegra boards.')
 
+parser.add_argument('--socs', type=str,
+    help='Restrict the build to a (comma-separated) list of SoCs.')
+parser.add_argument('--boards', type=str,
+    help='Restrict the build to a (comma-separated) list of boards.')
+
 subparsers = parser.add_subparsers()
 
 parser_list_configs = subparsers.add_parser('build-uboots',
@@ -197,4 +224,10 @@ parser_list_configs.set_defaults(func = cmd_build)
 if __name__ == '__main__':
     args = parser.parse_args()
     load_configs(os.path.join(scripts_dir, 'configs'))
+    if args.socs:
+        user_restrict_socs(args.socs)
+    if args.boards:
+        user_restrict_boards(args.boards)
+    restrict_boards()
+    restrict_configs()
     args.func()
-- 
1.8.1.5
