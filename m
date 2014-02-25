From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [flasher PATCH 1/3] Add libtool to dependency list in README
Date: Tue, 25 Feb 2014 11:28:45 -0700
Message-ID: <1393352927-27595-1-git-send-email-swarren@wwwdotorg.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

libtools is required by some of the tools that tegra-uboot-flasher can
build. Add it to the list of dependencies.

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 README-developer.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/README-developer.txt b/README-developer.txt
index 090f90051c1c..e2648c39f796 100644
--- a/README-developer.txt
+++ b/README-developer.txt
@@ -74,6 +74,7 @@ will be useful:
   build-essential
   autoconf
   automake
+  libtool
   libusb-1.0-0-dev
   libcrypto++-dev
 
-- 
1.8.1.5
