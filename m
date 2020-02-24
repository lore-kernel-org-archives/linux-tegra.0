From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 2/4] ARM64: tegra: Add EEPROM supplies
Date: Mon, 24 Feb 2020 14:34:34 +0000
Message-ID: <20200224143436.5438-2-jonathanh@nvidia.com>
References: <20200224143436.5438-1-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200224143436.5438-1-jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

The following warning is observed on Jetson TX1, Jetson Nano and Jetson
TX2 platforms because the supply regulators are not specified for the
EEPROMs.

 WARNING KERN at24 0-0050: 0-0050 supply vcc not found, using dummy regulator
 WARNING KERN at24 0-0057: 0-0057 supply vcc not found, using dummy regulator

For both of these platforms the EEPROM is powered by the main 1.8V
supply rail and so populate the supply for these devices to fix these
warnings.

Signed-off-by: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts | 1 +
 arch/arm64/boot/dts/nvidia/tegra186-p3310.dtsi     | 1 +
 arch/arm64/boot/dts/nvidia/tegra210-p2180.dtsi     | 1 +
 arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dts | 1 +
 arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts | 2 ++
 5 files changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts b/arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts
index d7628f5afb85..961b1be0c56b 100644
--- a/arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts
@@ -226,6 +226,7 @@
 			compatible = "atmel,24c02";
 			reg = <0x57>;
 
+			vcc-supply = <&vdd_1v8>;
 			address-bits = <8>;
 			page-size = <8>;
 			size = <256>;
diff --git a/arch/arm64/boot/dts/nvidia/tegra186-p3310.dtsi b/arch/arm64/boot/dts/nvidia/tegra186-p3310.dtsi
index 947744d0f04c..da96de04d003 100644
--- a/arch/arm64/boot/dts/nvidia/tegra186-p3310.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra186-p3310.dtsi
@@ -171,6 +171,7 @@
 			compatible = "atmel,24c02";
 			reg = <0x50>;
 
+			vcc-supply = <&vdd_1v8>;
 			address-bits = <8>;
 			page-size = <8>;
 			size = <256>;
diff --git a/arch/arm64/boot/dts/nvidia/tegra210-p2180.dtsi b/arch/arm64/boot/dts/nvidia/tegra210-p2180.dtsi
index 95b1a6e76e6e..f87d2437d11c 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210-p2180.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra210-p2180.dtsi
@@ -272,6 +272,7 @@
 			compatible = "atmel,24c02";
 			reg = <0x50>;
 
+			vcc-supply = <&vdd_1v8>;
 			address-bits = <8>;
 			page-size = <8>;
 			size = <256>;
diff --git a/arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dts b/arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dts
index a3cafe39ba4c..c70a610f8e3a 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dts
@@ -85,6 +85,7 @@
 			compatible = "atmel,24c02";
 			reg = <0x57>;
 
+			vcc-supply = <&vdd_1v8>;
 			address-bits = <8>;
 			page-size = <8>;
 			size = <256>;
diff --git a/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts b/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts
index 848afd855da6..21ed1756b889 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts
@@ -114,6 +114,7 @@
 			compatible = "atmel,24c02";
 			reg = <0x50>;
 
+			vcc-supply = <&vdd_1v8>;
 			address-bits = <8>;
 			page-size = <8>;
 			size = <256>;
@@ -124,6 +125,7 @@
 			compatible = "atmel,24c02";
 			reg = <0x57>;
 
+			vcc-supply = <&vdd_1v8>;
 			address-bits = <8>;
 			page-size = <8>;
 			size = <256>;
-- 
2.17.1
