Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98BB04BD36E;
	Mon, 28 Sep 2026 16:24:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790612700; cv=none; b=fWe62Twcs6QEBU5Omz3pDCtnoMdNOh18wMlP6N8v7g1ef7dWZ/eCC+1PQVY/CNSixKhnhFg9paq44GwOrWxrgDuTfGLyoLb6DGWU5SJUeZftLd8jNzQFrNiEuFxTVyczWapP6JLV4h8CPFNIhgL0c8AXn/E6a8Eq3v+5Hf3vhtA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790612700; c=relaxed/simple;
	bh=EqajWGWzBlIntS+aozeogxW6U8hdLVnpwqc9sdw63zw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dTkSCDdKcZ75FWD4kB9v1cqYO6Xs/aahIL6TQCdF92Q73HI4gPd+Y8r9uF8j7ZmJUOLdYrNpmP2ljGiGjudAnZh/6VM8JAr116x5dU6VINA1SIsEDqP3VGMs79Zf5tT8LqqQ86e12E10NiiKk3TnZnrBz46MhZCMrC6chuqo4Oc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DyjWP7zi; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DyjWP7zi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA9EF1F000FF;
	Mon, 28 Sep 2026 16:24:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790612698;
	bh=ZlWdaUCtLtFv97fFFfLczxM70wIt9Df9wzLAdBRKHFM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=DyjWP7ziejapSx+n8EEbMsDxdLPk+Mb5gH1AlLiJfhqas6iLJORRpKuZaa83xiyn+
	 snUb+r19AsKW786oHyxH1Lu/ZEPvI3KKU9sKs+A7A4i81skQc11CdgYUyeIefpST7U
	 IdTGVjWmwr7tVrdA2zyYA1GBlD2klRP4j+r5Dqgpe6tugEcNOXIgPUgbDpSUSzDUoe
	 MEGZCFmpVdimiNEiFkB08bRUW/Qr8I2W6o9P5CrCLFuGMW4HIFG8Ta7DIRqw6APqm1
	 vtVu0dVbiOXfmExrDg0bKmgmJBm0nyPh35awbpZJUHRivMJAld9VbVmU/jCL0XRNYm
	 tVDrPjiwVg1Cw==
From: Thierry Reding <thierry.reding@kernel.org>
Date: Mon, 28 Sep 2026 18:24:40 +0200
Subject: [PATCH 1/2] dt-bindings: mfd: as3722: Convert to json-schema
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260928-as3722-bindings-v1-1-35f423a9f2b2@nvidia.com>
References: <20260928-as3722-bindings-v1-0-35f423a9f2b2@nvidia.com>
In-Reply-To: <20260928-as3722-bindings-v1-0-35f423a9f2b2@nvidia.com>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, Laxman Dewangan <ldewangan@nvidia.com>, 
 Thierry Reding <thierry.reding@kernel.org>, 
 Jonathan Hunter <jonathanh@nvidia.com>
Cc: mfd@lists.linux.dev, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>, 
 linux-sound@vger.kernel.org, linux-tegra@vger.kernel.org, 
 Thierry Reding <treding@nvidia.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=20721; i=treding@nvidia.com;
 h=from:subject:message-id; bh=dtTDOOnlMDV3aHALbPSHHDIkL1iiYYsNYnKO0MmVmNk=;
 b=owEBbQKS/ZANAwAKAd0jrNd/PrOhAcsmYgBqupTUXtiWz/jdJxCSJSDqYxrMQigAuKZkLZNyS
 hgKtAEA9FeJAjMEAAEKAB0WIQSI6sMIAUnM98CNyJ/dI6zXfz6zoQUCarqU1AAKCRDdI6zXfz6z
 oZCID/9mq1Vmil4hy0/sWBGmHBka++RZnYcsfHUeVCtKQ4294KWGiKmDHM3vcgjmPnKwELfgWEK
 S9sncj2YXwuhzXJYUkFBt1Iqy4DKOInjpy/HP981eIXQ+YaciL3JUL1zZUT0eZ6F/qzl/eMnQoi
 dbbJmaojohfj711eg055X/ME9VLhkWmg/5lIKrAQCGLj3fn5tCl7y0iTX7Fis4a1ohhzLJSiYOH
 Qgfwgu3sz61i3EiSUYFVcg70wRsEw4cOXeal0pX33R17LuA7v778nmHmgVH0X8DYAviqrTuGjDO
 r8QYsaKAo3rU2D8mAh+bCXcXAK+Bui3ZvDT0oUyWmSGfoJMQeJHYGwLY230AP11iLwNShFibbDo
 O4Tkv/8vbFtDs5b0M95MZPJqz+dzKeop3VSYQMOiBr9Gg6pTIX8wyEWIde0noSApXRmpQerxHHU
 ItyRxqGyFifn0P+oylmz4Q7BUOWqShvebFRDeIlwF3F/dqhlzx8tcyrNXd6iIGyIxDqc1QWvy+k
 yv/tNsQgrGsJeJ+9fB3i0SPQlAr8y6hyw04mmVoUUhWtS+AsWQs5qSJI1UzL5XPuFVjQmV2H4ST
 X5eLONp9kd3UoUOSsUN35rnTp3j3/rT8gDEa1CL1xmTHqhWAR+rcurBPx05eoEP1oxC0khiAHGj
 14FQ1cflr17F9VA==
X-Developer-Key: i=treding@nvidia.com; a=openpgp;
 fpr=88EAC3080149CCF7C08DC89FDD23ACD77F3EB3A1

From: Thierry Reding <treding@nvidia.com>

Convert the AMS AS3722 PMIC bindings from the free-form text format to
json-schema.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 .../devicetree/bindings/mfd/ams,as3722.yaml        | 276 +++++++++++++++++++++
 Documentation/devicetree/bindings/mfd/as3722.txt   | 214 ----------------
 .../bindings/regulator/as3722-regulator.txt        |  91 -------
 3 files changed, 276 insertions(+), 305 deletions(-)

diff --git a/Documentation/devicetree/bindings/mfd/ams,as3722.yaml b/Documentation/devicetree/bindings/mfd/ams,as3722.yaml
new file mode 100644
index 000000000000..6a6444500396
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/ams,as3722.yaml
@@ -0,0 +1,276 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mfd/ams,as3722.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: AMS AS3722 Power Management IC
+
+maintainers:
+  - Laxman Dewangan <ldewangan@nvidia.com>
+  - Lee Jones <lee.jones@linaro.org>
+
+properties:
+  compatible:
+    const: ams,as3722
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  # standard properties
+  interrupt-controller:
+    description: The AS3722 has an internal interrupt controller which takes
+      the interrupt request from internal sub-blocks like RTC, regulators,
+      GPIOs as well as external input.
+
+  "#interrupt-cells":
+    description: The first cell is the IRQ number. IRQ numbers for different
+      interrupt source of AS3722 are defined at dt-bindings/mfd/as3722.h The
+      second cell is the flags, encoded as the trigger masks from binding
+      document interrupts.txt, using dt-bindings/irq.
+    const: 2
+
+  # from gpio.yaml
+  gpio-controller: true
+  "#gpio-cells": true
+
+  # optional properties
+  ams,enable-internal-int-pullup:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description: Boolean property, to enable internal pullup on interrupt pin.
+      Omitting this will disable internal pullup on INT pin.
+
+  ams,enable-internal-i2c-pullup:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description: Boolean property, to enable internal pullup on I2C SCL/SDA
+      pins. Omitting this will disable internal pullup on I2C SCL/SDA lines.
+
+  ams,enable-ac-ok-power-on:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description: Boolean property, to enable exit out of power off mode with
+      AC_OK pin (pin enabled in power off mode).
+
+  ams,system-power-controller:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description: The AS3722 supports the system power off by turning off all
+      its rails. The device node should contain this boolean property to
+      enable this functionality.
+
+  pinmux:
+    type: object
+    description: |
+      Device has 8 GPIO pins which can be configured as GPIO as well as the
+      special IO functions.
+
+      Please refer to pinctrl-bindings.txt in this directory for details of
+      the common pinctrl bindings used by client devices, including the
+      meaning of the phrase "pin configuration node".
+
+    patternProperties:
+      "^gpio[0-7_]+$":
+        description: |
+          Child nodes of the pinmux node represent some desired configuration
+          for a list of pins. This configuration can include the mux function
+          to select on those pin(s), and various pin configuration parameters,
+          such as pull-up, open drain.
+        type: object
+        properties:
+          pins:
+            $ref: /schemas/types.yaml#/definitions/string-array
+            description: List of pins for this configuration group.
+            items:
+              enum: [ gpio0, gpio1, gpio2, gpio3, gpio4, gpio5, gpio6, gpio7 ]
+
+          function:
+            $ref: /schemas/types.yaml#/definitions/string
+            description: Function configuration for this configuration group.
+            enum: [ gpio, interrupt-out, gpio-in-interrupt,
+                    vsup-vbat-low-undebounce-out, vsup-vbat-low-debounce-out,
+                    voltage-in-standby, oc-pg-sd0, oc-pg-sd6, powergood-out,
+                    pwm-in, pwm-out, clk32k-out, watchdog-in, soft-reset-in ]
+
+          bias-disable:
+            $ref: /schemas/types.yaml#/definitions/flag
+
+          bias-pull-up:
+            $ref: /schemas/types.yaml#/definitions/flag
+
+          bias-pull-down:
+            $ref: /schemas/types.yaml#/definitions/flag
+
+          bias-high-impedance:
+            $ref: /schemas/types.yaml#/definitions/flag
+
+          drive-open-drain:
+            $ref: /schemas/types.yaml#/definitions/flag
+
+        additionalProperties: false
+
+        required:
+          - pins
+
+  regulators:
+    type: object
+    description: Device has multiple DCDC and LDOs. The node "regulators" is
+      required if regulator functionality is needed.
+
+    properties:
+      vsup-sd2-supply:
+        description: input supply for SD2
+
+      vsup-sd3-supply:
+        description: input supply for SD3
+
+      vsup-sd4-supply:
+        description: input supply for SD4
+
+      vsup-sd5-supply:
+        description: input supply for SD5
+
+      vin-ldo0-supply:
+        description: input supply for LDO0
+
+      vin-ldo1-6-supply:
+        description: input supply for LDO1 and LDO6
+
+      vin-ldo2-5-7-supply:
+        description: input supply for LDO2, LDO5 and LDO7
+
+      vin-ldo3-4-supply:
+        description: input supply for LDO3 and LDO4
+
+      vin-ldo9-10-supply:
+        description: input supply for LDO9 and LDO10
+
+      vin-ldo11-supply:
+        description: input supply for LDO11
+
+    patternProperties:
+      "^(sd[0-6]|ldo[0-7]|ldo9|ldo10|ldo11)$":
+        type: object
+        description: These sub-nodes must be named after one of the regulators
+          found on the AS3277. Each sub-node should contain the constraints and
+          initialization information for that regulator.
+
+        properties:
+          ams,ext-control:
+            $ref: /schemas/types.yaml#/definitions/uint32
+            description: External control of the rail. The value of this
+              property will tell which external input is controlling this rail.
+              Valid values are 0, 1, 2 ad 3. If this property does not exist,
+              the default value is 0. The external control pin macros are
+              defined in dt-bindings/mfd/as3722.h.
+            oneOf:
+              - description: there is no external control of this rail
+                const: 0
+              - description: rail is controlled by ENABLE1 input pin
+                const: 1
+              - description: rail is controlled by ENABLE2 input pin
+                const: 2
+              - description: rail is controlled by ENABLE3 input pin
+                const: 3
+            default: 0
+
+          ams,enable-tracking:
+            $ref: /schemas/types.yaml#/definitions/flag
+            description: Enable tracking with SD1, only supported by LDO3.
+
+additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - interrupt-controller
+  - "#interrupt-cells"
+
+allOf:
+  - $ref: /schemas/gpio/gpio.yaml
+
+examples:
+  - |
+    #include <dt-bindings/mfd/as3722.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        pmic@48 {
+            compatible = "ams,as3722";
+            reg = <0x48>;
+
+            ams,system-power-controller;
+
+            interrupt-parent = <&intc>;
+            interrupt-controller;
+            #interrupt-cells = <2>;
+
+            gpio-controller;
+            #gpio-cells = <2>;
+
+            pinctrl-names = "default";
+            pinctrl-0 = <&as3722_default>;
+
+            as3722_default: pinmux {
+                gpio0 {
+                    pins = "gpio0";
+                    function = "gpio";
+                    bias-pull-down;
+                };
+
+                gpio1_2_4_7 {
+                    pins = "gpio1", "gpio2", "gpio4", "gpio7";
+                    function = "gpio";
+                    bias-pull-up;
+                };
+
+                gpio5 {
+                    pins = "gpio5";
+                    function = "clk32k-out";
+                };
+            };
+
+            regulators {
+                vsup-sd2-supply = <&vdd_5v0_sys>;
+
+                sd0 {
+                    regulator-name = "vdd_cpu";
+                    regulator-min-microvolt = <700000>;
+                    regulator-max-microvolt = <1400000>;
+                    regulator-always-on;
+                    ams,ext-control = <2>;
+                };
+
+                sd1 {
+                    regulator-name = "vdd_core";
+                    regulator-min-microvolt = <700000>;
+                    regulator-max-microvolt = <1400000>;
+                    regulator-always-on;
+                    ams,ext-control = <1>;
+                };
+
+                sd2 {
+                    regulator-name = "vddio_ddr";
+                    regulator-min-microvolt = <1350000>;
+                    regulator-max-microvolt = <1350000>;
+                    regulator-always-on;
+                };
+
+                sd4 {
+                    regulator-name = "avdd-hdmi-pex";
+                    regulator-min-microvolt = <1050000>;
+                    regulator-max-microvolt = <1050000>;
+                    regulator-always-on;
+                };
+
+                sd5 {
+                    regulator-name = "vdd-1v8";
+                    regulator-min-microvolt = <1800000>;
+                    regulator-max-microvolt = <1800000>;
+                    regulator-always-on;
+                };
+            };
+        };
+    };
diff --git a/Documentation/devicetree/bindings/mfd/as3722.txt b/Documentation/devicetree/bindings/mfd/as3722.txt
deleted file mode 100644
index 2a665741d7fe..000000000000
--- a/Documentation/devicetree/bindings/mfd/as3722.txt
+++ /dev/null
@@ -1,214 +0,0 @@
-* ams AS3722 Power management IC.
-
-Required properties:
--------------------
-- compatible: Must be "ams,as3722".
-- reg: I2C device address.
-- interrupt-controller: AS3722 has internal interrupt controller which takes the
-  interrupt request from internal sub-blocks like RTC, regulators, GPIOs as well
-  as external input.
-- #interrupt-cells: Should be set to 2 for IRQ number and flags.
-  The first cell is the IRQ number. IRQ numbers for different interrupt source
-  of AS3722 are defined at dt-bindings/mfd/as3722.h
-  The second cell is the flags, encoded as the trigger masks from binding document
-	interrupts.txt, using dt-bindings/irq.
-
-Optional properties:
---------------------
-- ams,enable-internal-int-pullup: Boolean property, to enable internal pullup on
-	interrupt pin. Missing this will disable internal pullup on INT pin.
-- ams,enable-internal-i2c-pullup: Boolean property, to enable internal pullup on
-	i2c scl/sda pins. Missing this will disable internal pullup on i2c
-	scl/sda lines.
-- ams,enable-ac-ok-power-on: Boolean property, to enable exit out of power off
-	mode with AC_OK pin (pin enabled in power off mode).
-
-Optional submodule and their properties:
-=======================================
-
-Pinmux and GPIO:
-===============
-Device has 8 GPIO pins which can be configured as GPIO as well as the special IO
-functions.
-
-Please refer to pinctrl-bindings.txt in this directory for details of the
-common pinctrl bindings used by client devices, including the meaning of the
-phrase "pin configuration node".
-
-Following are properties which is needed if GPIO and pinmux functionality
-is required:
-    Required properties:
-    -------------------
-	- gpio-controller: Marks the device node as a GPIO controller.
-	- #gpio-cells: Number of GPIO cells. Refer to binding document
-			gpio/gpio.txt
-
-    Optional properties:
-    --------------------
-	Following properties are require if pin control setting is required
-	at boot.
-	- pinctrl-names: A pinctrl state named "default" be defined, using the
-		bindings in pinctrl/pinctrl-bindings.txt.
-	- pinctrl[0...n]: Properties to contain the phandle that refer to
-		different nodes of pin control settings. These nodes represents
-		the pin control setting of state 0 to state n. Each of these
-		nodes contains different subnodes to represents some desired
-		configuration for a list of pins. This configuration can
-		include the mux function to select on those pin(s), and
-		various pin configuration parameters, such as pull-up,
-		open drain.
-
-		Each subnode have following properties:
-		Required properties:
-		    - pins: List of pins. Valid values of pins properties are:
-				gpio0, gpio1, gpio2, gpio3, gpio4, gpio5,
-				gpio6, gpio7
-
-		Optional properties:
-			function, bias-disable, bias-pull-up, bias-pull-down,
-			bias-high-impedance, drive-open-drain.
-
-			Valid values for function properties are:
-				gpio, interrupt-out, gpio-in-interrupt,
-				vsup-vbat-low-undebounce-out,
-				vsup-vbat-low-debounce-out,
-				voltage-in-standby, oc-pg-sd0, oc-pg-sd6,
-				powergood-out, pwm-in, pwm-out, clk32k-out,
-				watchdog-in, soft-reset-in
-
-Regulators:
-===========
-Device has multiple DCDC and LDOs. The node "regulators" is require if regulator
-functionality is needed.
-
-Following are properties of regulator subnode.
-
-    Optional properties:
-    -------------------
-	The input supply of regulators are the optional properties on the
-	regulator node. The input supply of these regulators are provided
-	through following properties:
-		vsup-sd2-supply: Input supply for SD2.
-		vsup-sd3-supply: Input supply for SD3.
-		vsup-sd4-supply: Input supply for SD4.
-		vsup-sd5-supply: Input supply for SD5.
-		vin-ldo0-supply: Input supply for LDO0.
-		vin-ldo1-6-supply: Input supply for LDO1 and LDO6.
-		vin-ldo2-5-7-supply: Input supply for LDO2, LDO5 and LDO7.
-		vin-ldo3-4-supply: Input supply for LDO3 and LDO4.
-		vin-ldo9-10-supply: Input supply for LDO9 and LDO10.
-		vin-ldo11-supply: Input supply for LDO11.
-
-    Optional sub nodes for regulators:
-    ---------------------------------
-	The subnodes name is the name of regulator and it must be one of:
-	sd[0-6], ldo[0-7], ldo[9-11]
-
-	Each sub-node should contain the constraints and initialization
-	information for that regulator. See regulator.txt for a description
-	of standard properties for these sub-nodes.
-	Additional optional custom properties  are listed below.
-		ams,ext-control: External control of the rail. The option of
-			this properties will tell which external input is
-			controlling this rail. Valid values are 0, 1, 2 ad 3.
-			0: There is no external control of this rail.
-			1: Rail is controlled by ENABLE1 input pin.
-			2: Rail is controlled by ENABLE2 input pin.
-			3: Rail is controlled by ENABLE3 input pin.
-			Missing this property on DT will be assume as no
-			external control. The external control pin macros
-			are defined @dt-bindings/mfd/as3722.h
-
-		ams,enable-tracking: Enable tracking with SD1, only supported
-			by LDO3.
-
-Power-off:
-=========
-AS3722 supports the system power off by turning off all its rails.
-The device node should have the following properties to enable this
-functionality
-ams,system-power-controller: Boolean, to enable the power off functionality
-        through this device.
-
-Example:
---------
-#include <dt-bindings/mfd/as3722.h>
-...
-ams3722 {
-	compatible = "ams,as3722";
-	reg = <0x48>;
-
-	ams,system-power-controller;
-
-	interrupt-parent = <&intc>;
-	interrupt-controller;
-	#interrupt-cells = <2>;
-
-	gpio-controller;
-	#gpio-cells = <2>;
-
-	pinctrl-names = "default";
-	pinctrl-0 = <&as3722_default>;
-
-	as3722_default: pinmux {
-			gpio0 {
-				pins = "gpio0";
-				function = "gpio";
-				bias-pull-down;
-			};
-
-			gpio1_2_4_7 {
-				pins = "gpio1", "gpio2", "gpio4", "gpio7";
-				function = "gpio";
-				bias-pull-up;
-			};
-
-			gpio5 {
-				pins = "gpio5";
-				function = "clk32k_out";
-			};
-	}
-
-	regulators {
-			vsup-sd2-supply = <...>;
-			...
-
-			sd0 {
-				regulator-name = "vdd_cpu";
-				regulator-min-microvolt = <700000>;
-				regulator-max-microvolt = <1400000>;
-				regulator-always-on;
-				ams,ext-control = <2>;
-			};
-
-			sd1 {
-				regulator-name = "vdd_core";
-				regulator-min-microvolt = <700000>;
-				regulator-max-microvolt = <1400000>;
-				regulator-always-on;
-				ams,ext-control = <1>;
-			};
-
-			sd2 {
-				regulator-name = "vddio_ddr";
-				regulator-min-microvolt = <1350000>;
-				regulator-max-microvolt = <1350000>;
-				regulator-always-on;
-			};
-
-			sd4 {
-				regulator-name = "avdd-hdmi-pex";
-				regulator-min-microvolt = <1050000>;
-				regulator-max-microvolt = <1050000>;
-				regulator-always-on;
-			};
-
-			sd5 {
-				regulator-name = "vdd-1v8";
-				regulator-min-microvolt = <1800000>;
-				regulator-max-microvolt = <1800000>;
-				regulator-always-on;
-			};
-			....
-	};
-};
diff --git a/Documentation/devicetree/bindings/regulator/as3722-regulator.txt b/Documentation/devicetree/bindings/regulator/as3722-regulator.txt
deleted file mode 100644
index caad0c8a258d..000000000000
--- a/Documentation/devicetree/bindings/regulator/as3722-regulator.txt
+++ /dev/null
@@ -1,91 +0,0 @@
-Regulator of AMS AS3722 PMIC.
-Name of the regulator subnode must be "regulators".
-
-Optional properties:
---------------------
-The input supply of regulators are the optional properties on the
-regulator node. The AS3722 is having 7 DCDC step-down regulators as
-sd[0-6], 10 LDOs as ldo[0-7], ldo[9-11]. The input supply of these
-regulators are provided through following properties:
-vsup-sd2-supply: Input supply for SD2.
-vsup-sd3-supply: Input supply for SD3.
-vsup-sd4-supply: Input supply for SD4.
-vsup-sd5-supply: Input supply for SD5.
-vin-ldo0-supply: Input supply for LDO0.
-vin-ldo1-6-supply: Input supply for LDO1 and LDO6.
-vin-ldo2-5-7-supply: Input supply for LDO2, LDO5 and LDO7.
-vin-ldo3-4-supply: Input supply for LDO3 and LDO4.
-vin-ldo9-10-supply: Input supply for LDO9 and LDO10.
-vin-ldo11-supply: Input supply for LDO11.
-
-Optional nodes:
---------------
-- regulators : Must contain a sub-node per regulator from the list below.
-	       Each sub-node should contain the constraints and initialization
-	       information for that regulator. See regulator.txt for a
-	       description of standard properties for these sub-nodes.
-	       Additional custom properties  are listed below.
-	       sd[0-6], ldo[0-7], ldo[9-11].
-
-	       Optional sub-node properties:
-	       ----------------------------
-		ams,ext-control: External control of the rail. The option of
-			this properties will tell which external input is
-			controlling this rail. Valid values are 0, 1, 2 ad 3.
-			0: There is no external control of this rail.
-			1: Rail is controlled by ENABLE1 input pin.
-			2: Rail is controlled by ENABLE2 input pin.
-			3: Rail is controlled by ENABLE3 input pin.
-		ams,enable-tracking: Enable tracking with SD1, only supported
-			by LDO3.
-
-Example:
--------
-	ams3722: ams3722 {
-		compatible = "ams,as3722";
-		reg = <0x40>;
-		...
-
-		regulators {
-			vsup-sd2-supply = <...>;
-			...
-
-			sd0 {
-				regulator-name = "vdd_cpu";
-				regulator-min-microvolt = <700000>;
-				regulator-max-microvolt = <1400000>;
-				regulator-always-on;
-				ams,ext-control = <2>;
-			};
-
-			sd1 {
-				regulator-name = "vdd_core";
-				regulator-min-microvolt = <700000>;
-				regulator-max-microvolt = <1400000>;
-				regulator-always-on;
-				ams,ext-control = <1>;
-			};
-
-			sd2 {
-				regulator-name = "vddio_ddr";
-				regulator-min-microvolt = <1350000>;
-				regulator-max-microvolt = <1350000>;
-				regulator-always-on;
-			};
-
-			sd4 {
-				regulator-name = "avdd-hdmi-pex";
-				regulator-min-microvolt = <1050000>;
-				regulator-max-microvolt = <1050000>;
-				regulator-always-on;
-			};
-
-			sd5 {
-				regulator-name = "vdd-1v8";
-				regulator-min-microvolt = <1800000>;
-				regulator-max-microvolt = <1800000>;
-				regulator-always-on;
-			};
-			....
-		};
-	};

-- 
2.55.0

