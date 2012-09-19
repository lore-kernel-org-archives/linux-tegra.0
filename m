From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [PATCH 2/5] ARM: tegra: define DT bindings for and instantiate RTC
Date: Wed, 19 Sep 2012 15:31:16 -0600
Message-ID: <1348090279-22631-2-git-send-email-swarren@wwwdotorg.org>
References: <1348090279-22631-1-git-send-email-swarren@wwwdotorg.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1348090279-22631-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

The Tegra RTC maintains seconds and milliseconds counters, and five alarm
registers. The alarms and other interrupts may wake the system from
low-power state.

Define a DT binding for this HW module, and add the module into the Tegra
device tree files.

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 .../devicetree/bindings/rtc/nvidia,tegra20-rtc.txt |   19 +++++++++++++++++++
 arch/arm/boot/dts/tegra20.dtsi                     |    6 ++++++
 arch/arm/boot/dts/tegra30.dtsi                     |    6 ++++++
 3 files changed, 31 insertions(+), 0 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/rtc/nvidia,tegra20-rtc.txt

diff --git a/Documentation/devicetree/bindings/rtc/nvidia,tegra20-rtc.txt b/Documentation/devicetree/bindings/rtc/nvidia,tegra20-rtc.txt
new file mode 100644
index 0000000..93f45e9
--- /dev/null
+++ b/Documentation/devicetree/bindings/rtc/nvidia,tegra20-rtc.txt
@@ -0,0 +1,19 @@
+NVIDIA Tegra20 real-time clock
+
+The Tegra RTC maintains seconds and milliseconds counters, and five alarm
+registers. The alarms and other interrupts may wake the system from low-power
+state.
+
+Required properties:
+
+- compatible : should be "nvidia,tegra20-rtc".
+- reg : Specifies base physical address and size of the registers.
+- interrupts : A single interrupt specifier.
+
+Example:
+
+timer {
+	compatible = "nvidia,tegra20-rtc";
+	reg = <0x7000e000 0x100>;
+	interrupts = <0 2 0x04>;
+};
diff --git a/arch/arm/boot/dts/tegra20.dtsi b/arch/arm/boot/dts/tegra20.dtsi
index 0fadf4d..9d22238 100644
--- a/arch/arm/boot/dts/tegra20.dtsi
+++ b/arch/arm/boot/dts/tegra20.dtsi
@@ -138,6 +138,12 @@
 		#pwm-cells = <2>;
 	};
 
+	rtc {
+		compatible = "nvidia,tegra20-rtc";
+		reg = <0x7000e000 0x100>;
+		interrupts = <0 2 0x04>;
+	};
+
 	i2c@7000c000 {
 		compatible = "nvidia,tegra20-i2c";
 		reg = <0x7000c000 0x100>;
diff --git a/arch/arm/boot/dts/tegra30.dtsi b/arch/arm/boot/dts/tegra30.dtsi
index d6f8e4c..ffb035a 100644
--- a/arch/arm/boot/dts/tegra30.dtsi
+++ b/arch/arm/boot/dts/tegra30.dtsi
@@ -134,6 +134,12 @@
 		#pwm-cells = <2>;
 	};
 
+	rtc {
+		compatible = "nvidia,tegra30-rtc", "nvidia,tegra20-rtc";
+		reg = <0x7000e000 0x100>;
+		interrupts = <0 2 0x04>;
+	};
+
 	i2c@7000c000 {
 		compatible =  "nvidia,tegra30-i2c", "nvidia,tegra20-i2c";
 		reg = <0x7000c000 0x100>;
-- 
1.7.0.4
