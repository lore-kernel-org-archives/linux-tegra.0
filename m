Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14055C433ED
	for <linux-tegra@archiver.kernel.org>; Fri,  9 Apr 2021 00:17:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C0B5061165
	for <linux-tegra@archiver.kernel.org>; Fri,  9 Apr 2021 00:17:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233026AbhDIARM (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 8 Apr 2021 20:17:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39632 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232426AbhDIARM (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 8 Apr 2021 20:17:12 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A6C3C061760;
        Thu,  8 Apr 2021 17:17:00 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id o126so6991838lfa.0;
        Thu, 08 Apr 2021 17:17:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=/E9rjFis209vB8mKqrZTfEo8r+p4OTpVfwqR6ApKPLE=;
        b=h8Ek7qkWul9n2j2hqzgylEptBvi+Uho1FDpFv5HWPMNVlxKOMoa8QNn3PxWD7zeSDi
         bqg8Zd6bvLr3N0gYiuas9KoyZMzWNMHlJHgCOLjtmP594semIn0rD6oie4KybZD7CafN
         xdbLGku/+7XecIpOwjPhMDmGkJvw6+T9nrin71KsQRCeoX3LAnW9c1aRjucdBuWVaHw+
         3sPmWhp3G2Y/TIxzQnQaeuCg+LKCypVOL4b+sWdYmQrdjZ0u9AEME1ZfajItpDrp3WfU
         QJ88x6hvM3EF2+1BBWE/r1ufLq2z6B+xKUPCBxmuZBA/xHIShRonOuO4LBWiSQ68BlhH
         alwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=/E9rjFis209vB8mKqrZTfEo8r+p4OTpVfwqR6ApKPLE=;
        b=GB3FHEa/YMka6AgYmYk7DqGqNrkxmKMftmB/ws9Bca+4tTp/m8LT1hmlglBONGkUh2
         hFmlARByVJrLejqxAWREnO0eJaGHIsWtB1J9mi1yALyEMmef63KAJpcxS5NYn9S9wrKq
         HtxRB7fKAQbBLeA9OTu6pc7Yt1eCKr1cWtLh90oJeUogDziTZAkVP0BaHHn86Q1oNsmo
         IUmAYlkons4j9gCRu6JGzJ8fhHC7ORztm/+ZhGqdoFfcFhwFyJuuuJvGVrHGDUJ5vZ4S
         m+7mx5T6Mm7Lzz1fjIInvR9YFwAco4t4AGtHB9skCUGj+EQHO+FWzndudO3d67dOEUUk
         Rq3Q==
X-Gm-Message-State: AOAM530mGPNSuJxXqHKbmBjwbq/SHrO/r4MfaO5WevTg8R2Nm1T1N3sU
        PETe/oPX4kAkH/MEkK7Vwsu3D22ExXY=
X-Google-Smtp-Source: ABdhPJwXqZ9OazqlFl2/uP/zDKATAxa7zGpu/R1jbPpqOvU0sTEjey/pK7VCXHrbSESo0G4rTsCgPQ==
X-Received: by 2002:ac2:5dd4:: with SMTP id x20mr1279356lfq.517.1617927418769;
        Thu, 08 Apr 2021 17:16:58 -0700 (PDT)
Received: from [192.168.2.145] (109-252-193-85.dynamic.spd-mgts.ru. [109.252.193.85])
        by smtp.googlemail.com with ESMTPSA id w14sm92902lfl.305.2021.04.08.17.16.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Apr 2021 17:16:58 -0700 (PDT)
Subject: Re: [PATCH v3 1/1] dt-bindings: memory: tegra20: emc: Convert to
 schema
To:     Rob Herring <robh@kernel.org>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-tegra@vger.kernel.org
References: <20210404155501.5066-1-digetx@gmail.com>
 <20210404155501.5066-2-digetx@gmail.com>
 <20210408202953.GA1902701@robh.at.kernel.org>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <dc60e7f4-1513-5c8e-0ad2-7671a2cb02de@gmail.com>
Date:   Fri, 9 Apr 2021 03:16:57 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210408202953.GA1902701@robh.at.kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

08.04.2021 23:29, Rob Herring пишет:
> On Sun, Apr 04, 2021 at 06:55:01PM +0300, Dmitry Osipenko wrote:
>> Convert Tegra20 External Memory Controller binding to schema.
>>
>> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
>> ---
>>  .../memory-controllers/nvidia,tegra20-emc.txt | 130 --------
>>  .../nvidia,tegra20-emc.yaml                   | 303 ++++++++++++++++++
>>  2 files changed, 303 insertions(+), 130 deletions(-)
>>  delete mode 100644 Documentation/devicetree/bindings/memory-controllers/nvidia,tegra20-emc.txt
>>  create mode 100644 Documentation/devicetree/bindings/memory-controllers/nvidia,tegra20-emc.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra20-emc.txt b/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra20-emc.txt
>> deleted file mode 100644
>> index d2250498c36d..000000000000
>> --- a/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra20-emc.txt
>> +++ /dev/null
>> @@ -1,130 +0,0 @@
>> -Embedded Memory Controller
>> -
>> -Properties:
>> -- name : Should be emc
>> -- #address-cells : Should be 1
>> -- #size-cells : Should be 0
>> -- compatible : Should contain "nvidia,tegra20-emc".
>> -- reg : Offset and length of the register set for the device
>> -- nvidia,use-ram-code : If present, the sub-nodes will be addressed
>> -  and chosen using the ramcode board selector. If omitted, only one
>> -  set of tables can be present and said tables will be used
>> -  irrespective of ram-code configuration.
>> -- interrupts : Should contain EMC General interrupt.
>> -- clocks : Should contain EMC clock.
>> -- nvidia,memory-controller : Phandle of the Memory Controller node.
>> -- #interconnect-cells : Should be 0.
>> -- operating-points-v2: See ../bindings/opp/opp.txt for details.
>> -
>> -For each opp entry in 'operating-points-v2' table:
>> -- opp-supported-hw: One bitfield indicating SoC process ID mask
>> -
>> -	A bitwise AND is performed against this value and if any bit
>> -	matches, the OPP gets enabled.
>> -
>> -Optional properties:
>> -- power-domains: Phandle of the SoC "core" power domain.
>> -
>> -Child device nodes describe the memory settings for different configurations and clock rates.
>> -
>> -Example:
>> -
>> -	opp_table: opp-table {
>> -		compatible = "operating-points-v2";
>> -
>> -		opp@36000000 {
>> -			opp-microvolt = <950000 950000 1300000>;
>> -			opp-hz = /bits/ 64 <36000000>;
>> -		};
>> -		...
>> -	};
>> -
>> -	memory-controller@7000f400 {
>> -		#address-cells = < 1 >;
>> -		#size-cells = < 0 >;
>> -		#interconnect-cells = <0>;
>> -		compatible = "nvidia,tegra20-emc";
>> -		reg = <0x7000f400 0x400>;
>> -		interrupts = <0 78 0x04>;
>> -		clocks = <&tegra_car TEGRA20_CLK_EMC>;
>> -		nvidia,memory-controller = <&mc>;
>> -		power-domains = <&domain>;
>> -		operating-points-v2 = <&opp_table>;
>> -	}
>> -
>> -
>> -Embedded Memory Controller ram-code table
>> -
>> -If the emc node has the nvidia,use-ram-code property present, then the
>> -next level of nodes below the emc table are used to specify which settings
>> -apply for which ram-code settings.
>> -
>> -If the emc node lacks the nvidia,use-ram-code property, this level is omitted
>> -and the tables are stored directly under the emc node (see below).
>> -
>> -Properties:
>> -
>> -- name : Should be emc-tables
>> -- nvidia,ram-code : the binary representation of the ram-code board strappings
>> -  for which this node (and children) are valid.
>> -
>> -
>> -
>> -Embedded Memory Controller configuration table
>> -
>> -This is a table containing the EMC register settings for the various
>> -operating speeds of the memory controller. They are always located as
>> -subnodes of the emc controller node.
>> -
>> -There are two ways of specifying which tables to use:
>> -
>> -* The simplest is if there is just one set of tables in the device tree,
>> -  and they will always be used (based on which frequency is used).
>> -  This is the preferred method, especially when firmware can fill in
>> -  this information based on the specific system information and just
>> -  pass it on to the kernel.
>> -
>> -* The slightly more complex one is when more than one memory configuration
>> -  might exist on the system.  The Tegra20 platform handles this during
>> -  early boot by selecting one out of possible 4 memory settings based
>> -  on a 2-pin "ram code" bootstrap setting on the board. The values of
>> -  these strappings can be read through a register in the SoC, and thus
>> -  used to select which tables to use.
>> -
>> -Properties:
>> -- name : Should be emc-table
>> -- compatible : Should contain "nvidia,tegra20-emc-table".
>> -- reg : either an opaque enumerator to tell different tables apart, or
>> -  the valid frequency for which the table should be used (in kHz).
>> -- clock-frequency : the clock frequency for the EMC at which this
>> -  table should be used (in kHz).
>> -- nvidia,emc-registers : a 46 word array of EMC registers to be programmed
>> -  for operation at the 'clock-frequency' setting.
>> -  The order and contents of the registers are:
>> -    RC, RFC, RAS, RP, R2W, W2R, R2P, W2P, RD_RCD, WR_RCD, RRD, REXT,
>> -    WDV, QUSE, QRST, QSAFE, RDV, REFRESH, BURST_REFRESH_NUM, PDEX2WR,
>> -    PDEX2RD, PCHG2PDEN, ACT2PDEN, AR2PDEN, RW2PDEN, TXSR, TCKE, TFAW,
>> -    TRPAB, TCLKSTABLE, TCLKSTOP, TREFBW, QUSE_EXTRA, FBIO_CFG6, ODT_WRITE,
>> -    ODT_READ, FBIO_CFG5, CFG_DIG_DLL, DLL_XFORM_DQS, DLL_XFORM_QUSE,
>> -    ZCAL_REF_CNT, ZCAL_WAIT_CNT, AUTO_CAL_INTERVAL, CFG_CLKTRIM_0,
>> -    CFG_CLKTRIM_1, CFG_CLKTRIM_2
>> -
>> -		emc-table@166000 {
>> -			reg = <166000>;
>> -			compatible = "nvidia,tegra20-emc-table";
>> -			clock-frequency = < 166000 >;
>> -			nvidia,emc-registers = < 0 0 0 0 0 0 0 0 0 0 0 0 0 0
>> -						 0 0 0 0 0 0 0 0 0 0 0 0 0 0
>> -						 0 0 0 0 0 0 0 0 0 0 0 0 0 0
>> -						 0 0 0 0 >;
>> -		};
>> -
>> -		emc-table@333000 {
>> -			reg = <333000>;
>> -			compatible = "nvidia,tegra20-emc-table";
>> -			clock-frequency = < 333000 >;
>> -			nvidia,emc-registers = < 0 0 0 0 0 0 0 0 0 0 0 0 0 0
>> -						 0 0 0 0 0 0 0 0 0 0 0 0 0 0
>> -						 0 0 0 0 0 0 0 0 0 0 0 0 0 0
>> -						 0 0 0 0 >;
>> -		};
>> diff --git a/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra20-emc.yaml b/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra20-emc.yaml
>> new file mode 100644
>> index 000000000000..f4ccfa85d5fb
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra20-emc.yaml
>> @@ -0,0 +1,303 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/memory-controllers/nvidia,tegra20-emc.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: NVIDIA Tegra20 SoC External Memory Controller
>> +
>> +maintainers:
>> +  - Dmitry Osipenko <digetx@gmail.com>
>> +  - Jon Hunter <jonathanh@nvidia.com>
>> +  - Thierry Reding <thierry.reding@gmail.com>
>> +
>> +description: |
>> +  The External Memory Controller (EMC) interfaces with the off-chip SDRAM to
>> +  service the request stream sent from Memory Controller. The EMC also has
>> +  various performance-affecting settings beyond the obvious SDRAM configuration
>> +  parameters and initialization settings. Tegra20 EMC supports multiple JEDEC
>> +  standard protocols: DDR1, LPDDR2 and DDR2.
>> +
>> +properties:
>> +  compatible:
>> +    const: nvidia,tegra20-emc
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  clocks:
>> +    maxItems: 1
>> +
>> +  interrupts:
>> +    maxItems: 1
>> +
>> +  "#address-cells":
>> +    const: 1
>> +
>> +  "#size-cells":
>> +    const: 0
>> +
>> +  "#interconnect-cells":
>> +    const: 0
>> +
>> +  nvidia,memory-controller:
>> +    $ref: /schemas/types.yaml#/definitions/phandle
>> +    description:
>> +      Phandle of the Memory Controller node.
>> +
>> +  power-domains:
>> +    maxItems: 1
>> +    description:
>> +      Phandle of the SoC "core" power domain.
>> +
>> +  operating-points-v2:
>> +    description:
>> +      Should contain freqs and voltages and opp-supported-hw property, which
>> +      is a bitfield indicating SoC process ID mask.
>> +
>> +  nvidia,use-ram-code:
>> +    type: boolean
>> +    description:
>> +      If present, the emc-tables@ sub-nodes will be addressed.
>> +
>> +patternProperties:
>> +  "^emc-table@[0-9]+$":
> 
> Duplicating this can be avoided. Change this to:
> 
> $defs:
>   emc-table:
> 
> 
> And then do:
> 
> patternProperties:
>   "^emc-table@[0-9]+$":
>     $ref: #/$defs/emc-table
> 
> And the same later on.

Thank you, I'll try that variant.
