From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [PATCH V3] get_maintainer: use filename-only regex match for Tegra
Date: Mon, 11 Mar 2013 14:19:09 -0600
Message-ID: <1363033149-7839-1-git-send-email-swarren@wwwdotorg.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>
Cc: Joe Perches <joe-6d6DIl74uiNBDgjK7y7TUQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>, Borislav Petkov <bp-Gina5bIWoIWzQB+pC5nmwQ@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Maarten Lankhorst <maarten.lankhorst-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Create a new N: entry type in MAINTAINERS which performs a regex match
against filenames; either those extracted from patch +++ or --- lines,
or those specified on the command-line using the -f option.

This provides the same benefits as using a K: regex option to match a
set of filenames (see commit eb90d08 "get_maintainer: allow keywords to
match filenames"), but without the disadvantage that "random" file
content, such as comments, will ever match the regex. Hence, revert most
of that commit.

Switch the Tegra entry from using K: to N:

Reported-by: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Suggested-by: Joe Perches <joe-6d6DIl74uiNBDgjK7y7TUQ@public.gmane.org>
Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
v2: Corrected typo in MAINTAINERS documentation
v3: Squash 3 patches into one.
---
 MAINTAINERS               |   14 ++++++++------
 scripts/get_maintainer.pl |    2 +-
 2 files changed, 9 insertions(+), 7 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 9561658..e68a07a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -90,6 +90,9 @@ Descriptions of section entries:
 	   F:	drivers/net/*	all files in drivers/net, but not below
 	   F:	*/net/*		all files in "any top level directory"/net
 	   One pattern per line.  Multiple F: lines acceptable.
+	N: Files and directories with regex patterns.
+	   N:	[^a-z]tegra	all files whose patch contains the word tegra
+	   One pattern per line.  Multiple N: lines acceptable.
 	X: Files and directories that are NOT maintained, same rules as F:
 	   Files exclusions are tested before file matches.
 	   Can be useful for excluding a specific subdirectory, for instance:
@@ -97,13 +100,12 @@ Descriptions of section entries:
 	   X:	net/ipv6/
 	   matches all files in and below net excluding net/ipv6/
 	K: Keyword perl extended regex pattern to match content in a
-	   patch or file, or an affected filename.  For instance:
+	   patch or file.  For instance:
 	   K: of_get_profile
-	      matches patch or file content, or filenames, that contain
-	      "of_get_profile"
+	      matches patches or files that contain "of_get_profile"
 	   K: \b(printk|pr_(info|err))\b
-	      matches patch or file content, or filenames, that contain one or
-	      more of the words printk, pr_info or pr_err
+	      matches patches or files that contain one or more of the words
+	      printk, pr_info or pr_err
 	   One regex pattern per line.  Multiple K: lines acceptable.
 
 Note: For the hard of thinking, this list is meant to remain in alphabetical
@@ -7848,7 +7850,7 @@ L:	linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
 Q:	http://patchwork.ozlabs.org/project/linux-tegra/list/
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/swarren/linux-tegra.git
 S:	Supported
-K:	(?i)[^a-z]tegra
+N:	[^a-z]tegra
 
 TEHUTI ETHERNET DRIVER
 M:	Andy Gospodarek <andy-QlMahl40kYEqcZcGjlUOXw@public.gmane.org>
diff --git a/scripts/get_maintainer.pl b/scripts/get_maintainer.pl
index ce4cc83..5e4fb14 100755
--- a/scripts/get_maintainer.pl
+++ b/scripts/get_maintainer.pl
@@ -611,7 +611,7 @@ sub get_maintainers {
 				    $hash{$tvi} = $value_pd;
 				}
 			    }
-			} elsif ($type eq 'K') {
+			} elsif ($type eq 'N') {
 			    if ($file =~ m/$value/x) {
 				$hash{$tvi} = 0;
 			    }
-- 
1.7.10.4
