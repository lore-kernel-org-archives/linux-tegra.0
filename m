From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 2/2] arm64: tegra: Make the RTC a wakeup source on Jetson TX2
Date: Fri, 17 Apr 2020 19:11:17 +0200
Message-ID: <20200417171117.2556374-2-thierry.reding@gmail.com>
References: <20200417171117.2556374-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200417171117.2556374-1-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

The RTC found on the MAX77620 PMIC can be used as a wakeup source on
Jetson TX2, which is useful to wake the system from suspend at a given
time.

Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 arch/arm64/boot/dts/nvidia/tegra186-p3310.dtsi | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra186-p3310.dtsi b/arch/arm64/boot/dts/nvidia/tegra186-p3310.dtsi
index da96de04d003..7a0fa157f48c 100644
--- a/arch/arm64/boot/dts/nvidia/tegra186-p3310.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra186-p3310.dtsi
@@ -221,7 +221,8 @@ pmic: pmic@3c {
 				compatible = "maxim,max77620";
 				reg = <0x3c>;
 
-				interrupts = <GIC_SPI 209 IRQ_TYPE_LEVEL_HIGH>;
+				interrupt-parent = <&pmc>;
+				interrupts = <24 IRQ_TYPE_LEVEL_LOW>;
 				#interrupt-cells = <2>;
 				interrupt-controller;
 
@@ -379,6 +380,10 @@ vdd_pex: ldo8 {
 						regulator-max-microvolt = <1050000>;
 					};
 				};
+
+				rtc {
+					wakeup-source;
+				};
 			};
 		};
 	};
-- 
2.24.1
