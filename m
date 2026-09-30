Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 508954E36F5;
	Wed, 30 Sep 2026 14:01:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790776915; cv=none; b=YG/exkYC9LoxhOg7xucZleHxgN39j0AL9c5M5Bp04DUiv9te5QSaClZa0EJZzd+J0EmCylpRwAkkGOQp5hKifuvWKGptDvvZ/VWj9CTwD9GNYUUP1FpTqT8RYnk8WOCnB5+t7SFl8On7iDO6kJxaMMxENG5VxI0nLSGo9Jju2UQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790776915; c=relaxed/simple;
	bh=dST97r3LAEaw/PyflLWS5Q9+HD1zA7kN1XtKOCgeuXs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=V+WNMI72dKlyMytlRWtCC8ijSGBUFm7nUYwPCW34ezDGi4nErgYypA+IP5Dqx3rIbed5OdgYJ/Ik5TVfFqXRjw6IrASWocmw1EIX+TrkV0UNyxRFl1pUlio8z/r/OIJQxYbW1/xgc6NjHMrooF94ArlDFMbchhAKy15uwII3DV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=htCY9Rq9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="htCY9Rq9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A66F31F00899;
	Wed, 30 Sep 2026 14:01:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790776898;
	bh=DU6bdit+raxlYp4VgYHrPLaGpqqt4jAicr7hgcaMNYc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=htCY9Rq90mMYws9Hep8nUSWNtgDCxND05gNFqBGiOyF9ZOF1M1Kf8MjWNcFvE4+ke
	 Sfw4gYbj7SgiJftoyV9kuy5VXI5oDEtP2venTVKqkh+vcMYceAdSgrzS+qJnIBA6y9
	 djXSjfzDUsoS6w0hrjAr02+7Wjcuw9AwkR7Ndjibu+zKcTph1rGpH/IlKKKKKDdOdy
	 Mgv0Xe4ZAeCECgMxqfWnl6IqCNMOt2D76tYfR76Td4v2mNOhLCuHxxE+dKjO6G7+3y
	 ft0S2HUNttiZsVSOi3AQOj8X1QY+gZ5JOt8ue/m4UG5SQqvKhthG+3ICOqIC4U/BjY
	 XF3Q+hzdmchzQ==
From: Thierry Reding <thierry.reding@kernel.org>
Date: Wed, 30 Sep 2026 16:01:23 +0200
Subject: [PATCH v2 1/3] dt-bindings: mfd: as3722: Convert to json-schema
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260930-as3722-bindings-v2-1-a3bba649ebf9@nvidia.com>
References: <20260930-as3722-bindings-v2-0-a3bba649ebf9@nvidia.com>
In-Reply-To: <20260930-as3722-bindings-v2-0-a3bba649ebf9@nvidia.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=20801; i=treding@nvidia.com;
 h=from:subject:message-id; bh=LSLhGpFasvbos8uxwdw6Z4f3+bkCq8/HpYDDTtA7qBs=;
 b=owEBbQKS/ZANAwAKAd0jrNd/PrOhAcsmYgBqvRY80hRsmK+MCfaJuL6C5mdoj4Q/YiZwFLcg5
 vvYPVi+fl+JAjMEAAEKAB0WIQSI6sMIAUnM98CNyJ/dI6zXfz6zoQUCar0WPAAKCRDdI6zXfz6z
 odoZEAC68rSotK9+Fl6ZxwrHrsqnIIadIRa+pby7n/rOMn7ESeG/aAynOdgiR9tTw7pH0PregGp
 4+8LaZJiQKUkXAnfCELorwQjWOy5EQVttgvoz9h8lq1fSo1IKcvhxPmpaxJPVnLUG4awG9p5k9o
 D3jLqF603Z0/Zl4sONsD6XohilMgdNz912kbS+LEDEx0+KvrmK6LAAy4FP1rgFLwqFut2x0x+ZM
 JIjpN7yCwY5kiRmMpJgTV7nGjiM/CN4S6xNLmcsG7Hr2DnS7lCvnKZA6CHjzAf7UlXnDuio+tXp
 lSSj9EAn4o/ZQ+2YcESbj903/GB4rtfQM8v5hlsD+gdlyqMUQFgMR0HlSMbYiMZ/BmRtgEpoz2L
 C40PU9iyo1Ip/4IYR0JGTX+2shujm88AAfg7l8+SLeEzDd37cIwQrxMoBj0SPkbvKApoJYWZ+Qg
 +h2JveRJnWID15055wS9YwesE6D91huQMyESNs7qu7RJmZSL4ObOIoG5t0DnLe8q17LqiQTkVKm
 c4Kp+OXP2Ld0pmoslfFgo7d/3kkbbLgOQXXoHYFcRhPO4KqbTigDPS2++9xGG3Rxezj3WaEHwLN
 HNnI7uqpIIa/qlhKPRTiuUx2nYA2qs7y8tmuDnYgXonQe3SS71p4YgNzAbAXg4qKgZigQPMmSsl
 zOlxwzQ8cI+uoQA==
X-Developer-Key: i=treding@nvidia.com; a=openpgp;
 fpr=88EAC3080149CCF7C08DC89FDD23ACD77F3EB3A1

From: Thierry Reding <treding@nvidia.com>

Convert the AMS AS3722 PMIC bindings from the free-form text format to
json-schema.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
Changes in v2:
- use pinmux-node.yaml, pincfg-node.yaml, gpio.yaml and regulator.yaml
- add #gpio-cells and gpio-controller to list of required properties
- remove some old and broken references from descriptions
- use consistent formatting for description property
- remove some duplicate type definitions
- add missing additionalProperties
- order properties consistently
- constrain #gpio-cells to 2
---
 .../devicetree/bindings/mfd/ams,as3722.yaml        | 293 +++++++++++++++++++++
 Documentation/devicetree/bindings/mfd/as3722.txt   | 214 ---------------
 .../bindings/regulator/as3722-regulator.txt        |  91 -------
 3 files changed, 293 insertions(+), 305 deletions(-)

diff --git a/Documentation/devicetree/bindings/mfd/ams,as3722.yaml b/Documentation/devicetree/bindings/mfd/ams,as3722.yaml
new file mode 100644
index 000000000000..51910042c621
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/ams,as3722.yaml
@@ -0,0 +1,293 @@
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
+    description:
+      The AS3722 has an internal interrupt controller which takes the interrupt
+      request from internal sub-blocks like RTC, regulators, GPIOs as well as
+      external input.
+
+  "#interrupt-cells":
+    description:
+      The first cell is the IRQ number. IRQ numbers for different interrupt
+      source of AS3722 are defined at dt-bindings/mfd/as3722.h. The second cell
+      is the flags, as defined in dt-bindings/interrupt-controller/irq.h.
+
+    const: 2
+
+  # from gpio.yaml
+  gpio-controller: true
+
+  "#gpio-cells":
+    const: 2
+
+  # optional properties
+  ams,enable-internal-int-pullup:
+    description:
+      Enable internal pullup on interrupt pin when present. Omitting this will
+      disable internal pullup on INT pin.
+
+    $ref: /schemas/types.yaml#/definitions/flag
+
+  ams,enable-internal-i2c-pullup:
+    description:
+      Enable internal pullup on I2C SCL/SDA pins when present. Omitting this
+      will disable internal pullup on I2C SCL/SDA lines.
+
+    $ref: /schemas/types.yaml#/definitions/flag
+
+  ams,enable-ac-ok-power-on:
+    description:
+      When present, enable exit out of power off mode with AC_OK pin (pin
+      enabled in power off mode).
+
+    $ref: /schemas/types.yaml#/definitions/flag
+
+  ams,system-power-controller:
+    description:
+      The AS3722 supports the system power off by turning off all its rails.
+      The device node should contain this boolean property to enable this
+      functionality.
+
+    $ref: /schemas/types.yaml#/definitions/flag
+
+  pinmux:
+    description:
+      Device has 8 GPIO pins which can be configured as GPIO as well as the
+      special IO functions.
+
+    type: object
+    additionalProperties: false
+
+    patternProperties:
+      "^gpio[0-7_]+$":
+        description:
+          Child nodes of the pinmux node represent some desired configuration
+          for a list of pins. This configuration can include the mux function
+          to select on those pin(s), and various pin configuration parameters,
+          such as pull-up, open drain.
+
+        type: object
+        allOf:
+          - $ref: ../pinctrl/pincfg-node.yaml#
+          - $ref: ../pinctrl/pinmux-node.yaml#
+        additionalProperties: false
+
+        properties:
+          pins:
+            items:
+              enum: [ gpio0, gpio1, gpio2, gpio3, gpio4, gpio5, gpio6, gpio7 ]
+
+          function:
+            enum: [ gpio, interrupt-out, gpio-in-interrupt,
+                    vsup-vbat-low-undebounce-out, vsup-vbat-low-debounce-out,
+                    voltage-in-standby, oc-pg-sd0, oc-pg-sd6, powergood-out,
+                    pwm-in, pwm-out, clk32k-out, watchdog-in, soft-reset-in ]
+
+          bias-pull-up:
+            type: boolean
+
+          bias-pull-down:
+            type: boolean
+
+          bias-disable: true
+          bias-high-impedance: true
+          drive-open-drain: true
+
+        required:
+          - pins
+
+  regulators:
+    description:
+      Device has multiple DCDC and LDOs. The node "regulators" is required if
+      regulator functionality is needed.
+
+    type: object
+    additionalProperties: false
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
+        description:
+          These sub-nodes must be named after one of the regulators found on
+          the AS3277. Each sub-node should contain the constraints and
+          initialization information for that regulator.
+
+        $ref: /schemas/regulator/regulator.yaml#
+        unevaluatedProperties: false
+        type: object
+
+        properties:
+          ams,ext-control:
+            description:
+              External control of the rail. The value of this property will
+              tell which external input is controlling this rail. Valid values
+              are 0, 1, 2 ad 3. If this property does not exist, the default
+              value is 0. The external control pin macros are defined in
+              dt-bindings/mfd/as3722.h.
+
+            $ref: /schemas/types.yaml#/definitions/uint32
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
+            description: Enable tracking with SD1, only supported by LDO3.
+
+            $ref: /schemas/types.yaml#/definitions/flag
+
+unevaluatedProperties: false
+
+required:
+  - compatible
+  - reg
+  - interrupt-controller
+  - "#interrupt-cells"
+  - gpio-controller
+  - "#gpio-cells"
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

