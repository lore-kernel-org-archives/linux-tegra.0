From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 1/4] ARM64: Tegra: Enable I2C controller for EEPROM
Date: Mon, 24 Feb 2020 14:34:33 +0000
Message-ID: <20200224143436.5438-1-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Commit a5b6b67364cb ("arm64: tegra: Add ID EEPROM for Jetson TX1
module") populated the EEPROM on the Jetson TX1 module, but did not
enable the corresponding I2C controller. Enable the I2C controller so
that this EEPROM can be accessed.

Fixes: a5b6b67364cb ("arm64: tegra: Add ID EEPROM for Jetson TX1 module")

Cc: <stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Signed-off-by: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 arch/arm64/boot/dts/nvidia/tegra210-p2180.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra210-p2180.dtsi b/arch/arm64/boot/dts/nvidia/tegra210-p2180.dtsi
index cb58f79deb48..95b1a6e76e6e 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210-p2180.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra210-p2180.dtsi
@@ -265,6 +265,8 @@
 	};
 
 	i2c@7000c500 {
+		status = "okay";
+
 		/* module ID EEPROM */
 		eeprom@50 {
 			compatible = "atmel,24c02";
-- 
2.17.1
