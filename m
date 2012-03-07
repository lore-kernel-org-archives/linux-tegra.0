From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH v8 21/21] tegra: fdt: Enable FDT support for Ventana
Date: Tue,  6 Mar 2012 19:10:33 -0800
Message-ID: <1331089833-25262-22-git-send-email-sjg@chromium.org>
References: <1331089833-25262-16-git-send-email-sjg@chromium.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1331089833-25262-16-git-send-email-sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: U-Boot Mailing List <u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org>
Cc: Tom Warren <twarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jerry Van Baren <vanbaren-He//nVnquyzQT0dZR+AlfA@public.gmane.org>, Devicetree Discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Tom Warren <twarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

This switches Ventana over to use FDT for run-time config instead of
CONFIG options.

At present Ventana does not have its own device tree file - it just uses
the Seaboard one.

Signed-off-by: Tom Warren <twarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Acked-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
---
Changes in v8:
- Add Tom's patch to enable FDT support on Ventana

 include/configs/ventana.h |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/include/configs/ventana.h b/include/configs/ventana.h
index acc9b43..3e55fe5 100644
--- a/include/configs/ventana.h
+++ b/include/configs/ventana.h
@@ -27,6 +27,11 @@
 #include <asm/sizes.h>
 #include "tegra2-common.h"
 
+/* Enable fdt support for Ventana. Flash the image in u-boot-dtb.bin */
+#define CONFIG_DEFAULT_DEVICE_TREE	tegra2-seaboard
+#define CONFIG_OF_CONTROL
+#define CONFIG_OF_SEPARATE
+
 /* High-level configuration options */
 #define TEGRA2_SYSMEM		"mem=384M@0M nvmem=128M@384M mem=512M@512M"
 #define V_PROMPT		"Tegra2 (Ventana) # "
-- 
1.7.7.3
