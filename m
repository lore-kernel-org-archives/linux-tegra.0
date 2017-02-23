From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 11/11] arm64: tegra: Add GPIO expanders on P2771
Date: Thu, 23 Feb 2017 18:30:53 +0100
Message-ID: <20170223173053.19701-11-thierry.reding@gmail.com>
References: <20170223173053.19701-1-thierry.reding@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170223173053.19701-1-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

The P2771 development board expands the number of GPIOs via two I2C
chips.

Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts b/arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts
index 9485841e3351..eac75764bf3c 100644
--- a/arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts
@@ -18,6 +18,28 @@
 			compatible = "ti,ina3221";
 			reg = <0x43>;
 		};
+
+		exp1: gpio@74 {
+			compatible = "ti,tca9539";
+			reg = <0x74>;
+
+			interrupt-parent = <&gpio>;
+			interrupts = <TEGRA_MAIN_GPIO(Y, 0) GPIO_ACTIVE_LOW>;
+
+			#gpio-cells = <2>;
+			gpio-controller;
+		};
+
+		exp2: gpio@77 {
+			compatible = "ti,tca9539";
+			reg = <0x77>;
+
+			interrupt-parent = <&gpio>;
+			interrupts = <TEGRA_MAIN_GPIO(Y, 6) GPIO_ACTIVE_LOW>;
+
+			#gpio-cells = <2>;
+			gpio-controller;
+		};
 	};
 
 	gpio-keys {
-- 
2.11.1
