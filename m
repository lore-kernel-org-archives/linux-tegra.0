Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD705C433EF
	for <linux-tegra@archiver.kernel.org>; Thu,  9 Dec 2021 16:53:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241381AbhLIQ5V (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 9 Dec 2021 11:57:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40586 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238120AbhLIQ5V (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 9 Dec 2021 11:57:21 -0500
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F5B6C061746;
        Thu,  9 Dec 2021 08:53:47 -0800 (PST)
Received: by mail-wr1-x42a.google.com with SMTP id i5so10810619wrb.2;
        Thu, 09 Dec 2021 08:53:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3HIM41WLGN21TIrY4S+aqs2mu9+dq63GuvS9U31Vx2E=;
        b=WbEk7fg8n2zkKv2e6uF4YZoxj4/u7KvZKnPkPUQLP5ZkhzM/V6JyOBSgG9PfKX09pa
         bvGWhuzlH1U/xuP0sszphJV0Mg7QXMCFB47DDH6FqZNre1RX8y5gSqaMjAnK7nG7aeSP
         sQwMHhiC4YFXR209sZ632zZA9o103w24Ngp3ro6jA4+rswxMyQxfs1lJKF5Qcyk45PYA
         RxegYMNDXmyX+GaEzftEi+tiuJ8ungTaKFGej4LHob/8amIYPcbld/IHbaRyF0SWOhfV
         6DUHgzUh2Kvw+ssbqBz6uvLeOBHBClIIwRObMUK+CRua8GQSrib8YP2OHJqc0YztzTki
         yjig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3HIM41WLGN21TIrY4S+aqs2mu9+dq63GuvS9U31Vx2E=;
        b=lfJXzHfMzdVutJdDYLJLhVQKkBLo0fFwHgYfkcr4UzId4FdaNV9mOGjciMf09S7/uK
         XTdX+UgEiIDCAh+T14apacGwGPMG4s03PId2W3vdtVroUNZTa+93OUPw5xR+ba8vciZp
         UQ2PEuoOKcbmcm3eTvANpq7pm4iSkCTAXMJ7sh60CxsZOOf91o7ImP/UNt6Xo5fq/tiB
         b/ezWiFnQ3Pe2UiqHWQWx/HAtSVyJ7fPOC7n7ARnDmLFlqHnb2S9Hyw1Dw/+7vV4sW2V
         OURYpEzsNwcM9R2WFX/H2DXq7DJ4wKTREJt6xDwkqtSdS4jKPZHBoe9lLOyV6U28ghM+
         xK1w==
X-Gm-Message-State: AOAM532l6cIO66KLiVCrSphudl+p23jbEyQynFkt8NZCU2RrhjwiC1ZC
        /UgltTvCnAHIUXxVZmWR3MS7krfMkwGEQA==
X-Google-Smtp-Source: ABdhPJxI/r8JhEZcU8VnmcD79u7FIwEYFLDcyV/EHotjIiGsVaft7w/Att+WdBhLLgFE91cnsxt+Ew==
X-Received: by 2002:a05:6000:1885:: with SMTP id a5mr7950074wri.258.1639068825510;
        Thu, 09 Dec 2021 08:53:45 -0800 (PST)
Received: from localhost ([193.209.96.43])
        by smtp.gmail.com with ESMTPSA id l15sm306943wme.47.2021.12.09.08.53.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Dec 2021 08:53:44 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Rob Herring <robh+dt@kernel.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Peter Chen <peter.chen@freescale.com>,
        Nagarjuna Kristam <nkristam@nvidia.com>,
        JC Kuo <jckuo@nvidia.com>, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org
Subject: [PATCH 1/4] dt-bindings: usb: chipidea: Convert to json-schema
Date:   Thu,  9 Dec 2021 17:53:36 +0100
Message-Id: <20211209165339.614498-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Convert the ChipIdea USB2 bindings from the free-form text format to
json-schema.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 .../bindings/usb/chipidea,usb2.yaml           | 310 ++++++++++++++++++
 .../devicetree/bindings/usb/ci-hdrc-usb2.txt  | 158 ---------
 2 files changed, 310 insertions(+), 158 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/usb/chipidea,usb2.yaml
 delete mode 100644 Documentation/devicetree/bindings/usb/ci-hdrc-usb2.txt

diff --git a/Documentation/devicetree/bindings/usb/chipidea,usb2.yaml b/Documentation/devicetree/bindings/usb/chipidea,usb2.yaml
new file mode 100644
index 000000000000..0e36259f23ba
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/chipidea,usb2.yaml
@@ -0,0 +1,310 @@
+# SPDX-License-Identifier: GPL-2.0-only
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/usb/chipidea,usb2.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: USB2 ChipIdea USB controller for ci13xxx
+
+maintainers:
+  - Peter Chen <peter.chen@freescale.com>
+
+properties:
+  compatible:
+    oneOf:
+      - enum:
+          - fsl,imx23-usb
+          - fsl,imx27-usb
+          - fsl,imx28-usb
+          - fsl,imx6q-usb
+          - fsl,imx6sl-usb
+          - fsl,imx6sx-usb
+          - fsl,imx6ul-usb
+          - fsl,imx7d-usb
+          - fsl,imx7ulp-usb
+          - lsi,zevio-usb
+          - qcom,ci-hdrc
+          - chipidea,usb2
+          - xlnx,zynq-usb-2.20a
+          - nvidia,tegra20-udc
+          - nvidia,tegra30-udc
+          - nvidia,tegra114-udc
+          - nvidia,tegra124-udc
+      - items:
+          - const: fsl,imx6q-usb
+          - const: fsl,imx27-usb
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  phy_type:
+    $ref: /schemas/types.yaml#/definitions/string
+    description: The type of the PHY connected to the core. Without this property the PORTSC
+      register won't be touched.
+    enum:
+      - utmi
+      - utmi_wide
+      - ulpi
+      - serial
+      - hsic
+
+  dr_mode:
+    $ref: /schemas/types.yaml#/definitions/string
+    description: dual-role mode of the interface
+    enum:
+      - host
+      - peripheral
+      - otg
+    default:
+      const: otg
+
+  clocks:
+    items:
+      - description: reference to the USB clock
+
+  resets:
+    items:
+      - description: reference to the USB reset
+
+  reset-names:
+    items:
+      - const: usb
+
+  phys:
+    items:
+      - description: reference to the USB PHY
+
+  phy-names:
+    items:
+      - const: usb-phy
+
+  vbus-supply:
+    description: reference to the VBUS regulator
+
+  maximum-speed:
+    description: limit the maximum connection speed to "full-speed".
+
+  tpl-support:
+    description: TPL (Targeted Peripheral List) feature for targeted hosts
+
+  itc-setting:
+    description: Interrupt threshold control register control, the setting should be aligned with
+      ITC bits at register USBCMD.
+
+  ahb-burst-config:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: This vendor-dependent property is used to change the AHB burst configuration and
+      should be aligned with AHBBRST at SBUSCFG. See the ChipIdea specification for the details on
+      each of those values. If this property does not exist, the reset value will be used.
+    minimum: 0
+    maximum: 7
+
+  tx-burst-size-dword:
+    description: This vendor-dependent property is used to configure the TX burst size (in 32-bit
+      words). The value represents the maximum length of a burst while moving data from system
+      memory to the USB bus. This property takes effect only if the "ahb-burst-config" property is
+      set to 0. If this property is missing the reset default of the hardware implementation will
+      be used.
+
+  rx-burst-size-dword:
+    description: This vendor-dependent property is used to configure the RX burst size (in 32-bit
+      words). This value represents the maximum length of a burst while moving data from the USB
+      bus to system memory. This property takes effect only if the "ahb-burst-config" property is
+      set to 0. If this property is missing the reset default of the hardware implementation will
+      be used.
+
+  extcon:
+    description: A list of phandles to external connector devices. The first phandle should point
+      to the external connector which provides "USB" cable events. The second should point to the
+      external connector device that provide "USB-HOST" cable events. If one of the external
+      connector devices is not required, an empty phandle (0) should be specified.
+
+  phy-clkgate-delay-us:
+    description: The delay time (in microseconds) between putting the PHY into low power mode and
+      gating the PHY clock.
+
+  non-zero-ttctrl-ttha:
+    description: |
+      After setting this property, the value of register ttctrl.ttha will be 0x7f; if not, the
+      value will be 0x0 (the default). The value for this property needs to be chosen very
+      carefully after consulting with your IC engineer.
+
+      On most ChipIdea platforms, the "usage_tt" flag at RTL is 0, so this property only affects
+      siTD.
+
+      If this property is not set, the maximum packet size is 1023 bytes, and if the total packet
+      size for previous transactions is more than 256 bytes, no further transactions can be
+      accepted within the frame. The use case is single transaction, but higher frame rate.
+
+      If this property is set, the maximum packet size is limited to 188 bytes and more
+      transactions than in the above case can be handled. Transactions will be accepted as long as
+      188 bytes or more of space are left within a frame. Software needs to make sure it does not
+      send more than 90% maximum_periodic_data_per_frame. The use case is higher amount of
+      transactions at the cost of a lower frame rate.
+
+  mux-controls:
+    description: The mux control for toggling host/device output of this controller. It's expected
+      that a mux state of 0 indicates device mode and a mux state of 1 indicates host mode.
+
+  mux-control-names:
+    const: usb_switch
+
+  pinctrl-names:
+    description: In case of HSIC-mode, "idle" and "active" pin modes are mandatory. In this case,
+      the "idle" state needs to pull down the data and strobe pin and the "active" state needs to
+      pull up the strobe pin.
+    minItems: 1
+    maxItems: 5
+    items:
+      enum:
+        - default
+        - host
+        - device
+        - idle # mandatory for HSIC
+        - active # mandatory for HSIC
+
+  # i.MX specific properties
+  fsl,usbmisc:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    description: phandle to non-core register device, with one argument that indicate USB
+      controller index.
+
+  disable-over-current:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description: disable over current detect
+
+  over-current-active-low:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description: Over-current signal polarity is active low. It's recommended to specify the
+      over-current polarity.
+
+  over-current-active-high:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description: Over-current signal polarity is active high. It's recommended to specify the
+      over-current polarity.
+
+  power-active-high:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description: power signal polarity is active high
+
+  external-vbus-divider:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description: enables off-chip resistor divider for Vbus
+
+  samsung,picophy-pre-emp-curr-control:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: HS Transmitter Pre-Emphasis Current Control. This signal controls the amount of
+      current sourced to the USB_OTG*_DP and USB_OTG*_DN pins after a J-to-K or K-to-J transition.
+      Refer to the TXPREEMPAMPTUNE0 bits of register USBNC_n_PHY_CFG1 in the documentation for
+      more details.
+    minimum: 0
+    maximum: 3
+    default: 1
+
+  samsung,picophy-dc-vol-level-adjust:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: HS DC Voltage Level Adjustment. Adjust the high-speed transmitter DC level
+      voltage. Refer to the TXVREFTUNE0 bits of register USBNC_n_PHY_CFG1 in the documentation for
+      more details.
+    minimum: 0
+    maximum: 0xf
+    default: 3
+
+  # NVIDIA Tegra specific properties
+  nvidia,needs-double-reset:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description: Specifies a workaround for the USB1 port that needs to be reset twice internally
+      some Tegra devices.
+
+  # deprecated properties
+  usb-phy:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: phandle for the PHY device. Use "phys" instead.
+    deprecated: true
+
+  fsl,usbphy:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: phandle of usb phy that connects to the port. Use "phys" instead.
+    deprecated: true
+
+  nvidia,phy:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: phandle for the PHY device. Use "phys" instead.
+    deprecated: true
+
+  # USB bus
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 0
+
+patternProperties:
+  "^pinctrl-[0-9]+$": true
+
+additionalProperties:
+  $ref: usb-device.yaml
+
+required:
+  - compatible
+  - reg
+  - interrupts
+
+dependencies:
+  mux-control-names: [ mux-controls ]
+
+examples:
+  - |
+    #include <dt-bindings/clock/berlin2.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    usb@f7ed0000 {
+      compatible = "chipidea,usb2";
+      reg = <0xf7ed0000 0x10000>;
+      interrupts = <GIC_SPI 11 IRQ_TYPE_LEVEL_HIGH>;
+      clocks = <&chip CLKID_USB0>;
+      phys = <&usb_phy0>;
+      phy-names = "usb-phy";
+      vbus-supply = <&reg_usb0_vbus>;
+      itc-setting = <0x4>; /* 4 micro-frames */
+      /* Incremental burst of unspecified length */
+      ahb-burst-config = <0x0>;
+      tx-burst-size-dword = <0x10>; /* 64 bytes */
+      rx-burst-size-dword = <0x10>;
+      extcon = <0>, <&usb_id>;
+      phy-clkgate-delay-us = <400>;
+      mux-controls = <&usb_switch>;
+      mux-control-names = "usb_switch";
+    };
+
+  # HSIC
+  - |
+    #include <dt-bindings/clock/imx6qdl-clock.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    usb@2184400 {
+      compatible = "fsl,imx6q-usb", "fsl,imx27-usb";
+      reg = <0x02184400 0x200>;
+      interrupts = <GIC_SPI 41 IRQ_TYPE_LEVEL_HIGH>;
+      clocks = <&clks IMX6QDL_CLK_USBOH3>;
+      fsl,usbphy = <&usbphynop1>;
+      fsl,usbmisc = <&usbmisc 2>;
+      phy_type = "hsic";
+      dr_mode = "host";
+      ahb-burst-config = <0x0>;
+      tx-burst-size-dword = <0x10>;
+      rx-burst-size-dword = <0x10>;
+      pinctrl-names = "idle", "active";
+      pinctrl-0 = <&pinctrl_usbh2_idle>;
+      pinctrl-1 = <&pinctrl_usbh2_active>;
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      usbnet: smsc@1 {
+        compatible = "usb424,9730";
+        reg = <1>;
+      };
+    };
diff --git a/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.txt b/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.txt
deleted file mode 100644
index a5c5db6a0b2d..000000000000
--- a/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.txt
+++ /dev/null
@@ -1,158 +0,0 @@
-* USB2 ChipIdea USB controller for ci13xxx
-
-Required properties:
-- compatible: should be one of:
-	"fsl,imx23-usb"
-	"fsl,imx27-usb"
-	"fsl,imx28-usb"
-	"fsl,imx6q-usb"
-	"fsl,imx6sl-usb"
-	"fsl,imx6sx-usb"
-	"fsl,imx6ul-usb"
-	"fsl,imx7d-usb"
-	"fsl,imx7ulp-usb"
-	"lsi,zevio-usb"
-	"qcom,ci-hdrc"
-	"chipidea,usb2"
-	"xlnx,zynq-usb-2.20a"
-	"nvidia,tegra20-udc"
-	"nvidia,tegra30-udc"
-	"nvidia,tegra114-udc"
-	"nvidia,tegra124-udc"
-- reg: base address and length of the registers
-- interrupts: interrupt for the USB controller
-
-Recommended properies:
-- phy_type: the type of the phy connected to the core. Should be one
-  of "utmi", "utmi_wide", "ulpi", "serial" or "hsic". Without this
-  property the PORTSC register won't be touched.
-- dr_mode: One of "host", "peripheral" or "otg". Defaults to "otg"
-
-Deprecated properties:
-- usb-phy:      phandle for the PHY device. Use "phys" instead.
-- fsl,usbphy: phandle of usb phy that connects to the port. Use "phys" instead.
-
-Optional properties:
-- clocks: reference to the USB clock
-- phys: reference to the USB PHY
-- phy-names: should be "usb-phy"
-- vbus-supply: reference to the VBUS regulator
-- maximum-speed: limit the maximum connection speed to "full-speed".
-- tpl-support: TPL (Targeted Peripheral List) feature for targeted hosts
-- itc-setting: interrupt threshold control register control, the setting
-  should be aligned with ITC bits at register USBCMD.
-- ahb-burst-config: it is vendor dependent, the required value should be
-  aligned with AHBBRST at SBUSCFG, the range is from 0x0 to 0x7. This
-  property is used to change AHB burst configuration, check the chipidea
-  spec for meaning of each value. If this property is not existed, it
-  will use the reset value.
-- tx-burst-size-dword: it is vendor dependent, the tx burst size in dword
-  (4 bytes), This register represents the maximum length of a the burst
-  in 32-bit words while moving data from system memory to the USB
-  bus, the value of this property will only take effect if property
-  "ahb-burst-config" is set to 0, if this property is missing the reset
-  default of the hardware implementation will be used.
-- rx-burst-size-dword: it is vendor dependent, the rx burst size in dword
-  (4 bytes), This register represents the maximum length of a the burst
-  in 32-bit words while moving data from the USB bus to system memory,
-  the value of this property will only take effect if property
-  "ahb-burst-config" is set to 0, if this property is missing the reset
-  default of the hardware implementation will be used.
-- extcon: phandles to external connector devices. First phandle should point to
-  external connector, which provide "USB" cable events, the second should point
-  to external connector device, which provide "USB-HOST" cable events. If one
-  of the external connector devices is not required, empty <0> phandle should
-  be specified.
-- phy-clkgate-delay-us: the delay time (us) between putting the PHY into
-  low power mode and gating the PHY clock.
-- non-zero-ttctrl-ttha: after setting this property, the value of register
-  ttctrl.ttha will be 0x7f; if not, the value will be 0x0, this is the default
-  value. It needs to be very carefully for setting this property, it is
-  recommended that consult with your IC engineer before setting this value.
-  On the most of chipidea platforms, the "usage_tt" flag at RTL is 0, so this
-  property only affects siTD.
-  If this property is not set, the max packet size is 1023 bytes, and if
-  the total of packet size for pervious transactions are more than 256 bytes,
-  it can't accept any transactions within this frame. The use case is single
-  transaction, but higher frame rate.
-  If this property is set, the max packet size is 188 bytes, it can handle
-  more transactions than above case, it can accept transactions until it
-  considers the left room size within frame is less than 188 bytes, software
-  needs to make sure it does not send more than 90%
-  maximum_periodic_data_per_frame. The use case is multiple transactions, but
-  less frame rate.
-- mux-controls: The mux control for toggling host/device output of this
-  controller. It's expected that a mux state of 0 indicates device mode and a
-  mux state of 1 indicates host mode.
-- mux-control-names: Shall be "usb_switch" if mux-controls is specified.
-- pinctrl-names: Names for optional pin modes in "default", "host", "device".
-  In case of HSIC-mode, "idle" and "active" pin modes are mandatory. In this
-  case, the "idle" state needs to pull down the data and strobe pin
-  and the "active" state needs to pull up the strobe pin.
-- pinctrl-n: alternate pin modes
-
-i.mx specific properties
-- fsl,usbmisc: phandler of non-core register device, with one
-  argument that indicate usb controller index
-- disable-over-current: disable over current detect
-- over-current-active-low: over current signal polarity is active low.
-- over-current-active-high: over current signal polarity is active high.
-  It's recommended to specify the over current polarity.
-- power-active-high: power signal polarity is active high
-- external-vbus-divider: enables off-chip resistor divider for Vbus
-- samsung,picophy-pre-emp-curr-control: HS Transmitter Pre-Emphasis Current
-  Control. This signal controls the amount of current sourced to the
-  USB_OTG*_DP and USB_OTG*_DN pins after a J-to-K or K-to-J transition.
-  The range is from 0x0 to 0x3, the default value is 0x1.
-  Details can refer to TXPREEMPAMPTUNE0 bits of USBNC_n_PHY_CFG1.
-- samsung,picophy-dc-vol-level-adjust: HS DC Voltage Level Adjustment.
-  Adjust the high-speed transmitter DC level voltage.
-  The range is from 0x0 to 0xf, the default value is 0x3.
-  Details can refer to TXVREFTUNE0 bits of USBNC_n_PHY_CFG1.
-
-Example:
-
-	usb@f7ed0000 {
-		compatible = "chipidea,usb2";
-		reg = <0xf7ed0000 0x10000>;
-		interrupts = <GIC_SPI 11 IRQ_TYPE_LEVEL_HIGH>;
-		clocks = <&chip CLKID_USB0>;
-		phys = <&usb_phy0>;
-		phy-names = "usb-phy";
-		vbus-supply = <&reg_usb0_vbus>;
-		itc-setting = <0x4>; /* 4 micro-frames */
-		 /* Incremental burst of unspecified length */
-		ahb-burst-config = <0x0>;
-		tx-burst-size-dword = <0x10>; /* 64 bytes */
-		rx-burst-size-dword = <0x10>;
-		extcon = <0>, <&usb_id>;
-		phy-clkgate-delay-us = <400>;
-		mux-controls = <&usb_switch>;
-		mux-control-names = "usb_switch";
-	};
-
-Example for HSIC:
-
-	usb@2184400 {
-		compatible = "fsl,imx6q-usb", "fsl,imx27-usb";
-		reg = <0x02184400 0x200>;
-		interrupts = <0 41 IRQ_TYPE_LEVEL_HIGH>;
-		clocks = <&clks IMX6QDL_CLK_USBOH3>;
-		fsl,usbphy = <&usbphynop1>;
-		fsl,usbmisc = <&usbmisc 2>;
-		phy_type = "hsic";
-		dr_mode = "host";
-		ahb-burst-config = <0x0>;
-		tx-burst-size-dword = <0x10>;
-		rx-burst-size-dword = <0x10>;
-		pinctrl-names = "idle", "active";
-		pinctrl-0 = <&pinctrl_usbh2_idle>;
-		pinctrl-1 = <&pinctrl_usbh2_active>;
-		#address-cells = <1>;
-		#size-cells = <0>;
-
-		usbnet: smsc@1 {
-			compatible = "usb424,9730";
-			reg = <1>;
-		};
-	};
-- 
2.34.1

