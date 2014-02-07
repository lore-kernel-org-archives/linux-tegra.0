From: Bryan Wu <cooloney-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 2/2] ARM: tegra: enable PCA9546 on Cardhu
Date: Fri,  7 Feb 2014 15:54:58 -0800
Message-ID: <1391817298-10600-2-git-send-email-pengw@nvidia.com>
References: <1391817298-10600-1-git-send-email-pengw@nvidia.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1391817298-10600-1-git-send-email-pengw-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Cardhu has a PCA9546 for I2C bus extension, which connects to 3
cameras. It's required for Tegra V4L2 soc camera driver and camera
sensor drivers.

Signed-off-by: Bryan Wu <pengw-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 arch/arm/boot/dts/tegra30-cardhu.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm/boot/dts/tegra30-cardhu.dtsi b/arch/arm/boot/dts/tegra30-cardhu.dtsi
index 9104224..004002c 100644
--- a/arch/arm/boot/dts/tegra30-cardhu.dtsi
+++ b/arch/arm/boot/dts/tegra30-cardhu.dtsi
@@ -187,6 +187,13 @@
 			interrupt-parent = <&gpio>;
 			interrupts = <TEGRA_GPIO(L, 0) IRQ_TYPE_LEVEL_HIGH>;
 		};
+
+		i2cmux@70 {
+			compatible = "nxp,pca9546";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0x70>;
+		};
 	};
 
 	i2c@7000c700 {
-- 
1.8.3.2
