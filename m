From: Alexandre Courbot <acourbot@nvidia.com>
Subject: [PATCH 3/4] ARM: tegra: jetson-tk1: Add GK20A GPU DT node
Date: Wed, 1 Jul 2015 18:13:47 +0900
Message-ID: <1435742028-8237-4-git-send-email-acourbot@nvidia.com>
References: <1435742028-8237-1-git-send-email-acourbot@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1435742028-8237-1-git-send-email-acourbot@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, Stephen Warren <swarren@wwwdotorg.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, gnurou@gmail.com, Alexandre Courbot <acourbot@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

Add the device-tree node for the GK20A GPU and leave it disabled.
It is the responsability of the bootloader to enable it if the
VPR registers have been programmed such as the GPU can operate.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 arch/arm/boot/dts/tegra124-jetson-tk1.dts | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/tegra124-jetson-tk1.dts b/arch/arm/boot/dts/tegra124-jetson-tk1.dts
index ed8a8acd3d34..f0459ea94981 100644
--- a/arch/arm/boot/dts/tegra124-jetson-tk1.dts
+++ b/arch/arm/boot/dts/tegra124-jetson-tk1.dts
@@ -53,6 +53,14 @@
 		};
 	};
 
+	gpu@0,57000000 {
+		/*
+		 * Node left disabled on purpose - the bootloader will enable
+		 * it after having set the VPR up
+		 */
+		vdd-supply = <&vdd_gpu>;
+	};
+
 	pinmux: pinmux@0,70000868 {
 		pinctrl-names = "boot";
 		pinctrl-0 = <&state_boot>;
@@ -1514,7 +1522,7 @@
 					regulator-always-on;
 				};
 
-				sd6 {
+				vdd_gpu: sd6 {
 					regulator-name = "+VDD_GPU_AP";
 					regulator-min-microvolt = <650000>;
 					regulator-max-microvolt = <1200000>;
-- 
2.4.4
