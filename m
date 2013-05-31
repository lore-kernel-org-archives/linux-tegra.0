From: Ying Xue <ying.xue-CWA4WttNNZF54TAoqtyWWQ@public.gmane.org>
Subject: [PATCH] MAINTAINERS: update path for drm tegra driver
Date: Fri, 31 May 2013 14:55:37 +0800
Message-ID: <1369983337-19571-1-git-send-email-ying.xue@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org, tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Since 4231c6b01af9f0f3eeca4b8d0d87125d78233b41 commit, drm tegra
driver was moved to host1x, however, its correspding entry in
MAINTAINERS is not updated in time.

Signed-off-by: Ying Xue <ying.xue-CWA4WttNNZF54TAoqtyWWQ@public.gmane.org>
---
 MAINTAINERS |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 7714c3c..d672968 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2702,7 +2702,7 @@ L:	dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
 L:	linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
 T:	git git://gitorious.org/thierryreding/linux.git
 S:	Maintained
-F:	drivers/gpu/drm/tegra/
+F:	drivers/gpu/host1x/drm/
 F:	Documentation/devicetree/bindings/gpu/nvidia,tegra20-host1x.txt
 
 DSBR100 USB FM RADIO DRIVER
-- 
1.7.9.5
