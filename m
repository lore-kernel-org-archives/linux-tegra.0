From: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH V2 5/9] ARM: dts: tegra: add power gpio keys to DT
Date: Tue, 12 Mar 2013 12:03:16 +0800
Message-ID: <1363060996-9363-1-git-send-email-josephl@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

This adds the power gpio key to DT and enable the wakeup of the gpio key
for the device. The Seaboard and paz00 already had the power gpio key
binding and the power key of Whistler was on KBC. So these boards' device
tree didn't include in this patch.

Signed-off-by: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
V2:
* no change
---
 arch/arm/boot/dts/tegra20-harmony.dts   | 11 +++++++++++
 arch/arm/boot/dts/tegra20-trimslice.dts | 11 +++++++++++
 arch/arm/boot/dts/tegra20-ventana.dts   | 11 +++++++++++
 3 files changed, 33 insertions(+)

diff --git a/arch/arm/boot/dts/tegra20-harmony.dts b/arch/arm/boot/dts/tegra20-harmony.dts
index 1f79c0d..3532853 100644
--- a/arch/arm/boot/dts/tegra20-harmony.dts
+++ b/arch/arm/boot/dts/tegra20-harmony.dts
@@ -568,6 +568,17 @@
 				0x1F0400D6>;	/* KEY_QUESTION */
 	};
 
+	gpio-keys {
+		compatible = "gpio-keys";
+
+		power {
+			label = "Power";
+			gpios = <&gpio 170 1>; /* gpio PV2, active low */
+			linux,code = <116>; /* KEY_POWER */
+			gpio-key,wakeup;
+		};
+	};
+
 	regulators {
 		compatible = "simple-bus";
 		#address-cells = <1>;
diff --git a/arch/arm/boot/dts/tegra20-trimslice.dts b/arch/arm/boot/dts/tegra20-trimslice.dts
index 98f3e44..3cfd9ed 100644
--- a/arch/arm/boot/dts/tegra20-trimslice.dts
+++ b/arch/arm/boot/dts/tegra20-trimslice.dts
@@ -335,6 +335,17 @@
 		gpios = <&gpio 191 1>; /* gpio PX7, active low */
 	};
 
+	gpio-keys {
+		compatible = "gpio-keys";
+
+		power {
+			label = "Power";
+			gpios = <&gpio 190 1>; /* gpio PX6, active low */
+			linux,code = <116>; /* KEY_POWER */
+			gpio-key,wakeup;
+		};
+	};
+
 	regulators {
 		compatible = "simple-bus";
 		#address-cells = <1>;
diff --git a/arch/arm/boot/dts/tegra20-ventana.dts b/arch/arm/boot/dts/tegra20-ventana.dts
index 4aef56f..ede91c0 100644
--- a/arch/arm/boot/dts/tegra20-ventana.dts
+++ b/arch/arm/boot/dts/tegra20-ventana.dts
@@ -531,6 +531,17 @@
 		bus-width = <8>;
 	};
 
+	gpio-keys {
+		compatible = "gpio-keys";
+
+		power {
+			label = "Power";
+			gpios = <&gpio 170 1>; /* gpio PV2, active low */
+			linux,code = <116>; /* KEY_POWER */
+			gpio-key,wakeup;
+		};
+	};
+
 	regulators {
 		compatible = "simple-bus";
 		#address-cells = <1>;
-- 
1.8.1.5
