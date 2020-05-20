From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 2/2] arm64: tegra: Make the RTC a wakeup source on Jetson Nano and TX1
Date: Wed, 20 May 2020 16:13:18 +0100
Message-ID: <20200520151318.15493-2-jonathanh@nvidia.com>
References: <20200520151318.15493-1-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200520151318.15493-1-jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

The RTC found on the MAX77620 PMIC can be used as a wakeup source on
Jetson Nano and TX1, which is useful to wake the system from suspend
at a given time.

Signed-off-by: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 arch/arm64/boot/dts/nvidia/tegra210-p2180.dtsi     | 3 ++-
 arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts | 3 ++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra210-p2180.dtsi b/arch/arm64/boot/dts/nvidia/tegra210-p2180.dtsi
index f87d2437d11c..cc6ed45a2b48 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210-p2180.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra210-p2180.dtsi
@@ -38,7 +38,8 @@
 		pmic: pmic@3c {
 			compatible = "maxim,max77620";
 			reg = <0x3c>;
-			interrupts = <GIC_SPI 86 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-parent = <&tegra_pmc>;
+			interrupts = <51 IRQ_TYPE_LEVEL_LOW>;
 
 			#interrupt-cells = <2>;
 			interrupt-controller;
diff --git a/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts b/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts
index 374ce58b2b38..9bc52fdb393c 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts
@@ -149,7 +149,8 @@
 		pmic: pmic@3c {
 			compatible = "maxim,max77620";
 			reg = <0x3c>;
-			interrupts = <GIC_SPI 86 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-parent = <&tegra_pmc>;
+			interrupts = <51 IRQ_TYPE_LEVEL_LOW>;
 
 			#interrupt-cells = <2>;
 			interrupt-controller;
-- 
2.17.1
