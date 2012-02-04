From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH v3 8/9] tegra: i2c: Select number of controllers for Tegra2 boards
Date: Fri,  3 Feb 2012 17:13:59 -0800
Message-ID: <1328318041-10943-9-git-send-email-sjg@chromium.org>
References: <1328318041-10943-1-git-send-email-sjg@chromium.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1328318041-10943-1-git-send-email-sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: U-Boot Mailing List <u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org>
Cc: Tom Warren <twarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Heiko Schocher <hs-ynQEQJNshbs@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

The Tegra 2x SOC has four ports, so define TEGRA_I2C_NUM_CONTROLLERS
in the shared config file.

Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
---

 include/configs/tegra2-common.h |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/include/configs/tegra2-common.h b/include/configs/tegra2-common.h
index 266d0e5..837f859 100644
--- a/include/configs/tegra2-common.h
+++ b/include/configs/tegra2-common.h
@@ -94,6 +94,9 @@
 #define CONFIG_EHCI_IS_TDI
 #define CONFIG_EHCI_DCACHE
 
+/* Total I2C ports on Tegra2 */
+#define TEGRA_I2C_NUM_CONTROLLERS	4
+
 /* include default commands */
 #include <config_cmd_default.h>
 
-- 
1.7.7.3
