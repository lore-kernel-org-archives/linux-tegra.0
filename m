Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D761C352A1
	for <linux-tegra@archiver.kernel.org>; Wed, 30 Nov 2022 17:10:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229835AbiK3RKc (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 30 Nov 2022 12:10:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39258 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231181AbiK3RKM (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 30 Nov 2022 12:10:12 -0500
Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A32C5862E6;
        Wed, 30 Nov 2022 09:05:30 -0800 (PST)
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-143ffc8c2b2so2920605fac.2;
        Wed, 30 Nov 2022 09:05:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lDgey8gcP2JsHGRK3gZGVyEmZV2YfPyK5QnTjpqK3hI=;
        b=fLVoSJjyJkNOlFTlHkg7qAt/OuE0ajZhIPX2Ljs6bH+kIPxUv9LsJBN0N5d0AC/4UZ
         QXEDPTmtjhqj9sSqZ0HdkCPzTDZfrtfavoVGCVmcakQtVeYbFiKbPrJTDcmKhIdNnIlE
         zKP/etcgLCVj6yEPNnxXjM1Hz333PkZa558WprPStcU2tnlOqm79+adXP4IjWGGwrwHn
         O1TBo1YHg31ve02Fn1pZrXszRLuvQQySajGoZEKoIlUenDyKUhm+PTpSuYi49yUNE1r8
         WmSXNUT4Ajsbl0W4AHWpIKmly5oD3eWsLdoujJ2dUMmL8j5W+ca6Iyvu5d7IWEOZe6A8
         BC3g==
X-Gm-Message-State: ANoB5pk5wMJzWZY1AUIdxucv0dwcQh2vchrZnQJ3N+Mbtn/DziuS08L0
        hdMYbaihVbVuhFzcKm1Sew==
X-Google-Smtp-Source: AA0mqf4KPwq8c4VuXL6t8TX3Lqbwz3T2g4RcJWUrCe5ZlYeS7JyhEfq4NOkAI5ANV7mU4ARI4UvV1g==
X-Received: by 2002:a05:6870:cb95:b0:13b:2f1f:82fa with SMTP id ov21-20020a056870cb9500b0013b2f1f82famr28508820oab.47.1669827929455;
        Wed, 30 Nov 2022 09:05:29 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id k14-20020a0568080e8e00b0034d8abf42f1sm841635oil.23.2022.11.30.09.05.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Nov 2022 09:05:27 -0800 (PST)
Received: (nullmailer pid 2454312 invoked by uid 1000);
        Wed, 30 Nov 2022 17:05:26 -0000
Date:   Wed, 30 Nov 2022 11:05:26 -0600
From:   Rob Herring <robh@kernel.org>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Jon Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: Re: [PATCH v2] dt-bindings: phy: tegra-xusb: Convert to json-schema
Message-ID: <20221130170526.GA2433335-robh@kernel.org>
References: <20221118144015.3650774-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221118144015.3650774-1-thierry.reding@gmail.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Fri, Nov 18, 2022 at 03:40:15PM +0100, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> Convert the Tegra XUSB pad controller bindings from free-form text
> format to json-schema.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
> Changes in v2:
> - split up into multiple schemas
> 
>  .../phy/nvidia,tegra124-xusb-padctl.txt       | 779 --------------
>  .../phy/nvidia,tegra124-xusb-padctl.yaml      | 797 +++++++++++++++
>  .../phy/nvidia,tegra186-xusb-padctl.yaml      | 632 ++++++++++++
>  .../phy/nvidia,tegra194-xusb-padctl.yaml      | 731 ++++++++++++++
>  .../phy/nvidia,tegra210-xusb-padctl.yaml      | 946 ++++++++++++++++++
>  5 files changed, 3106 insertions(+), 779 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/phy/nvidia,tegra124-xusb-padctl.txt
>  create mode 100644 Documentation/devicetree/bindings/phy/nvidia,tegra124-xusb-padctl.yaml
>  create mode 100644 Documentation/devicetree/bindings/phy/nvidia,tegra186-xusb-padctl.yaml
>  create mode 100644 Documentation/devicetree/bindings/phy/nvidia,tegra194-xusb-padctl.yaml
>  create mode 100644 Documentation/devicetree/bindings/phy/nvidia,tegra210-xusb-padctl.yaml

Need to CC the phy maintainers.

[...]

> diff --git a/Documentation/devicetree/bindings/phy/nvidia,tegra124-xusb-padctl.yaml b/Documentation/devicetree/bindings/phy/nvidia,tegra124-xusb-padctl.yaml
> new file mode 100644
> index 000000000000..f1121a340a72
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/nvidia,tegra124-xusb-padctl.yaml
> @@ -0,0 +1,797 @@
> +# SPDX-License-Identifier: GPL-2.0-only

All NVIDIA authors on the original, please dual license.

> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/phy/nvidia,tegra124-xusb-padctl.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: NVIDIA Tegra124 XUSB pad controller
> +
> +maintainers:
> +  - Thierry Reding <thierry.reding@gmail.com>
> +  - Jon Hunter <jonathanh@nvidia.com>
> +
> +description:

Need a '|'  to maintain paragraphs here.

> +  The Tegra XUSB pad controller manages a set of I/O lanes (with differential
> +  signals) which connect directly to pins/pads on the SoC package. Each lane
> +  is controlled by a HW block referred to as a "pad" in the Tegra hardware
> +  documentation. Each such "pad" may control either one or multiple lanes,
> +  and thus contains any logic common to all its lanes. Each lane can be
> +  separately configured and powered up.
> +
> +  Some of the lanes are high-speed lanes, which can be used for PCIe, SATA or
> +  super-speed USB. Other lanes are for various types of low-speed, full-speed
> +  or high-speed USB (such as UTMI, ULPI and HSIC). The XUSB pad controller
> +  contains a software-configurable mux that sits between the I/O controller
> +  ports (e.g. PCIe) and the lanes.
> +
> +  In addition to per-lane configuration, USB 3.0 ports may require additional
> +  settings on a per-board basis.
> +
> +  Pads will be represented as children of the top-level XUSB pad controller
> +  device tree node. Each lane exposed by the pad will be represented by its
> +  own subnode and can be referenced by users of the lane using the standard
> +  PHY bindings, as described by the phy-bindings.txt file in this directory.
> +
> +  The Tegra hardware documentation refers to the connection between the XUSB
> +  pad controller and the XUSB controller as "ports". This is confusing since
> +  "port" is typically used to denote the physical USB receptacle. The device
> +  tree binding in this document uses the term "port" to refer to the logical
> +  abstraction of the signals that are routed to a USB receptacle (i.e. a PHY
> +  for the USB signal, the VBUS power supply, the USB 2.0 companion port for
> +  USB 3.0 receptacles, ...).
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - enum:
> +          - nvidia,tegra124-xusb-padctl
> +
> +      - items:
> +          - const: nvidia,tegra132-xusb-padctl
> +          - const: nvidia,tegra124-xusb-padctl
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    items:
> +      - description: XUSB pad controller interrupt
> +
> +  resets:
> +    items:
> +      - description: pad controller reset
> +
> +  reset-names:
> +    items:
> +      - const: padctl
> +
> +  avdd-pll-utmip-supply:
> +    description: UTMI PLL power supply. Must supply 1.8 V.
> +
> +  avdd-pll-erefe-supply:
> +    description: PLLE reference PLL power supply. Must supply 1.05 V.
> +
> +  avdd-pex-pll-supply:
> +    description: PCIe/USB3 PLL power supply. Must supply 1.05 V.
> +
> +  hvdd-pex-pll-e-supply:
> +    description: High-voltage PLLE power supply. Must supply 3.3 V.
> +
> +  pads:
> +    description: A required child node named "pads" contains a list of
> +      subnodes, one for each of the pads exposed by the XUSB pad controller.
> +      Each pad may need additional resources that can be referenced in its
> +      pad node.
> +
> +      The "status" property is used to enable or disable the use of a pad.
> +      If set to "disabled", the pad will not be used on the given board. In
> +      order to use the pad and any of its lanes, this property must be set
> +      to "okay".

...or be absent.

> +    type: object
> +    properties:
> +      usb2:
> +        type: object
> +        properties:
> +          clocks:
> +            items:
> +              - description: USB2 tracking clock
> +
> +          clock-names:
> +            items:
> +              - const: trk
> +
> +          lanes:
> +            type: object
> +            properties:
> +              usb2-0:
> +                type: object
> +                properties:
> +                  "#phy-cells":
> +                    const: 0
> +
> +                  nvidia,function:
> +                    description: Function selection for this lane.
> +                    $ref: "/schemas/types.yaml#/definitions/string"

Drop quotes.

> +                    enum: [ snps, xusb, uart ]
> +
> +                  phandle:
> +                    $ref: "/schemas/dt-core.yaml#/properties/phandle"

You shouldn't need 'phandle' as the tools should handle it. If not, let 
me know and I will investigate.

> +
> +                  status:
> +                    $ref: "/schemas/dt-core.yaml#/properties/status"

Same for status. Also, a ref to dt-core.yaml is never correct.

> +
> +                additionalProperties: false

For the indented cases, I find it easier to read putting this before 
'properties'.

> +
> +              usb2-1:
> +                type: object
> +                properties:
> +                  "#phy-cells":
> +                    const: 0
> +
> +                  nvidia,function:
> +                    description: Function selection for this lane.
> +                    $ref: "/schemas/types.yaml#/definitions/string"
> +                    enum: [ snps, xusb, uart ]
> +
> +                  phandle:
> +                    $ref: "/schemas/dt-core.yaml#/properties/phandle"
> +
> +                  status:
> +                    $ref: "/schemas/dt-core.yaml#/properties/status"
> +
> +                additionalProperties: false
> +
> +              usb2-2:
> +                type: object
> +                properties:
> +                  "#phy-cells":
> +                    const: 0
> +
> +                  nvidia,function:
> +                    description: Function selection for this lane.
> +                    $ref: "/schemas/types.yaml#/definitions/string"
> +                    enum: [ snps, xusb, uart ]
> +
> +                  phandle:
> +                    $ref: "/schemas/dt-core.yaml#/properties/phandle"
> +
> +                  status:
> +                    $ref: "/schemas/dt-core.yaml#/properties/status"
> +
> +                additionalProperties: false
> +
> +            additionalProperties: false
> +
> +          status:
> +            $ref: "/schemas/dt-core.yaml#/properties/status"
> +
> +        additionalProperties: false
> +
> +      ulpi:
> +        type: object
> +        properties:
> +          lanes:
> +            type: object
> +            properties:
> +              ulpi-0:
> +                type: object
> +                properties:
> +                  "#phy-cells":
> +                    const: 0
> +
> +                  nvidia,function:
> +                    description: Function selection for this lane.
> +                    $ref: "/schemas/types.yaml#/definitions/string"
> +                    enum: [ snps, xusb ]
> +
> +                  phandle:
> +                    $ref: "/schemas/dt-core.yaml#/properties/phandle"
> +
> +                  status:
> +                    $ref: "/schemas/dt-core.yaml#/properties/status"
> +
> +                additionalProperties: false
> +
> +            additionalProperties: false
> +
> +          status:
> +            $ref: "/schemas/dt-core.yaml#/properties/status"
> +
> +        additionalProperties: false
> +
> +      hsic:
> +        type: object
> +        properties:
> +          clocks:
> +            items:
> +              - description: HSIC tracking clock
> +
> +          clock-names:
> +            items:
> +              - const: trk
> +
> +          lanes:
> +            type: object
> +            properties:
> +              hsic-0:
> +                type: object
> +                properties:
> +                  "#phy-cells":
> +                    const: 0
> +
> +                  nvidia,function:
> +                    description: Function selection for this lane.
> +                    $ref: "/schemas/types.yaml#/definitions/string"
> +                    enum: [ snps, xusb ]
> +
> +                  phandle:
> +                    $ref: "/schemas/dt-core.yaml#/properties/phandle"
> +
> +                  status:
> +                    $ref: "/schemas/dt-core.yaml#/properties/status"
> +
> +                additionalProperties: false
> +
> +              hsic-1:
> +                type: object
> +                properties:
> +                  "#phy-cells":
> +                    const: 0
> +
> +                  nvidia,function:
> +                    description: Function selection for this lane.
> +                    $ref: "/schemas/types.yaml#/definitions/string"
> +                    enum: [ snps, xusb ]
> +
> +                  phandle:
> +                    $ref: "/schemas/dt-core.yaml#/properties/phandle"
> +
> +                  status:
> +                    $ref: "/schemas/dt-core.yaml#/properties/status"
> +
> +                additionalProperties: false
> +
> +            additionalProperties: false
> +
> +          status:
> +            $ref: "/schemas/dt-core.yaml#/properties/status"
> +
> +        additionalProperties: false
> +
> +      pcie:
> +        type: object
> +        properties:
> +          clocks:
> +            items:
> +              - description: PLLE clock
> +
> +          clock-names:
> +            items:
> +              - const: pll
> +
> +          resets:
> +            items:
> +              - description: reset for the PCIe UPHY block
> +
> +          reset-names:
> +            items:
> +              - const: phy
> +
> +          lanes:
> +            type: object
> +            properties:
> +              pcie-0:
> +                type: object
> +                properties:
> +                  "#phy-cells":
> +                    const: 0
> +
> +                  nvidia,function:
> +                    description: Function selection for this lane.
> +                    $ref: "/schemas/types.yaml#/definitions/string"
> +                    enum: [ pcie, usb3-ss ]
> +
> +                  phandle:
> +                    $ref: "/schemas/dt-core.yaml#/properties/phandle"
> +
> +                  status:
> +                    $ref: "/schemas/dt-core.yaml#/properties/status"
> +
> +                additionalProperties: false
> +
> +              pcie-1:
> +                type: object
> +                properties:
> +                  "#phy-cells":
> +                    const: 0
> +
> +                  nvidia,function:
> +                    description: Function selection for this lane.
> +                    $ref: "/schemas/types.yaml#/definitions/string"
> +                    enum: [ pcie, usb3-ss ]
> +
> +                  phandle:
> +                    $ref: "/schemas/dt-core.yaml#/properties/phandle"
> +
> +                  status:
> +                    $ref: "/schemas/dt-core.yaml#/properties/status"
> +
> +                additionalProperties: false
> +
> +              pcie-2:
> +                type: object
> +                properties:
> +                  "#phy-cells":
> +                    const: 0
> +
> +                  nvidia,function:
> +                    description: Function selection for this lane.
> +                    $ref: "/schemas/types.yaml#/definitions/string"
> +                    enum: [ pcie, usb3-ss ]
> +
> +                  phandle:
> +                    $ref: "/schemas/dt-core.yaml#/properties/phandle"
> +
> +                  status:
> +                    $ref: "/schemas/dt-core.yaml#/properties/status"
> +
> +                additionalProperties: false
> +
> +              pcie-3:
> +                type: object
> +                properties:
> +                  "#phy-cells":
> +                    const: 0
> +
> +                  nvidia,function:
> +                    description: Function selection for this lane.
> +                    $ref: "/schemas/types.yaml#/definitions/string"
> +                    enum: [ pcie, usb3-ss ]
> +
> +                  phandle:
> +                    $ref: "/schemas/dt-core.yaml#/properties/phandle"
> +
> +                  status:
> +                    $ref: "/schemas/dt-core.yaml#/properties/status"
> +
> +                additionalProperties: false
> +
> +              pcie-4:
> +                type: object
> +                properties:
> +                  "#phy-cells":
> +                    const: 0
> +
> +                  nvidia,function:
> +                    description: Function selection for this lane.
> +                    $ref: "/schemas/types.yaml#/definitions/string"
> +                    enum: [ pcie, usb3-ss ]
> +
> +                  phandle:
> +                    $ref: "/schemas/dt-core.yaml#/properties/phandle"
> +
> +                  status:
> +                    $ref: "/schemas/dt-core.yaml#/properties/status"
> +
> +                additionalProperties: false
> +
> +            additionalProperties: false
> +
> +          status:
> +            $ref: "/schemas/dt-core.yaml#/properties/status"
> +
> +        additionalProperties: false
> +
> +      sata:
> +        type: object
> +        properties:
> +          resets:
> +            items:
> +              - description: reset for the SATA UPHY block
> +
> +          reset-names:
> +            items:
> +              - const: phy
> +
> +          lanes:
> +            type: object
> +            properties:
> +              sata-0:
> +                type: object
> +                properties:
> +                  "#phy-cells":
> +                    const: 0
> +
> +                  nvidia,function:
> +                    description: Function selection for this lane.
> +                    $ref: "/schemas/types.yaml#/definitions/string"
> +                    enum: [ sata, usb3-ss ]
> +
> +                  phandle:
> +                    $ref: "/schemas/dt-core.yaml#/properties/phandle"
> +
> +                  status:
> +                    $ref: "/schemas/dt-core.yaml#/properties/status"
> +
> +                additionalProperties: false
> +
> +            additionalProperties: false
> +
> +          status:
> +            $ref: "/schemas/dt-core.yaml#/properties/status"
> +
> +        additionalProperties: false
> +
> +    additionalProperties: false
> +
> +  ports:
> +    description: A required child node named "ports" contains a list of
> +      subnodes, one for each of the ports exposed by the XUSB pad controller.
> +      Each port may need additional resources that can be referenced in its
> +      port node.
> +
> +      The "status" property is used to enable or disable the use of a port.
> +      If set to "disabled", the port will not be used on the given board. In
> +      order to use the port, this property must be set to "okay".
> +    type: object
> +    properties:
> +      usb2-0:
> +        type: object
> +        properties:
> +          # no need to further describe this because the connector will
> +          # match on gpio-usb-b-connector or usb-b-connector and cause
> +          # that binding to be selected for the subnode
> +          connector:
> +            type: object
> +
> +          mode:
> +            description: A string that determines the mode in which to
> +              run the port.
> +            $ref: "/schemas/types.yaml#/definitions/string"
> +            enum: [ host, peripheral, otg ]
> +
> +          nvidia,internal:
> +            description: A boolean property whose presence determines
> +              that a port is internal. In the absence of this property
> +              the port is considered to be external.
> +            $ref: "/schemas/types.yaml#/definitions/flag"
> +
> +          status:
> +            $ref: "/schemas/dt-core.yaml#/properties/status"
> +
> +          usb-role-switch:
> +            description: |
> +              A boolean property whole presence indicates that the port
> +              supports OTG or peripheral mode. If present, the port
> +              supports switching between USB host and peripheral roles.
> +              A connector must be added as a subnode in that case.
> +
> +              See ../connector/usb-connector.yaml.
> +
> +          vbus-supply:
> +            description: A phandle to the regulator supplying the VBUS
> +              voltage.
> +
> +        additionalProperties: false
> +
> +      usb2-1:
> +        type: object
> +        properties:
> +          # no need to further describe this because the connector will
> +          # match on gpio-usb-b-connector or usb-b-connector and cause
> +          # that binding to be selected for the subnode
> +          connector:
> +            type: object
> +
> +          mode:
> +            description: A string that determines the mode in which to
> +              run the port.
> +            $ref: "/schemas/types.yaml#/definitions/string"
> +            enum: [ host, peripheral, otg ]
> +
> +          nvidia,internal:
> +            description: A boolean property whose presence determines
> +              that a port is internal. In the absence of this property
> +              the port is considered to be external.
> +            $ref: "/schemas/types.yaml#/definitions/flag"
> +
> +          status:
> +            $ref: "/schemas/dt-core.yaml#/properties/status"
> +
> +          usb-role-switch:
> +            description: |
> +              A boolean property whole presence indicates that the port
> +              supports OTG or peripheral mode. If present, the port
> +              supports switching between USB host and peripheral roles.
> +              A connector must be added as a subnode in that case.
> +
> +              See ../connector/usb-connector.yaml.
> +
> +          vbus-supply:
> +            description: A phandle to the regulator supplying the VBUS
> +              voltage.
> +
> +        additionalProperties: false
> +
> +      usb2-2:
> +        type: object
> +        properties:
> +          # no need to further describe this because the connector will
> +          # match on gpio-usb-b-connector or usb-b-connector and cause
> +          # that binding to be selected for the subnode
> +          connector:
> +            type: object
> +
> +          mode:
> +            description: A string that determines the mode in which to
> +              run the port.
> +            $ref: "/schemas/types.yaml#/definitions/string"
> +            enum: [ host, peripheral, otg ]
> +
> +          nvidia,internal:
> +            description: A boolean property whose presence determines
> +              that a port is internal. In the absence of this property
> +              the port is considered to be external.
> +            $ref: "/schemas/types.yaml#/definitions/flag"
> +
> +          status:
> +            $ref: "/schemas/dt-core.yaml#/properties/status"
> +
> +          usb-role-switch:
> +            description: |
> +              A boolean property whole presence indicates that the port
> +              supports OTG or peripheral mode. If present, the port
> +              supports switching between USB host and peripheral roles.
> +              A connector must be added as a subnode in that case.
> +
> +              See ../connector/usb-connector.yaml.
> +
> +          vbus-supply:
> +            description: A phandle to the regulator supplying the VBUS
> +              voltage.
> +
> +        additionalProperties: false
> +
> +      ulpi-0:
> +        type: object
> +        properties:
> +          status:
> +            $ref: "/schemas/dt-core.yaml#/properties/status"
> +
> +          nvidia,internal:
> +            description: A boolean property whose presence determines
> +              that a port is internal. In the absence of this property
> +              the port is considered to be external.
> +            $ref: "/schemas/types.yaml#/definitions/flag"
> +
> +          vbus-supply:
> +            description: A phandle to the regulator supplying the VBUS
> +              voltage.
> +
> +        additionalProperties: false
> +
> +      hsic-0:
> +        type: object
> +        properties:
> +          status:
> +            $ref: "/schemas/dt-core.yaml#/properties/status"
> +
> +          vbus-supply:
> +            description: A phandle to the regulator supplying the VBUS
> +              voltage.
> +
> +        additionalProperties: false
> +
> +      hsic-1:
> +        type: object
> +        properties:
> +          status:
> +            $ref: "/schemas/dt-core.yaml#/properties/status"
> +
> +          vbus-supply:
> +            description: A phandle to the regulator supplying the VBUS
> +              voltage.
> +
> +        additionalProperties: false
> +
> +      usb3-0:
> +        type: object
> +        properties:
> +          nvidia,internal:
> +            description: A boolean property whose presence determines
> +              that a port is internal. In the absence of this property
> +              the port is considered to be external.
> +            $ref: "/schemas/types.yaml#/definitions/flag"
> +
> +          nvidia,usb2-companion:
> +            description: A single cell that specifies the physical port
> +              number to map this super-speed USB port to. The range of
> +              valid port numbers varies with the SoC generation.
> +            $ref: "/schemas/types.yaml#/definitions/uint32"
> +            enum: [ 0, 1, 2 ]
> +
> +          status:
> +            $ref: "/schemas/dt-core.yaml#/properties/status"
> +
> +          vbus-supply:
> +            description: A phandle to the regulator supplying the VBUS
> +              voltage.
> +
> +        additionalProperties: false
> +
> +      usb3-1:
> +        type: object
> +        properties:
> +          nvidia,internal:
> +            description: A boolean property whose presence determines
> +              that a port is internal. In the absence of this property
> +              the port is considered to be external.
> +            $ref: "/schemas/types.yaml#/definitions/flag"
> +
> +          nvidia,usb2-companion:
> +            description: A single cell that specifies the physical port
> +              number to map this super-speed USB port to. The range of
> +              valid port numbers varies with the SoC generation.
> +            $ref: "/schemas/types.yaml#/definitions/uint32"
> +            enum: [ 0, 1, 2 ]
> +
> +          status:
> +            $ref: "/schemas/dt-core.yaml#/properties/status"
> +
> +          vbus-supply:
> +            description: A phandle to the regulator supplying the VBUS
> +              voltage.
> +
> +        additionalProperties: false
> +
> +    additionalProperties: false
> +
> +additionalProperties: false
> +
> +required:
> +  - compatible
> +  - reg
> +  - resets
> +  - reset-names
> +  - avdd-pll-utmip-supply
> +  - avdd-pll-erefe-supply
> +  - avdd-pex-pll-supply
> +  - hvdd-pex-pll-e-supply
> +
> +examples:
> +  # Tegra124 and Tegra132
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +    padctl@7009f000 {
> +        compatible = "nvidia,tegra124-xusb-padctl";
> +        reg = <0x7009f000 0x1000>;
> +        interrupts = <GIC_SPI 20 IRQ_TYPE_LEVEL_HIGH>;
> +        resets = <&tegra_car 142>;
> +        reset-names = "padctl";
> +
> +        avdd-pll-utmip-supply = <&vddio_1v8>;
> +        avdd-pll-erefe-supply = <&avdd_1v05_run>;
> +        avdd-pex-pll-supply = <&vdd_1v05_run>;
> +        hvdd-pex-pll-e-supply = <&vdd_3v3_lp0>;
> +
> +        pads {
> +            usb2 {
> +                lanes {
> +                    usb2-0 {
> +                        nvidia,function = "xusb";
> +                        #phy-cells = <0>;
> +                    };
> +
> +                    usb2-1 {
> +                        nvidia,function = "xusb";
> +                        #phy-cells = <0>;
> +                    };
> +
> +                    usb2-2 {
> +                        nvidia,function = "xusb";
> +                        #phy-cells = <0>;
> +                    };
> +                };
> +            };
> +
> +            ulpi {
> +                lanes {
> +                    ulpi-0 {
> +                        status = "disabled";

The normal comment is 'status' should not be in examples, and I have a 
schema to check just that. But I guess it makes sense here with how it 
is used...

> +                        #phy-cells = <0>;
> +                    };
> +                };
> +            };
> +
> +            hsic {
> +                lanes {
> +                    hsic-0 {
> +                        status = "disabled";
> +                        #phy-cells = <0>;
> +                    };
> +
> +                    hsic-1 {
> +                        status = "disabled";
> +                        #phy-cells = <0>;
> +                    };
> +                };
> +            };
> +
> +            pcie {
> +                lanes {
> +                    pcie-0 {
> +                        nvidia,function = "usb3-ss";
> +                        #phy-cells = <0>;
> +                    };
> +
> +                    pcie-1 {
> +                        status = "disabled";
> +                        #phy-cells = <0>;
> +                    };
> +
> +                    pcie-2 {
> +                        nvidia,function = "pcie";
> +                        #phy-cells = <0>;
> +                    };
> +
> +                    pcie-3 {
> +                        status = "disabled";
> +                        #phy-cells = <0>;
> +                    };
> +
> +                    pcie-4 {
> +                        nvidia,function = "pcie";
> +                        #phy-cells = <0>;
> +                    };
> +                };
> +            };
> +
> +            sata {
> +                lanes {
> +                    sata-0 {
> +                        nvidia,function = "sata";
> +                        #phy-cells = <0>;
> +                    };
> +                };
> +            };
> +        };
> +
> +        ports {
> +            /* Micro A/B */
> +            usb2-0 {
> +                mode = "otg";
> +            };
> +
> +            /* Mini PCIe */
> +            usb2-1 {
> +                mode = "host";
> +            };
> +
> +            /* USB3 */
> +            usb2-2 {
> +                vbus-supply = <&vdd_usb3_vbus>;
> +                mode = "host";
> +            };
> +
> +            ulpi-0 {
> +                status = "disabled";
> +            };
> +
> +            hsic-0 {
> +                status = "disabled";
> +            };
> +
> +            hsic-1 {
> +                status = "disabled";
> +            };
> +
> +            usb3-0 {
> +                nvidia,usb2-companion = <2>;
> +            };
> +
> +            usb3-1 {
> +                status = "disabled";
> +            };
> +        };
> +    };

Similar comments for the rest.

Rob
