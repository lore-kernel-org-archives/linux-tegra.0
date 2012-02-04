From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH v3 6/9] tegra: i2c: Initialise I2C on Nvidia boards
Date: Fri,  3 Feb 2012 17:13:57 -0800
Message-ID: <1328318041-10943-7-git-send-email-sjg@chromium.org>
References: <1328318041-10943-1-git-send-email-sjg@chromium.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1328318041-10943-1-git-send-email-sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: U-Boot Mailing List <u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org>
Cc: Tom Warren <twarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Heiko Schocher <hs-ynQEQJNshbs@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

This enables I2C on all Nvidia boards including Seaboard and
Harmony.

Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
---
Changes in v2:
- Add build warning if CONFIG_SYS_I2C_INIT_BOARD is not defined

Changes in v3:
- Use CONFIG_TEGRA_I2C instead of CONFIG_TEGRA2_I2C

 board/nvidia/common/board.c |    7 +++++++
 1 files changed, 7 insertions(+), 0 deletions(-)

diff --git a/board/nvidia/common/board.c b/board/nvidia/common/board.c
index 72d8630..85dd359 100644
--- a/board/nvidia/common/board.c
+++ b/board/nvidia/common/board.c
@@ -34,6 +34,7 @@
 #include <asm/arch/uart.h>
 #include <spi.h>
 #include <asm/arch/usb.h>
+#include <i2c.h>
 #include "board.h"
 
 DECLARE_GLOBAL_DATA_PTR;
@@ -75,6 +76,12 @@ int board_init(void)
 #endif
 	/* boot param addr */
 	gd->bd->bi_boot_params = (NV_PA_SDRAM_BASE + 0x100);
+#ifdef CONFIG_TEGRA_I2C
+#ifndef CONFIG_SYS_I2C_INIT_BOARD
+#error "You must define CONFIG_SYS_I2C_INIT_BOARD to use i2c on Nvidia boards"
+#endif
+	i2c_init_board();
+#endif
 
 #ifdef CONFIG_USB_EHCI_TEGRA
 	pin_mux_usb();
-- 
1.7.7.3
