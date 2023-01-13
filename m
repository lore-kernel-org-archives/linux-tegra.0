Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E85FCC61DB3
	for <linux-tegra@archiver.kernel.org>; Fri, 13 Jan 2023 15:17:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230034AbjAMPR3 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 13 Jan 2023 10:17:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37710 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229492AbjAMPQx (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 13 Jan 2023 10:16:53 -0500
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2080840BC;
        Fri, 13 Jan 2023 07:08:12 -0800 (PST)
Received: by mail-ej1-x635.google.com with SMTP id cf18so46619306ejb.5;
        Fri, 13 Jan 2023 07:08:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9vS7zEGbpIgjIQ3EyeViyWuTY2mWIBtCQOuRrZSPD3s=;
        b=HrwRVNZ7ixTnri5loHVg982lJTmM/hdAhy9QVAolJOo0iQg3BzspYi62ff/Gdj3Y58
         gqV58VuUKr5BZ5B7LLeCckAY8WAFW7Oc/aYywztLMn8waJZQnIDZCBMsZYy8dSFycbhD
         03ArRqDscJjLJ4kNyamuT2XT2BwvRdWo7QSnxR1YOlnalfS8nngPhGXouYNi6PsOTt+L
         URcNWZtFm+KekTA8b1MMRAiqfUzIifVsR0S8O1ylw2e6izckXmz5SowHfpW7SZnVfOs1
         wlcNAJodo/fBicyVl445Df8BY1G53pETRJcdI6H4aFbDTLnoec1cMelADAPxjAXveJCN
         RUbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9vS7zEGbpIgjIQ3EyeViyWuTY2mWIBtCQOuRrZSPD3s=;
        b=b+4djLvRxTjtn9XYwQHDThJ7oQsb4Ou+zMNtrPixJSBnMjCnqmOf4yOmscivuV+9rz
         eTif19ZhYnLXQpxF8TrsG6dCw6dwvao23Qgzja+hbM6djrwcYYpBdOrZOq1+xB2ldPBt
         AvmtmLX6+HNyoz36xCWJ1z4MnSk06bITKDjXcU3SCEbnHZGH8EUuhh3udHSnbJpeAFJj
         D3cVRdD0FwlsrvBJghsRaccips8O5oTlGWxcsRyi0o8mPpHYPfTo+m4XUKWh6Z560lh4
         Lv3+9+f8bVlxigAdZ8pm98EwELBIqWv0L7wUTSDM5NCi9egiGUehlRfs32AmQXg3iCk6
         oZDg==
X-Gm-Message-State: AFqh2kpUvrt6gg6x/0rmg/7Adrf+lOlD27laI+OFBNb3CVAtcw/uSPci
        MmKZ7uiKhURg/073PXQno9s=
X-Google-Smtp-Source: AMrXdXsbgLwRwoYENPaYHij2D9fX7nASczURLeKaUMSU8OkOXUf/EfjDnm4rEydv2Ef1xja6fnfoaA==
X-Received: by 2002:a17:906:d9c7:b0:84d:4923:366d with SMTP id qk7-20020a170906d9c700b0084d4923366dmr17939118ejb.44.1673622489277;
        Fri, 13 Jan 2023 07:08:09 -0800 (PST)
Received: from localhost (p200300e41f201d00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f20:1d00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id h10-20020a1709070b0a00b0084d4e9a13cbsm5468631ejl.221.2023.01.13.07.08.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jan 2023 07:08:08 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Jon Hunter <jonathanh@nvidia.com>, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: [PATCH v3] dt-bindings: phy: tegra-xusb: Convert to json-schema
Date:   Fri, 13 Jan 2023 16:08:04 +0100
Message-Id: <20230113150804.1272555-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Convert the Tegra XUSB pad controller bindings from free-form text
format to json-schema.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
Changes in v3:
- use | to keep paragraphs in multi-paragraph descriptions
- move additionalProperties to improve readability
- clarify that "status" can also be absent
- drop phandle and status properties
- remove quotes around references
- use dual licensing

Changes in v2:
- split up into multiple schemas

 .../phy/nvidia,tegra124-xusb-padctl.txt       | 779 -----------------
 .../phy/nvidia,tegra124-xusb-padctl.yaml      | 654 +++++++++++++++
 .../phy/nvidia,tegra186-xusb-padctl.yaml      | 544 ++++++++++++
 .../phy/nvidia,tegra194-xusb-padctl.yaml      | 630 ++++++++++++++
 .../phy/nvidia,tegra210-xusb-padctl.yaml      | 786 ++++++++++++++++++
 5 files changed, 2614 insertions(+), 779 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/phy/nvidia,tegra124-xusb-padctl.txt
 create mode 100644 Documentation/devicetree/bindings/phy/nvidia,tegra124-xusb-padctl.yaml
 create mode 100644 Documentation/devicetree/bindings/phy/nvidia,tegra186-xusb-padctl.yaml
 create mode 100644 Documentation/devicetree/bindings/phy/nvidia,tegra194-xusb-padctl.yaml
 create mode 100644 Documentation/devicetree/bindings/phy/nvidia,tegra210-xusb-padctl.yaml

diff --git a/Documentation/devicetree/bindings/phy/nvidia,tegra124-xusb-padctl.txt b/Documentation/devicetree/bindings/phy/nvidia,tegra124-xusb-padctl.txt
deleted file mode 100644
index b62397d2bb0c..000000000000
--- a/Documentation/devicetree/bindings/phy/nvidia,tegra124-xusb-padctl.txt
+++ /dev/null
@@ -1,779 +0,0 @@
-Device tree binding for NVIDIA Tegra XUSB pad controller
-========================================================
-
-The Tegra XUSB pad controller manages a set of I/O lanes (with differential
-signals) which connect directly to pins/pads on the SoC package. Each lane
-is controlled by a HW block referred to as a "pad" in the Tegra hardware
-documentation. Each such "pad" may control either one or multiple lanes,
-and thus contains any logic common to all its lanes. Each lane can be
-separately configured and powered up.
-
-Some of the lanes are high-speed lanes, which can be used for PCIe, SATA or
-super-speed USB. Other lanes are for various types of low-speed, full-speed
-or high-speed USB (such as UTMI, ULPI and HSIC). The XUSB pad controller
-contains a software-configurable mux that sits between the I/O controller
-ports (e.g. PCIe) and the lanes.
-
-In addition to per-lane configuration, USB 3.0 ports may require additional
-settings on a per-board basis.
-
-Pads will be represented as children of the top-level XUSB pad controller
-device tree node. Each lane exposed by the pad will be represented by its
-own subnode and can be referenced by users of the lane using the standard
-PHY bindings, as described by the phy-bindings.txt file in this directory.
-
-The Tegra hardware documentation refers to the connection between the XUSB
-pad controller and the XUSB controller as "ports". This is confusing since
-"port" is typically used to denote the physical USB receptacle. The device
-tree binding in this document uses the term "port" to refer to the logical
-abstraction of the signals that are routed to a USB receptacle (i.e. a PHY
-for the USB signal, the VBUS power supply, the USB 2.0 companion port for
-USB 3.0 receptacles, ...).
-
-Required properties:
---------------------
-- compatible: Must be:
-  - Tegra124: "nvidia,tegra124-xusb-padctl"
-  - Tegra132: "nvidia,tegra132-xusb-padctl", "nvidia,tegra124-xusb-padctl"
-  - Tegra210: "nvidia,tegra210-xusb-padctl"
-  - Tegra186: "nvidia,tegra186-xusb-padctl"
-  - Tegra194: "nvidia,tegra194-xusb-padctl"
-- reg: Physical base address and length of the controller's registers.
-- resets: Must contain an entry for each entry in reset-names.
-- reset-names: Must include the following entries:
-  - "padctl"
-
-For Tegra124:
-- avdd-pll-utmip-supply: UTMI PLL power supply. Must supply 1.8 V.
-- avdd-pll-erefe-supply: PLLE reference PLL power supply. Must supply 1.05 V.
-- avdd-pex-pll-supply: PCIe/USB3 PLL power supply. Must supply 1.05 V.
-- hvdd-pex-pll-e-supply: High-voltage PLLE power supply. Must supply 3.3 V.
-
-For Tegra210:
-- avdd-pll-utmip-supply: UTMI PLL power supply. Must supply 1.8 V.
-- avdd-pll-uerefe-supply: PLLE reference PLL power supply. Must supply 1.05 V.
-- dvdd-pex-pll-supply: PCIe/USB3 PLL power supply. Must supply 1.05 V.
-- hvdd-pex-pll-e-supply: High-voltage PLLE power supply. Must supply 1.8 V.
-- nvidia,pmc: phandle and specifier referring to the Tegra210 PMC node.
-
-For Tegra186:
-- avdd-pll-erefeut-supply: UPHY brick and reference clock as well as UTMI PHY
-  power supply. Must supply 1.8 V.
-- avdd-usb-supply: USB I/Os, VBUS, ID, REXT, D+/D- power supply. Must supply
-  3.3 V.
-- vclamp-usb-supply: Bias rail for USB pad. Must supply 1.8 V.
-- vddio-hsic-supply: HSIC PHY power supply. Must supply 1.2 V.
-
-For Tegra194:
-- avdd-usb-supply: USB I/Os, VBUS, ID, REXT, D+/D- power supply. Must supply
-  3.3 V.
-- vclamp-usb-supply: Bias rail for USB pad. Must supply 1.8 V.
-
-Pad nodes:
-==========
-
-A required child node named "pads" contains a list of subnodes, one for each
-of the pads exposed by the XUSB pad controller. Each pad may need additional
-resources that can be referenced in its pad node.
-
-The "status" property is used to enable or disable the use of a pad. If set
-to "disabled", the pad will not be used on the given board. In order to use
-the pad and any of its lanes, this property must be set to "okay".
-
-For Tegra124 and Tegra132, the following pads exist: usb2, ulpi, hsic, pcie
-and sata. No extra resources are required for operation of these pads.
-
-For Tegra210, the following pads exist: usb2, hsic, pcie and sata. Below is
-a description of the properties of each pad.
-
-UTMI pad:
----------
-
-Required properties:
-- clocks: Must contain an entry for each entry in clock-names.
-- clock-names: Must contain the following entries:
-  - "trk": phandle and specifier referring to the USB2 tracking clock
-
-HSIC pad:
----------
-
-Required properties:
-- clocks: Must contain an entry for each entry in clock-names.
-- clock-names: Must contain the following entries:
-  - "trk": phandle and specifier referring to the HSIC tracking clock
-
-PCIe pad:
----------
-
-Required properties:
-- clocks: Must contain an entry for each entry in clock-names.
-- clock-names: Must contain the following entries:
-  - "pll": phandle and specifier referring to the PLLE
-- resets: Must contain an entry for each entry in reset-names.
-- reset-names: Must contain the following entries:
-  - "phy": reset for the PCIe UPHY block
-
-SATA pad:
----------
-
-Required properties:
-- resets: Must contain an entry for each entry in reset-names.
-- reset-names: Must contain the following entries:
-  - "phy": reset for the SATA UPHY block
-
-
-PHY nodes:
-==========
-
-Each pad node has a child named "lanes" that contains one or more children of
-its own, each representing one of the lanes controlled by the pad.
-
-Required properties:
---------------------
-- status: Defines the operation status of the PHY. Valid values are:
-  - "disabled": the PHY is disabled
-  - "okay": the PHY is enabled
-- #phy-cells: Should be 0. Since each lane represents a single PHY, there is
-  no need for an additional specifier.
-- nvidia,function: The output function of the PHY. See below for a list of
-  valid functions per SoC generation.
-
-For Tegra124 and Tegra132, the list of valid PHY nodes is given below:
-- usb2: usb2-0, usb2-1, usb2-2
-  - functions: "snps", "xusb", "uart"
-- ulpi: ulpi-0
-  - functions: "snps", "xusb"
-- hsic: hsic-0, hsic-1
-  - functions: "snps", "xusb"
-- pcie: pcie-0, pcie-1, pcie-2, pcie-3, pcie-4
-  - functions: "pcie", "usb3-ss"
-- sata: sata-0
-  - functions: "usb3-ss", "sata"
-
-For Tegra210, the list of valid PHY nodes is given below:
-- usb2: usb2-0, usb2-1, usb2-2, usb2-3
-  - functions: "snps", "xusb", "uart"
-- hsic: hsic-0, hsic-1
-  - functions: "snps", "xusb"
-- pcie: pcie-0, pcie-1, pcie-2, pcie-3, pcie-4, pcie-5, pcie-6
-  - functions: "pcie-x1", "usb3-ss", "pcie-x4"
-- sata: sata-0
-  - functions: "usb3-ss", "sata"
-
-For Tegra194, the list of valid PHY nodes is given below:
-- usb2: usb2-0, usb2-1, usb2-2, usb2-3
-  - functions: "xusb"
-- usb3: usb3-0, usb3-1, usb3-2, usb3-3
-  - functions: "xusb"
-
-Port nodes:
-===========
-
-A required child node named "ports" contains a list of all the ports exposed
-by the XUSB pad controller. Per-port configuration is only required for USB.
-
-USB2 ports:
------------
-
-Required properties:
-- status: Defines the operation status of the port. Valid values are:
-  - "disabled": the port is disabled
-  - "okay": the port is enabled
-- mode: A string that determines the mode in which to run the port. Valid
-  values are:
-  - "host": for USB host mode
-  - "device": for USB device mode
-  - "otg": for USB OTG mode
-
-Required properties for OTG/Peripheral capable USB2 ports:
-- usb-role-switch: Boolean property to indicate that the port support OTG or
-  peripheral mode. If present, the port supports switching between USB host
-  and peripheral roles. Connector should be added as subnode.
-  See usb/usb-conn-gpio.txt.
-
-Optional properties:
-- nvidia,internal: A boolean property whose presence determines that a port
-  is internal. In the absence of this property the port is considered to be
-  external.
-- vbus-supply: phandle to a regulator supplying the VBUS voltage.
-
-ULPI ports:
------------
-
-Optional properties:
-- status: Defines the operation status of the port. Valid values are:
-  - "disabled": the port is disabled
-  - "okay": the port is enabled
-- nvidia,internal: A boolean property whose presence determines that a port
-  is internal. In the absence of this property the port is considered to be
-  external.
-- vbus-supply: phandle to a regulator supplying the VBUS voltage.
-
-HSIC ports:
------------
-
-Required properties:
-- status: Defines the operation status of the port. Valid values are:
-  - "disabled": the port is disabled
-  - "okay": the port is enabled
-
-Optional properties:
-- vbus-supply: phandle to a regulator supplying the VBUS voltage.
-
-Super-speed USB ports:
-----------------------
-
-Required properties:
-- status: Defines the operation status of the port. Valid values are:
-  - "disabled": the port is disabled
-  - "okay": the port is enabled
-- nvidia,usb2-companion: A single cell that specifies the physical port number
-  to map this super-speed USB port to. The range of valid port numbers varies
-  with the SoC generation:
-  - 0-2: for Tegra124 and Tegra132
-  - 0-3: for Tegra210
-
-Optional properties:
-- nvidia,internal: A boolean property whose presence determines that a port
-  is internal. In the absence of this property the port is considered to be
-  external.
-
-- maximum-speed: Only for Tegra194. A string property that specifies maximum
-  supported speed of a usb3 port. Valid values are:
-  - "super-speed-plus": default, the usb3 port supports USB 3.1 Gen 2 speed.
-  - "super-speed": the usb3 port supports USB 3.1 Gen 1 speed only.
-
-For Tegra124 and Tegra132, the XUSB pad controller exposes the following
-ports:
-- 3x USB2: usb2-0, usb2-1, usb2-2
-- 1x ULPI: ulpi-0
-- 2x HSIC: hsic-0, hsic-1
-- 2x super-speed USB: usb3-0, usb3-1
-
-For Tegra210, the XUSB pad controller exposes the following ports:
-- 4x USB2: usb2-0, usb2-1, usb2-2, usb2-3
-- 2x HSIC: hsic-0, hsic-1
-- 4x super-speed USB: usb3-0, usb3-1, usb3-2, usb3-3
-
-For Tegra194, the XUSB pad controller exposes the following ports:
-- 4x USB2: usb2-0, usb2-1, usb2-2, usb2-3
-- 4x super-speed USB: usb3-0, usb3-1, usb3-2, usb3-3
-
-Examples:
-=========
-
-Tegra124 and Tegra132:
-----------------------
-
-SoC include:
-
-	padctl@7009f000 {
-		/* for Tegra124 */
-		compatible = "nvidia,tegra124-xusb-padctl";
-		/* for Tegra132 */
-		compatible = "nvidia,tegra132-xusb-padctl",
-			     "nvidia,tegra124-xusb-padctl";
-		reg = <0x0 0x7009f000 0x0 0x1000>;
-		resets = <&tegra_car 142>;
-		reset-names = "padctl";
-
-		pads {
-			usb2 {
-				status = "disabled";
-
-				lanes {
-					usb2-0 {
-						status = "disabled";
-						#phy-cells = <0>;
-					};
-
-					usb2-1 {
-						status = "disabled";
-						#phy-cells = <0>;
-					};
-
-					usb2-2 {
-						status = "disabled";
-						#phy-cells = <0>;
-					};
-				};
-			};
-
-			ulpi {
-				status = "disabled";
-
-				lanes {
-					ulpi-0 {
-						status = "disabled";
-						#phy-cells = <0>;
-					};
-				};
-			};
-
-			hsic {
-				status = "disabled";
-
-				lanes {
-					hsic-0 {
-						status = "disabled";
-						#phy-cells = <0>;
-					};
-
-					hsic-1 {
-						status = "disabled";
-						#phy-cells = <0>;
-					};
-				};
-			};
-
-			pcie {
-				status = "disabled";
-
-				lanes {
-					pcie-0 {
-						status = "disabled";
-						#phy-cells = <0>;
-					};
-
-					pcie-1 {
-						status = "disabled";
-						#phy-cells = <0>;
-					};
-
-					pcie-2 {
-						status = "disabled";
-						#phy-cells = <0>;
-					};
-
-					pcie-3 {
-						status = "disabled";
-						#phy-cells = <0>;
-					};
-
-					pcie-4 {
-						status = "disabled";
-						#phy-cells = <0>;
-					};
-				};
-			};
-
-			sata {
-				status = "disabled";
-
-				lanes {
-					sata-0 {
-						status = "disabled";
-						#phy-cells = <0>;
-					};
-				};
-			};
-		};
-
-		ports {
-			usb2-0 {
-				status = "disabled";
-			};
-
-			usb2-1 {
-				status = "disabled";
-			};
-
-			usb2-2 {
-				status = "disabled";
-			};
-
-			ulpi-0 {
-				status = "disabled";
-			};
-
-			hsic-0 {
-				status = "disabled";
-			};
-
-			hsic-1 {
-				status = "disabled";
-			};
-
-			usb3-0 {
-				status = "disabled";
-			};
-
-			usb3-1 {
-				status = "disabled";
-			};
-		};
-	};
-
-Board file:
-
-	padctl@7009f000 {
-		status = "okay";
-
-		pads {
-			usb2 {
-				status = "okay";
-
-				lanes {
-					usb2-0 {
-						nvidia,function = "xusb";
-						status = "okay";
-					};
-
-					usb2-1 {
-						nvidia,function = "xusb";
-						status = "okay";
-					};
-
-					usb2-2 {
-						nvidia,function = "xusb";
-						status = "okay";
-					};
-				};
-			};
-
-			pcie {
-				status = "okay";
-
-				lanes {
-					pcie-0 {
-						nvidia,function = "usb3-ss";
-						status = "okay";
-					};
-
-					pcie-2 {
-						nvidia,function = "pcie";
-						status = "okay";
-					};
-
-					pcie-4 {
-						nvidia,function = "pcie";
-						status = "okay";
-					};
-				};
-			};
-
-			sata {
-				status = "okay";
-
-				lanes {
-					sata-0 {
-						nvidia,function = "sata";
-						status = "okay";
-					};
-				};
-			};
-		};
-
-		ports {
-			/* Micro A/B */
-			usb2-0 {
-				status = "okay";
-				mode = "otg";
-			};
-
-			/* Mini PCIe */
-			usb2-1 {
-				status = "okay";
-				mode = "host";
-			};
-
-			/* USB3 */
-			usb2-2 {
-				status = "okay";
-				mode = "host";
-
-				vbus-supply = <&vdd_usb3_vbus>;
-			};
-
-			usb3-0 {
-				nvidia,port = <2>;
-				status = "okay";
-			};
-		};
-	};
-
-Tegra210:
----------
-
-SoC include:
-
-	padctl@7009f000 {
-		compatible = "nvidia,tegra210-xusb-padctl";
-		reg = <0x0 0x7009f000 0x0 0x1000>;
-		resets = <&tegra_car 142>;
-		reset-names = "padctl";
-
-		status = "disabled";
-
-		pads {
-			usb2 {
-				clocks = <&tegra_car TEGRA210_CLK_USB2_TRK>;
-				clock-names = "trk";
-				status = "disabled";
-
-				lanes {
-					usb2-0 {
-						status = "disabled";
-						#phy-cells = <0>;
-					};
-
-					usb2-1 {
-						status = "disabled";
-						#phy-cells = <0>;
-					};
-
-					usb2-2 {
-						status = "disabled";
-						#phy-cells = <0>;
-					};
-
-					usb2-3 {
-						status = "disabled";
-						#phy-cells = <0>;
-					};
-				};
-			};
-
-			hsic {
-				clocks = <&tegra_car TEGRA210_CLK_HSIC_TRK>;
-				clock-names = "trk";
-				status = "disabled";
-
-				lanes {
-					hsic-0 {
-						status = "disabled";
-						#phy-cells = <0>;
-					};
-
-					hsic-1 {
-						status = "disabled";
-						#phy-cells = <0>;
-					};
-				};
-			};
-
-			pcie {
-				clocks = <&tegra_car TEGRA210_CLK_PLL_E>;
-				clock-names = "pll";
-				resets = <&tegra_car 205>;
-				reset-names = "phy";
-				status = "disabled";
-
-				lanes {
-					pcie-0 {
-						status = "disabled";
-						#phy-cells = <0>;
-					};
-
-					pcie-1 {
-						status = "disabled";
-						#phy-cells = <0>;
-					};
-
-					pcie-2 {
-						status = "disabled";
-						#phy-cells = <0>;
-					};
-
-					pcie-3 {
-						status = "disabled";
-						#phy-cells = <0>;
-					};
-
-					pcie-4 {
-						status = "disabled";
-						#phy-cells = <0>;
-					};
-
-					pcie-5 {
-						status = "disabled";
-						#phy-cells = <0>;
-					};
-
-					pcie-6 {
-						status = "disabled";
-						#phy-cells = <0>;
-					};
-				};
-			};
-
-			sata {
-				clocks = <&tegra_car TEGRA210_CLK_PLL_E>;
-				clock-names = "pll";
-				resets = <&tegra_car 204>;
-				reset-names = "phy";
-				status = "disabled";
-
-				lanes {
-					sata-0 {
-						status = "disabled";
-						#phy-cells = <0>;
-					};
-				};
-			};
-		};
-
-		ports {
-			usb2-0 {
-				status = "disabled";
-			};
-
-			usb2-1 {
-				status = "disabled";
-			};
-
-			usb2-2 {
-				status = "disabled";
-			};
-
-			usb2-3 {
-				status = "disabled";
-			};
-
-			hsic-0 {
-				status = "disabled";
-			};
-
-			hsic-1 {
-				status = "disabled";
-			};
-
-			usb3-0 {
-				status = "disabled";
-			};
-
-			usb3-1 {
-				status = "disabled";
-			};
-
-			usb3-2 {
-				status = "disabled";
-			};
-
-			usb3-3 {
-				status = "disabled";
-			};
-		};
-	};
-
-Board file:
-
-	padctl@7009f000 {
-		status = "okay";
-
-		pads {
-			usb2 {
-				status = "okay";
-
-				lanes {
-					usb2-0 {
-						nvidia,function = "xusb";
-						status = "okay";
-					};
-
-					usb2-1 {
-						nvidia,function = "xusb";
-						status = "okay";
-					};
-
-					usb2-2 {
-						nvidia,function = "xusb";
-						status = "okay";
-					};
-
-					usb2-3 {
-						nvidia,function = "xusb";
-						status = "okay";
-					};
-				};
-			};
-
-			pcie {
-				status = "okay";
-
-				lanes {
-					pcie-0 {
-						nvidia,function = "pcie-x1";
-						status = "okay";
-					};
-
-					pcie-1 {
-						nvidia,function = "pcie-x4";
-						status = "okay";
-					};
-
-					pcie-2 {
-						nvidia,function = "pcie-x4";
-						status = "okay";
-					};
-
-					pcie-3 {
-						nvidia,function = "pcie-x4";
-						status = "okay";
-					};
-
-					pcie-4 {
-						nvidia,function = "pcie-x4";
-						status = "okay";
-					};
-
-					pcie-5 {
-						nvidia,function = "usb3-ss";
-						status = "okay";
-					};
-
-					pcie-6 {
-						nvidia,function = "usb3-ss";
-						status = "okay";
-					};
-				};
-			};
-
-			sata {
-				status = "okay";
-
-				lanes {
-					sata-0 {
-						nvidia,function = "sata";
-						status = "okay";
-					};
-				};
-			};
-		};
-
-		ports {
-			usb2-0 {
-				status = "okay";
-				mode = "otg";
-			};
-
-			usb2-1 {
-				status = "okay";
-				vbus-supply = <&vdd_5v0_rtl>;
-				mode = "host";
-			};
-
-			usb2-2 {
-				status = "okay";
-				vbus-supply = <&vdd_usb_vbus>;
-				mode = "host";
-			};
-
-			usb2-3 {
-				status = "okay";
-				mode = "host";
-			};
-
-			usb3-0 {
-				status = "okay";
-				nvidia,lanes = "pcie-6";
-				nvidia,port = <1>;
-			};
-
-			usb3-1 {
-				status = "okay";
-				nvidia,lanes = "pcie-5";
-				nvidia,port = <2>;
-			};
-		};
-	};
diff --git a/Documentation/devicetree/bindings/phy/nvidia,tegra124-xusb-padctl.yaml b/Documentation/devicetree/bindings/phy/nvidia,tegra124-xusb-padctl.yaml
new file mode 100644
index 000000000000..33b41b6b2fd5
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/nvidia,tegra124-xusb-padctl.yaml
@@ -0,0 +1,654 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/phy/nvidia,tegra124-xusb-padctl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NVIDIA Tegra124 XUSB pad controller
+
+maintainers:
+  - Thierry Reding <thierry.reding@gmail.com>
+  - Jon Hunter <jonathanh@nvidia.com>
+
+description: |
+  The Tegra XUSB pad controller manages a set of I/O lanes (with differential
+  signals) which connect directly to pins/pads on the SoC package. Each lane
+  is controlled by a HW block referred to as a "pad" in the Tegra hardware
+  documentation. Each such "pad" may control either one or multiple lanes,
+  and thus contains any logic common to all its lanes. Each lane can be
+  separately configured and powered up.
+
+  Some of the lanes are high-speed lanes, which can be used for PCIe, SATA or
+  super-speed USB. Other lanes are for various types of low-speed, full-speed
+  or high-speed USB (such as UTMI, ULPI and HSIC). The XUSB pad controller
+  contains a software-configurable mux that sits between the I/O controller
+  ports (e.g. PCIe) and the lanes.
+
+  In addition to per-lane configuration, USB 3.0 ports may require additional
+  settings on a per-board basis.
+
+  Pads will be represented as children of the top-level XUSB pad controller
+  device tree node. Each lane exposed by the pad will be represented by its
+  own subnode and can be referenced by users of the lane using the standard
+  PHY bindings, as described by the phy-bindings.txt file in this directory.
+
+  The Tegra hardware documentation refers to the connection between the XUSB
+  pad controller and the XUSB controller as "ports". This is confusing since
+  "port" is typically used to denote the physical USB receptacle. The device
+  tree binding in this document uses the term "port" to refer to the logical
+  abstraction of the signals that are routed to a USB receptacle (i.e. a PHY
+  for the USB signal, the VBUS power supply, the USB 2.0 companion port for
+  USB 3.0 receptacles, ...).
+
+properties:
+  compatible:
+    oneOf:
+      - enum:
+          - nvidia,tegra124-xusb-padctl
+
+      - items:
+          - const: nvidia,tegra132-xusb-padctl
+          - const: nvidia,tegra124-xusb-padctl
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    items:
+      - description: XUSB pad controller interrupt
+
+  resets:
+    items:
+      - description: pad controller reset
+
+  reset-names:
+    items:
+      - const: padctl
+
+  avdd-pll-utmip-supply:
+    description: UTMI PLL power supply. Must supply 1.8 V.
+
+  avdd-pll-erefe-supply:
+    description: PLLE reference PLL power supply. Must supply 1.05 V.
+
+  avdd-pex-pll-supply:
+    description: PCIe/USB3 PLL power supply. Must supply 1.05 V.
+
+  hvdd-pex-pll-e-supply:
+    description: High-voltage PLLE power supply. Must supply 3.3 V.
+
+  pads:
+    description: A required child node named "pads" contains a list of
+      subnodes, one for each of the pads exposed by the XUSB pad controller.
+      Each pad may need additional resources that can be referenced in its
+      pad node.
+
+      The "status" property is used to enable or disable the use of a pad.
+      If set to "disabled", the pad will not be used on the given board. In
+      order to use the pad and any of its lanes, this property must be set
+      to "okay" or be absent.
+    type: object
+    additionalProperties: false
+    properties:
+      usb2:
+        type: object
+        additionalProperties: false
+        properties:
+          clocks:
+            items:
+              - description: USB2 tracking clock
+
+          clock-names:
+            items:
+              - const: trk
+
+          lanes:
+            type: object
+            additionalProperties: false
+            properties:
+              usb2-0:
+                type: object
+                additionalProperties: false
+                properties:
+                  "#phy-cells":
+                    const: 0
+
+                  nvidia,function:
+                    description: Function selection for this lane.
+                    $ref: /schemas/types.yaml#/definitions/string
+                    enum: [ snps, xusb, uart ]
+
+              usb2-1:
+                type: object
+                additionalProperties: false
+                properties:
+                  "#phy-cells":
+                    const: 0
+
+                  nvidia,function:
+                    description: Function selection for this lane.
+                    $ref: /schemas/types.yaml#/definitions/string
+                    enum: [ snps, xusb, uart ]
+
+              usb2-2:
+                type: object
+                additionalProperties: false
+                properties:
+                  "#phy-cells":
+                    const: 0
+
+                  nvidia,function:
+                    description: Function selection for this lane.
+                    $ref: /schemas/types.yaml#/definitions/string
+                    enum: [ snps, xusb, uart ]
+
+      ulpi:
+        type: object
+        additionalProperties: false
+        properties:
+          lanes:
+            type: object
+            additionalProperties: false
+            properties:
+              ulpi-0:
+                type: object
+                additionalProperties: false
+                properties:
+                  "#phy-cells":
+                    const: 0
+
+                  nvidia,function:
+                    description: Function selection for this lane.
+                    $ref: /schemas/types.yaml#/definitions/string
+                    enum: [ snps, xusb ]
+
+      hsic:
+        type: object
+        additionalProperties: false
+        properties:
+          clocks:
+            items:
+              - description: HSIC tracking clock
+
+          clock-names:
+            items:
+              - const: trk
+
+          lanes:
+            type: object
+            additionalProperties: false
+            properties:
+              hsic-0:
+                type: object
+                additionalProperties: false
+                properties:
+                  "#phy-cells":
+                    const: 0
+
+                  nvidia,function:
+                    description: Function selection for this lane.
+                    $ref: /schemas/types.yaml#/definitions/string
+                    enum: [ snps, xusb ]
+
+              hsic-1:
+                type: object
+                additionalProperties: false
+                properties:
+                  "#phy-cells":
+                    const: 0
+
+                  nvidia,function:
+                    description: Function selection for this lane.
+                    $ref: /schemas/types.yaml#/definitions/string
+                    enum: [ snps, xusb ]
+
+      pcie:
+        type: object
+        additionalProperties: false
+        properties:
+          clocks:
+            items:
+              - description: PLLE clock
+
+          clock-names:
+            items:
+              - const: pll
+
+          resets:
+            items:
+              - description: reset for the PCIe UPHY block
+
+          reset-names:
+            items:
+              - const: phy
+
+          lanes:
+            type: object
+            additionalProperties: false
+            properties:
+              pcie-0:
+                type: object
+                additionalProperties: false
+                properties:
+                  "#phy-cells":
+                    const: 0
+
+                  nvidia,function:
+                    description: Function selection for this lane.
+                    $ref: /schemas/types.yaml#/definitions/string
+                    enum: [ pcie, usb3-ss ]
+
+              pcie-1:
+                type: object
+                additionalProperties: false
+                properties:
+                  "#phy-cells":
+                    const: 0
+
+                  nvidia,function:
+                    description: Function selection for this lane.
+                    $ref: /schemas/types.yaml#/definitions/string
+                    enum: [ pcie, usb3-ss ]
+
+              pcie-2:
+                type: object
+                additionalProperties: false
+                properties:
+                  "#phy-cells":
+                    const: 0
+
+                  nvidia,function:
+                    description: Function selection for this lane.
+                    $ref: /schemas/types.yaml#/definitions/string
+                    enum: [ pcie, usb3-ss ]
+
+              pcie-3:
+                type: object
+                additionalProperties: false
+                properties:
+                  "#phy-cells":
+                    const: 0
+
+                  nvidia,function:
+                    description: Function selection for this lane.
+                    $ref: /schemas/types.yaml#/definitions/string
+                    enum: [ pcie, usb3-ss ]
+
+              pcie-4:
+                type: object
+                additionalProperties: false
+                properties:
+                  "#phy-cells":
+                    const: 0
+
+                  nvidia,function:
+                    description: Function selection for this lane.
+                    $ref: /schemas/types.yaml#/definitions/string
+                    enum: [ pcie, usb3-ss ]
+
+      sata:
+        type: object
+        additionalProperties: false
+        properties:
+          resets:
+            items:
+              - description: reset for the SATA UPHY block
+
+          reset-names:
+            items:
+              - const: phy
+
+          lanes:
+            type: object
+            additionalProperties: false
+            properties:
+              sata-0:
+                type: object
+                additionalProperties: false
+                properties:
+                  "#phy-cells":
+                    const: 0
+
+                  nvidia,function:
+                    description: Function selection for this lane.
+                    $ref: /schemas/types.yaml#/definitions/string
+                    enum: [ sata, usb3-ss ]
+
+  ports:
+    description: A required child node named "ports" contains a list of
+      subnodes, one for each of the ports exposed by the XUSB pad controller.
+      Each port may need additional resources that can be referenced in its
+      port node.
+
+      The "status" property is used to enable or disable the use of a port.
+      If set to "disabled", the port will not be used on the given board. In
+      order to use the port, this property must be set to "okay".
+    type: object
+    additionalProperties: false
+    properties:
+      usb2-0:
+        type: object
+        additionalProperties: false
+        properties:
+          # no need to further describe this because the connector will
+          # match on gpio-usb-b-connector or usb-b-connector and cause
+          # that binding to be selected for the subnode
+          connector:
+            type: object
+
+          mode:
+            description: A string that determines the mode in which to
+              run the port.
+            $ref: /schemas/types.yaml#/definitions/string
+            enum: [ host, peripheral, otg ]
+
+          nvidia,internal:
+            description: A boolean property whose presence determines
+              that a port is internal. In the absence of this property
+              the port is considered to be external.
+            $ref: /schemas/types.yaml#/definitions/flag
+
+          usb-role-switch:
+            description: |
+              A boolean property whole presence indicates that the port
+              supports OTG or peripheral mode. If present, the port
+              supports switching between USB host and peripheral roles.
+              A connector must be added as a subnode in that case.
+
+              See ../connector/usb-connector.yaml.
+
+          vbus-supply:
+            description: A phandle to the regulator supplying the VBUS
+              voltage.
+
+      usb2-1:
+        type: object
+        additionalProperties: false
+        properties:
+          # no need to further describe this because the connector will
+          # match on gpio-usb-b-connector or usb-b-connector and cause
+          # that binding to be selected for the subnode
+          connector:
+            type: object
+
+          mode:
+            description: A string that determines the mode in which to
+              run the port.
+            $ref: /schemas/types.yaml#/definitions/string
+            enum: [ host, peripheral, otg ]
+
+          nvidia,internal:
+            description: A boolean property whose presence determines
+              that a port is internal. In the absence of this property
+              the port is considered to be external.
+            $ref: /schemas/types.yaml#/definitions/flag
+
+          usb-role-switch:
+            description: |
+              A boolean property whole presence indicates that the port
+              supports OTG or peripheral mode. If present, the port
+              supports switching between USB host and peripheral roles.
+              A connector must be added as a subnode in that case.
+
+              See ../connector/usb-connector.yaml.
+
+          vbus-supply:
+            description: A phandle to the regulator supplying the VBUS
+              voltage.
+
+      usb2-2:
+        type: object
+        additionalProperties: false
+        properties:
+          # no need to further describe this because the connector will
+          # match on gpio-usb-b-connector or usb-b-connector and cause
+          # that binding to be selected for the subnode
+          connector:
+            type: object
+
+          mode:
+            description: A string that determines the mode in which to
+              run the port.
+            $ref: /schemas/types.yaml#/definitions/string
+            enum: [ host, peripheral, otg ]
+
+          nvidia,internal:
+            description: A boolean property whose presence determines
+              that a port is internal. In the absence of this property
+              the port is considered to be external.
+            $ref: /schemas/types.yaml#/definitions/flag
+
+          usb-role-switch:
+            description: |
+              A boolean property whole presence indicates that the port
+              supports OTG or peripheral mode. If present, the port
+              supports switching between USB host and peripheral roles.
+              A connector must be added as a subnode in that case.
+
+              See ../connector/usb-connector.yaml.
+
+          vbus-supply:
+            description: A phandle to the regulator supplying the VBUS
+              voltage.
+
+      ulpi-0:
+        type: object
+        additionalProperties: false
+        properties:
+          nvidia,internal:
+            description: A boolean property whose presence determines
+              that a port is internal. In the absence of this property
+              the port is considered to be external.
+            $ref: /schemas/types.yaml#/definitions/flag
+
+          vbus-supply:
+            description: A phandle to the regulator supplying the VBUS
+              voltage.
+
+      hsic-0:
+        type: object
+        additionalProperties: false
+        properties:
+          vbus-supply:
+            description: A phandle to the regulator supplying the VBUS
+              voltage.
+
+      hsic-1:
+        type: object
+        additionalProperties: false
+        properties:
+          vbus-supply:
+            description: A phandle to the regulator supplying the VBUS
+              voltage.
+
+      usb3-0:
+        type: object
+        additionalProperties: false
+        properties:
+          nvidia,internal:
+            description: A boolean property whose presence determines
+              that a port is internal. In the absence of this property
+              the port is considered to be external.
+            $ref: /schemas/types.yaml#/definitions/flag
+
+          nvidia,usb2-companion:
+            description: A single cell that specifies the physical port
+              number to map this super-speed USB port to. The range of
+              valid port numbers varies with the SoC generation.
+            $ref: /schemas/types.yaml#/definitions/uint32
+            enum: [ 0, 1, 2 ]
+
+          vbus-supply:
+            description: A phandle to the regulator supplying the VBUS
+              voltage.
+
+      usb3-1:
+        type: object
+        additionalProperties: false
+        properties:
+          nvidia,internal:
+            description: A boolean property whose presence determines
+              that a port is internal. In the absence of this property
+              the port is considered to be external.
+            $ref: /schemas/types.yaml#/definitions/flag
+
+          nvidia,usb2-companion:
+            description: A single cell that specifies the physical port
+              number to map this super-speed USB port to. The range of
+              valid port numbers varies with the SoC generation.
+            $ref: /schemas/types.yaml#/definitions/uint32
+            enum: [ 0, 1, 2 ]
+
+          vbus-supply:
+            description: A phandle to the regulator supplying the VBUS
+              voltage.
+
+additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - resets
+  - reset-names
+  - avdd-pll-utmip-supply
+  - avdd-pll-erefe-supply
+  - avdd-pex-pll-supply
+  - hvdd-pex-pll-e-supply
+
+examples:
+  # Tegra124 and Tegra132
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    padctl@7009f000 {
+        compatible = "nvidia,tegra124-xusb-padctl";
+        reg = <0x7009f000 0x1000>;
+        interrupts = <GIC_SPI 20 IRQ_TYPE_LEVEL_HIGH>;
+        resets = <&tegra_car 142>;
+        reset-names = "padctl";
+
+        avdd-pll-utmip-supply = <&vddio_1v8>;
+        avdd-pll-erefe-supply = <&avdd_1v05_run>;
+        avdd-pex-pll-supply = <&vdd_1v05_run>;
+        hvdd-pex-pll-e-supply = <&vdd_3v3_lp0>;
+
+        pads {
+            usb2 {
+                lanes {
+                    usb2-0 {
+                        nvidia,function = "xusb";
+                        #phy-cells = <0>;
+                    };
+
+                    usb2-1 {
+                        nvidia,function = "xusb";
+                        #phy-cells = <0>;
+                    };
+
+                    usb2-2 {
+                        nvidia,function = "xusb";
+                        #phy-cells = <0>;
+                    };
+                };
+            };
+
+            ulpi {
+                lanes {
+                    ulpi-0 {
+                        status = "disabled";
+                        #phy-cells = <0>;
+                    };
+                };
+            };
+
+            hsic {
+                lanes {
+                    hsic-0 {
+                        status = "disabled";
+                        #phy-cells = <0>;
+                    };
+
+                    hsic-1 {
+                        status = "disabled";
+                        #phy-cells = <0>;
+                    };
+                };
+            };
+
+            pcie {
+                lanes {
+                    pcie-0 {
+                        nvidia,function = "usb3-ss";
+                        #phy-cells = <0>;
+                    };
+
+                    pcie-1 {
+                        status = "disabled";
+                        #phy-cells = <0>;
+                    };
+
+                    pcie-2 {
+                        nvidia,function = "pcie";
+                        #phy-cells = <0>;
+                    };
+
+                    pcie-3 {
+                        status = "disabled";
+                        #phy-cells = <0>;
+                    };
+
+                    pcie-4 {
+                        nvidia,function = "pcie";
+                        #phy-cells = <0>;
+                    };
+                };
+            };
+
+            sata {
+                lanes {
+                    sata-0 {
+                        nvidia,function = "sata";
+                        #phy-cells = <0>;
+                    };
+                };
+            };
+        };
+
+        ports {
+            /* Micro A/B */
+            usb2-0 {
+                mode = "otg";
+            };
+
+            /* Mini PCIe */
+            usb2-1 {
+                mode = "host";
+            };
+
+            /* USB3 */
+            usb2-2 {
+                vbus-supply = <&vdd_usb3_vbus>;
+                mode = "host";
+            };
+
+            ulpi-0 {
+                status = "disabled";
+            };
+
+            hsic-0 {
+                status = "disabled";
+            };
+
+            hsic-1 {
+                status = "disabled";
+            };
+
+            usb3-0 {
+                nvidia,usb2-companion = <2>;
+            };
+
+            usb3-1 {
+                status = "disabled";
+            };
+        };
+    };
diff --git a/Documentation/devicetree/bindings/phy/nvidia,tegra186-xusb-padctl.yaml b/Documentation/devicetree/bindings/phy/nvidia,tegra186-xusb-padctl.yaml
new file mode 100644
index 000000000000..8b1d5a8529e3
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/nvidia,tegra186-xusb-padctl.yaml
@@ -0,0 +1,544 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/phy/nvidia,tegra186-xusb-padctl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NVIDIA Tegra186 XUSB pad controller
+
+maintainers:
+  - Thierry Reding <thierry.reding@gmail.com>
+  - Jon Hunter <jonathanh@nvidia.com>
+
+description: |
+  The Tegra XUSB pad controller manages a set of I/O lanes (with differential
+  signals) which connect directly to pins/pads on the SoC package. Each lane
+  is controlled by a HW block referred to as a "pad" in the Tegra hardware
+  documentation. Each such "pad" may control either one or multiple lanes,
+  and thus contains any logic common to all its lanes. Each lane can be
+  separately configured and powered up.
+
+  Some of the lanes are high-speed lanes, which can be used for PCIe, SATA or
+  super-speed USB. Other lanes are for various types of low-speed, full-speed
+  or high-speed USB (such as UTMI, ULPI and HSIC). The XUSB pad controller
+  contains a software-configurable mux that sits between the I/O controller
+  ports (e.g. PCIe) and the lanes.
+
+  In addition to per-lane configuration, USB 3.0 ports may require additional
+  settings on a per-board basis.
+
+  Pads will be represented as children of the top-level XUSB pad controller
+  device tree node. Each lane exposed by the pad will be represented by its
+  own subnode and can be referenced by users of the lane using the standard
+  PHY bindings, as described by the phy-bindings.txt file in this directory.
+
+  The Tegra hardware documentation refers to the connection between the XUSB
+  pad controller and the XUSB controller as "ports". This is confusing since
+  "port" is typically used to denote the physical USB receptacle. The device
+  tree binding in this document uses the term "port" to refer to the logical
+  abstraction of the signals that are routed to a USB receptacle (i.e. a PHY
+  for the USB signal, the VBUS power supply, the USB 2.0 companion port for
+  USB 3.0 receptacles, ...).
+
+properties:
+  compatible:
+    const: nvidia,tegra186-xusb-padctl
+
+  reg:
+    items:
+      - description: pad controller registers
+      - description: AO registers
+
+  interrupts:
+    items:
+      - description: XUSB pad controller interrupt
+
+  reg-names:
+    items:
+      - const: padctl
+      - const: ao
+
+  resets:
+    items:
+      - description: pad controller reset
+
+  reset-names:
+    items:
+      - const: padctl
+
+  avdd-pll-erefeut-supply:
+    description: UPHY brick and reference clock as well as UTMI PHY
+      power supply. Must supply 1.8 V.
+
+  avdd-usb-supply:
+    description: USB I/Os, VBUS, ID, REXT, D+/D- power supply. Must
+      supply 3.3 V.
+
+  vclamp-usb-supply:
+    description: Bias rail for USB pad. Must supply 1.8 V.
+
+  vddio-hsic-supply:
+    description: HSIC PHY power supply. Must supply 1.2 V.
+
+  pads:
+    description: A required child node named "pads" contains a list of
+      subnodes, one for each of the pads exposed by the XUSB pad controller.
+      Each pad may need additional resources that can be referenced in its
+      pad node.
+
+      The "status" property is used to enable or disable the use of a pad.
+      If set to "disabled", the pad will not be used on the given board. In
+      order to use the pad and any of its lanes, this property must be set
+      to "okay" or be absent.
+    type: object
+    additionalProperties: false
+    properties:
+      usb2:
+        type: object
+        additionalProperties: false
+        properties:
+          clocks:
+            items:
+              - description: USB2 tracking clock
+
+          clock-names:
+            items:
+              - const: trk
+
+          lanes:
+            type: object
+            additionalProperties: false
+            properties:
+              usb2-0:
+                type: object
+                additionalProperties: false
+                properties:
+                  "#phy-cells":
+                    const: 0
+
+                  nvidia,function:
+                    description: Function selection for this lane.
+                    $ref: /schemas/types.yaml#/definitions/string
+                    enum: [ xusb ]
+
+              usb2-1:
+                type: object
+                additionalProperties: false
+                properties:
+                  "#phy-cells":
+                    const: 0
+
+                  nvidia,function:
+                    description: Function selection for this lane.
+                    $ref: /schemas/types.yaml#/definitions/string
+                    enum: [ xusb ]
+
+              usb2-2:
+                type: object
+                additionalProperties: false
+                properties:
+                  "#phy-cells":
+                    const: 0
+
+                  nvidia,function:
+                    description: Function selection for this lane.
+                    $ref: /schemas/types.yaml#/definitions/string
+                    enum: [ xusb ]
+
+      hsic:
+        type: object
+        additionalProperties: false
+        properties:
+          clocks:
+            items:
+              - description: HSIC tracking clock
+
+          clock-names:
+            items:
+              - const: trk
+
+          lanes:
+            type: object
+            additionalProperties: false
+            properties:
+              hsic-0:
+                type: object
+                additionalProperties: false
+                properties:
+                  "#phy-cells":
+                    const: 0
+
+                  nvidia,function:
+                    description: Function selection for this lane.
+                    $ref: /schemas/types.yaml#/definitions/string
+                    enum: [ xusb ]
+
+      usb3:
+        type: object
+        additionalProperties: false
+        properties:
+          lanes:
+            type: object
+            additionalProperties: false
+            properties:
+              usb3-0:
+                type: object
+                additionalProperties: false
+                properties:
+                  "#phy-cells":
+                    const: 0
+
+                  nvidia,function:
+                    description: Function selection for this lane.
+                    $ref: /schemas/types.yaml#/definitions/string
+                    enum: [ xusb ]
+
+              usb3-1:
+                type: object
+                additionalProperties: false
+                properties:
+                  "#phy-cells":
+                    const: 0
+
+                  nvidia,function:
+                    description: Function selection for this lane.
+                    $ref: /schemas/types.yaml#/definitions/string
+                    enum: [ xusb ]
+
+              usb3-2:
+                type: object
+                additionalProperties: false
+                properties:
+                  "#phy-cells":
+                    const: 0
+
+                  nvidia,function:
+                    description: Function selection for this lane.
+                    $ref: /schemas/types.yaml#/definitions/string
+                    enum: [ xusb ]
+
+  ports:
+    description: A required child node named "ports" contains a list of
+      subnodes, one for each of the ports exposed by the XUSB pad controller.
+      Each port may need additional resources that can be referenced in its
+      port node.
+
+      The "status" property is used to enable or disable the use of a port.
+      If set to "disabled", the port will not be used on the given board. In
+      order to use the port, this property must be set to "okay".
+    type: object
+    additionalProperties: false
+    properties:
+      usb2-0:
+        type: object
+        additionalProperties: false
+        properties:
+          # no need to further describe this because the connector will
+          # match on gpio-usb-b-connector or usb-b-connector and cause
+          # that binding to be selected for the subnode
+          connector:
+            type: object
+
+          mode:
+            description: A string that determines the mode in which to
+              run the port.
+            $ref: /schemas/types.yaml#/definitions/string
+            enum: [ host, peripheral, otg ]
+
+          nvidia,internal:
+            description: A boolean property whose presence determines
+              that a port is internal. In the absence of this property
+              the port is considered to be external.
+            $ref: /schemas/types.yaml#/definitions/flag
+
+          usb-role-switch:
+            description: |
+              A boolean property whole presence indicates that the port
+              supports OTG or peripheral mode. If present, the port
+              supports switching between USB host and peripheral roles.
+              A connector must be added as a subnode in that case.
+
+              See ../connector/usb-connector.yaml.
+
+          vbus-supply:
+            description: A phandle to the regulator supplying the VBUS
+              voltage.
+
+        dependencies:
+          usb-role-switch: [ connector ]
+
+      usb2-1:
+        type: object
+        additionalProperties: false
+        properties:
+          # no need to further describe this because the connector will
+          # match on gpio-usb-b-connector or usb-b-connector and cause
+          # that binding to be selected for the subnode
+          connector:
+            type: object
+
+          mode:
+            description: A string that determines the mode in which to
+              run the port.
+            $ref: /schemas/types.yaml#/definitions/string
+            enum: [ host, peripheral, otg ]
+
+          nvidia,internal:
+            description: A boolean property whose presence determines
+              that a port is internal. In the absence of this property
+              the port is considered to be external.
+            $ref: /schemas/types.yaml#/definitions/flag
+
+          usb-role-switch:
+            description: |
+              A boolean property whole presence indicates that the port
+              supports OTG or peripheral mode. If present, the port
+              supports switching between USB host and peripheral roles.
+              A connector must be added as a subnode in that case.
+
+              See ../connector/usb-connector.yaml.
+
+          vbus-supply:
+            description: A phandle to the regulator supplying the VBUS
+              voltage.
+
+        dependencies:
+          usb-role-switch: [ connector ]
+
+      usb2-2:
+        type: object
+        additionalProperties: false
+        properties:
+          # no need to further describe this because the connector will
+          # match on gpio-usb-b-connector or usb-b-connector and cause
+          # that binding to be selected for the subnode
+          connector:
+            type: object
+
+          mode:
+            description: A string that determines the mode in which to
+              run the port.
+            $ref: /schemas/types.yaml#/definitions/string
+            enum: [ host, peripheral, otg ]
+
+          nvidia,internal:
+            description: A boolean property whose presence determines
+              that a port is internal. In the absence of this property
+              the port is considered to be external.
+            $ref: /schemas/types.yaml#/definitions/flag
+
+          usb-role-switch:
+            description: |
+              A boolean property whole presence indicates that the port
+              supports OTG or peripheral mode. If present, the port
+              supports switching between USB host and peripheral roles.
+              A connector must be added as a subnode in that case.
+
+              See ../connector/usb-connector.yaml.
+
+          vbus-supply:
+            description: A phandle to the regulator supplying the VBUS
+              voltage.
+
+        dependencies:
+          usb-role-switch: [ connector ]
+
+      hsic-0:
+        type: object
+        additionalProperties: false
+
+      usb3-0:
+        type: object
+        additionalProperties: false
+        properties:
+          nvidia,internal:
+            description: A boolean property whose presence determines
+              that a port is internal. In the absence of this property
+              the port is considered to be external.
+            $ref: /schemas/types.yaml#/definitions/flag
+
+          nvidia,usb2-companion:
+            description: A single cell that specifies the physical port
+              number to map this super-speed USB port to. The range of
+              valid port numbers varies with the SoC generation.
+            $ref: /schemas/types.yaml#/definitions/uint32
+            enum: [ 0, 1, 2, 3 ]
+
+          vbus-supply:
+            description: A phandle to the regulator supplying the VBUS
+              voltage.
+
+      usb3-1:
+        type: object
+        additionalProperties: false
+        properties:
+          nvidia,internal:
+            description: A boolean property whose presence determines
+              that a port is internal. In the absence of this property
+              the port is considered to be external.
+            $ref: /schemas/types.yaml#/definitions/flag
+
+          nvidia,usb2-companion:
+            description: A single cell that specifies the physical port
+              number to map this super-speed USB port to. The range of
+              valid port numbers varies with the SoC generation.
+            $ref: /schemas/types.yaml#/definitions/uint32
+            enum: [ 0, 1, 2, 3 ]
+
+          vbus-supply:
+            description: A phandle to the regulator supplying the VBUS
+              voltage.
+
+      usb3-2:
+        type: object
+        additionalProperties: false
+        properties:
+          nvidia,internal:
+            description: A boolean property whose presence determines
+              that a port is internal. In the absence of this property
+              the port is considered to be external.
+            $ref: /schemas/types.yaml#/definitions/flag
+
+          nvidia,usb2-companion:
+            description: A single cell that specifies the physical port
+              number to map this super-speed USB port to. The range of
+              valid port numbers varies with the SoC generation.
+            $ref: /schemas/types.yaml#/definitions/uint32
+            enum: [ 0, 1, 2, 3 ]
+
+          vbus-supply:
+            description: A phandle to the regulator supplying the VBUS
+              voltage.
+
+additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - resets
+  - reset-names
+  - avdd-pll-erefeut-supply
+  - avdd-usb-supply
+  - vclamp-usb-supply
+  - vddio-hsic-supply
+
+examples:
+  - |
+    #include <dt-bindings/clock/tegra186-clock.h>
+    #include <dt-bindings/gpio/tegra186-gpio.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/reset/tegra186-reset.h>
+
+    padctl@3520000 {
+        compatible = "nvidia,tegra186-xusb-padctl";
+        reg = <0x03520000 0x1000>,
+              <0x03540000 0x1000>;
+        reg-names = "padctl", "ao";
+        interrupts = <GIC_SPI 167 IRQ_TYPE_LEVEL_HIGH>;
+
+        resets = <&bpmp TEGRA186_RESET_XUSB_PADCTL>;
+        reset-names = "padctl";
+
+        avdd-pll-erefeut-supply = <&vdd_1v8_pll>;
+        avdd-usb-supply = <&vdd_3v3_sys>;
+        vclamp-usb-supply = <&vdd_1v8>;
+        vddio-hsic-supply = <&gnd>;
+
+        pads {
+            usb2 {
+                clocks = <&bpmp TEGRA186_CLK_USB2_TRK>;
+                clock-names = "trk";
+
+                lanes {
+                    usb2-0 {
+                        nvidia,function = "xusb";
+                        #phy-cells = <0>;
+                    };
+
+                    usb2-1 {
+                        nvidia,function = "xusb";
+                        #phy-cells = <0>;
+                    };
+
+                    usb2-2 {
+                        nvidia,function = "xusb";
+                        #phy-cells = <0>;
+                    };
+                };
+            };
+
+            hsic {
+                clocks = <&bpmp TEGRA186_CLK_HSIC_TRK>;
+                clock-names = "trk";
+                status = "disabled";
+
+                lanes {
+                    hsic-0 {
+                        status = "disabled";
+                        #phy-cells = <0>;
+                    };
+                };
+            };
+
+            usb3 {
+                lanes {
+                    usb3-0 {
+                        nvidia,function = "xusb";
+                        #phy-cells = <0>;
+                    };
+
+                    usb3-1 {
+                        nvidia,function = "xusb";
+                        #phy-cells = <0>;
+                    };
+
+                    usb3-2 {
+                        nvidia,function = "xusb";
+                        #phy-cells = <0>;
+                    };
+                };
+            };
+        };
+
+        ports {
+            usb2-0 {
+                mode = "otg";
+                vbus-supply = <&vdd_usb0>;
+                usb-role-switch;
+
+                connector {
+                    compatible = "gpio-usb-b-connector",
+                                 "usb-b-connector";
+                    label = "micro-USB";
+                    type = "micro";
+                    vbus-gpios = <&gpio TEGRA186_MAIN_GPIO(X, 7) GPIO_ACTIVE_LOW>;
+                    id-gpios = <&pmic 0 GPIO_ACTIVE_HIGH>;
+                };
+            };
+
+            usb2-1 {
+                vbus-supply = <&vdd_usb1>;
+                mode = "host";
+            };
+
+            usb2-2 {
+                status = "disabled";
+            };
+
+            hsic-0 {
+                status = "disabled";
+            };
+
+            usb3-0 {
+                nvidia,usb2-companion = <1>;
+            };
+
+            usb3-1 {
+                status = "disabled";
+            };
+
+            usb3-2 {
+                status = "disabled";
+            };
+        };
+    };
diff --git a/Documentation/devicetree/bindings/phy/nvidia,tegra194-xusb-padctl.yaml b/Documentation/devicetree/bindings/phy/nvidia,tegra194-xusb-padctl.yaml
new file mode 100644
index 000000000000..9d4eb7e6fbb7
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/nvidia,tegra194-xusb-padctl.yaml
@@ -0,0 +1,630 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/phy/nvidia,tegra194-xusb-padctl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NVIDIA Tegra194 XUSB pad controller
+
+maintainers:
+  - Thierry Reding <thierry.reding@gmail.com>
+  - Jon Hunter <jonathanh@nvidia.com>
+
+description: |
+  The Tegra XUSB pad controller manages a set of I/O lanes (with differential
+  signals) which connect directly to pins/pads on the SoC package. Each lane
+  is controlled by a HW block referred to as a "pad" in the Tegra hardware
+  documentation. Each such "pad" may control either one or multiple lanes,
+  and thus contains any logic common to all its lanes. Each lane can be
+  separately configured and powered up.
+
+  Some of the lanes are high-speed lanes, which can be used for PCIe, SATA or
+  super-speed USB. Other lanes are for various types of low-speed, full-speed
+  or high-speed USB (such as UTMI, ULPI and HSIC). The XUSB pad controller
+  contains a software-configurable mux that sits between the I/O controller
+  ports (e.g. PCIe) and the lanes.
+
+  In addition to per-lane configuration, USB 3.0 ports may require additional
+  settings on a per-board basis.
+
+  Pads will be represented as children of the top-level XUSB pad controller
+  device tree node. Each lane exposed by the pad will be represented by its
+  own subnode and can be referenced by users of the lane using the standard
+  PHY bindings, as described by the phy-bindings.txt file in this directory.
+
+  The Tegra hardware documentation refers to the connection between the XUSB
+  pad controller and the XUSB controller as "ports". This is confusing since
+  "port" is typically used to denote the physical USB receptacle. The device
+  tree binding in this document uses the term "port" to refer to the logical
+  abstraction of the signals that are routed to a USB receptacle (i.e. a PHY
+  for the USB signal, the VBUS power supply, the USB 2.0 companion port for
+  USB 3.0 receptacles, ...).
+
+properties:
+  compatible:
+    const: nvidia,tegra194-xusb-padctl
+
+  reg:
+    items:
+      - description: pad controller registers
+      - description: AO registers
+
+  reg-names:
+    items:
+      - const: padctl
+      - const: ao
+
+  interrupts:
+    items:
+      - description: XUSB pad controller interrupt
+
+  resets:
+    items:
+      - description: pad controller reset
+
+  reset-names:
+    items:
+      - const: padctl
+
+  avdd-usb-supply:
+    description: USB I/Os, VBUS, ID, REXT, D+/D- power supply. Must
+      supply 3.3 V.
+
+  vclamp-usb-supply:
+    description: Bias rail for USB pad. Must supply 1.8 V.
+
+  pads:
+    description: A required child node named "pads" contains a list of
+      subnodes, one for each of the pads exposed by the XUSB pad controller.
+      Each pad may need additional resources that can be referenced in its
+      pad node.
+
+      The "status" property is used to enable or disable the use of a pad.
+      If set to "disabled", the pad will not be used on the given board. In
+      order to use the pad and any of its lanes, this property must be set
+      to "okay" or absent.
+    type: object
+    additionalProperties: false
+    properties:
+      usb2:
+        type: object
+        additionalProperties: false
+        properties:
+          clocks:
+            items:
+              - description: USB2 tracking clock
+
+          clock-names:
+            items:
+              - const: trk
+
+          lanes:
+            type: object
+            additionalProperties: false
+            properties:
+              usb2-0:
+                type: object
+                additionalProperties: false
+                properties:
+                  "#phy-cells":
+                    const: 0
+
+                  nvidia,function:
+                    description: Function selection for this lane.
+                    $ref: /schemas/types.yaml#/definitions/string
+                    enum: [ xusb ]
+
+              usb2-1:
+                type: object
+                additionalProperties: false
+                properties:
+                  "#phy-cells":
+                    const: 0
+
+                  nvidia,function:
+                    description: Function selection for this lane.
+                    $ref: /schemas/types.yaml#/definitions/string
+                    enum: [ xusb ]
+
+              usb2-2:
+                type: object
+                additionalProperties: false
+                properties:
+                  "#phy-cells":
+                    const: 0
+
+                  nvidia,function:
+                    description: Function selection for this lane.
+                    $ref: /schemas/types.yaml#/definitions/string
+                    enum: [ xusb ]
+
+              usb2-3:
+                type: object
+                additionalProperties: false
+                properties:
+                  "#phy-cells":
+                    const: 0
+
+                  nvidia,function:
+                    description: Function selection for this lane.
+                    $ref: /schemas/types.yaml#/definitions/string
+                    enum: [ xusb ]
+
+      usb3:
+        type: object
+        additionalProperties: false
+        properties:
+          lanes:
+            type: object
+            additionalProperties: false
+            properties:
+              usb3-0:
+                type: object
+                additionalProperties: false
+                properties:
+                  "#phy-cells":
+                    const: 0
+
+                  nvidia,function:
+                    description: Function selection for this lane.
+                    $ref: /schemas/types.yaml#/definitions/string
+                    enum: [ xusb ]
+
+              usb3-1:
+                type: object
+                additionalProperties: false
+                properties:
+                  "#phy-cells":
+                    const: 0
+
+                  nvidia,function:
+                    description: Function selection for this lane.
+                    $ref: /schemas/types.yaml#/definitions/string
+                    enum: [ xusb ]
+
+              usb3-2:
+                type: object
+                additionalProperties: false
+                properties:
+                  "#phy-cells":
+                    const: 0
+
+                  nvidia,function:
+                    description: Function selection for this lane.
+                    $ref: /schemas/types.yaml#/definitions/string
+                    enum: [ xusb ]
+
+              usb3-3:
+                type: object
+                additionalProperties: false
+                properties:
+                  "#phy-cells":
+                    const: 0
+
+                  nvidia,function:
+                    description: Function selection for this lane.
+                    $ref: /schemas/types.yaml#/definitions/string
+                    enum: [ xusb ]
+
+  ports:
+    description: A required child node named "ports" contains a list of
+      subnodes, one for each of the ports exposed by the XUSB pad controller.
+      Each port may need additional resources that can be referenced in its
+      port node.
+
+      The "status" property is used to enable or disable the use of a port.
+      If set to "disabled", the port will not be used on the given board. In
+      order to use the port, this property must be set to "okay".
+    type: object
+    additionalProperties: false
+    properties:
+      usb2-0:
+        type: object
+        additionalProperties: false
+        properties:
+          # no need to further describe this because the connector will
+          # match on gpio-usb-b-connector or usb-b-connector and cause
+          # that binding to be selected for the subnode
+          connector:
+            type: object
+
+          mode:
+            description: A string that determines the mode in which to
+              run the port.
+            $ref: /schemas/types.yaml#/definitions/string
+            enum: [ host, peripheral, otg ]
+
+          nvidia,internal:
+            description: A boolean property whose presence determines
+              that a port is internal. In the absence of this property
+              the port is considered to be external.
+            $ref: /schemas/types.yaml#/definitions/flag
+
+          usb-role-switch:
+            description: |
+              A boolean property whole presence indicates that the port
+              supports OTG or peripheral mode. If present, the port
+              supports switching between USB host and peripheral roles.
+              A connector must be added as a subnode in that case.
+
+              See ../connector/usb-connector.yaml.
+
+          vbus-supply:
+            description: A phandle to the regulator supplying the VBUS
+              voltage.
+
+        dependencies:
+          usb-role-switch: [ connector ]
+
+      usb2-1:
+        type: object
+        additionalProperties: false
+        properties:
+          # no need to further describe this because the connector will
+          # match on gpio-usb-b-connector or usb-b-connector and cause
+          # that binding to be selected for the subnode
+          connector:
+            type: object
+
+          mode:
+            description: A string that determines the mode in which to
+              run the port.
+            $ref: /schemas/types.yaml#/definitions/string
+            enum: [ host, peripheral, otg ]
+
+          nvidia,internal:
+            description: A boolean property whose presence determines
+              that a port is internal. In the absence of this property
+              the port is considered to be external.
+            $ref: /schemas/types.yaml#/definitions/flag
+
+          usb-role-switch:
+            description: |
+              A boolean property whole presence indicates that the port
+              supports OTG or peripheral mode. If present, the port
+              supports switching between USB host and peripheral roles.
+              A connector must be added as a subnode in that case.
+
+              See ../connector/usb-connector.yaml.
+
+          vbus-supply:
+            description: A phandle to the regulator supplying the VBUS
+              voltage.
+
+        dependencies:
+          usb-role-switch: [ connector ]
+
+      usb2-2:
+        type: object
+        additionalProperties: false
+        properties:
+          # no need to further describe this because the connector will
+          # match on gpio-usb-b-connector or usb-b-connector and cause
+          # that binding to be selected for the subnode
+          connector:
+            type: object
+
+          mode:
+            description: A string that determines the mode in which to
+              run the port.
+            $ref: /schemas/types.yaml#/definitions/string
+            enum: [ host, peripheral, otg ]
+
+          nvidia,internal:
+            description: A boolean property whose presence determines
+              that a port is internal. In the absence of this property
+              the port is considered to be external.
+            $ref: /schemas/types.yaml#/definitions/flag
+
+          usb-role-switch:
+            description: |
+              A boolean property whole presence indicates that the port
+              supports OTG or peripheral mode. If present, the port
+              supports switching between USB host and peripheral roles.
+              A connector must be added as a subnode in that case.
+
+              See ../connector/usb-connector.yaml.
+
+          vbus-supply:
+            description: A phandle to the regulator supplying the VBUS
+              voltage.
+
+        dependencies:
+          usb-role-switch: [ connector ]
+
+      usb2-3:
+        type: object
+        additionalProperties: false
+        properties:
+          # no need to further describe this because the connector will
+          # match on gpio-usb-b-connector or usb-b-connector and cause
+          # that binding to be selected for the subnode
+          connector:
+            type: object
+
+          mode:
+            description: A string that determines the mode in which to
+              run the port.
+            $ref: /schemas/types.yaml#/definitions/string
+            enum: [ host, peripheral, otg ]
+
+          nvidia,internal:
+            description: A boolean property whose presence determines
+              that a port is internal. In the absence of this property
+              the port is considered to be external.
+            $ref: /schemas/types.yaml#/definitions/flag
+
+          usb-role-switch:
+            description: |
+              A boolean property whole presence indicates that the port
+              supports OTG or peripheral mode. If present, the port
+              supports switching between USB host and peripheral roles.
+              A connector must be added as a subnode in that case.
+
+              See ../connector/usb-connector.yaml.
+
+          vbus-supply:
+            description: A phandle to the regulator supplying the VBUS
+              voltage.
+
+        dependencies:
+          usb-role-switch: [ connector ]
+
+      usb3-0:
+        type: object
+        additionalProperties: false
+        properties:
+          maximum-speed:
+            description: A string property that specifies the maximum
+              supported speed of a USB3 port.
+            $ref: /schemas/types.yaml#/definitions/string
+            oneOf:
+              - description: The USB3 port supports USB 3.1 Gen 2 speed.
+                  This is the default.
+                const: super-speed-plus
+              - description: The USB3 port supports USB 3.1 Gen 1 speed
+                  only.
+                const: super-speed
+
+          nvidia,internal:
+            description: A boolean property whose presence determines
+              that a port is internal. In the absence of this property
+              the port is considered to be external.
+            $ref: /schemas/types.yaml#/definitions/flag
+
+          nvidia,usb2-companion:
+            description: A single cell that specifies the physical port
+              number to map this super-speed USB port to. The range of
+              valid port numbers varies with the SoC generation.
+            $ref: /schemas/types.yaml#/definitions/uint32
+            enum: [ 0, 1, 2, 3 ]
+
+          vbus-supply:
+            description: A phandle to the regulator supplying the VBUS
+              voltage.
+
+      usb3-1:
+        type: object
+        additionalProperties: false
+        properties:
+          maximum-speed:
+            description: A string property that specifies the maximum
+              supported speed of a USB3 port.
+            $ref: /schemas/types.yaml#/definitions/string
+            oneOf:
+              - description: The USB3 port supports USB 3.1 Gen 2 speed.
+                  This is the default.
+                const: super-speed-plus
+              - description: The USB3 port supports USB 3.1 Gen 1 speed
+                  only.
+                const: super-speed
+
+          nvidia,internal:
+            description: A boolean property whose presence determines
+              that a port is internal. In the absence of this property
+              the port is considered to be external.
+            $ref: /schemas/types.yaml#/definitions/flag
+
+          nvidia,usb2-companion:
+            description: A single cell that specifies the physical port
+              number to map this super-speed USB port to. The range of
+              valid port numbers varies with the SoC generation.
+            $ref: /schemas/types.yaml#/definitions/uint32
+            enum: [ 0, 1, 2, 3 ]
+
+          vbus-supply:
+            description: A phandle to the regulator supplying the VBUS
+              voltage.
+
+      usb3-2:
+        type: object
+        additionalProperties: false
+        properties:
+          maximum-speed:
+            description: A string property that specifies the maximum
+              supported speed of a USB3 port.
+            $ref: /schemas/types.yaml#/definitions/string
+            oneOf:
+              - description: The USB3 port supports USB 3.1 Gen 2 speed.
+                  This is the default.
+                const: super-speed-plus
+              - description: The USB3 port supports USB 3.1 Gen 1 speed
+                  only.
+                const: super-speed
+
+          nvidia,internal:
+            description: A boolean property whose presence determines
+              that a port is internal. In the absence of this property
+              the port is considered to be external.
+            $ref: /schemas/types.yaml#/definitions/flag
+
+          nvidia,usb2-companion:
+            description: A single cell that specifies the physical port
+              number to map this super-speed USB port to. The range of
+              valid port numbers varies with the SoC generation.
+            $ref: /schemas/types.yaml#/definitions/uint32
+            enum: [ 0, 1, 2, 3 ]
+
+          vbus-supply:
+            description: A phandle to the regulator supplying the VBUS
+              voltage.
+
+      usb3-3:
+        type: object
+        additionalProperties: false
+        properties:
+          maximum-speed:
+            description: A string property that specifies the maximum
+              supported speed of a USB3 port.
+            $ref: /schemas/types.yaml#/definitions/string
+            oneOf:
+              - description: The USB3 port supports USB 3.1 Gen 2 speed.
+                  This is the default.
+                const: super-speed-plus
+              - description: The USB3 port supports USB 3.1 Gen 1 speed
+                  only.
+                const: super-speed
+
+          nvidia,internal:
+            description: A boolean property whose presence determines
+              that a port is internal. In the absence of this property
+              the port is considered to be external.
+            $ref: /schemas/types.yaml#/definitions/flag
+
+          nvidia,usb2-companion:
+            description: A single cell that specifies the physical port
+              number to map this super-speed USB port to. The range of
+              valid port numbers varies with the SoC generation.
+            $ref: /schemas/types.yaml#/definitions/uint32
+            enum: [ 0, 1, 2, 3 ]
+
+          vbus-supply:
+            description: A phandle to the regulator supplying the VBUS
+              voltage.
+
+additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - resets
+  - reset-names
+  - avdd-usb-supply
+  - vclamp-usb-supply
+
+examples:
+  - |
+    #include <dt-bindings/clock/tegra194-clock.h>
+    #include <dt-bindings/gpio/tegra194-gpio.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/reset/tegra194-reset.h>
+
+    padctl@3520000 {
+        compatible = "nvidia,tegra194-xusb-padctl";
+        reg = <0x03520000 0x1000>,
+              <0x03540000 0x1000>;
+        reg-names = "padctl", "ao";
+        interrupts = <GIC_SPI 167 IRQ_TYPE_LEVEL_HIGH>;
+
+        resets = <&bpmp TEGRA194_RESET_XUSB_PADCTL>;
+        reset-names = "padctl";
+
+        avdd-usb-supply = <&vdd_usb_3v3>;
+        vclamp-usb-supply = <&vdd_1v8ao>;
+
+        pads {
+            usb2 {
+                clocks = <&bpmp TEGRA194_CLK_USB2_TRK>;
+                clock-names = "trk";
+
+                lanes {
+                    usb2-0 {
+                        nvidia,function = "xusb";
+                        status = "disabled";
+                        #phy-cells = <0>;
+                    };
+
+                    usb2-1 {
+                        nvidia,function = "xusb";
+                        #phy-cells = <0>;
+                    };
+
+                    usb2-2 {
+                        nvidia,function = "xusb";
+                        status = "disabled";
+                        #phy-cells = <0>;
+                    };
+
+                    usb2-3 {
+                        nvidia,function = "xusb";
+                        #phy-cells = <0>;
+                    };
+                };
+            };
+
+            usb3 {
+                lanes {
+                    usb3-0 {
+                        nvidia,function = "xusb";
+                        #phy-cells = <0>;
+                    };
+
+                    usb3-1 {
+                        nvidia,function = "xusb";
+                        status = "disabled";
+                        #phy-cells = <0>;
+                    };
+
+                    usb3-2 {
+                        nvidia,function = "xusb";
+                        status = "disabled";
+                        #phy-cells = <0>;
+                    };
+
+                    usb3-3 {
+                        nvidia,function = "xusb";
+                        #phy-cells = <0>;
+                    };
+                };
+            };
+        };
+
+        ports {
+            usb2-0 {
+                status = "disabled";
+            };
+
+            usb2-1 {
+                vbus-supply = <&vdd_5v0_sys>;
+                mode = "host";
+            };
+
+            usb2-2 {
+                status = "disabled";
+            };
+
+            usb2-3 {
+                vbus-supply = <&vdd_5v_sata>;
+                mode = "host";
+            };
+
+            usb3-0 {
+                vbus-supply = <&vdd_5v0_sys>;
+                nvidia,usb2-companion = <1>;
+            };
+
+            usb3-1 {
+                status = "disabled";
+            };
+
+            usb3-2 {
+                status = "disabled";
+            };
+
+            usb3-3 {
+                maximum-speed = "super-speed";
+                vbus-supply = <&vdd_5v0_sys>;
+                nvidia,usb2-companion = <3>;
+            };
+        };
+    };
diff --git a/Documentation/devicetree/bindings/phy/nvidia,tegra210-xusb-padctl.yaml b/Documentation/devicetree/bindings/phy/nvidia,tegra210-xusb-padctl.yaml
new file mode 100644
index 000000000000..d16bd6e47f90
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/nvidia,tegra210-xusb-padctl.yaml
@@ -0,0 +1,786 @@
+# SPDX-License-Identifier: GPL-2.0-only or BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/phy/nvidia,tegra210-xusb-padctl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NVIDIA Tegra210 XUSB pad controller
+
+maintainers:
+  - Thierry Reding <thierry.reding@gmail.com>
+  - Jon Hunter <jonathanh@nvidia.com>
+
+description: |
+  The Tegra XUSB pad controller manages a set of I/O lanes (with differential
+  signals) which connect directly to pins/pads on the SoC package. Each lane
+  is controlled by a HW block referred to as a "pad" in the Tegra hardware
+  documentation. Each such "pad" may control either one or multiple lanes,
+  and thus contains any logic common to all its lanes. Each lane can be
+  separately configured and powered up.
+
+  Some of the lanes are high-speed lanes, which can be used for PCIe, SATA or
+  super-speed USB. Other lanes are for various types of low-speed, full-speed
+  or high-speed USB (such as UTMI, ULPI and HSIC). The XUSB pad controller
+  contains a software-configurable mux that sits between the I/O controller
+  ports (e.g. PCIe) and the lanes.
+
+  In addition to per-lane configuration, USB 3.0 ports may require additional
+  settings on a per-board basis.
+
+  Pads will be represented as children of the top-level XUSB pad controller
+  device tree node. Each lane exposed by the pad will be represented by its
+  own subnode and can be referenced by users of the lane using the standard
+  PHY bindings, as described by the phy-bindings.txt file in this directory.
+
+  The Tegra hardware documentation refers to the connection between the XUSB
+  pad controller and the XUSB controller as "ports". This is confusing since
+  "port" is typically used to denote the physical USB receptacle. The device
+  tree binding in this document uses the term "port" to refer to the logical
+  abstraction of the signals that are routed to a USB receptacle (i.e. a PHY
+  for the USB signal, the VBUS power supply, the USB 2.0 companion port for
+  USB 3.0 receptacles, ...).
+
+properties:
+  compatible:
+    const: nvidia,tegra210-xusb-padctl
+
+  reg:
+    maxItems: 1
+
+  resets:
+    items:
+      - description: pad controller reset
+
+  interrupts:
+    items:
+      - description: XUSB pad controller interrupt
+
+  reset-names:
+    items:
+      - const: padctl
+
+  avdd-pll-utmip-supply:
+    description: UTMI PLL power supply. Must supply 1.8 V.
+
+  avdd-pll-uerefe-supply:
+    description: PLLE reference PLL power supply. Must supply 1.05 V.
+
+  dvdd-pex-pll-supply:
+    description: PCIe/USB3 PLL power supply. Must supply 1.05 V.
+
+  hvdd-pex-pll-e-supply:
+    description: High-voltage PLLE power supply. Must supply 1.8 V.
+
+  nvidia,pmc:
+    description: phandle to the Tegra Power Management Controller (PMC) node
+    $ref: /schemas/types.yaml#/definitions/phandle
+
+  pads:
+    description: A required child node named "pads" contains a list of
+      subnodes, one for each of the pads exposed by the XUSB pad controller.
+      Each pad may need additional resources that can be referenced in its
+      pad node.
+
+      The "status" property is used to enable or disable the use of a pad.
+      If set to "disabled", the pad will not be used on the given board. In
+      order to use the pad and any of its lanes, this property must be set
+      to "okay" or be absent.
+    type: object
+    additionalProperties: false
+    properties:
+      usb2:
+        type: object
+        additionalProperties: false
+        properties:
+          clocks:
+            items:
+              - description: USB2 tracking clock
+
+          clock-names:
+            items:
+              - const: trk
+
+          lanes:
+            type: object
+            additionalProperties: false
+            properties:
+              usb2-0:
+                type: object
+                additionalProperties: false
+                properties:
+                  "#phy-cells":
+                    const: 0
+
+                  nvidia,function:
+                    description: Function selection for this lane.
+                    $ref: /schemas/types.yaml#/definitions/string
+                    enum: [ snps, xusb, uart ]
+
+              usb2-1:
+                type: object
+                additionalProperties: false
+                properties:
+                  "#phy-cells":
+                    const: 0
+
+                  nvidia,function:
+                    description: Function selection for this lane.
+                    $ref: /schemas/types.yaml#/definitions/string
+                    enum: [ snps, xusb, uart ]
+
+              usb2-2:
+                type: object
+                additionalProperties: false
+                properties:
+                  "#phy-cells":
+                    const: 0
+
+                  nvidia,function:
+                    description: Function selection for this lane.
+                    $ref: /schemas/types.yaml#/definitions/string
+                    enum: [ snps, xusb, uart ]
+
+              usb2-3:
+                type: object
+                additionalProperties: false
+                properties:
+                  "#phy-cells":
+                    const: 0
+
+                  nvidia,function:
+                    description: Function selection for this lane.
+                    $ref: /schemas/types.yaml#/definitions/string
+                    enum: [ snps, xusb, uart ]
+
+      hsic:
+        type: object
+        additionalProperties: false
+        properties:
+          clocks:
+            items:
+              - description: HSIC tracking clock
+
+          clock-names:
+            items:
+              - const: trk
+
+          lanes:
+            type: object
+            additionalProperties: false
+            properties:
+              hsic-0:
+                type: object
+                additionalProperties: false
+                properties:
+                  "#phy-cells":
+                    const: 0
+
+                  nvidia,function:
+                    description: Function selection for this lane.
+                    $ref: /schemas/types.yaml#/definitions/string
+                    enum: [ snps, xusb ]
+
+              hsic-1:
+                type: object
+                additionalProperties: false
+                properties:
+                  "#phy-cells":
+                    const: 0
+
+                  nvidia,function:
+                    description: Function selection for this lane.
+                    $ref: /schemas/types.yaml#/definitions/string
+                    enum: [ snps, xusb ]
+
+      pcie:
+        type: object
+        additionalProperties: false
+        properties:
+          clocks:
+            items:
+              - description: PCIe PLL clock source
+
+          clock-names:
+            items:
+              - const: pll
+
+          resets:
+            items:
+              - description: PCIe PHY reset
+
+          reset-names:
+            items:
+              - const: phy
+
+          lanes:
+            type: object
+            additionalProperties: false
+            properties:
+              pcie-0:
+                type: object
+                additionalProperties: false
+                properties:
+                  "#phy-cells":
+                    const: 0
+
+                  nvidia,function:
+                    description: Function selection for this lane.
+                    $ref: /schemas/types.yaml#/definitions/string
+                    enum: [ pcie-x1, usb3-ss, pcie-x4 ]
+
+              pcie-1:
+                type: object
+                additionalProperties: false
+                properties:
+                  "#phy-cells":
+                    const: 0
+
+                  nvidia,function:
+                    description: Function selection for this lane.
+                    $ref: /schemas/types.yaml#/definitions/string
+                    enum: [ pcie-x1, usb3-ss, pcie-x4 ]
+
+              pcie-2:
+                type: object
+                additionalProperties: false
+                properties:
+                  "#phy-cells":
+                    const: 0
+
+                  nvidia,function:
+                    description: Function selection for this lane.
+                    $ref: /schemas/types.yaml#/definitions/string
+                    enum: [ pcie-x1, usb3-ss, pcie-x4 ]
+
+              pcie-3:
+                type: object
+                additionalProperties: false
+                properties:
+                  "#phy-cells":
+                    const: 0
+
+                  nvidia,function:
+                    description: Function selection for this lane.
+                    $ref: /schemas/types.yaml#/definitions/string
+                    enum: [ pcie-x1, usb3-ss, pcie-x4 ]
+
+              pcie-4:
+                type: object
+                additionalProperties: false
+                properties:
+                  "#phy-cells":
+                    const: 0
+
+                  nvidia,function:
+                    description: Function selection for this lane.
+                    $ref: /schemas/types.yaml#/definitions/string
+                    enum: [ pcie-x1, usb3-ss, pcie-x4 ]
+
+              pcie-5:
+                type: object
+                additionalProperties: false
+                properties:
+                  "#phy-cells":
+                    const: 0
+
+                  nvidia,function:
+                    description: Function selection for this lane.
+                    $ref: /schemas/types.yaml#/definitions/string
+                    enum: [ pcie-x1, usb3-ss, pcie-x4 ]
+
+              pcie-6:
+                type: object
+                additionalProperties: false
+                properties:
+                  "#phy-cells":
+                    const: 0
+
+                  nvidia,function:
+                    description: Function selection for this lane.
+                    $ref: /schemas/types.yaml#/definitions/string
+                    enum: [ pcie-x1, usb3-ss, pcie-x4 ]
+
+      sata:
+        type: object
+        additionalProperties: false
+        properties:
+          clocks:
+            items:
+              - description: SATA PLL clock source
+
+          clock-names:
+            items:
+              - const: pll
+
+          resets:
+            items:
+              - description: SATA PHY reset
+
+          reset-names:
+            items:
+              - const: phy
+
+          lanes:
+            type: object
+            additionalProperties: false
+            properties:
+              sata-0:
+                type: object
+                additionalProperties: false
+                properties:
+                  "#phy-cells":
+                    const: 0
+
+                  nvidia,function:
+                    description: Function selection for this lane.
+                    $ref: /schemas/types.yaml#/definitions/string
+                    enum: [ usb3-ss, sata ]
+
+  ports:
+    description: A required child node named "ports" contains a list of
+      subnodes, one for each of the ports exposed by the XUSB pad controller.
+      Each port may need additional resources that can be referenced in its
+      port node.
+
+      The "status" property is used to enable or disable the use of a port.
+      If set to "disabled", the port will not be used on the given board. In
+      order to use the port, this property must be set to "okay".
+    type: object
+    additionalProperties: false
+    properties:
+      usb2-0:
+        type: object
+        additionalProperties: false
+        properties:
+          # no need to further describe this because the connector will
+          # match on gpio-usb-b-connector or usb-b-connector and cause
+          # that binding to be selected for the subnode
+          connector:
+            type: object
+
+          mode:
+            description: A string that determines the mode in which to
+              run the port.
+            $ref: /schemas/types.yaml#/definitions/string
+            enum: [ host, peripheral, otg ]
+
+          nvidia,internal:
+            description: A boolean property whose presence determines
+              that a port is internal. In the absence of this property
+              the port is considered to be external.
+            $ref: /schemas/types.yaml#/definitions/flag
+
+          usb-role-switch:
+            description: |
+              A boolean property whole presence indicates that the port
+              supports OTG or peripheral mode. If present, the port
+              supports switching between USB host and peripheral roles.
+              A connector must be added as a subnode in that case.
+
+              See ../connector/usb-connector.yaml.
+
+          vbus-supply:
+            description: A phandle to the regulator supplying the VBUS
+              voltage.
+
+        dependencies:
+          usb-role-switch: [ connector ]
+
+      usb2-1:
+        type: object
+        additionalProperties: false
+        properties:
+          # no need to further describe this because the connector will
+          # match on gpio-usb-b-connector or usb-b-connector and cause
+          # that binding to be selected for the subnode
+          connector:
+            type: object
+
+          mode:
+            description: A string that determines the mode in which to
+              run the port.
+            $ref: /schemas/types.yaml#/definitions/string
+            enum: [ host, peripheral, otg ]
+
+          nvidia,internal:
+            description: A boolean property whose presence determines
+              that a port is internal. In the absence of this property
+              the port is considered to be external.
+            $ref: /schemas/types.yaml#/definitions/flag
+
+          usb-role-switch:
+            description: |
+              A boolean property whole presence indicates that the port
+              supports OTG or peripheral mode. If present, the port
+              supports switching between USB host and peripheral roles.
+              A connector must be added as a subnode in that case.
+
+              See ../connector/usb-connector.yaml.
+
+          vbus-supply:
+            description: A phandle to the regulator supplying the VBUS
+              voltage.
+
+        dependencies:
+          usb-role-switch: [ connector ]
+
+      usb2-2:
+        type: object
+        additionalProperties: false
+        properties:
+          # no need to further describe this because the connector will
+          # match on gpio-usb-b-connector or usb-b-connector and cause
+          # that binding to be selected for the subnode
+          connector:
+            type: object
+
+          mode:
+            description: A string that determines the mode in which to
+              run the port.
+            $ref: /schemas/types.yaml#/definitions/string
+            enum: [ host, peripheral, otg ]
+
+          nvidia,internal:
+            description: A boolean property whose presence determines
+              that a port is internal. In the absence of this property
+              the port is considered to be external.
+            $ref: /schemas/types.yaml#/definitions/flag
+
+          usb-role-switch:
+            description: |
+              A boolean property whole presence indicates that the port
+              supports OTG or peripheral mode. If present, the port
+              supports switching between USB host and peripheral roles.
+              A connector must be added as a subnode in that case.
+
+              See ../connector/usb-connector.yaml.
+
+          vbus-supply:
+            description: A phandle to the regulator supplying the VBUS
+              voltage.
+
+        dependencies:
+          usb-role-switch: [ connector ]
+
+      usb2-3:
+        type: object
+        additionalProperties: false
+        properties:
+          # no need to further describe this because the connector will
+          # match on gpio-usb-b-connector or usb-b-connector and cause
+          # that binding to be selected for the subnode
+          connector:
+            type: object
+
+          mode:
+            description: A string that determines the mode in which to
+              run the port.
+            $ref: /schemas/types.yaml#/definitions/string
+            enum: [ host, peripheral, otg ]
+
+          nvidia,internal:
+            description: A boolean property whose presence determines
+              that a port is internal. In the absence of this property
+              the port is considered to be external.
+            $ref: /schemas/types.yaml#/definitions/flag
+
+          usb-role-switch:
+            description: |
+              A boolean property whole presence indicates that the port
+              supports OTG or peripheral mode. If present, the port
+              supports switching between USB host and peripheral roles.
+              A connector must be added as a subnode in that case.
+
+              See ../connector/usb-connector.yaml.
+
+          vbus-supply:
+            description: A phandle to the regulator supplying the VBUS
+              voltage.
+
+        dependencies:
+          usb-role-switch: [ connector ]
+
+      hsic-0:
+        type: object
+        additionalProperties: false
+        properties:
+          vbus-supply:
+            description: A phandle to the regulator supplying the VBUS
+              voltage.
+
+      hsic-1:
+        type: object
+        additionalProperties: false
+        properties:
+          vbus-supply:
+            description: A phandle to the regulator supplying the VBUS
+              voltage.
+
+      usb3-0:
+        type: object
+        additionalProperties: false
+        properties:
+          nvidia,internal:
+            description: A boolean property whose presence determines
+              that a port is internal. In the absence of this property
+              the port is considered to be external.
+            $ref: /schemas/types.yaml#/definitions/flag
+
+          nvidia,usb2-companion:
+            description: A single cell that specifies the physical port
+              number to map this super-speed USB port to. The range of
+              valid port numbers varies with the SoC generation.
+            $ref: /schemas/types.yaml#/definitions/uint32
+            enum: [ 0, 1, 2, 3 ]
+
+          vbus-supply:
+            description: A phandle to the regulator supplying the VBUS
+              voltage.
+
+      usb3-1:
+        type: object
+        additionalProperties: false
+        properties:
+          nvidia,internal:
+            description: A boolean property whose presence determines
+              that a port is internal. In the absence of this property
+              the port is considered to be external.
+            $ref: /schemas/types.yaml#/definitions/flag
+
+          nvidia,usb2-companion:
+            description: A single cell that specifies the physical port
+              number to map this super-speed USB port to. The range of
+              valid port numbers varies with the SoC generation.
+            $ref: /schemas/types.yaml#/definitions/uint32
+            enum: [ 0, 1, 2, 3 ]
+
+          vbus-supply:
+            description: A phandle to the regulator supplying the VBUS
+              voltage.
+
+      usb3-2:
+        type: object
+        additionalProperties: false
+        properties:
+          nvidia,internal:
+            description: A boolean property whose presence determines
+              that a port is internal. In the absence of this property
+              the port is considered to be external.
+            $ref: /schemas/types.yaml#/definitions/flag
+
+          nvidia,usb2-companion:
+            description: A single cell that specifies the physical port
+              number to map this super-speed USB port to. The range of
+              valid port numbers varies with the SoC generation.
+            $ref: /schemas/types.yaml#/definitions/uint32
+            enum: [ 0, 1, 2, 3 ]
+
+          vbus-supply:
+            description: A phandle to the regulator supplying the VBUS
+              voltage.
+
+      usb3-3:
+        type: object
+        additionalProperties: false
+        properties:
+          nvidia,internal:
+            description: A boolean property whose presence determines
+              that a port is internal. In the absence of this property
+              the port is considered to be external.
+            $ref: /schemas/types.yaml#/definitions/flag
+
+          nvidia,usb2-companion:
+            description: A single cell that specifies the physical port
+              number to map this super-speed USB port to. The range of
+              valid port numbers varies with the SoC generation.
+            $ref: /schemas/types.yaml#/definitions/uint32
+            enum: [ 0, 1, 2, 3 ]
+
+          vbus-supply:
+            description: A phandle to the regulator supplying the VBUS
+              voltage.
+
+additionalProperties: false
+
+required:
+  - avdd-pll-utmip-supply
+  - avdd-pll-uerefe-supply
+  - dvdd-pex-pll-supply
+  - hvdd-pex-pll-e-supply
+
+examples:
+  - |
+    #include <dt-bindings/clock/tegra210-car.h>
+    #include <dt-bindings/gpio/tegra-gpio.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    padctl@7009f000 {
+        compatible = "nvidia,tegra210-xusb-padctl";
+        reg = <0x7009f000 0x1000>;
+        interrupts = <GIC_SPI 49 IRQ_TYPE_LEVEL_HIGH>;
+        resets = <&tegra_car 142>;
+        reset-names = "padctl";
+
+        avdd-pll-utmip-supply = <&vdd_1v8>;
+        avdd-pll-uerefe-supply = <&vdd_pex_1v05>;
+        dvdd-pex-pll-supply = <&vdd_pex_1v05>;
+        hvdd-pex-pll-e-supply = <&vdd_1v8>;
+
+        pads {
+            usb2 {
+                clocks = <&tegra_car TEGRA210_CLK_USB2_TRK>;
+                clock-names = "trk";
+
+                lanes {
+                    usb2-0 {
+                        nvidia,function = "xusb";
+                        #phy-cells = <0>;
+                    };
+
+                    usb2-1 {
+                        nvidia,function = "xusb";
+                        #phy-cells = <0>;
+                    };
+
+                    usb2-2 {
+                        nvidia,function = "xusb";
+                        #phy-cells = <0>;
+                    };
+
+                    usb2-3 {
+                        nvidia,function = "xusb";
+                        #phy-cells = <0>;
+                    };
+                };
+            };
+
+            hsic {
+                clocks = <&tegra_car TEGRA210_CLK_HSIC_TRK>;
+                clock-names = "trk";
+                status = "disabled";
+
+                lanes {
+                    hsic-0 {
+                        status = "disabled";
+                        #phy-cells = <0>;
+                    };
+
+                    hsic-1 {
+                        status = "disabled";
+                        #phy-cells = <0>;
+                    };
+                };
+            };
+
+            pcie {
+                clocks = <&tegra_car TEGRA210_CLK_PLL_E>;
+                clock-names = "pll";
+                resets = <&tegra_car 205>;
+                reset-names = "phy";
+
+                lanes {
+                    pcie-0 {
+                        nvidia,function = "pcie-x1";
+                        #phy-cells = <0>;
+                    };
+
+                    pcie-1 {
+                        nvidia,function = "pcie-x4";
+                        #phy-cells = <0>;
+                    };
+
+                    pcie-2 {
+                        nvidia,function = "pcie-x4";
+                        #phy-cells = <0>;
+                    };
+
+                    pcie-3 {
+                        nvidia,function = "pcie-x4";
+                        #phy-cells = <0>;
+                    };
+
+                    pcie-4 {
+                        nvidia,function = "pcie-x4";
+                        #phy-cells = <0>;
+                    };
+
+                    pcie-5 {
+                        nvidia,function = "usb3-ss";
+                        #phy-cells = <0>;
+                    };
+
+                    pcie-6 {
+                        nvidia,function = "usb3-ss";
+                        #phy-cells = <0>;
+                    };
+                };
+            };
+
+            sata {
+                clocks = <&tegra_car TEGRA210_CLK_PLL_E>;
+                clock-names = "pll";
+                resets = <&tegra_car 204>;
+                reset-names = "phy";
+
+                lanes {
+                    sata-0 {
+                        nvidia,function = "sata";
+                        #phy-cells = <0>;
+                    };
+                };
+            };
+        };
+
+        ports {
+            usb2-0 {
+                mode = "peripheral";
+                usb-role-switch;
+
+                connector {
+                    compatible = "gpio-usb-b-connector",
+                                 "usb-b-connector";
+                    label = "micro-USB";
+                    type = "micro";
+                    vbus-gpios = <&gpio TEGRA_GPIO(CC, 4) GPIO_ACTIVE_LOW>;
+                };
+            };
+
+            usb2-1 {
+                vbus-supply = <&vdd_5v0_rtl>;
+                mode = "host";
+            };
+
+            usb2-2 {
+                vbus-supply = <&vdd_usb_vbus>;
+                mode = "host";
+            };
+
+            usb2-3 {
+                mode = "host";
+            };
+
+            hsic-0 {
+                status = "disabled";
+            };
+
+            hsic-1 {
+                status = "disabled";
+            };
+
+            usb3-0 {
+                nvidia,usb2-companion = <1>;
+            };
+
+            usb3-1 {
+                nvidia,usb2-companion = <2>;
+            };
+
+            usb3-2 {
+                status = "disabled";
+            };
+
+            usb3-3 {
+                status = "disabled";
+            };
+        };
+    };
-- 
2.39.0

