From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [PATCH 3/5] ARM: tegra: add TWD to device tree
Date: Wed, 19 Sep 2012 15:31:17 -0600
Message-ID: <1348090279-22631-3-git-send-email-swarren@wwwdotorg.org>
References: <1348090279-22631-1-git-send-email-swarren@wwwdotorg.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1348090279-22631-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

This will allow timer.c to use twd_local_timer_of_register(), and
hence not need to hard-code the TWD address or IRQ.

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 arch/arm/boot/dts/tegra20.dtsi |    6 ++++++
 arch/arm/boot/dts/tegra30.dtsi |    6 ++++++
 2 files changed, 12 insertions(+), 0 deletions(-)

diff --git a/arch/arm/boot/dts/tegra20.dtsi b/arch/arm/boot/dts/tegra20.dtsi
index 9d22238..723fd43 100644
--- a/arch/arm/boot/dts/tegra20.dtsi
+++ b/arch/arm/boot/dts/tegra20.dtsi
@@ -4,6 +4,12 @@
 	compatible = "nvidia,tegra20";
 	interrupt-parent = <&intc>;
 
+	timer@50004600 {
+		compatible = "arm,cortex-a9-twd-timer";
+		reg = <0x50040600 0x20>;
+		interrupts = <1 13 0x304>;
+	};
+
 	intc: interrupt-controller {
 		compatible = "arm,cortex-a9-gic";
 		reg = <0x50041000 0x1000
diff --git a/arch/arm/boot/dts/tegra30.dtsi b/arch/arm/boot/dts/tegra30.dtsi
index ffb035a..15e61b6 100644
--- a/arch/arm/boot/dts/tegra30.dtsi
+++ b/arch/arm/boot/dts/tegra30.dtsi
@@ -4,6 +4,12 @@
 	compatible = "nvidia,tegra30";
 	interrupt-parent = <&intc>;
 
+	timer@50004600 {
+		compatible = "arm,cortex-a9-twd-timer";
+		reg = <0x50040600 0x20>;
+		interrupts = <1 13 0xf04>;
+	};
+
 	intc: interrupt-controller {
 		compatible = "arm,cortex-a9-gic";
 		reg = <0x50041000 0x1000
-- 
1.7.0.4
