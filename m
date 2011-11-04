From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: [PATCH 1/2] arm/dt: add basic usb nodes to tegra device trees
Date: Thu,  3 Nov 2011 20:26:13 -0700
Message-ID: <1320377174-28047-1-git-send-email-olof@lixom.net>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

For now they are a minimal binding. It needs to be amended with
vendor-specific settings for phy setup and link tuning, etc.

Signed-off-by: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
---
 arch/arm/boot/dts/tegra-seaboard.dts |    4 ++++
 arch/arm/boot/dts/tegra20.dtsi       |   18 ++++++++++++++++++
 2 files changed, 22 insertions(+), 0 deletions(-)

diff --git a/arch/arm/boot/dts/tegra-seaboard.dts b/arch/arm/boot/dts/tegra-seaboard.dts
index a72299b..88c682a 100644
--- a/arch/arm/boot/dts/tegra-seaboard.dts
+++ b/arch/arm/boot/dts/tegra-seaboard.dts
@@ -29,4 +29,8 @@
 	sdhci@c8000600 {
 		support-8bit;
 	};
+
+	usb@c5000000 {
+		nvidia,vbus-gpio = <&gpio 24 0>; /* PD0 */
+	};
 };
diff --git a/arch/arm/boot/dts/tegra20.dtsi b/arch/arm/boot/dts/tegra20.dtsi
index 65d7e6a..2ad1107 100644
--- a/arch/arm/boot/dts/tegra20.dtsi
+++ b/arch/arm/boot/dts/tegra20.dtsi
@@ -143,5 +143,23 @@
 		reg = <0xc8000600 0x200>;
 		interrupts = < 63 >;
 	};
+
+	usb@c5000000 {
+		compatible = "nvidia,tegra20-ehci", "usb-ehci";
+		reg = <0xc5000000 0x4000>;
+		interrupts = < 52 >;
+	};
+
+	usb@c5004000 {
+		compatible = "nvidia,tegra20-ehci", "usb-ehci";
+		reg = <0xc5004000 0x4000>;
+		interrupts = < 53 >;
+	};
+
+	usb@c5008000 {
+		compatible = "nvidia,tegra20-ehci", "usb-ehci";
+		reg = <0xc5008000 0x4000>;
+		interrupts = < 129 >;
+	};
 };
 
-- 
1.7.4.1
