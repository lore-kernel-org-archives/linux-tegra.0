From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 05/11] arm64: tegra: Enable ethernet on P3310
Date: Thu, 23 Feb 2017 18:30:47 +0100
Message-ID: <20170223173053.19701-5-thierry.reding@gmail.com>
References: <20170223173053.19701-1-thierry.reding@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170223173053.19701-1-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

The P3310 processor module provides networking via the ethernet
controller found on NVIDIA Tegra186 SoCs.

Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 arch/arm64/boot/dts/nvidia/tegra186-p3310.dtsi | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra186-p3310.dtsi b/arch/arm64/boot/dts/nvidia/tegra186-p3310.dtsi
index 762f4756346c..ffbb4be5122e 100644
--- a/arch/arm64/boot/dts/nvidia/tegra186-p3310.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra186-p3310.dtsi
@@ -26,6 +26,26 @@
 		reg = <0x0 0x80000000 0x2 0x00000000>;
 	};
 
+	ethernet@2490000 {
+		status = "okay";
+
+		phy-reset-gpios = <&gpio TEGRA_MAIN_GPIO(M, 4) GPIO_ACTIVE_LOW>;
+		phy-handle = <&phy>;
+		phy-mode = "rgmii";
+
+		mdio {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			phy: phy@0 {
+				compatible = "ethernet-phy-ieee802.3-c22";
+				reg = <0x0>;
+				interrupt-parent = <&gpio>;
+				interrupts = <TEGRA_MAIN_GPIO(M, 5) IRQ_TYPE_LEVEL_HIGH>;
+			};
+		};
+	};
+
 	serial@3100000 {
 		status = "okay";
 	};
-- 
2.11.1
