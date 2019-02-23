From: Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: [PATCH 16/18] dt-bindings: timer: add Tegra210 timer
Date: Sat, 23 Feb 2019 14:07:04 +0100
Message-ID: <20190223130707.16704-16-daniel.lezcano@linaro.org>
References: <b5d75b05-b78c-535c-2b35-9a1f5a3a853f@linaro.org>
 <20190223130707.16704-1-daniel.lezcano@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190223130707.16704-1-daniel.lezcano@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: tglx@linutronix.de
Cc: linux-kernel@vger.kernel.org, Joseph Lo <josephl@nvidia.com>, devicetree@vger.kernel.org, Jon Hunter <jonathanh@nvidia.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Thierry Reding <thierry.reding@gmail.com>, "open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

From: Joseph Lo <josephl@nvidia.com>

The Tegra210 timer provides fourteen 29-bit timer counters and one 32-bit
timestamp counter. The TMRs run at either a fixed 1 MHz clock rate derived
from the oscillator clock (TMR0-TMR9) or directly at the oscillator clock
(TMR10-TMR13). Each TMR can be programmed to generate one-shot periodic,
or watchdog interrupts.

Cc: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: linux-kernel@vger.kernel.org
Cc: devicetree@vger.kernel.org
Signed-off-by: Joseph Lo <josephl@nvidia.com>
Reviewed-by: Rob Herring <robh@kernel.org>
Acked-by: Jon Hunter <jonathanh@nvidia.com>
Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
---
 .../bindings/timer/nvidia,tegra210-timer.txt  | 36 +++++++++++++++++++
 1 file changed, 36 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/timer/nvidia,tegra210-timer.txt

diff --git a/Documentation/devicetree/bindings/timer/nvidia,tegra210-timer.txt b/Documentation/devicetree/bindings/timer/nvidia,tegra210-timer.txt
new file mode 100644
index 000000000000..032cda96fe0d
--- /dev/null
+++ b/Documentation/devicetree/bindings/timer/nvidia,tegra210-timer.txt
@@ -0,0 +1,36 @@
+NVIDIA Tegra210 timer
+
+The Tegra210 timer provides fourteen 29-bit timer counters and one 32-bit
+timestamp counter. The TMRs run at either a fixed 1 MHz clock rate derived
+from the oscillator clock (TMR0-TMR9) or directly at the oscillator clock
+(TMR10-TMR13). Each TMR can be programmed to generate one-shot, periodic,
+or watchdog interrupts.
+
+Required properties:
+- compatible : "nvidia,tegra210-timer".
+- reg : Specifies base physical address and size of the registers.
+- interrupts : A list of 14 interrupts; one per each timer channels 0 through
+  13.
+- clocks : Must contain one entry, for the module clock.
+  See ../clocks/clock-bindings.txt for details.
+
+timer@60005000 {
+	compatible = "nvidia,tegra210-timer";
+	reg = <0x0 0x60005000 0x0 0x400>;
+	interrupts = <GIC_SPI 156 IRQ_TYPE_LEVEL_HIGH>,
+		     <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>,
+		     <GIC_SPI 1 IRQ_TYPE_LEVEL_HIGH>,
+		     <GIC_SPI 41 IRQ_TYPE_LEVEL_HIGH>,
+		     <GIC_SPI 42 IRQ_TYPE_LEVEL_HIGH>,
+		     <GIC_SPI 121 IRQ_TYPE_LEVEL_HIGH>,
+		     <GIC_SPI 152 IRQ_TYPE_LEVEL_HIGH>,
+		     <GIC_SPI 153 IRQ_TYPE_LEVEL_HIGH>,
+		     <GIC_SPI 154 IRQ_TYPE_LEVEL_HIGH>,
+		     <GIC_SPI 155 IRQ_TYPE_LEVEL_HIGH>,
+		     <GIC_SPI 176 IRQ_TYPE_LEVEL_HIGH>,
+		     <GIC_SPI 177 IRQ_TYPE_LEVEL_HIGH>,
+		     <GIC_SPI 178 IRQ_TYPE_LEVEL_HIGH>,
+		     <GIC_SPI 179 IRQ_TYPE_LEVEL_HIGH>;
+	clocks = <&tegra_car TEGRA210_CLK_TIMER>;
+	clock-names = "timer";
+};
-- 
2.17.1
