From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH 2/2] tegra: Enable pre-console putc() for Tegra boards
Date: Thu,  8 Mar 2012 18:52:57 -0800
Message-ID: <1331261577-21099-2-git-send-email-sjg@chromium.org>
References: <1331261577-21099-1-git-send-email-sjg@chromium.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1331261577-21099-1-git-send-email-sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: U-Boot Mailing List <u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org>
Cc: Tom Warren <twarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

This is used to display panic messages before the console is active.


Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
---
 include/configs/tegra2-common.h |    7 +++++++
 1 files changed, 7 insertions(+), 0 deletions(-)

diff --git a/include/configs/tegra2-common.h b/include/configs/tegra2-common.h
index e6f385f..6ced617 100644
--- a/include/configs/tegra2-common.h
+++ b/include/configs/tegra2-common.h
@@ -68,11 +68,18 @@
  */
 #define V_NS16550_CLK			216000000	/* 216MHz (pllp_out0) */
 
+/* Default serial clock and multiplier */
+#define CONFIG_DEFAULT_NS16550_CLK	V_NS16550_CLK
+#define CONFIG_DEFAULT_NS16550_MULT	16
+
 #define CONFIG_SYS_NS16550
 #define CONFIG_SYS_NS16550_SERIAL
 #define CONFIG_SYS_NS16550_REG_SIZE	(-4)
 #define CONFIG_SYS_NS16550_CLK		V_NS16550_CLK
 
+/* We use this for a warning message when no device tree is present */
+#define CONFIG_PRE_CONSOLE_PUTC
+
 /*
  * select serial console configuration
  */
-- 
1.7.7.3
