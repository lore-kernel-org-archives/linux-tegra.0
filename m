From: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 2/2] ARM: tegra: jetson-tk1: add GK20A GPU DT node
Date: Thu, 9 Oct 2014 15:11:52 +0900
Message-ID: <1412835112-7209-2-git-send-email-acourbot@nvidia.com>
References: <1412835112-7209-1-git-send-email-acourbot@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1412835112-7209-1-git-send-email-acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Add the device-tree node for the GK20A GPU and leave it disabled by
default. It is the responsability of the bootloader to enable it if the
VPR registers have been programmed such as the GPU can operate.

Signed-off-by: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 arch/arm/boot/dts/tegra124-jetson-tk1.dts | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/tegra124-jetson-tk1.dts b/arch/arm/boot/dts/tegra124-jetson-tk1.dts
index 029c9a021541..6f84c7e231a0 100644
--- a/arch/arm/boot/dts/tegra124-jetson-tk1.dts
+++ b/arch/arm/boot/dts/tegra124-jetson-tk1.dts
@@ -50,6 +50,12 @@
 		};
 	};
 
+	gpu@0,57000000 {
+		status = "disabled";
+
+		vdd-supply = <&vdd_gpu>;
+	};
+
 	pinmux: pinmux@0,70000868 {
 		pinctrl-names = "boot";
 		pinctrl-0 = <&state_boot>;
@@ -1560,7 +1566,7 @@
 					regulator-always-on;
 				};
 
-				sd6 {
+				vdd_gpu: sd6 {
 					regulator-name = "+VDD_GPU_AP";
 					regulator-min-microvolt = <650000>;
 					regulator-max-microvolt = <1200000>;
-- 
2.1.2
