From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [cbootimage PATCH 1/2] autogen.sh: allow spaced in configure arguments
Date: Fri, 23 Aug 2013 12:56:01 -0600
Message-ID: <1377284162-7700-1-git-send-email-swarren@wwwdotorg.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Using "$@" (rather than #@) quotes any arguments if required. This is
useful if you want to run ./autogen.sh CFLAGS="-ggdb -O0".

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 autogen.sh | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/autogen.sh b/autogen.sh
index e925023..530783b 100755
--- a/autogen.sh
+++ b/autogen.sh
@@ -1,5 +1,4 @@
 #!/bin/sh -e
 
 autoreconf --install --symlink
-./configure $@
-
+./configure "$@"
-- 
1.8.1.5
