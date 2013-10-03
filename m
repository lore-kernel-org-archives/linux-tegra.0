From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [flasher scripts PATCH] Update URL to obtain the repo tool
Date: Thu,  3 Oct 2013 11:01:17 -0600
Message-ID: <1380819677-31166-1-git-send-email-swarren@wwwdotorg.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

The repo tool's download location has changed. Update the README
to contain the new location. For reference, see the equivalent chagne
to Android and associated discussion:

https://android-review.googlesource.com/#/c/66864/
https://groups.google.com/forum/#!topic/repo-discuss/4EsDRDRK5Lk

Reported-by: kusma on IRC #tegra
Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 README-developer.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/README-developer.txt b/README-developer.txt
index 9feff24..9016d2b 100644
--- a/README-developer.txt
+++ b/README-developer.txt
@@ -39,7 +39,7 @@ http://code.google.com/p/git-repo/
 
 To obtain repo, do the following in a directory in your $PATH:
 
-curl https://dl-ssl.google.com/dl/googlesource/git-repo/repo > repo
+curl http://commondatastorage.googleapis.com/git-repo-downloads/repo > repo
 chmod a+x repo
 
 To obtain the source of the tegra-uboot-flasher project, do:
-- 
1.8.1.5
