From: Jimmy Zhang <jimmzhang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [tegrarcm PATCH v1 4/4] Increate USB timeout value
Date: Fri, 4 Mar 2016 15:44:47 -0800
Message-ID: <1457135087-967-5-git-send-email-jimmzhang@nvidia.com>
References: <1457135087-967-1-git-send-email-jimmzhang@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1457135087-967-1-git-send-email-jimmzhang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, alban.bedel-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jimmy Zhang <jimmzhang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

It has been observed that some times USB time out could occure when a long (3ft)
usb cable is connected to recovery mode usb port

Signed-off-by: Jimmy Zhang <jimmzhang>
---
 src/usb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/src/usb.c b/src/usb.c
index 8a367426b29c..4f7d1cae9d3a 100644
--- a/src/usb.c
+++ b/src/usb.c
@@ -35,7 +35,7 @@
 #include "debug.h"
 
 // USB xfer timeout in ms
-#define USB_TIMEOUT 1000
+#define USB_TIMEOUT 5000
 
 #define USB_XFER_MAX 4096
 
-- 
1.9.1
