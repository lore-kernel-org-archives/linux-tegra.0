Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6B84C0015E
	for <linux-tegra@archiver.kernel.org>; Tue, 25 Jul 2023 16:20:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230455AbjGYQUz (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 25 Jul 2023 12:20:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53426 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230248AbjGYQUy (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 25 Jul 2023 12:20:54 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 225DC11A;
        Tue, 25 Jul 2023 09:20:52 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-4f4b2bc1565so8858107e87.2;
        Tue, 25 Jul 2023 09:20:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690302050; x=1690906850;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZRPD9PbaDBSiBQOusi/8d/JpXsjgP4pKid7HWOnj6Qo=;
        b=REXGVT24NZwkXPkp7leMDPsRBF8xRhYUbahTx4Omz4jtuoNwZTgmfAko98sj19McS7
         dWxbNaNSEXRyZfXGH03aV4DnCWR2Zbv7RxDaCCGl0QKOoBvICE+tvG6VMgI1oBV1Osef
         7UpZVnOPkcxYd/laLT+oQGOjLgkst1gPZMGS34sWftlWdxAw3aZSkjAd5zwofkxVtCnn
         6SW9Or7nNyM4CAXLHtbDR6HWUE9Apxj83GjyBEKkN1kZonQSjUfi9YxiGPRoQW/3KOUh
         ECnSScLMBij451A8hQ9xGyIFn3BdOr0ya5eu/xG8fU9i81BMWa+0n1Gf737sa2OWfZQL
         rF/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690302050; x=1690906850;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZRPD9PbaDBSiBQOusi/8d/JpXsjgP4pKid7HWOnj6Qo=;
        b=NHkKjAQ+zNiLvqZ+OAaABTyWYVF91hISciR3cUh/5JcvdhM+u6Jg/aNdQeNfJ+LPh4
         f6jIdAltMViQ/OJjKCJ9EdblKJiozOyq6mlPRJ8Ht1scFAlvnyyqJxeX9FMMCVL/uRoU
         g7zQY/2Th5y96XQ/9q4DwZEJl/ISb4sGwcZYFsfTzZvSUU0Cum228BsumHZJ331t+mB0
         GhVCh4rY1BmUUeL8hWq+8lQKwO69ycYGcz+NgoQPdseU23imMGQH1jN9IPlkClnG+oUW
         MPExUicP7693N9tgE+A4LJko3N+UjTBsSZLubThskmz7E+xp1yppjvekPHmUZDjaXVmr
         EURg==
X-Gm-Message-State: ABy/qLY6r4WOmKbzYYcnBdrYr0wmX9T0dyBsuxRVCMnST7ut6Ylc40fq
        LvKcg8x49+kvFHeoIxmYrLBLM1tecms=
X-Google-Smtp-Source: APBJJlFgQKgpN8R3Jr0Z3/6qO3p4qZXxihjuvuNGadLpY8EQ6hTEiNeQDXMDry6vh+8L58xtZ1JIhQ==
X-Received: by 2002:a19:790e:0:b0:4f7:6b72:3323 with SMTP id u14-20020a19790e000000b004f76b723323mr6972030lfc.55.1690302049949;
        Tue, 25 Jul 2023 09:20:49 -0700 (PDT)
Received: from localhost (p200300e41f1bd600f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f1b:d600:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id fy17-20020a170906b7d100b009931a3adf64sm8569582ejb.17.2023.07.25.09.20.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jul 2023 09:20:49 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Jon Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: [PATCH v3] dt-bindings: clock: tegra124-dfll: Convert to json-schema
Date:   Tue, 25 Jul 2023 18:20:46 +0200
Message-ID: <20230725162046.1426970-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Convert the Tegra124 (and later) DFLL bindings from the free-form text
format to json-schema.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
Changes in v3:
- license under GPL-2.0-only OR BSD-2-Clause
- add constraints for vendor properties

Changes in v2:
- should now validate properly because pinmux bindings have been merged

 .../bindings/clock/nvidia,tegra124-dfll.txt   | 155 ---------
 .../bindings/clock/nvidia,tegra124-dfll.yaml  | 293 ++++++++++++++++++
 2 files changed, 293 insertions(+), 155 deletions(-)
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
index 000000000000..21960941c8eb
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/nvidia,tegra124-dfll.yaml
@@ -0,0 +1,293 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/nvidia,tegra124-dfll.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NVIDIA Tegra124 (and later) DFLL FCPU clocksource
+
+maintainers:
+  - Thierry Reding <thierry.reding@gmail.com>
+  - Jon Hunter <jonathanh@nvidia.com>
+
+description:
+  The DFLL IP block on Tegra is a root clocksource designed for clocking
+  the fast CPU cluster. It consists of a free-running voltage controlled
+  oscillator connected to the CPU voltage rail (VDD_CPU), and a closed
+  loop control module that will automatically adjust the VDD_CPU voltage
+  by communicating with an off-chip PMIC either via an I2C bus or via
+  PWM signals.
+
+properties:
+  compatible:
+    enum:
+      - nvidia,tegra124-dfll
+      - nvidia,tegra210-dfll
+
+  reg:
+    items:
+      - description: DFLL control logic
+      - description: I2C output logic
+      - description: integrated I2C controller
+      - description: look-up table RAM for voltage register values
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: clock source for the DFLL control logic
+      - description: closed loop reference clock
+      - description: clock source for the integrated I2C controller
+
+  clock-names:
+    items:
+      - const: soc
+      - const: ref
+      - const: i2c
+
+  resets:
+    minItems: 1
+    maxItems: 2
+
+  reset-names:
+    minItems: 1
+    maxItems: 2
+
+  "#clock-cells":
+    const: 0
+
+  clock-output-names:
+    description: name of the clock output
+
+  vdd-cpu-supply:
+    description: Regulator for the CPU voltage rail that the DFLL
+      hardware will start controlling. The regulator will be queried for
+      the I2C register, control values and supported voltages.
+
+  nvidia,sample-rate:
+    description: Sample rate of the DFLL control loop.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 12500
+    maximum: 25000
+
+  nvidia,droop-ctrl:
+    description: See the register CL_DVFS_DROOP_CTRL in the TRM.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum:
+      - 0x00000f00
+
+  nvidia,force-mode:
+    description: See the field DFLL_PARAMS_FORCE_MODE in the TRM.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [ 0, 1, 2, 3 ]
+
+  nvidia,cf:
+    description: Numeric value, see the field DFLL_PARAMS_CF_PARAM in the TRM.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 0
+    maximum: 63
+
+  nvidia,ci:
+    description: Numeric value, see the field DFLL_PARAMS_CI_PARAM in the TRM.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 0
+    maximum: 7
+
+  nvidia,cg:
+    description: Numeric value, see the field DFLL_PARAMS_CG_PARAM in the TRM.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 0
+    maximum: 255
+
+  # optional properties
+  nvidia,cg-scale:
+    description: Boolean value, see the field DFLL_PARAMS_CG_SCALE in the TRM.
+    $ref: /schemas/types.yaml#/definitions/flag
+
+  nvidia,pwm-to-pmic:
+    description: Use PWM to control regulator rather then I2C.
+    $ref: /schemas/types.yaml#/definitions/flag
+
+  nvidia,i2c-fs-rate:
+    description: I2C transfer rate, if using full speed mode.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [ 100000, 400000 ]
+
+  # required properties for PWM mode
+  nvidia,pwm-period-nanoseconds:
+    description: period of PWM square wave in nanoseconds.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 1000
+    maximum: 1000000000
+
+  nvidia,pwm-tristate-microvolts:
+    description: Regulator voltage in micro volts when PWM control is
+      disabled and the PWM output is tristated. Note that this voltage
+      is configured in hardware, typically via a resistor divider.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 0
+    maximum: 3300000
+
+  nvidia,pwm-min-microvolts:
+    description: Regulator voltage in micro volts when PWM control is
+      enabled and PWM output is low. Hence, this is the minimum output
+      voltage that the regulator supports when PWM control is enabled.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 0
+    maximum: 3300000
+
+  nvidia,pwm-voltage-step-microvolts:
+    description: |
+      Voltage increase in micro volts corresponding to a 1/33th increase
+      in duty cycle. Eg the voltage for 2/33th duty cycle would be:
+
+        nvidia,pwm-min-microvolts + nvidia,pwm-voltage-step-microvolts * 2
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 0
+    maximum: 1000000
+
+  pinctrl-names:
+    items:
+      # I/O pad configuration when PWM control is enabled
+      - const: dvfs_pwm_enable
+      # I/O pad configuration when PWM control is disabled
+      - const: dvfs_pwm_disable
+
+  pinctrl-0: true
+  pinctrl-1: true
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
+          items:
+            - description: DFLL DVCO reset
+
+        reset-names:
+          items:
+            - const: dvco
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: nvidia,tegra210-dfll
+    then:
+      properties:
+        resets:
+          items:
+            - description: DFLL DVCO reset
+            - description: DFLL reset
+
+        reset-names:
+          items:
+            - const: dvco
+            - const: dfll
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/tegra124-car.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/pinctrl/pinctrl-tegra.h>
+    #include <dt-bindings/reset/tegra124-car.h>
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
+        vdd-cpu-supply = <&vdd_cpu>;
+
+        nvidia,sample-rate = <12500>;
+        nvidia,droop-ctrl = <0x00000f00>;
+        nvidia,force-mode = <1>;
+        nvidia,cf = <10>;
+        nvidia,ci = <0>;
+        nvidia,cg = <2>;
+
+        nvidia,i2c-fs-rate = <400000>;
+    };
+
+  - |
+    #include <dt-bindings/clock/tegra210-car.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/pinctrl/pinctrl-tegra.h>
+    #include <dt-bindings/reset/tegra210-car.h>
+
+    clock@70110000 {
+        compatible = "nvidia,tegra210-dfll";
+        reg = <0x70110000 0x100>, /* DFLL control */
+              <0x70110000 0x100>, /* I2C output control */
+              <0x70110100 0x100>, /* Integrated I2C controller */
+              <0x70110200 0x100>; /* Look-up table RAM */
+        interrupts = <GIC_SPI 62 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&tegra_car TEGRA210_CLK_DFLL_SOC>,
+                 <&tegra_car TEGRA210_CLK_DFLL_REF>,
+                 <&tegra_car TEGRA210_CLK_I2C5>;
+        clock-names = "soc", "ref", "i2c";
+        resets = <&tegra_car TEGRA210_RST_DFLL_DVCO>,
+                 <&tegra_car 155>;
+        reset-names = "dvco", "dfll";
+        #clock-cells = <0>;
+        clock-output-names = "dfllCPU_out";
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
+
+    /*
+     * pinmux nodes added for completeness. Binding doc can be found in:
+     * Documentation/devicetree/bindings/pinctrl/nvidia,tegra210-pinmux.yaml
+     */
+
+    pinmux: pinmux@700008d4 {
+        compatible = "nvidia,tegra210-pinmux";
+        reg = <0x700008d4 0x29c>, /* Pad control registers */
+              <0x70003000 0x294>; /* Mux registers */
+
+        dvfs_pwm_active_state: pinmux-dvfs-pwm-active {
+            dvfs_pwm_pbb1 {
+                nvidia,pins = "dvfs_pwm_pbb1";
+                nvidia,tristate = <TEGRA_PIN_DISABLE>;
+            };
+        };
+
+        dvfs_pwm_inactive_state: pinmux-dvfs-pwm-inactive {
+            dvfs_pwm_pbb1 {
+                nvidia,pins = "dvfs_pwm_pbb1";
+                nvidia,tristate = <TEGRA_PIN_ENABLE>;
+            };
+        };
+    };
-- 
2.41.0

