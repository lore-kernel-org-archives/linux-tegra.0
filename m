From: Tomeu Vizoso <tomeu.vizoso@collabora.com>
Subject: [PATCH 1/3] of: Add binding for NVIDIA Tegra ACTMON node
Date: Wed, 29 Oct 2014 15:50:11 +0100
Message-ID: <1414594232-15684-2-git-send-email-tomeu.vizoso@collabora.com>
References: <1414594232-15684-1-git-send-email-tomeu.vizoso@collabora.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1414594232-15684-1-git-send-email-tomeu.vizoso@collabora.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Javier Martinez Canillas <javier.martinez@collabora.co.uk>, Tomeu Vizoso <tomeu.vizoso@collabora.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Stephen Warren <swarren@wwwdotorg.org>, Thierry Reding <thierry.reding@gmail.com>, Alexandre Courbot <gnurou@gmail.com>, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

This block gathers statistics about various counters and can be configured to
fire interrupts when thresholds are crossed.

Signed-off-by: Tomeu Vizoso <tomeu.vizoso@collabora.com>
---
 .../devicetree/bindings/arm/tegra/actmon.txt       | 26 ++++++++++++++++++++++
 1 file changed, 26 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/tegra/actmon.txt

diff --git a/Documentation/devicetree/bindings/arm/tegra/actmon.txt b/Documentation/devicetree/bindings/arm/tegra/actmon.txt
new file mode 100644
index 0000000..593683f
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/tegra/actmon.txt
@@ -0,0 +1,26 @@
+Tegra124 Activity Monitor driver
+
+Required properties:
+
+- compatible: should be "nvidia,tegra124-actmon"
+- reg: offset and length of the register set for the device
+- interrupts: standard interrupt property
+- clocks: Must contain a phandle and clock specifier pair for each entry in clock-names. See ../clock/clock-bindings.txt for details.
+- clock-names: Must include the following entries:
+  - actmon
+  - emc
+- resets: Must contain an entry for each entry in reset-names. See ../reset/reset.txt for details.
+- reset-names: Must include the following entries:
+  - actmon
+
+Example:
+	actmon@0,6000c800 {
+		compatible = "nvidia,tegra124-actmon";
+		reg = <0x0 0x6000c800 0x0 0x400>;
+		interrupts = <GIC_SPI 45 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&tegra_car TEGRA124_CLK_ACTMON>,
+			 <&tegra_car TEGRA124_CLK_EMC>;
+		clock-names = "actmon", "emc";
+		resets = <&tegra_car 119>;
+		reset-names = "actmon";
+	};
-- 
1.9.3
