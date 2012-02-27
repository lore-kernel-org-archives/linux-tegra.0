From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH v6 18/20] tegra: usb: Add common USB defines for tegra2 boards
Date: Mon, 27 Feb 2012 12:52:51 -0800
Message-ID: <1330375973-10681-19-git-send-email-sjg@chromium.org>
References: <1330375973-10681-1-git-send-email-sjg@chromium.org>
Mime-Version: 1.0
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1330375973-10681-1-git-send-email-sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: U-Boot Mailing List <u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org>
Cc: Tom Warren <twarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Remy Bohmer <linux-SYUVB/VFmdasTnJN9+BGXg@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

All Tegra2 boards should include tegra2-common. This adds the required
USB config to that file.

Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
---
Changes in v5:
- Add CONFIG_EHCI_DCACHE which is needed for dcache operation
- Drop unused CONFIG_USB_EHCI_DATA_ALIGN option

 include/configs/tegra2-common.h |   10 ++++++++++
 1 files changed, 10 insertions(+), 0 deletions(-)

diff --git a/include/configs/tegra2-common.h b/include/configs/tegra2-common.h
index e6f385f..266d0e5 100644
--- a/include/configs/tegra2-common.h
+++ b/include/configs/tegra2-common.h
@@ -84,6 +84,16 @@
 #define CONFIG_SYS_BAUDRATE_TABLE	{4800, 9600, 19200, 38400, 57600,\
 					115200}
 
+/*
+ * This parameter affects a TXFILLTUNING field that controls how much data is
+ * sent to the latency fifo before it is sent to the wire. Without this
+ * parameter, the default (2) causes occasional Data Buffer Errors in OUT
+ * packets depending on the buffer address and size.
+ */
+#define CONFIG_USB_EHCI_TXFIFO_THRESH	10
+#define CONFIG_EHCI_IS_TDI
+#define CONFIG_EHCI_DCACHE
+
 /* include default commands */
 #include <config_cmd_default.h>
 
-- 
1.7.7.3
