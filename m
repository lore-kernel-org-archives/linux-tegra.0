From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [PATCH 4/9] ARM: dt: tegra: format regs properties consistently
Date: Fri, 11 May 2012 18:37:56 -0600
Message-ID: <1336783081-16978-5-git-send-email-swarren@wwwdotorg.org>
References: <1336783081-16978-1-git-send-email-swarren@wwwdotorg.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1336783081-16978-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Place each reg "entry" on its own line, and wrap the whole list in
<> rather than each individual entry.

The convention chosen here is slightly arbitrary, but is not consistent
throughout all Tegra files.

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 arch/arm/boot/dts/tegra20.dtsi |    4 ++--
 arch/arm/boot/dts/tegra30.dtsi |    7 ++++---
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/arch/arm/boot/dts/tegra20.dtsi b/arch/arm/boot/dts/tegra20.dtsi
index a6b1351..7f718bd 100644
--- a/arch/arm/boot/dts/tegra20.dtsi
+++ b/arch/arm/boot/dts/tegra20.dtsi
@@ -13,8 +13,8 @@
 		compatible = "arm,cortex-a9-gic";
 		interrupt-controller;
 		#interrupt-cells = <3>;
-		reg = <0x50041000 0x1000>,
-		      <0x50040100 0x0100>;
+		reg = <0x50041000 0x1000
+		       0x50040100 0x0100>;
 	};
 
 	pmu {
diff --git a/arch/arm/boot/dts/tegra30.dtsi b/arch/arm/boot/dts/tegra30.dtsi
index 45547ad..b52378a 100644
--- a/arch/arm/boot/dts/tegra30.dtsi
+++ b/arch/arm/boot/dts/tegra30.dtsi
@@ -13,8 +13,8 @@
 		compatible = "arm,cortex-a9-gic";
 		interrupt-controller;
 		#interrupt-cells = <3>;
-		reg = <0x50041000 0x1000>,
-		      <0x50040100 0x0100>;
+		reg = <0x50041000 0x1000
+		       0x50040100 0x0100>;
 	};
 
 	pmu {
@@ -186,7 +186,8 @@
 
 	ahub {
 		compatible = "nvidia,tegra30-ahub";
-		reg = <0x70080000 0x200 0x70080200 0x100>;
+		reg = <0x70080000 0x200
+		       0x70080200 0x100>;
 		interrupts = <0 103 0x04>;
 		nvidia,dma-request-selector = <&apbdma 1>;
 
-- 
1.7.0.4
