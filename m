From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH v3 9/9] tegra: i2c: Enable I2C on Seaboard
Date: Fri,  3 Feb 2012 17:14:00 -0800
Message-ID: <1328318041-10943-10-git-send-email-sjg@chromium.org>
References: <1328318041-10943-1-git-send-email-sjg@chromium.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1328318041-10943-1-git-send-email-sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: U-Boot Mailing List <u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org>
Cc: Tom Warren <twarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Heiko Schocher <hs-ynQEQJNshbs@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

This enables I2C on Seaboard.

Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
---
Changes in v3:
- Use CONFIG_TEGRA_I2C instead of CONFIG_TEGRA2_I2C

 include/configs/seaboard.h |    8 ++++++++
 1 files changed, 8 insertions(+), 0 deletions(-)

diff --git a/include/configs/seaboard.h b/include/configs/seaboard.h
index 6937bcc..ea7e4f0 100644
--- a/include/configs/seaboard.h
+++ b/include/configs/seaboard.h
@@ -64,6 +64,14 @@
 #define CONFIG_CMD_SF
 #define CONFIG_SPI_FLASH_SIZE		(4 << 20)
 
+/* I2C */
+#define CONFIG_TEGRA_I2C
+#define CONFIG_SYS_I2C_INIT_BOARD
+#define CONFIG_I2C_MULTI_BUS
+#define CONFIG_SYS_MAX_I2C_BUS		4
+#define CONFIG_SYS_I2C_SPEED		100000
+#define CONFIG_CMD_I2C
+
 /* SD/MMC */
 #define CONFIG_MMC
 #define CONFIG_GENERIC_MMC
-- 
1.7.7.3
