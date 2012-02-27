From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH v6 19/20] tegra: usb: Enable USB on Seaboard
Date: Mon, 27 Feb 2012 12:52:52 -0800
Message-ID: <1330375973-10681-20-git-send-email-sjg@chromium.org>
References: <1330375973-10681-1-git-send-email-sjg@chromium.org>
Mime-Version: 1.0
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1330375973-10681-1-git-send-email-sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: U-Boot Mailing List <u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org>
Cc: Tom Warren <twarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Remy Bohmer <linux-SYUVB/VFmdasTnJN9+BGXg@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Seaboard has a top port which is USB host or device, and a side port which
is host only.

Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
---
Changes in v2:
- Remove unneeded CONFIG_TEGRA_USBx defines

 include/configs/seaboard.h |    7 +++++++
 1 files changed, 7 insertions(+), 0 deletions(-)

diff --git a/include/configs/seaboard.h b/include/configs/seaboard.h
index 261f952..b6d9f7a 100644
--- a/include/configs/seaboard.h
+++ b/include/configs/seaboard.h
@@ -72,4 +72,11 @@
 
 #define CONFIG_ENV_SECT_SIZE    CONFIG_ENV_SIZE
 #define CONFIG_ENV_OFFSET       (CONFIG_SPI_FLASH_SIZE - CONFIG_ENV_SECT_SIZE)
+
+/* USB Host support */
+#define CONFIG_USB_EHCI
+#define CONFIG_USB_EHCI_TEGRA
+#define CONFIG_USB_STORAGE
+#define CONFIG_CMD_USB
+
 #endif /* __CONFIG_H */
-- 
1.7.7.3
