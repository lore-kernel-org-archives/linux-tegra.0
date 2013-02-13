From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [PATCH 3/9] ARM: dt: create a DT header for the GIC
Date: Wed, 13 Feb 2013 14:33:12 -0700
Message-ID: <1360791198-29462-4-git-send-email-swarren@wwwdotorg.org>
References: <1360791198-29462-1-git-send-email-swarren@wwwdotorg.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1360791198-29462-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

The ARM GIC binding defines a few custom cells and flags for its IRQ
specifier. Provide names for those.

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 arch/arm/boot/dts/arm-gic.h |   17 +++++++++++++++++
 1 file changed, 17 insertions(+)
 create mode 100644 arch/arm/boot/dts/arm-gic.h

diff --git a/arch/arm/boot/dts/arm-gic.h b/arch/arm/boot/dts/arm-gic.h
new file mode 100644
index 0000000..5b1bc85
--- /dev/null
+++ b/arch/arm/boot/dts/arm-gic.h
@@ -0,0 +1,17 @@
+/*
+ * This header provides constants for the ARM GIC.
+ */
+
+#include "irq.h"
+
+/* interrupt specific cell 0 */
+
+#define GIC_SPI 0
+#define GIC_PPI 1
+
+/*
+ * Interrupt specifier cell 2.
+ * The flaggs in irq.h are valid, plus those below.
+ */
+#define GIC_CPU_MASK_RAW(x) ((x) << 8)
+#define GIC_CPU_MASK_SIMPLE(num) GIC_CPU_MASK_RAW((1 << (num)) - 1)
-- 
1.7.10.4
