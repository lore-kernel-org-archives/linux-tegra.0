From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: [PATCH] ARM: tegra: Add clocks property to TWD node
Date: Tue, 12 Feb 2013 16:56:51 +0100
Message-ID: <1360684611-11152-1-git-send-email-thierry.reding@avionic-design.de>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

The generic ARM TWD code has recently gained support for looking up the
clock from DT. Adding the appropriate clocks property allows the driver
to successfully register the clock event device.

Signed-off-by: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
---
Note that the binding documentation says that the twd clock is 132 on
Tegra20, but according to drivers/clk/tegra/clk-tegra20.c it is in fact
130. The patch doesn't update the binding documentation because some
other offsets are probably also wrong and I didn't have the time to go
through all of them.
---
 arch/arm/boot/dts/tegra20.dtsi | 1 +
 arch/arm/boot/dts/tegra30.dtsi | 1 +
 2 files changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/tegra20.dtsi b/arch/arm/boot/dts/tegra20.dtsi
index cdb8da0..d6642b2 100644
--- a/arch/arm/boot/dts/tegra20.dtsi
+++ b/arch/arm/boot/dts/tegra20.dtsi
@@ -118,6 +118,7 @@
 		compatible = "arm,cortex-a9-twd-timer";
 		reg = <0x50040600 0x20>;
 		interrupts = <1 13 0x304>;
+		clocks = <&tegra_car 130>;
 	};
 
 	intc: interrupt-controller {
diff --git a/arch/arm/boot/dts/tegra30.dtsi b/arch/arm/boot/dts/tegra30.dtsi
index 572a45b..922c8cf 100644
--- a/arch/arm/boot/dts/tegra30.dtsi
+++ b/arch/arm/boot/dts/tegra30.dtsi
@@ -119,6 +119,7 @@
 		compatible = "arm,cortex-a9-twd-timer";
 		reg = <0x50040600 0x20>;
 		interrupts = <1 13 0xf04>;
+		clocks = <&tegra_car 214>;
 	};
 
 	intc: interrupt-controller {
-- 
1.8.1.2
