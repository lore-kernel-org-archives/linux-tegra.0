From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [flasher PATCH 1/2] Fix typo in variable name
Date: Thu,  3 Oct 2013 14:51:09 -0600
Message-ID: <1380833470-32189-1-git-send-email-swarren@wwwdotorg.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

For some reason (likely cut/paste), all the ArgParser subparsers were
stored in a variable named parser_list_configs. That variable name is at
most appropriate for one subcommand, and in fact the subcommand it would
be relevant for is not implemented by "build" but rather
"tegra-uboot-flasher". Replace this variable name with something more
appropriate and generic.

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 build | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/build b/build
index b0587f5..134d6de 100755
--- a/build
+++ b/build
@@ -222,21 +222,21 @@ parser.add_argument('--boards', type=str,
 
 subparsers = parser.add_subparsers()
 
-parser_list_configs = subparsers.add_parser('build-uboots',
+subparser = subparsers.add_parser('build-uboots',
     help='Build U-Boot binaries')
-parser_list_configs.set_defaults(func = cmd_build_uboots)
+subparser.set_defaults(func = cmd_build_uboots)
 
-parser_list_configs = subparsers.add_parser('build-bcts-imgs',
+subparser = subparsers.add_parser('build-bcts-imgs',
     help='Build BCT and flash images')
-parser_list_configs.set_defaults(func = cmd_build_bcts_imgs)
+subparser.set_defaults(func = cmd_build_bcts_imgs)
 
-parser_list_configs = subparsers.add_parser('build-configs',
+subparser = subparsers.add_parser('build-configs',
     help='Build config files')
-parser_list_configs.set_defaults(func = cmd_build_configs)
+subparser.set_defaults(func = cmd_build_configs)
 
-parser_list_configs = subparsers.add_parser('build',
+subparser = subparsers.add_parser('build',
     help='Build everything')
-parser_list_configs.set_defaults(func = cmd_build)
+subparser.set_defaults(func = cmd_build)
 
 if __name__ == '__main__':
     args = parser.parse_args()
-- 
1.8.1.5
