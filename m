From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [RFC PATCH 2/3] ARM: mvebu: restore uncompress.h
Date: Tue, 25 Sep 2012 16:46:51 -0600
Message-ID: <1348613212-21897-3-git-send-email-swarren@wwwdotorg.org>
References: <1348613212-21897-1-git-send-email-swarren@wwwdotorg.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1348613212-21897-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Lior Amsalem <alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Yehuda Yitschak <yehuday-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Now that we have a way to provide uncompress.h in a multi-platform zImage,
re-instate mvebu's uncompress.h. This was originally removed as part of
commit 387798b "ARM: initial multiplatform support". Note that actually
enabling this via DEBUG_LL still entails the restrictions outlined for
that option.

Cc: Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Lior Amsalem <alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
Cc: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
Cc: Yehuda Yitschak <yehuday-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 arch/arm/Kconfig.debug                    |    3 +-
 arch/arm/include/debug/mvebu-uncompress.h |   43 +++++++++++++++++++++++++++++
 2 files changed, 45 insertions(+), 1 deletions(-)
 create mode 100644 arch/arm/include/debug/mvebu-uncompress.h

diff --git a/arch/arm/Kconfig.debug b/arch/arm/Kconfig.debug
index 0daec3d..af34a43 100644
--- a/arch/arm/Kconfig.debug
+++ b/arch/arm/Kconfig.debug
@@ -423,8 +423,9 @@ config DEBUG_LL_INCLUDE
 config UNCOMPRESS_INCLUDE
 	string
 	default "debug/icedcc-uncompress.h" if DEBUG_ICEDCC
+	default "debug/mvebu-uncompress.h" if DEBUG_MVEBU_UART
 	default "debug/none-uncompress.h" if ARCH_MULTIPLATFORM || \
-		DEBUG_HIGHBANK_UART || DEBUG_MVEBU_UART || \
+		DEBUG_HIGHBANK_UART || \
 		DEBUG_PICOXCELL_UART || DEBUG_SOCFPGA_UART || \
 		DEBUG_VEXPRESS_UART0_DETECT || DEBUG_VEXPRESS_UART0_CA9 || \
 		DEBUG_VEXPRESS_UART0_RS1
diff --git a/arch/arm/include/debug/mvebu-uncompress.h b/arch/arm/include/debug/mvebu-uncompress.h
new file mode 100644
index 0000000..df3bd6b
--- /dev/null
+++ b/arch/arm/include/debug/mvebu-uncompress.h
@@ -0,0 +1,43 @@
+/*
+ * Marvell Armada SoC kernel uncompression UART routines
+ *
+ * Copyright (C) 2012 Marvell
+ *
+ * Lior Amsalem <alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
+ *
+ * This file is licensed under the terms of the GNU General Public
+ * License version 2.  This program is licensed "as is" without any
+ * warranty of any kind, whether express or implied.
+ */
+
+#define ARMADA_370_XP_REGS_PHYS_BASE	0xd0000000
+
+#define UART_THR ((volatile unsigned char *)(ARMADA_370_XP_REGS_PHYS_BASE\
+								+ 0x12000))
+#define UART_LSR ((volatile unsigned char *)(ARMADA_370_XP_REGS_PHYS_BASE\
+								+ 0x12014))
+
+#define LSR_THRE	0x20
+
+static void putc(const char c)
+{
+	int i;
+
+	for (i = 0; i < 0x1000; i++) {
+		/* Transmit fifo not full? */
+		if (*UART_LSR & LSR_THRE)
+			break;
+	}
+
+	*UART_THR = c;
+}
+
+static void flush(void)
+{
+}
+
+/*
+ * nothing to do
+ */
+#define arch_decomp_setup()
+#define arch_decomp_wdog()
-- 
1.7.0.4
