Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB940C433B4
	for <linux-tegra@archiver.kernel.org>; Thu,  8 Apr 2021 20:29:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8669861107
	for <linux-tegra@archiver.kernel.org>; Thu,  8 Apr 2021 20:29:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232322AbhDHUaJ (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 8 Apr 2021 16:30:09 -0400
Received: from mail-ot1-f48.google.com ([209.85.210.48]:35491 "EHLO
        mail-ot1-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232091AbhDHUaJ (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 8 Apr 2021 16:30:09 -0400
Received: by mail-ot1-f48.google.com with SMTP id v24-20020a9d69d80000b02901b9aec33371so3624546oto.2;
        Thu, 08 Apr 2021 13:29:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=cakW4ZXxe69nMeFI8ccco6QMH2RbmBbbKUMKGkS5ZFU=;
        b=DFD2o25BwjAoFUWhThT+KCwD8HjP5T9eph4f0vr6kyMQE16EYtHYRDL/ZGqW9oA9ru
         e0D0fCcHgDu4tJNqx6ZONWHxNq0K2Po4WwXZ8t4wXp+a2wKzt9YDu/MzhcURiBmSvaXV
         5715Hsib7e85uUN+kjE/yrAmiPWc0gQQuilm/Px16VT3aFpO64MT4tkoWMdLyxcWUEw1
         5ji+0T8XbFZR/CUTusMNS7PKRMEskG2Sijbny0tPxkh8t2fN2XHyfTITstxVVLK1FOU+
         UfeuHs8rr++IVuANwHZoOjY1knT1FeCRuT9LVBPUSqZQzibbmHvRH5dVBYPIIs/ZNwAl
         saqg==
X-Gm-Message-State: AOAM530yaFC6anVVHJAzfYx1zVKXAng6lZ2Igu2bGBQR9PDRTNC8119o
        1M6mxxxJCvmbrJSv31rNFw==
X-Google-Smtp-Source: ABdhPJzWZWdji3DH27c7B6zTzF78/vKAySXKhJSwQ0d+uoC9hAr7w5V8BSW4KCWBgkRJNNeu+26S9g==
X-Received: by 2002:a05:6830:1d70:: with SMTP id l16mr9404800oti.148.1617913795500;
        Thu, 08 Apr 2021 13:29:55 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id d206sm92970oib.56.2021.04.08.13.29.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Apr 2021 13:29:54 -0700 (PDT)
Received: (nullmailer pid 1908652 invoked by uid 1000);
        Thu, 08 Apr 2021 20:29:53 -0000
Date:   Thu, 8 Apr 2021 15:29:53 -0500
From:   Rob Herring <robh@kernel.org>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: Re: [PATCH v3 1/1] dt-bindings: memory: tegra20: emc: Convert to
 schema
Message-ID: <20210408202953.GA1902701@robh.at.kernel.org>
References: <20210404155501.5066-1-digetx@gmail.com>
 <20210404155501.5066-2-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210404155501.5066-2-digetx@gmail.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Sun, Apr 04, 2021 at 06:55:01PM +0300, Dmitry Osipenko wrote:
> Convert Tegra20 External Memory Controller binding to schema.
> 
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  .../memory-controllers/nvidia,tegra20-emc.txt | 130 --------
>  .../nvidia,tegra20-emc.yaml                   | 303 ++++++++++++++++++
>  2 files changed, 303 insertions(+), 130 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/memory-controllers/nvidia,tegra20-emc.txt
>  create mode 100644 Documentation/devicetree/bindings/memory-controllers/nvidia,tegra20-emc.yaml
> 
> diff --git a/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra20-emc.txt b/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra20-emc.txt
> deleted file mode 100644
> index d2250498c36d..000000000000
> --- a/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra20-emc.txt
> +++ /dev/null
> @@ -1,130 +0,0 @@
> -Embedded Memory Controller
> -
> -Properties:
> -- name : Should be emc
> -- #address-cells : Should be 1
> -- #size-cells : Should be 0
> -- compatible : Should contain "nvidia,tegra20-emc".
> -- reg : Offset and length of the register set for the device
> -- nvidia,use-ram-code : If present, the sub-nodes will be addressed
> -  and chosen using the ramcode board selector. If omitted, only one
> -  set of tables can be present and said tables will be used
> -  irrespective of ram-code configuration.
> -- interrupts : Should contain EMC General interrupt.
> -- clocks : Should contain EMC clock.
> -- nvidia,memory-controller : Phandle of the Memory Controller node.
> -- #interconnect-cells : Should be 0.
> -- operating-points-v2: See ../bindings/opp/opp.txt for details.
> -
> -For each opp entry in 'operating-points-v2' table:
> -- opp-supported-hw: One bitfield indicating SoC process ID mask
> -
> -	A bitwise AND is performed against this value and if any bit
> -	matches, the OPP gets enabled.
> -
> -Optional properties:
> -- power-domains: Phandle of the SoC "core" power domain.
> -
> -Child device nodes describe the memory settings for different configurations and clock rates.
> -
> -Example:
> -
> -	opp_table: opp-table {
> -		compatible = "operating-points-v2";
> -
> -		opp@36000000 {
> -			opp-microvolt = <950000 950000 1300000>;
> -			opp-hz = /bits/ 64 <36000000>;
> -		};
> -		...
> -	};
> -
> -	memory-controller@7000f400 {
> -		#address-cells = < 1 >;
> -		#size-cells = < 0 >;
> -		#interconnect-cells = <0>;
> -		compatible = "nvidia,tegra20-emc";
> -		reg = <0x7000f400 0x400>;
> -		interrupts = <0 78 0x04>;
> -		clocks = <&tegra_car TEGRA20_CLK_EMC>;
> -		nvidia,memory-controller = <&mc>;
> -		power-domains = <&domain>;
> -		operating-points-v2 = <&opp_table>;
> -	}
> -
> -
> -Embedded Memory Controller ram-code table
> -
> -If the emc node has the nvidia,use-ram-code property present, then the
> -next level of nodes below the emc table are used to specify which settings
> -apply for which ram-code settings.
> -
> -If the emc node lacks the nvidia,use-ram-code property, this level is omitted
> -and the tables are stored directly under the emc node (see below).
> -
> -Properties:
> -
> -- name : Should be emc-tables
> -- nvidia,ram-code : the binary representation of the ram-code board strappings
> -  for which this node (and children) are valid.
> -
> -
> -
> -Embedded Memory Controller configuration table
> -
> -This is a table containing the EMC register settings for the various
> -operating speeds of the memory controller. They are always located as
> -subnodes of the emc controller node.
> -
> -There are two ways of specifying which tables to use:
> -
> -* The simplest is if there is just one set of tables in the device tree,
> -  and they will always be used (based on which frequency is used).
> -  This is the preferred method, especially when firmware can fill in
> -  this information based on the specific system information and just
> -  pass it on to the kernel.
> -
> -* The slightly more complex one is when more than one memory configuration
> -  might exist on the system.  The Tegra20 platform handles this during
> -  early boot by selecting one out of possible 4 memory settings based
> -  on a 2-pin "ram code" bootstrap setting on the board. The values of
> -  these strappings can be read through a register in the SoC, and thus
> -  used to select which tables to use.
> -
> -Properties:
> -- name : Should be emc-table
> -- compatible : Should contain "nvidia,tegra20-emc-table".
> -- reg : either an opaque enumerator to tell different tables apart, or
> -  the valid frequency for which the table should be used (in kHz).
> -- clock-frequency : the clock frequency for the EMC at which this
> -  table should be used (in kHz).
> -- nvidia,emc-registers : a 46 word array of EMC registers to be programmed
> -  for operation at the 'clock-frequency' setting.
> -  The order and contents of the registers are:
> -    RC, RFC, RAS, RP, R2W, W2R, R2P, W2P, RD_RCD, WR_RCD, RRD, REXT,
> -    WDV, QUSE, QRST, QSAFE, RDV, REFRESH, BURST_REFRESH_NUM, PDEX2WR,
> -    PDEX2RD, PCHG2PDEN, ACT2PDEN, AR2PDEN, RW2PDEN, TXSR, TCKE, TFAW,
> -    TRPAB, TCLKSTABLE, TCLKSTOP, TREFBW, QUSE_EXTRA, FBIO_CFG6, ODT_WRITE,
> -    ODT_READ, FBIO_CFG5, CFG_DIG_DLL, DLL_XFORM_DQS, DLL_XFORM_QUSE,
> -    ZCAL_REF_CNT, ZCAL_WAIT_CNT, AUTO_CAL_INTERVAL, CFG_CLKTRIM_0,
> -    CFG_CLKTRIM_1, CFG_CLKTRIM_2
> -
> -		emc-table@166000 {
> -			reg = <166000>;
> -			compatible = "nvidia,tegra20-emc-table";
> -			clock-frequency = < 166000 >;
> -			nvidia,emc-registers = < 0 0 0 0 0 0 0 0 0 0 0 0 0 0
> -						 0 0 0 0 0 0 0 0 0 0 0 0 0 0
> -						 0 0 0 0 0 0 0 0 0 0 0 0 0 0
> -						 0 0 0 0 >;
> -		};
> -
> -		emc-table@333000 {
> -			reg = <333000>;
> -			compatible = "nvidia,tegra20-emc-table";
> -			clock-frequency = < 333000 >;
> -			nvidia,emc-registers = < 0 0 0 0 0 0 0 0 0 0 0 0 0 0
> -						 0 0 0 0 0 0 0 0 0 0 0 0 0 0
> -						 0 0 0 0 0 0 0 0 0 0 0 0 0 0
> -						 0 0 0 0 >;
> -		};
> diff --git a/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra20-emc.yaml b/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra20-emc.yaml
> new file mode 100644
> index 000000000000..f4ccfa85d5fb
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra20-emc.yaml
> @@ -0,0 +1,303 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/memory-controllers/nvidia,tegra20-emc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: NVIDIA Tegra20 SoC External Memory Controller
> +
> +maintainers:
> +  - Dmitry Osipenko <digetx@gmail.com>
> +  - Jon Hunter <jonathanh@nvidia.com>
> +  - Thierry Reding <thierry.reding@gmail.com>
> +
> +description: |
> +  The External Memory Controller (EMC) interfaces with the off-chip SDRAM to
> +  service the request stream sent from Memory Controller. The EMC also has
> +  various performance-affecting settings beyond the obvious SDRAM configuration
> +  parameters and initialization settings. Tegra20 EMC supports multiple JEDEC
> +  standard protocols: DDR1, LPDDR2 and DDR2.
> +
> +properties:
> +  compatible:
> +    const: nvidia,tegra20-emc
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  "#address-cells":
> +    const: 1
> +
> +  "#size-cells":
> +    const: 0
> +
> +  "#interconnect-cells":
> +    const: 0
> +
> +  nvidia,memory-controller:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description:
> +      Phandle of the Memory Controller node.
> +
> +  power-domains:
> +    maxItems: 1
> +    description:
> +      Phandle of the SoC "core" power domain.
> +
> +  operating-points-v2:
> +    description:
> +      Should contain freqs and voltages and opp-supported-hw property, which
> +      is a bitfield indicating SoC process ID mask.
> +
> +  nvidia,use-ram-code:
> +    type: boolean
> +    description:
> +      If present, the emc-tables@ sub-nodes will be addressed.
> +
> +patternProperties:
> +  "^emc-table@[0-9]+$":

Duplicating this can be avoided. Change this to:

$defs:
  emc-table:


And then do:

patternProperties:
  "^emc-table@[0-9]+$":
    $ref: #/$defs/emc-table

And the same later on.

> +    type: object
> +    properties:
> +      compatible:
> +        const: nvidia,tegra20-emc-table
> +
> +      clock-frequency:
> +        description:
> +          Memory clock rate in kHz.
> +        minimum: 1000
> +        maximum: 900000
> +
> +      reg:
> +        maxItems: 1
> +        description:
> +          Either an opaque enumerator to tell different tables apart, or
> +          the valid frequency for which the table should be used (in kHz).
> +
> +      nvidia,emc-registers:
> +        description:
> +          EMC timing characterization data. These are the registers
> +          (see section "15.4.1 EMC Registers" in the TRM) whose values
> +          need to be specified, according to the board documentation.
> +        $ref: /schemas/types.yaml#/definitions/uint32-array
> +        items:
> +          - description: EMC_RC
> +          - description: EMC_RFC
> +          - description: EMC_RAS
> +          - description: EMC_RP
> +          - description: EMC_R2W
> +          - description: EMC_W2R
> +          - description: EMC_R2P
> +          - description: EMC_W2P
> +          - description: EMC_RD_RCD
> +          - description: EMC_WR_RCD
> +          - description: EMC_RRD
> +          - description: EMC_REXT
> +          - description: EMC_WDV
> +          - description: EMC_QUSE
> +          - description: EMC_QRST
> +          - description: EMC_QSAFE
> +          - description: EMC_RDV
> +          - description: EMC_REFRESH
> +          - description: EMC_BURST_REFRESH_NUM
> +          - description: EMC_PDEX2WR
> +          - description: EMC_PDEX2RD
> +          - description: EMC_PCHG2PDEN
> +          - description: EMC_ACT2PDEN
> +          - description: EMC_AR2PDEN
> +          - description: EMC_RW2PDEN
> +          - description: EMC_TXSR
> +          - description: EMC_TCKE
> +          - description: EMC_TFAW
> +          - description: EMC_TRPAB
> +          - description: EMC_TCLKSTABLE
> +          - description: EMC_TCLKSTOP
> +          - description: EMC_TREFBW
> +          - description: EMC_QUSE_EXTRA
> +          - description: EMC_FBIO_CFG6
> +          - description: EMC_ODT_WRITE
> +          - description: EMC_ODT_READ
> +          - description: EMC_FBIO_CFG5
> +          - description: EMC_CFG_DIG_DLL
> +          - description: EMC_DLL_XFORM_DQS
> +          - description: EMC_DLL_XFORM_QUSE
> +          - description: EMC_ZCAL_REF_CNT
> +          - description: EMC_ZCAL_WAIT_CNT
> +          - description: EMC_AUTO_CAL_INTERVAL
> +          - description: EMC_CFG_CLKTRIM_0
> +          - description: EMC_CFG_CLKTRIM_1
> +          - description: EMC_CFG_CLKTRIM_2
> +
> +    required:
> +      - clock-frequency
> +      - compatible
> +      - reg
> +      - nvidia,emc-registers
> +
> +    additionalProperties: false
> +
> +  "^emc-tables@[a-z0-9-]+$":
> +    type: object
> +    properties:
> +      reg:
> +        maxItems: 1
> +        description:
> +          An opaque enumerator to tell different tables apart.
> +
> +      nvidia,ram-code:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        description:
> +          Value of RAM_CODE this timing set is used for.
> +
> +      "#address-cells":
> +        const: 1
> +
> +      "#size-cells":
> +        const: 0
> +
> +    patternProperties:
> +      "^emc-table@[0-9]+$":
> +        type: object
> +        properties:
> +          compatible:
> +            const: nvidia,tegra20-emc-table
> +
> +          clock-frequency:
> +            description:
> +              Memory clock rate in kHz.
> +            minimum: 1000
> +            maximum: 900000
> +
> +          reg:
> +            maxItems: 1
> +            description:
> +              Either an opaque enumerator to tell different tables apart, or
> +              the valid frequency for which the table should be used (in kHz).
> +
> +          nvidia,emc-registers:
> +            description:
> +              EMC timing characterization data. These are the registers
> +              (see section "15.4.1 EMC Registers" in the TRM) whose values
> +              need to be specified, according to the board documentation.
> +            $ref: /schemas/types.yaml#/definitions/uint32-array
> +            items:
> +              - description: EMC_RC
> +              - description: EMC_RFC
> +              - description: EMC_RAS
> +              - description: EMC_RP
> +              - description: EMC_R2W
> +              - description: EMC_W2R
> +              - description: EMC_R2P
> +              - description: EMC_W2P
> +              - description: EMC_RD_RCD
> +              - description: EMC_WR_RCD
> +              - description: EMC_RRD
> +              - description: EMC_REXT
> +              - description: EMC_WDV
> +              - description: EMC_QUSE
> +              - description: EMC_QRST
> +              - description: EMC_QSAFE
> +              - description: EMC_RDV
> +              - description: EMC_REFRESH
> +              - description: EMC_BURST_REFRESH_NUM
> +              - description: EMC_PDEX2WR
> +              - description: EMC_PDEX2RD
> +              - description: EMC_PCHG2PDEN
> +              - description: EMC_ACT2PDEN
> +              - description: EMC_AR2PDEN
> +              - description: EMC_RW2PDEN
> +              - description: EMC_TXSR
> +              - description: EMC_TCKE
> +              - description: EMC_TFAW
> +              - description: EMC_TRPAB
> +              - description: EMC_TCLKSTABLE
> +              - description: EMC_TCLKSTOP
> +              - description: EMC_TREFBW
> +              - description: EMC_QUSE_EXTRA
> +              - description: EMC_FBIO_CFG6
> +              - description: EMC_ODT_WRITE
> +              - description: EMC_ODT_READ
> +              - description: EMC_FBIO_CFG5
> +              - description: EMC_CFG_DIG_DLL
> +              - description: EMC_DLL_XFORM_DQS
> +              - description: EMC_DLL_XFORM_QUSE
> +              - description: EMC_ZCAL_REF_CNT
> +              - description: EMC_ZCAL_WAIT_CNT
> +              - description: EMC_AUTO_CAL_INTERVAL
> +              - description: EMC_CFG_CLKTRIM_0
> +              - description: EMC_CFG_CLKTRIM_1
> +              - description: EMC_CFG_CLKTRIM_2
> +
> +        required:
> +          - clock-frequency
> +          - compatible
> +          - reg
> +          - nvidia,emc-registers
> +
> +        additionalProperties: false
> +
> +    required:
> +      - nvidia,ram-code
> +
> +    additionalProperties: false
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +  - nvidia,memory-controller
> +  - "#interconnect-cells"
> +  - operating-points-v2
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    external-memory-controller@7000f400 {
> +        compatible = "nvidia,tegra20-emc";
> +        reg = <0x7000f400 0x400>;
> +        interrupts = <0 78 4>;
> +        clocks = <&clock_controller 57>;
> +
> +        nvidia,memory-controller = <&mc>;
> +        operating-points-v2 = <&dvfs_opp_table>;
> +        power-domains = <&domain>;
> +
> +        #interconnect-cells = <0>;
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        nvidia,use-ram-code;
> +
> +        emc-tables@0 {
> +            nvidia,ram-code = <0>;
> +            reg = <0>;
> +
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +
> +            emc-table@333000 {
> +                reg = <333000>;
> +                compatible = "nvidia,tegra20-emc-table";
> +                clock-frequency = <333000>;
> +                nvidia,emc-registers = <0x00000018 0x00000033
> +                        0x00000012 0x00000004 0x00000004 0x00000005
> +                        0x00000003 0x0000000c 0x00000006 0x00000006
> +                        0x00000003 0x00000001 0x00000004 0x00000005
> +                        0x00000004 0x00000009 0x0000000d 0x00000bff
> +                        0x00000000 0x00000003 0x00000003 0x00000006
> +                        0x00000006 0x00000001 0x00000011 0x000000c8
> +                        0x00000003 0x0000000e 0x00000007 0x00000008
> +                        0x00000002 0x00000000 0x00000000 0x00000002
> +                        0x00000000 0x00000000 0x00000083 0xf0440303
> +                        0x007fe010 0x00001414 0x00000000 0x00000000
> +                        0x00000000 0x00000000 0x00000000 0x00000000>;
> +            };
> +        };
> +    };
> -- 
> 2.30.2
> 
