From: Marcel Ziswiler <marcel@ziswiler.com>
Subject: [PATCH v2 07/19] ARM: tegra: apalis-tk1: white-space clean-up
Date: Sat,  1 Sep 2018 15:04:52 +0200
Message-ID: <20180901130504.14318-8-marcel@ziswiler.com>
References: <20180901130504.14318-1-marcel@ziswiler.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180901130504.14318-1-marcel@ziswiler.com>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Marcel Ziswiler <marcel.ziswiler@toradex.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-Id: linux-tegra@vger.kernel.org

From: Marcel Ziswiler <marcel.ziswiler@toradex.com>

White-space clean-up.

Signed-off-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>

---

Changes in v2: None

 arch/arm/boot/dts/tegra124-apalis-v1.2.dtsi | 3 ---
 arch/arm/boot/dts/tegra124-apalis.dtsi      | 3 ---
 2 files changed, 6 deletions(-)

diff --git a/arch/arm/boot/dts/tegra124-apalis-v1.2.dtsi b/arch/arm/boot/dts/tegra124-apalis-v1.2.dtsi
index aaedc83a11bc..14114bc43e38 100644
--- a/arch/arm/boot/dts/tegra124-apalis-v1.2.dtsi
+++ b/arch/arm/boot/dts/tegra124-apalis-v1.2.dtsi
@@ -1881,7 +1881,6 @@
 			usb2-0 {
 				status = "okay";
 				mode = "otg";
-
 				vbus-supply = <&reg_usbo1_vbus>;
 			};
 
@@ -1889,7 +1888,6 @@
 			usb2-1 {
 				status = "okay";
 				mode = "host";
-
 				vbus-supply = <&reg_usbh_vbus>;
 			};
 
@@ -1897,7 +1895,6 @@
 			usb2-2 {
 				status = "okay";
 				mode = "host";
-
 				vbus-supply = <&reg_usbh_vbus>;
 			};
 
diff --git a/arch/arm/boot/dts/tegra124-apalis.dtsi b/arch/arm/boot/dts/tegra124-apalis.dtsi
index 208411692bdc..955adebc9e90 100644
--- a/arch/arm/boot/dts/tegra124-apalis.dtsi
+++ b/arch/arm/boot/dts/tegra124-apalis.dtsi
@@ -1910,7 +1910,6 @@
 			usb2-0 {
 				status = "okay";
 				mode = "otg";
-
 				vbus-supply = <&reg_usbo1_vbus>;
 			};
 
@@ -1918,7 +1917,6 @@
 			usb2-1 {
 				status = "okay";
 				mode = "host";
-
 				vbus-supply = <&reg_usbh_vbus>;
 			};
 
@@ -1926,7 +1924,6 @@
 			usb2-2 {
 				status = "okay";
 				mode = "host";
-
 				vbus-supply = <&reg_usbh_vbus>;
 			};
 
-- 
2.14.4
