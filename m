Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4A062E8E19;
	Mon, 30 Jun 2025 23:26:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751325995; cv=none; b=IsgfXqaq/ynj9YkntlGaEwOvbqbuMGR/zMn7RcTrd5MPfAOwTE+wz5X/6bpYgW6c6YLx+tF2zlMg9eyaW/Gg5TJSflWYMoxbO5SrLoXFlv1fTflNCH5DAEPDMznY0N8iuSjff4RsU4LOvPSnO3z4T0pRbYAWkKX4s17b1lnpMsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751325995; c=relaxed/simple;
	bh=mjK1/Nq8Oi7VarS8Fh94dKc9jap/JfbLBJrhqi62yM4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=k3llV9PBSKbvb6FfsEXBlozL5JrRSn1i/SHym8KlHVJLjmvERkq4QbA/qWdYfLYoV7ncCDOy1ZE19jyL43Np/wxHqpdgrrGKBmsi7nTiO45ZVAfcHnAlfEssb7O2h/nmPoCiY85CFInDssaSmgwOcwbDTLiS8cBTpOmH06j4Wss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=L+1jAI6T; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="L+1jAI6T"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42EB3C4CEE3;
	Mon, 30 Jun 2025 23:26:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751325994;
	bh=mjK1/Nq8Oi7VarS8Fh94dKc9jap/JfbLBJrhqi62yM4=;
	h=From:To:Cc:Subject:Date:From;
	b=L+1jAI6TGs5iJfUVlP5g1Zmd5OM+PVFZxSZkhT0X/FUd3pBkY7xu5e3PqSdRJwGJr
	 PFkRcRsK9VcRanuyajdo8bhHCgctsGBMdV9/QiZ63v90HmLg8QNz2123MJ5EMFcRna
	 pzL1HDQOBZYr0GeBKMSCJuNlJDgXmHOfWM4n7QP9ZyT7J79HMIy6v1JQX+U68CV0qN
	 sgDdgDbmSwep4Dv0v0nH7UeSRm/brQgbF/Oew1yaiTFOSosoj4Puc95TMvnYMcGAHS
	 VKfuTSb6tprHOBbQi4b2yg3AqdFBfdYFHWAmO5GYY42cKCB1q6DUv/GZPuQu7X2Mq/
	 KMc4eNKtLXm8A==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Joseph Lo <josephl@nvidia.com>,
	Tuomas Tynkkynen <ttynkkynen@nvidia.com>
Cc: Thierry Reding <treding@nvidia.com>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: clock: Convert nvidia,tegra124-dfll to DT schema
Date: Mon, 30 Jun 2025 18:26:30 -0500
Message-ID: <20250630232632.3700405-1-robh@kernel.org>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../bindings/clock/nvidia,tegra124-dfll.txt   | 155 -------------
 .../bindings/clock/nvidia,tegra124-dfll.yaml  | 219 ++++++++++++++++++
 2 files changed, 219 insertions(+), 155 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/clock/nvidia,tegra124-dfll.txt
 create mode 100644 Documentation/devicetree/bindings/clock/nvidia,tegra124-dfll.yaml

diff --git a/Documentation/devicetree/bindings/clock/nvidia,tegra124-dfll.txt b/Documentation/devicetree/bindings/clock/nvidia,tegra124-dfll.txt
deleted file mode 100644
index f7d347385b57..000000000000
--- a/Documentation/devicetree/bindings/clock/nvidia,tegra124-dfll.txt
+++ /dev/null
@@ -1,155 +0,0 @@
-NVIDIA Tegra124 DFLL FCPU clocksource
-
-This binding uses the common clock binding:
-Documentation/devicetree/bindings/clock/clock-bindings.txt
-
-The DFLL IP block on Tegra is a root clocksource designed for clocking
-the fast CPU cluster. It consists of a free-running voltage controlled
-oscillator connected to the CPU voltage rail (VDD_CPU), and a closed loop
-control module that will automatically adjust the VDD_CPU voltage by
-communicating with an off-chip PMIC either via an I2C bus or via PWM signals.
-
-Required properties:
-- compatible : should be one of:
-  - "nvidia,tegra124-dfll": for Tegra124
-  - "nvidia,tegra210-dfll": for Tegra210
-- reg : Defines the following set of registers, in the order listed:
-        - registers for the DFLL control logic.
-        - registers for the I2C output logic.
-        - registers for the integrated I2C master controller.
-        - look-up table RAM for voltage register values.
-- interrupts: Should contain the DFLL block interrupt.
-- clocks: Must contain an entry for each entry in clock-names.
-  See clock-bindings.txt for details.
-- clock-names: Must include the following entries:
-  - soc: Clock source for the DFLL control logic.
-  - ref: The closed loop reference clock
-  - i2c: Clock source for the integrated I2C master.
-- resets: Must contain an entry for each entry in reset-names.
-  See ../reset/reset.txt for details.
-- reset-names: Must include the following entries:
-  - dvco: Reset control for the DFLL DVCO.
-- #clock-cells: Must be 0.
-- clock-output-names: Name of the clock output.
-- vdd-cpu-supply: Regulator for the CPU voltage rail that the DFLL
-  hardware will start controlling. The regulator will be queried for
-  the I2C register, control values and supported voltages.
-
-Required properties for the control loop parameters:
-- nvidia,sample-rate: Sample rate of the DFLL control loop.
-- nvidia,droop-ctrl: See the register CL_DVFS_DROOP_CTRL in the TRM.
-- nvidia,force-mode: See the field DFLL_PARAMS_FORCE_MODE in the TRM.
-- nvidia,cf: Numeric value, see the field DFLL_PARAMS_CF_PARAM in the TRM.
-- nvidia,ci: Numeric value, see the field DFLL_PARAMS_CI_PARAM in the TRM.
-- nvidia,cg: Numeric value, see the field DFLL_PARAMS_CG_PARAM in the TRM.
-
-Optional properties for the control loop parameters:
-- nvidia,cg-scale: Boolean value, see the field DFLL_PARAMS_CG_SCALE in the TRM.
-
-Optional properties for mode selection:
-- nvidia,pwm-to-pmic: Use PWM to control regulator rather then I2C.
-
-Required properties for I2C mode:
-- nvidia,i2c-fs-rate: I2C transfer rate, if using full speed mode.
-
-Required properties for PWM mode:
-- nvidia,pwm-period-nanoseconds: period of PWM square wave in nanoseconds.
-- nvidia,pwm-tristate-microvolts: Regulator voltage in micro volts when PWM
-  control is disabled and the PWM output is tristated. Note that this voltage is
-  configured in hardware, typically via a resistor divider.
-- nvidia,pwm-min-microvolts: Regulator voltage in micro volts when PWM control
-  is enabled and PWM output is low. Hence, this is the minimum output voltage
-  that the regulator supports when PWM control is enabled.
-- nvidia,pwm-voltage-step-microvolts: Voltage increase in micro volts
-  corresponding to a 1/33th increase in duty cycle. Eg the voltage for 2/33th
-  duty cycle would be: nvidia,pwm-min-microvolts +
-  nvidia,pwm-voltage-step-microvolts * 2.
-- pinctrl-0: I/O pad configuration when PWM control is enabled.
-- pinctrl-1: I/O pad configuration when PWM control is disabled.
-- pinctrl-names: must include the following entries:
-  - dvfs_pwm_enable: I/O pad configuration when PWM control is enabled.
-  - dvfs_pwm_disable: I/O pad configuration when PWM control is disabled.
-
-Example for I2C:
-
-clock@70110000 {
-        compatible = "nvidia,tegra124-dfll";
-        reg = <0 0x70110000 0 0x100>, /* DFLL control */
-              <0 0x70110000 0 0x100>, /* I2C output control */
-              <0 0x70110100 0 0x100>, /* Integrated I2C controller */
-              <0 0x70110200 0 0x100>; /* Look-up table RAM */
-        interrupts = <GIC_SPI 62 IRQ_TYPE_LEVEL_HIGH>;
-        clocks = <&tegra_car TEGRA124_CLK_DFLL_SOC>,
-                 <&tegra_car TEGRA124_CLK_DFLL_REF>,
-                 <&tegra_car TEGRA124_CLK_I2C5>;
-        clock-names = "soc", "ref", "i2c";
-        resets = <&tegra_car TEGRA124_RST_DFLL_DVCO>;
-        reset-names = "dvco";
-        #clock-cells = <0>;
-        clock-output-names = "dfllCPU_out";
-        vdd-cpu-supply = <&vdd_cpu>;
-
-        nvidia,sample-rate = <12500>;
-        nvidia,droop-ctrl = <0x00000f00>;
-        nvidia,force-mode = <1>;
-        nvidia,cf = <10>;
-        nvidia,ci = <0>;
-        nvidia,cg = <2>;
-
-        nvidia,i2c-fs-rate = <400000>;
-};
-
-Example for PWM:
-
-clock@70110000 {
-	compatible = "nvidia,tegra124-dfll";
-	reg = <0 0x70110000 0 0x100>, /* DFLL control */
-	      <0 0x70110000 0 0x100>, /* I2C output control */
-	      <0 0x70110100 0 0x100>, /* Integrated I2C controller */
-	      <0 0x70110200 0 0x100>; /* Look-up table RAM */
-	interrupts = <GIC_SPI 62 IRQ_TYPE_LEVEL_HIGH>;
-	clocks = <&tegra_car TEGRA210_CLK_DFLL_SOC>,
-	         <&tegra_car TEGRA210_CLK_DFLL_REF>,
-		 <&tegra_car TEGRA124_CLK_I2C5>;;
-	clock-names = "soc", "ref", "i2c";
-	resets = <&tegra_car TEGRA124_RST_DFLL_DVCO>;
-	reset-names = "dvco";
-	#clock-cells = <0>;
-	clock-output-names = "dfllCPU_out";
-
-	nvidia,sample-rate = <25000>;
-	nvidia,droop-ctrl = <0x00000f00>;
-	nvidia,force-mode = <1>;
-	nvidia,cf = <6>;
-	nvidia,ci = <0>;
-	nvidia,cg = <2>;
-
-	nvidia,pwm-min-microvolts = <708000>; /* 708mV */
-	nvidia,pwm-period-nanoseconds = <2500>; /* 2.5us */
-	nvidia,pwm-to-pmic;
-	nvidia,pwm-tristate-microvolts = <1000000>;
-	nvidia,pwm-voltage-step-microvolts = <19200>; /* 19.2mV */
-
-	pinctrl-names = "dvfs_pwm_enable", "dvfs_pwm_disable";
-	pinctrl-0 = <&dvfs_pwm_active_state>;
-	pinctrl-1 = <&dvfs_pwm_inactive_state>;
-};
-
-/* pinmux nodes added for completeness. Binding doc can be found in:
- * Documentation/devicetree/bindings/pinctrl/nvidia,tegra210-pinmux.yaml
- */
-
-pinmux: pinmux@700008d4 {
-	dvfs_pwm_active_state: dvfs_pwm_active {
-		dvfs_pwm_pbb1 {
-			nvidia,pins = "dvfs_pwm_pbb1";
-			nvidia,tristate = <TEGRA_PIN_DISABLE>;
-		};
-	};
-	dvfs_pwm_inactive_state: dvfs_pwm_inactive {
-		dvfs_pwm_pbb1 {
-			nvidia,pins = "dvfs_pwm_pbb1";
-			nvidia,tristate = <TEGRA_PIN_ENABLE>;
-		};
-	};
-};
diff --git a/Documentation/devicetree/bindings/clock/nvidia,tegra124-dfll.yaml b/Documentation/devicetree/bindings/clock/nvidia,tegra124-dfll.yaml
new file mode 100644
index 000000000000..67d99fd89ea9
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/nvidia,tegra124-dfll.yaml
@@ -0,0 +1,219 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/nvidia,tegra124-dfll.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NVIDIA Tegra124 DFLL FCPU clocksource
+
+maintainers:
+  - Joseph Lo <josephl@nvidia.com>
+  - Thierry Reding <treding@nvidia.com>
+  - Tuomas Tynkkynen <ttynkkynen@nvidia.com>
+
+description:
+  The DFLL IP block on Tegra is a root clocksource designed for clocking the
+  fast CPU cluster. It consists of a free-running voltage controlled oscillator
+  connected to the CPU voltage rail (VDD_CPU), and a closed loop control module
+  that will automatically adjust the VDD_CPU voltage by communicating with an
+  off-chip PMIC either via an I2C bus or via PWM signals.
+
+properties:
+  compatible:
+    enum:
+      - nvidia,tegra124-dfll
+      - nvidia,tegra210-dfll
+
+  reg:
+    items:
+      - description: DFLL control logic registers
+      - description: I2C output logic registers
+      - description: Integrated I2C master controller registers
+      - description: Look-up table RAM for voltage register values
+
+  interrupts:
+    maxItems: 1
+
+  "#clock-cells":
+    const: 0
+
+  clocks:
+    items:
+      - description: Clock source for the DFLL control logic
+      - description: Closed loop reference clock
+      - description: Clock source for the integrated I2C master
+
+  clock-names:
+    items:
+      - const: soc
+      - const: ref
+      - const: i2c
+
+  clock-output-names:
+    description: Name of the DFLL CPU clock output
+    items:
+      - const: dfllCPU_out
+
+  resets:
+    minItems: 1
+    maxItems: 2
+
+  reset-names:
+    minItems: 1
+    items:
+      - const: dvco
+      - const: dfll
+
+  vdd-cpu-supply: true
+
+  nvidia,sample-rate:
+    description: Sample rate of the DFLL control loop
+    $ref: /schemas/types.yaml#/definitions/uint32
+
+  nvidia,droop-ctrl:
+    description: Droop control parameter (CL_DVFS_DROOP_CTRL) in TRM
+    $ref: /schemas/types.yaml#/definitions/uint32
+
+  nvidia,force-mode:
+    description: Force mode parameter (DFLL_PARAMS_FORCE_MODE) in TRM
+    $ref: /schemas/types.yaml#/definitions/uint32
+
+  nvidia,cf:
+    description: CF parameter (DFLL_PARAMS_CF_PARAM) in TRM
+    $ref: /schemas/types.yaml#/definitions/uint32
+
+  nvidia,ci:
+    description: CI parameter (DFLL_PARAMS_CI_PARAM) in TRM
+    $ref: /schemas/types.yaml#/definitions/uint32
+
+  nvidia,cg:
+    description: CG parameter (DFLL_PARAMS_CG_PARAM) in TRM
+    $ref: /schemas/types.yaml#/definitions/uint32
+
+  nvidia,cg-scale:
+    description: CG scale flag (DFLL_PARAMS_CG_SCALE) in TRM
+    type: boolean
+
+  nvidia,pwm-to-pmic:
+    description: Use PWM to control regulator rather than I2C
+    type: boolean
+
+  nvidia,i2c-fs-rate:
+    description: I2C full speed transfer rate when using I2C mode
+    $ref: /schemas/types.yaml#/definitions/uint32
+
+  nvidia,pwm-period-nanoseconds:
+    description: Period of PWM square wave in nanoseconds
+    $ref: /schemas/types.yaml#/definitions/uint32
+
+  nvidia,pwm-tristate-microvolts:
+    description: Regulator voltage in microvolts when PWM control is disabled
+    $ref: /schemas/types.yaml#/definitions/uint32
+
+  nvidia,pwm-min-microvolts:
+    description: Regulator voltage in microvolts when PWM control is enabled
+    $ref: /schemas/types.yaml#/definitions/uint32
+
+  nvidia,pwm-voltage-step-microvolts:
+    description: Voltage increase in microvolts per duty cycle increment
+    $ref: /schemas/types.yaml#/definitions/uint32
+
+  pinctrl-0:
+    description: I/O pad configuration when PWM control is enabled
+
+  pinctrl-1:
+    description: I/O pad configuration when PWM control is disabled
+
+  pinctrl-names:
+    items:
+      - const: dvfs_pwm_enable
+      - const: dvfs_pwm_disable
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - "#clock-cells"
+  - clocks
+  - clock-names
+  - clock-output-names
+  - resets
+  - reset-names
+  - vdd-cpu-supply
+  - nvidia,sample-rate
+  - nvidia,droop-ctrl
+  - nvidia,force-mode
+  - nvidia,cf
+  - nvidia,ci
+  - nvidia,cg
+
+dependencies:
+  nvidia,pwm-to-pmic:
+    - nvidia,pwm-min-microvolts
+    - nvidia,pwm-period-nanoseconds
+    - nvidia,pwm-tristate-microvolts
+    - nvidia,pwm-voltage-step-microvolts
+
+additionalProperties: false
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: nvidia,tegra124-dfll
+    then:
+      properties:
+        resets:
+          maxItems: 1
+
+        reset-names:
+          maxItems: 1
+    else:
+      properties:
+        resets:
+          minItems: 2
+
+        reset-names:
+          minItems: 2
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/reset/tegra124-car.h>
+    #include <dt-bindings/clock/tegra124-car-common.h>
+
+    clock@70110000 {
+        compatible = "nvidia,tegra124-dfll";
+        reg = <0x70110000 0x100>, /* DFLL control */
+              <0x70110000 0x100>, /* I2C output control */
+              <0x70110100 0x100>, /* Integrated I2C controller */
+              <0x70110200 0x100>; /* Look-up table RAM */
+        interrupts = <GIC_SPI 62 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&tegra_car TEGRA124_CLK_DFLL_SOC>,
+                 <&tegra_car TEGRA124_CLK_DFLL_REF>,
+                 <&tegra_car TEGRA124_CLK_I2C5>;
+        clock-names = "soc", "ref", "i2c";
+        resets = <&tegra_car TEGRA124_RST_DFLL_DVCO>;
+        reset-names = "dvco";
+        #clock-cells = <0>;
+        clock-output-names = "dfllCPU_out";
+        vdd-cpu-supply = <&reg_vdd_cpu>;
+
+        nvidia,sample-rate = <25000>;
+        nvidia,droop-ctrl = <0x00000f00>;
+        nvidia,force-mode = <1>;
+        nvidia,cf = <6>;
+        nvidia,ci = <0>;
+        nvidia,cg = <2>;
+
+        nvidia,pwm-min-microvolts = <708000>; /* 708mV */
+        nvidia,pwm-period-nanoseconds = <2500>; /* 2.5us */
+        nvidia,pwm-to-pmic;
+        nvidia,pwm-tristate-microvolts = <1000000>;
+        nvidia,pwm-voltage-step-microvolts = <19200>; /* 19.2mV */
+
+        pinctrl-names = "dvfs_pwm_enable", "dvfs_pwm_disable";
+        pinctrl-0 = <&dvfs_pwm_active_state>;
+        pinctrl-1 = <&dvfs_pwm_inactive_state>;
+    };
-- 
2.47.2

