From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 72/73] arm64: tegra: Rename cbb@0 to bus@0 on Tegra194
Date: Tue, 16 Jun 2020 15:52:37 +0200
Message-ID: <20200616135238.3001888-73-thierry.reding@gmail.com>
References: <20200616135238.3001888-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200616135238.3001888-1-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

The control backbone is a simple-bus and hence its device tree node
should be named "bus@<unit-address>" according to the bindings.

Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 .../arm64/boot/dts/nvidia/tegra194-p2888.dtsi | 22 +++++++++----------
 .../boot/dts/nvidia/tegra194-p2972-0000.dts   | 10 ++++-----
 arch/arm64/boot/dts/nvidia/tegra194.dtsi      |  2 +-
 3 files changed, 17 insertions(+), 17 deletions(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra194-p2888.dtsi b/arch/arm64/boot/dts/nvidia/tegra194-p2888.dtsi
index 6f2c0754c870..cefbd0000357 100644
--- a/arch/arm64/boot/dts/nvidia/tegra194-p2888.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra194-p2888.dtsi
@@ -8,18 +8,18 @@ / {
 	compatible = "nvidia,p2888", "nvidia,tegra194";
 
 	aliases {
-		ethernet0 = "/cbb@0/ethernet@2490000";
-		mmc0 = "/cbb@0/mmc@3460000";
-		mmc1 = "/cbb@0/mmc@3400000";
+		ethernet0 = "/bus@0/ethernet@2490000";
+		mmc0 = "/bus@0/mmc@3460000";
+		mmc1 = "/bus@0/mmc@3400000";
 		serial0 = &tcu;
 		i2c0 = "/bpmp/i2c";
-		i2c1 = "/cbb@0/i2c@3160000";
-		i2c2 = "/cbb@0/i2c@c240000";
-		i2c3 = "/cbb@0/i2c@3180000";
-		i2c4 = "/cbb@0/i2c@3190000";
-		i2c5 = "/cbb@0/i2c@31c0000";
-		i2c6 = "/cbb@0/i2c@c250000";
-		i2c7 = "/cbb@0/i2c@31e0000";
+		i2c1 = "/bus@0/i2c@3160000";
+		i2c2 = "/bus@0/i2c@c240000";
+		i2c3 = "/bus@0/i2c@3180000";
+		i2c4 = "/bus@0/i2c@3190000";
+		i2c5 = "/bus@0/i2c@31c0000";
+		i2c6 = "/bus@0/i2c@c250000";
+		i2c7 = "/bus@0/i2c@31e0000";
 	};
 
 	chosen {
@@ -27,7 +27,7 @@ chosen {
 		stdout-path = "serial0:115200n8";
 	};
 
-	cbb@0 {
+	bus@0 {
 		ethernet@2490000 {
 			status = "okay";
 
diff --git a/arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts b/arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts
index 0f9868b6fd6b..90b6ea5467fa 100644
--- a/arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts
@@ -10,7 +10,7 @@ / {
 	model = "NVIDIA Jetson AGX Xavier Developer Kit";
 	compatible = "nvidia,p2972-0000", "nvidia,tegra194";
 
-	cbb@0 {
+	bus@0 {
 		aconnect@2900000 {
 			status = "okay";
 
@@ -93,10 +93,10 @@ usb3-3 {
 		usb@3610000 {
 			status = "okay";
 
-			phys =	<&{/cbb@0/padctl@3520000/pads/usb2/lanes/usb2-1}>,
-				<&{/cbb@0/padctl@3520000/pads/usb2/lanes/usb2-3}>,
-				<&{/cbb@0/padctl@3520000/pads/usb3/lanes/usb3-0}>,
-				<&{/cbb@0/padctl@3520000/pads/usb3/lanes/usb3-3}>;
+			phys =	<&{/bus@0/padctl@3520000/pads/usb2/lanes/usb2-1}>,
+				<&{/bus@0/padctl@3520000/pads/usb2/lanes/usb2-3}>,
+				<&{/bus@0/padctl@3520000/pads/usb3/lanes/usb3-0}>,
+				<&{/bus@0/padctl@3520000/pads/usb3/lanes/usb3-3}>;
 			phy-names = "usb2-1", "usb2-3", "usb3-0", "usb3-3";
 		};
 
diff --git a/arch/arm64/boot/dts/nvidia/tegra194.dtsi b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
index 307f999edbf9..ea629dae6880 100644
--- a/arch/arm64/boot/dts/nvidia/tegra194.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
@@ -16,7 +16,7 @@ / {
 	#size-cells = <2>;
 
 	/* control backbone */
-	cbb@0 {
+	bus@0 {
 		compatible = "simple-bus";
 		#address-cells = <1>;
 		#size-cells = <1>;
-- 
2.24.1
