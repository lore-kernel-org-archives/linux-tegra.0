From: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 2/4] ARM: tegra: simplify GPU setup
Date: Mon, 19 Oct 2015 13:57:02 +0900
Message-ID: <1445230624-30314-3-git-send-email-acourbot@nvidia.com>
References: <1445230624-30314-1-git-send-email-acourbot@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1445230624-30314-1-git-send-email-acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Tom Warren <twarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Enable the GPU node in the system-wide ft_system_setup() hook instead of
the board-specific ft_board_hook(). This allows us to enable GPU per SoC
generation instead of per-board as we did initially.

Reported-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Signed-off-by: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 arch/arm/mach-tegra/board2.c         | 20 ++++++++++++++++++++
 board/nvidia/jetson-tk1/jetson-tk1.c |  8 --------
 board/nvidia/p2571/p2571.c           |  7 -------
 board/nvidia/venice2/venice2.c       |  8 --------
 include/configs/jetson-tk1.h         |  2 --
 include/configs/p2571.h              |  2 --
 include/configs/tegra-common.h       |  2 ++
 include/configs/venice2.h            |  2 --
 8 files changed, 22 insertions(+), 29 deletions(-)

diff --git a/arch/arm/mach-tegra/board2.c b/arch/arm/mach-tegra/board2.c
index 8ecc67459a10..ff9e77cfa3a3 100644
--- a/arch/arm/mach-tegra/board2.c
+++ b/arch/arm/mach-tegra/board2.c
@@ -403,3 +403,23 @@ ulong board_get_usable_ram_top(ulong total_size)
 {
 	return CONFIG_SYS_SDRAM_BASE + usable_ram_size_below_4g();
 }
+
+/*
+ * This function is called right before the kernel is booted. "blob" is the
+ * device tree that will be passed to the kernel.
+ */
+int ft_system_setup(void *blob, bd_t *bd)
+{
+	const char *gpu_path =
+#if defined(CONFIG_TEGRA124) || defined(CONFIG_TEGRA210)
+		"/gpu@0,57000000";
+#else
+		NULL;
+#endif
+
+	/* Enable GPU node if GPU setup has been performed */
+	if (gpu_path != NULL)
+		return gpu_enable_node(blob, gpu_path);
+
+	return 0;
+}
diff --git a/board/nvidia/jetson-tk1/jetson-tk1.c b/board/nvidia/jetson-tk1/jetson-tk1.c
index 3c21767ce4da..52425a8f6dea 100644
--- a/board/nvidia/jetson-tk1/jetson-tk1.c
+++ b/board/nvidia/jetson-tk1/jetson-tk1.c
@@ -11,7 +11,6 @@
 
 #include <asm/arch/gpio.h>
 #include <asm/arch/pinmux.h>
-#include <asm/arch-tegra/gpu.h>
 
 #include "pinmux-config-jetson-tk1.h"
 
@@ -80,10 +79,3 @@ int board_eth_init(bd_t *bis)
 	return pci_eth_init(bis);
 }
 #endif /* PCI */
-
-int ft_board_setup(void *blob, bd_t *bd)
-{
-	gpu_enable_node(blob, "/gpu@0,57000000");
-
-	return 0;
-}
diff --git a/board/nvidia/p2571/p2571.c b/board/nvidia/p2571/p2571.c
index d33e4d12b2fa..d80a7d0d3e31 100644
--- a/board/nvidia/p2571/p2571.c
+++ b/board/nvidia/p2571/p2571.c
@@ -11,7 +11,6 @@
 #include <asm/arch/pinmux.h>
 #include <asm/gpio.h>
 #include "max77620_init.h"
-#include <asm/arch-tegra/gpu.h>
 #include "pinmux-config-p2571.h"
 
 void pin_mux_mmc(void)
@@ -62,9 +61,3 @@ void start_cpu_fan(void)
 	gpio_request(GPIO_PE4, "FAN_VDD");
 	gpio_direction_output(GPIO_PE4, 1);
 }
-
-int ft_board_setup(void *blob, bd_t *bd)
-{
-	gpu_enable_node(blob, "/gpu@0,57000000");
-	return 0;
-}
diff --git a/board/nvidia/venice2/venice2.c b/board/nvidia/venice2/venice2.c
index 3e2b9a7745e9..c56ef129d6c7 100644
--- a/board/nvidia/venice2/venice2.c
+++ b/board/nvidia/venice2/venice2.c
@@ -8,7 +8,6 @@
 #include <common.h>
 #include <asm/arch/gpio.h>
 #include <asm/arch/pinmux.h>
-#include <asm/arch-tegra/gpu.h>
 #include "pinmux-config-venice2.h"
 
 /*
@@ -28,10 +27,3 @@ void pinmux_init(void)
 	pinmux_config_drvgrp_table(venice2_drvgrps,
 				   ARRAY_SIZE(venice2_drvgrps));
 }
-
-int ft_board_setup(void *blob, bd_t *bd)
-{
-	gpu_enable_node(blob, "/gpu@0,57000000");
-
-	return 0;
-}
diff --git a/include/configs/jetson-tk1.h b/include/configs/jetson-tk1.h
index e87a01047d30..f63957ab92fd 100644
--- a/include/configs/jetson-tk1.h
+++ b/include/configs/jetson-tk1.h
@@ -78,6 +78,4 @@
 #define CONFIG_ARMV7_SECURE_BASE		0xfff00000
 #define CONFIG_ARMV7_SECURE_RESERVE_SIZE	0x00100000
 
-#define CONFIG_OF_BOARD_SETUP
-
 #endif /* __CONFIG_H */
diff --git a/include/configs/p2571.h b/include/configs/p2571.h
index c65d3e5fcbc1..a5de411121b0 100644
--- a/include/configs/p2571.h
+++ b/include/configs/p2571.h
@@ -60,6 +60,4 @@
 #include "tegra-common-usb-gadget.h"
 #include "tegra-common-post.h"
 
-#define CONFIG_OF_BOARD_SETUP
-
 #endif /* _P2571_H */
diff --git a/include/configs/tegra-common.h b/include/configs/tegra-common.h
index 1c469d092e8c..9f0d4644431a 100644
--- a/include/configs/tegra-common.h
+++ b/include/configs/tegra-common.h
@@ -144,4 +144,6 @@
 #define CONFIG_FAT_WRITE
 #endif
 
+#define CONFIG_OF_SYSTEM_SETUP
+
 #endif /* _TEGRA_COMMON_H_ */
diff --git a/include/configs/venice2.h b/include/configs/venice2.h
index 0fc8cf7674d1..a374cd948849 100644
--- a/include/configs/venice2.h
+++ b/include/configs/venice2.h
@@ -60,6 +60,4 @@
 #include "tegra-common-usb-gadget.h"
 #include "tegra-common-post.h"
 
-#define CONFIG_OF_BOARD_SETUP
-
 #endif /* __CONFIG_H */
-- 
2.6.1
