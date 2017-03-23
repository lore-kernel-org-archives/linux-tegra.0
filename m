From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH V2] i2c: tegra-bpmp: Enable Tegra BPMP I2C adapter
Date: Thu, 23 Mar 2017 11:56:56 +0000
Message-ID: <1490270216-7234-1-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Enable the Tegra BPMP I2C adapter by default if the Tegra BPMP itself
is enabled. This adapter is used as the I2C interface for the PMIC on
the Tegra186 Jetson-TX2 platform.

Signed-off-by: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Acked-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---

Changes since V1:
- Dropped redundant 'if' condition from 'default' statement.

 drivers/i2c/busses/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
index 8adc0f1d7ad0..39c0ead2a6df 100644
--- a/drivers/i2c/busses/Kconfig
+++ b/drivers/i2c/busses/Kconfig
@@ -933,6 +933,7 @@ config I2C_TEGRA
 config I2C_TEGRA_BPMP
 	tristate "NVIDIA Tegra BPMP I2C controller"
 	depends on TEGRA_BPMP
+	default y
 	help
 	  If you say yes to this option, support will be included for the I2C
 	  controller embedded in NVIDIA Tegra SoCs accessed via the BPMP.
-- 
2.7.4
