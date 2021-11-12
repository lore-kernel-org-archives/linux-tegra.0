Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A5A4C4332F
	for <linux-tegra@archiver.kernel.org>; Fri, 12 Nov 2021 12:06:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EAABC6103C
	for <linux-tegra@archiver.kernel.org>; Fri, 12 Nov 2021 12:06:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235040AbhKLMI4 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 12 Nov 2021 07:08:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36316 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235046AbhKLMIq (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 12 Nov 2021 07:08:46 -0500
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 29150C06120A;
        Fri, 12 Nov 2021 04:05:56 -0800 (PST)
Received: by mail-wm1-x329.google.com with SMTP id o29so7527596wms.2;
        Fri, 12 Nov 2021 04:05:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=P/7ztmZKHyyKzC/vfI/wZjARcBDSSOm3pOkQTYjxERE=;
        b=ULw/7P8li0JWxL8kddM4WpB8KxhgFrOa3SINVGM9VMJfWuzRIOALcf7DIL7lBeh/dx
         JNRtAs4VIirOj3PdMQX+CiHZKJGfv3a7lbCDm8jadCwrP09xvDz/CIObHiKNoUTWWZV/
         9O/7XqV2AgPmJksiHedxTD1KIDbwkiAbqhvog34Gl9o8vJhyGmx8iCAHT3UHtVKV3A91
         2MeHyFflA6pMVM0ELsxovMLgxXN4z12MNbd4xs28XBv2ok5T5Wf6SCzIALj9rt61RKxI
         yZTwKtnyQd7YC4hszEdqI6i4CWmo1cYz0xUuF3obbI8EceKpXPw7EpbP9pkxJndce4j8
         X22g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=P/7ztmZKHyyKzC/vfI/wZjARcBDSSOm3pOkQTYjxERE=;
        b=UySZ+Jow9/J11QFJr2f+Hi/kFrovuPst+HQdHsmj43budf07MKdEHt+DgA2zFjh4DL
         xxCL412MAEwr7vnAL6XRbwsoVewfA1/QIPYUhinRNrd1bnOiPwH9dzJvV+QbkGm6A2Q4
         zcE1Iqtje2ac0vL0WZpL3jw9zbBInZrAz3nIT9V4Hx+cIrOJmnqQycFW6Qem+aCxm9Ya
         6Jrd0/wl04sMWE8XKfnSO5vKXyWfRu440qtPVQJiaEjmC9P4VRSzMktCSZh1Ga0/It6o
         mp9/Y7dyZQoZgHiFK9xEPULaN/WvMFwCb4VczjRGyAgeWxUkIpo/bdkuflIKqN5uJHJj
         JQXw==
X-Gm-Message-State: AOAM533ltMIEZkzwoPcA6Akr9Yt2ANpctSJwAkreVYt9nxQEhrTtwiFK
        0jpx3tpQh+o6f7nsClbEGDK6LvqyCn4Jog==
X-Google-Smtp-Source: ABdhPJyHi4Yx1tlWMjt6MJD5TBTzB8dg5o0PIomDCojbyMuUgM/FBNvWLg0Ktpp1GkHxgcvhTn4smA==
X-Received: by 2002:a1c:23cb:: with SMTP id j194mr34461912wmj.13.1636718754652;
        Fri, 12 Nov 2021 04:05:54 -0800 (PST)
Received: from localhost ([193.209.96.43])
        by smtp.gmail.com with ESMTPSA id h27sm12761920wmc.43.2021.11.12.04.05.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Nov 2021 04:05:53 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Jon Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: [PATCH 11/15] dt-bindings: tegra: pmc: Convert to json-schema
Date:   Fri, 12 Nov 2021 13:05:14 +0100
Message-Id: <20211112120518.3679793-12-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211112120518.3679793-1-thierry.reding@gmail.com>
References: <20211112120518.3679793-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Convert the NVIDIA Tegra186 (and later) PMC bindings from the free-form
text format to json-schema.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 .../arm/tegra/nvidia,tegra186-pmc.txt         | 133 ------------
 .../arm/tegra/nvidia,tegra186-pmc.yaml        | 199 ++++++++++++++++++
 2 files changed, 199 insertions(+), 133 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/arm/tegra/nvidia,tegra186-pmc.txt
 create mode 100644 Documentation/devicetree/bindings/arm/tegra/nvidia,tegra186-pmc.yaml

diff --git a/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra186-pmc.txt b/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra186-pmc.txt
deleted file mode 100644
index 576462fae27f..000000000000
--- a/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra186-pmc.txt
+++ /dev/null
@@ -1,133 +0,0 @@
-NVIDIA Tegra Power Management Controller (PMC)
-
-Required properties:
-- compatible: Should contain one of the following:
-  - "nvidia,tegra186-pmc": for Tegra186
-  - "nvidia,tegra194-pmc": for Tegra194
-  - "nvidia,tegra234-pmc": for Tegra234
-- reg: Must contain an (offset, length) pair of the register set for each
-  entry in reg-names.
-- reg-names: Must include the following entries:
-  - "pmc"
-  - "wake"
-  - "aotag"
-  - "scratch"
-  - "misc" (Only for Tegra194 and later)
-
-Optional properties:
-- nvidia,invert-interrupt: If present, inverts the PMU interrupt signal.
-- interrupt-controller: Identifies the node as an interrupt controller.
-- #interrupt-cells: Specifies the number of cells needed to encode an
-  interrupt source. The value must be 2.
-
-Example:
-
-SoC DTSI:
-
-	pmc@c3600000 {
-		compatible = "nvidia,tegra186-pmc";
-		reg = <0 0x0c360000 0 0x10000>,
-		      <0 0x0c370000 0 0x10000>,
-		      <0 0x0c380000 0 0x10000>,
-		      <0 0x0c390000 0 0x10000>;
-		reg-names = "pmc", "wake", "aotag", "scratch";
-	};
-
-Board DTS:
-
-	pmc@c360000 {
-		nvidia,invert-interrupt;
-	};
-
-== Pad Control ==
-
-On Tegra SoCs a pad is a set of pins which are configured as a group.
-The pin grouping is a fixed attribute of the hardware. The PMC can be
-used to set pad power state and signaling voltage. A pad can be either
-in active or power down mode. The support for power state and signaling
-voltage configuration varies depending on the pad in question. 3.3 V and
-1.8 V signaling voltages are supported on pins where software
-controllable signaling voltage switching is available.
-
-Pad configurations are described with pin configuration nodes which
-are placed under the pmc node and they are referred to by the pinctrl
-client properties. For more information see
-Documentation/devicetree/bindings/pinctrl/pinctrl-bindings.txt.
-
-The following pads are present on Tegra186:
-csia		csib		dsi		mipi-bias
-pex-clk-bias	pex-clk3	pex-clk2	pex-clk1
-usb0		usb1		usb2		usb-bias
-uart		audio		hsic		dbg
-hdmi-dp0	hdmi-dp1	pex-cntrl	sdmmc2-hv
-sdmmc4		cam		dsib		dsic
-dsid		csic		csid		csie
-dsif		spi		ufs		dmic-hv
-edp		sdmmc1-hv	sdmmc3-hv	conn
-audio-hv	ao-hv
-
-Required pin configuration properties:
-  - pins: A list of strings, each of which contains the name of a pad
-	  to be configured.
-
-Optional pin configuration properties:
-  - low-power-enable: Configure the pad into power down mode
-  - low-power-disable: Configure the pad into active mode
-  - power-source: Must contain either TEGRA_IO_PAD_VOLTAGE_1V8 or
-    TEGRA_IO_PAD_VOLTAGE_3V3 to select between signaling voltages.
-    The values are defined in
-    include/dt-bindings/pinctrl/pinctrl-tegra-io-pad.h.
-
-Note: The power state can be configured on all of the above pads except
-      for ao-hv. Following pads have software configurable signaling
-      voltages: sdmmc2-hv, dmic-hv, sdmmc1-hv, sdmmc3-hv, audio-hv,
-      ao-hv.
-
-Pad configuration state example:
-	pmc: pmc@7000e400 {
-		compatible = "nvidia,tegra186-pmc";
-		reg = <0 0x0c360000 0 0x10000>,
-		      <0 0x0c370000 0 0x10000>,
-		      <0 0x0c380000 0 0x10000>,
-		      <0 0x0c390000 0 0x10000>;
-		reg-names = "pmc", "wake", "aotag", "scratch";
-
-		...
-
-		sdmmc1_3v3: sdmmc1-3v3 {
-			pins = "sdmmc1-hv";
-			power-source = <TEGRA_IO_PAD_VOLTAGE_3V3>;
-		};
-
-		sdmmc1_1v8: sdmmc1-1v8 {
-			pins = "sdmmc1-hv";
-			power-source = <TEGRA_IO_PAD_VOLTAGE_1V8>;
-		};
-
-		hdmi_off: hdmi-off {
-			pins = "hdmi";
-			low-power-enable;
-		}
-
-		hdmi_on: hdmi-on {
-			pins = "hdmi";
-			low-power-disable;
-		}
-	};
-
-Pinctrl client example:
-	sdmmc1: sdhci@3400000 {
-		...
-		pinctrl-names = "sdmmc-3v3", "sdmmc-1v8";
-		pinctrl-0 = <&sdmmc1_3v3>;
-		pinctrl-1 = <&sdmmc1_1v8>;
-	};
-
-	...
-
-	sor0: sor@15540000 {
-		...
-		pinctrl-0 = <&hdmi_off>;
-		pinctrl-1 = <&hdmi_on>;
-		pinctrl-names = "hdmi-on", "hdmi-off";
-	};
diff --git a/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra186-pmc.yaml b/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra186-pmc.yaml
new file mode 100644
index 000000000000..6946df96ec81
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra186-pmc.yaml
@@ -0,0 +1,199 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/arm/tegra/nvidia,tegra186-pmc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NVIDIA Tegra Power Management Controller (PMC)
+
+maintainers:
+  - Thierry Reding <thierry.reding@gmail.com>
+  - Jon Hunter <jonathanh@nvidia.com>
+
+properties:
+  compatible:
+    enum:
+      - nvidia,tegra186-pmc
+      - nvidia,tegra194-pmc
+      - nvidia,tegra234-pmc
+
+  reg:
+    minItems: 4
+    maxItems: 5
+
+  reg-names:
+    minItems: 4
+    maxItems: 5
+    items:
+      - const: pmc
+      - const: wake
+      - const: aotag
+      - const: scratch
+      - const: misc
+
+  interrupt-controller: true
+
+  "#interrupt-cells":
+    description: Specifies the number of cells needed to encode an
+      interrupt source. The value must be 2.
+    const: 2
+
+  nvidia,invert-interrupt:
+    description: If present, inverts the PMU interrupt signal.
+    $ref: /schemas/types.yaml#/definitions/flag
+
+if:
+  properties:
+    compatible:
+      contains:
+        const: nvidia,tegra186-pmc
+then:
+  properties:
+    reg:
+      maxItems: 4
+
+    reg-names:
+      maxItems: 4
+else:
+  properties:
+    reg:
+      minItems: 5
+
+    reg-names:
+      minItems: 5
+
+patternProperties:
+  "^[a-z0-9]+-[a-z0-9]+$":
+    if:
+      type: object
+    then:
+      description: |
+        These are pad configuration nodes. On Tegra SoCs a pad is a set of
+        pins which are configured as a group. The pin grouping is a fixed
+        attribute of the hardware. The PMC can be used to set pad power
+        state and signaling voltage. A pad can be either in active or
+        power down mode. The support for power state and signaling voltage
+        configuration varies depending on the pad in question. 3.3 V and
+        1.8 V signaling voltages are supported on pins where software
+        controllable signaling voltage switching is available.
+
+        Pad configurations are described with pin configuration nodes
+        which are placed under the pmc node and they are referred to by
+        the pinctrl client properties. For more information see
+
+          Documentation/devicetree/bindings/pinctrl/pinctrl-bindings.txt
+
+        The following pads are present on Tegra186:
+
+          csia, csib, dsi, mipi-bias, pex-clk-bias, pex-clk3, pex-clk2,
+          pex-clk1, usb0, usb1, usb2, usb-bias, uart, audio, hsic, dbg,
+          hdmi-dp0, hdmi-dp1, pex-cntrl, sdmmc2-hv, sdmmc4, cam, dsib,
+          dsic, dsid, csic, csid, csie, dsif, spi, ufs, dmic-hv, edp,
+          sdmmc1-hv, sdmmc3-hv, conn, audio-hv, ao-hv
+
+        The following pads are present on Tegra194:
+
+          csia, csib, mipi-bias, pex-clk-bias, pex-clk3, pex-clk2,
+          pex-clk1, eqos, pex-clk-2-bias, pex-clk-2, dap3, dap5, uart,
+          pwr-ctl, soc-gpio53, audio, gp-pwm2, gp-pwm3, soc-gpio12,
+          soc-gpio13, soc-gpio10, uart4, uart5, dbg, hdmi-dp3, hdmi-dp2,
+          hdmi-dp0, hdmi-dp1, pex-cntrl, pex-ctl2, pex-l0-rst,
+          pex-l1-rst, sdmmc4, pex-l5-rst, cam, csic, csid, csie, csif,
+          spi, ufs, csig, csih, edp, sdmmc1-hv, sdmmc3-hv, conn,
+          audio-hv, ao-hv
+
+      properties:
+        pins:
+          $ref: /schemas/types.yaml#/definitions/string
+          description: Must contain the name of the pad(s) to be
+            configured.
+
+        low-power-enable:
+          description: Configure the pad into power down mode.
+          $ref: /schemas/types.yaml#/definitions/flag
+
+        low-power-disable:
+          description: Configure the pad into active mode.
+          $ref: /schemas/types.yaml#/definitions/flag
+
+        power-source:
+          $ref: /schemas/types.yaml#/definitions/uint32
+          description: |
+            Must contain either TEGRA_IO_PAD_VOLTAGE_1V8 or
+            TEGRA_IO_PAD_VOLTAGE_3V3 to select between signalling
+            voltages.
+
+            The values are defined in
+
+              include/dt-bindings/pinctrl/pinctrl-tegra-io-pad.h
+
+            The power state can be configured on all of the above pads
+            except for ao-hv. Following pads have software configurable
+            signaling voltages: sdmmc2-hv, dmic-hv, sdmmc1-hv, sdmmc3-hv,
+            audio-hv, ao-hv.
+
+        phandle: true
+
+      required:
+        - pins
+
+      additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - reg-names
+
+additionalProperties: false
+
+dependencies:
+  interrupt-controller: ['#interrupt-cells']
+  "#interrupt-cells":
+    required:
+      - interrupt-controller
+
+examples:
+  - |
+    #include <dt-bindings/clock/tegra186-clock.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/pinctrl/pinctrl-tegra-io-pad.h>
+    #include <dt-bindings/memory/tegra186-mc.h>
+    #include <dt-bindings/reset/tegra186-reset.h>
+
+    pmc@c3600000 {
+        compatible = "nvidia,tegra186-pmc";
+        reg = <0x0c360000 0x10000>,
+              <0x0c370000 0x10000>,
+              <0x0c380000 0x10000>,
+              <0x0c390000 0x10000>;
+        reg-names = "pmc", "wake", "aotag", "scratch";
+        nvidia,invert-interrupt;
+
+        sdmmc1_3v3: sdmmc1-3v3 {
+            pins = "sdmmc1-hv";
+            power-source = <TEGRA_IO_PAD_VOLTAGE_3V3>;
+        };
+
+        sdmmc1_1v8: sdmmc1-1v8 {
+            pins = "sdmmc1-hv";
+            power-source = <TEGRA_IO_PAD_VOLTAGE_1V8>;
+        };
+    };
+
+    sdmmc1: mmc@3400000 {
+        compatible = "nvidia,tegra186-sdhci";
+        reg = <0x03400000 0x10000>;
+        interrupts = <GIC_SPI 62 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&bpmp TEGRA186_CLK_SDMMC1>,
+                 <&bpmp TEGRA186_CLK_SDMMC_LEGACY_TM>;
+        clock-names = "sdhci", "tmclk";
+        resets = <&bpmp TEGRA186_RESET_SDMMC1>;
+        reset-names = "sdhci";
+        interconnects = <&mc TEGRA186_MEMORY_CLIENT_SDMMCRA &emc>,
+                        <&mc TEGRA186_MEMORY_CLIENT_SDMMCWA &emc>;
+        interconnect-names = "dma-mem", "write";
+        iommus = <&smmu TEGRA186_SID_SDMMC1>;
+        pinctrl-names = "sdmmc-3v3", "sdmmc-1v8";
+        pinctrl-0 = <&sdmmc1_3v3>;
+        pinctrl-1 = <&sdmmc1_1v8>;
+    };
-- 
2.33.1

