From: Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH] i2c: tegra-bpmp: Enable Tegra BPMP I2C adapter
Date: Wed, 15 Mar 2017 12:20:10 +0000
Message-ID: <1489580410-9541-1-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-i2c-owner@vger.kernel.org>
Sender: linux-i2c-owner@vger.kernel.org
To: Wolfram Sang <wsa@the-dreams.de>, Thierry Reding <thierry.reding@gmail.com>
Cc: linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, Jon Hunter <jonathanh@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

Enable the Tegra BPMP I2C adapter by default if the Tegra BPMP itself
is enabled. This adapter is used as the I2C interface for the PMIC on
the Tegra186 Jetson-TX2 platform.

Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
 drivers/i2c/busses/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
index 8adc0f1d7ad0..9e024ae8a067 100644
--- a/drivers/i2c/busses/Kconfig
+++ b/drivers/i2c/busses/Kconfig
@@ -933,6 +933,7 @@ config I2C_TEGRA
 config I2C_TEGRA_BPMP
 	tristate "NVIDIA Tegra BPMP I2C controller"
 	depends on TEGRA_BPMP
+	default y if TEGRA_BPMP
 	help
 	  If you say yes to this option, support will be included for the I2C
 	  controller embedded in NVIDIA Tegra SoCs accessed via the BPMP.
-- 
2.7.4
