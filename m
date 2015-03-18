From: Jimmy Zhang <jimmzhang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [tegrarcm PATCH v1 6/8] tegrarcm: increase USB timeout
Date: Tue, 17 Mar 2015 17:38:59 -0700
Message-ID: <1426639141-12060-8-git-send-email-jimmzhang@nvidia.com>
References: <1426639141-12060-1-git-send-email-jimmzhang@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1426639141-12060-1-git-send-email-jimmzhang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jimmy Zhang <jimmzhang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Allen Martin <amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Increase USB timeout from 1ms to 3ms to avoid flashing failure
happened when a long USB cable (5ft ?) is used.

Signed-off-by: Allen Martin <amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Signed-off-by: Jimmy Zhang <jimmzhang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 src/usb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/src/usb.c b/src/usb.c
index ed2ff28eef8d..4a0d8da46e5b 100644
--- a/src/usb.c
+++ b/src/usb.c
@@ -35,7 +35,7 @@
 #include "debug.h"
 
 // USB xfer timeout in ms
-#define USB_TIMEOUT 1000
+#define USB_TIMEOUT 3000
 
 #define USB_XFER_MAX 4096
 
-- 
1.8.1.5
