From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH v6 17/20] tegra: usb: Add USB support to nvidia boards
Date: Mon, 27 Feb 2012 12:52:50 -0800
Message-ID: <1330375973-10681-18-git-send-email-sjg@chromium.org>
References: <1330375973-10681-1-git-send-email-sjg@chromium.org>
Mime-Version: 1.0
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1330375973-10681-1-git-send-email-sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: U-Boot Mailing List <u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org>
Cc: Tom Warren <twarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Remy Bohmer <linux-SYUVB/VFmdasTnJN9+BGXg@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

This adds basic USB support for port 0. The other port is not supported
yet.

Tegra2 (SeaBoard) # usb start
(Re)start USB...
USB:   Register 10011 NbrPorts 1
USB EHCI 1.00
scanning bus for devices... 5 USB Device(s) found
       scanning bus for storage devices... 1 Storage Device(s) found
Tegra2 (SeaBoard) # ext2load usb 0:3 10000000 /boot/vmlinuz
Loading file "/boot/vmlinuz" from usb device 0:3 (ROOT-A)
2932976 bytes read

Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
---
Changes in v2:
- Add setting of pinmux for USB VBUS GPIO

Changes in v5:
- Put pinmux setting into a board-specific function

 board/nvidia/common/board.c      |   12 ++++++++++++
 board/nvidia/common/board.h      |    6 ++++++
 board/nvidia/seaboard/seaboard.c |    6 ++++++
 3 files changed, 24 insertions(+), 0 deletions(-)

diff --git a/board/nvidia/common/board.c b/board/nvidia/common/board.c
index e8253a0..72d8630 100644
--- a/board/nvidia/common/board.c
+++ b/board/nvidia/common/board.c
@@ -33,6 +33,7 @@
 #include <asm/arch/pinmux.h>
 #include <asm/arch/uart.h>
 #include <spi.h>
+#include <asm/arch/usb.h>
 #include "board.h"
 
 DECLARE_GLOBAL_DATA_PTR;
@@ -50,6 +51,12 @@ int timer_init(void)
 	return 0;
 }
 
+void __pin_mux_usb(void)
+{
+}
+
+void pin_mux_usb(void) __attribute__((weak, alias("__pin_mux_usb")));
+
 /*
  * Routine: board_init
  * Description: Early hardware init.
@@ -69,6 +76,11 @@ int board_init(void)
 	/* boot param addr */
 	gd->bd->bi_boot_params = (NV_PA_SDRAM_BASE + 0x100);
 
+#ifdef CONFIG_USB_EHCI_TEGRA
+	pin_mux_usb();
+	board_usb_init(gd->fdt_blob);
+#endif
+
 	return 0;
 }
 
diff --git a/board/nvidia/common/board.h b/board/nvidia/common/board.h
index a638af2..09fb158 100644
--- a/board/nvidia/common/board.h
+++ b/board/nvidia/common/board.h
@@ -27,4 +27,10 @@
 void gpio_config_uart(void);
 void gpio_early_init_uart(void);
 
+/*
+ * Set up any pin muxing needed for USB (for now, since fdt doesn't support
+ * it). Boards can overwrite the default fucction which does nothing.
+ */
+void pin_mux_usb(void);
+
 #endif	/* BOARD_H */
diff --git a/board/nvidia/seaboard/seaboard.c b/board/nvidia/seaboard/seaboard.c
index 9ab6825..94efb1e 100644
--- a/board/nvidia/seaboard/seaboard.c
+++ b/board/nvidia/seaboard/seaboard.c
@@ -90,3 +90,9 @@ int board_mmc_init(bd_t *bd)
 	return 0;
 }
 #endif
+
+void pin_mux_usb(void)
+{
+	/* For USB's GPIO PD0. For now, since we have no pinmux in fdt */
+	pinmux_tristate_disable(PINGRP_SLXK);
+}
-- 
1.7.7.3
