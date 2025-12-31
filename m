Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 949E830BF60
	for <linux-tegra@vger.kernel.org>; Wed, 31 Dec 2025 08:21:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767169315; cv=none; b=bctUWxu+jyC6shaij0J5OUxIeRsseFyA5Wkj0mHNsXEAZu3rs9/eUWU5nhODR/9/iQADVguLzkVpnbMO5cF1W4yhOjn0Uqp/KgBkipEfQBQStrPpi1GWDUfvgomdR60PPcRiGT+MYqdK/TIALmDjeKgD4Cf6PGyIWlc6tFwlBRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767169315; c=relaxed/simple;
	bh=0K11P5p0ZEWKw+Z7Tb6gGI48ZExl1y9WmaLk/8OFpN4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gTn/uJlUVtZNRLv5ujM7qZS9CvncNMnwmw9OsBD1OSMr6TZ7DOGh0kz5IFIJeGe6KkBN8QrnReegPv1pYo83mQmKIvIEjQJWx/rmwnETE7+sxcNIgwJoKPy6lYKT/aT3rKfjOYbHGp5VOfIoqEiqILuIShWXNeh62ICwPwZhf4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A5/E3r5P; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A5/E3r5P"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2a0d5c365ceso140801825ad.3
        for <linux-tegra@vger.kernel.org>; Wed, 31 Dec 2025 00:21:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767169313; x=1767774113; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pM8EtERWnfRSuu67YWhPe5WAPfUUQdQHLM2qZyic10w=;
        b=A5/E3r5PMGSNCQNJ9lay+sGQNgvPd2mDX0puTxXZpAffF8WYQZuBOpCpr183PK9f91
         0F0oI4svmiAyfJTEy/aVAUH8gHWYhimaD7uBoqLnkCO6muuxhxq0/K8qK6iH7ncS2J39
         DA6w6X75SQRfzvTwD3UHg7twz76pF0JpobqA8q+9Clemk4Z3XdzdYjnFx+4PCJTHm9rQ
         3UlWtzRavwT1uivZPUWcojVTE9fo0qJYBmH9lk6xDC6evWMlRIVpGClYgyyBWBsagDBU
         VijjXzQsInpmi3b/wjVSd3Dy/OPta2lPHGYj0Fnr3bi4k+/wmNbpwejWp3dfY1HRyZkD
         zgfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767169313; x=1767774113;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pM8EtERWnfRSuu67YWhPe5WAPfUUQdQHLM2qZyic10w=;
        b=J7vrOTeaTkXSUt+HTNgGYEsV1EomyoRuPNNos2XTjWG3ITfrOm4ME/O3MeXF7P8FoF
         LuK/qo6Wp6sKUJPdHOvvJmE88asXLE8mSY0VmsSD8ytzdCeMxDZMU1LowSJwoEk9Ua6B
         pPLZHsB22SX3WZ5d0fqANjviUyLe5RG+VDWxNIuQO+mVXlzWEVM23ftokCtQs+rQ6rTu
         /H0GjePwLKYYq3CoPBB9nS+MJRzyyI7japLtxUK9qyy4vl1q3a/UoxFEaIWlywfRCPET
         zbOvBq91ZkhHt1o7SWIm5hyClpJYW/msDGtbu6ksQZ5nmQhixNL8g1+NloTco7bgt6Xl
         RNZg==
X-Forwarded-Encrypted: i=1; AJvYcCXUbuDIei3T0ZkbZPVVXUsoirojjL7VWAOtzXCQHz7ALCDYK0a7gURFvXUbmpMY+I1JTyws/rZzFWVkCA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwS2PWpSp7USCoIlKQ8x7cnfbBL8cyOfHYD3KkTTuzM7JIku9ab
	Q2WJ9PEJEdT17FJPZjPp5K/iHDgCfdzTYw2JGsQk+z4qih6MYpZ1Gmq1
X-Gm-Gg: AY/fxX5JqxCso6h78QGKGvGAN4YwmCcWPgciRjYtKcVjILdqxDlLrv51ffbeugHjG5p
	2PHwlJYZErYxe3M06nDCnfc2AAlw0nC4GL9ZfuE7X6OlWHocQ0DS/vtT0Ywy9sl+Ki85oYu1uqM
	C6B3C4b63lp3sHDek8mt98EXi9XNePRsj07Q0orfD2DcF+mSsDd7xRaQmhokF2HFVpTV+MUrane
	kxy+uTEK/pzrTrMA21OHupnODUBDfvZx/7/txFfyyRTSi2ImJOoT+IEIwx7OdsTE7Buq2kywKRu
	8Js+UT8l3l1WsSX/eN3ZKzyCRl1L05RBG/TAXDCBAFRwQkSCjz9S6qUmZ/WRFCHmpieNW4eN616
	Z2P2F07APoJtrL3pnvWF8CBB/51BD/KMqeeCrbI4xZxb+Wfd8tm953+R2kPEyinb/ROLQWcYj/4
	B9uO+ldGocnSJDV/1X39CIksuWUXLG3BsPZ94y9g==
X-Google-Smtp-Source: AGHT+IGwWF/osE+HYmoH/fZSSrPCaaGpDZsI4LlTPJyRcz8V/TsbQniUgWS0cU9t4dihgXmLeP2mQQ==
X-Received: by 2002:a17:902:ce82:b0:2a0:f469:1f56 with SMTP id d9443c01a7336-2a2f272b393mr394966645ad.31.1767169312819;
        Wed, 31 Dec 2025 00:21:52 -0800 (PST)
Received: from [192.168.1.10] ([122.162.204.179])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c1e7a018586sm30029763a12.15.2025.12.31.00.21.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 31 Dec 2025 00:21:52 -0800 (PST)
Message-ID: <c711c06b-ff32-4606-8d98-9195f20de38a@gmail.com>
Date: Wed, 31 Dec 2025 13:51:47 +0530
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] dt-bindings: mtd: nvidia,tegra20-nand: convert to DT
 schema
To: Rob Herring <robh@kernel.org>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Stefan Agner <stefan@agner.ch>,
 Lucas Stach <dev@lynxeye.de>, linux-mtd@lists.infradead.org,
 devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20251229-nvidia-nand-v2-1-b697d9724b0b@gmail.com>
 <20251230172313.GA505571-robh@kernel.org>
Content-Language: en-US
From: Charan Pedumuru <charan.pedumuru@gmail.com>
In-Reply-To: <20251230172313.GA505571-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 30-12-2025 22:53, Rob Herring wrote:
> On Mon, Dec 29, 2025 at 02:31:12PM +0000, Charan Pedumuru wrote:
>> Convert NVIDIA Tegra NAND Flash Controller binding to YAML format.
>> Changes during Conversion:
>> - Define new properties `power-domains` and `operating-points-v2`
>>   because the existing in tree DTS uses them.
>>
>> Signed-off-by: Charan Pedumuru <charan.pedumuru@gmail.com>
>> ---
>> Changes in v2:
>> - Edited the commit description to match the updated changes.
>> - Modified the description for the YAML.
>> - Removed all the duplicated properties, defined a proper ref for both parent
>>   and child nodes.
>> - Removed unnecessary properties from the required following the old
>>   text binding.
>> - Link to v1: https://lore.kernel.org/r/20251030-nvidia-nand-v1-1-7614e1428292@gmail.com
>> ---
>>  .../bindings/mtd/nvidia,tegra20-nand.yaml          | 107 +++++++++++++++++++++
>>  .../bindings/mtd/nvidia-tegra20-nand.txt           |  64 ------------
>>  2 files changed, 107 insertions(+), 64 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/mtd/nvidia,tegra20-nand.yaml b/Documentation/devicetree/bindings/mtd/nvidia,tegra20-nand.yaml
>> new file mode 100644
>> index 000000000000..f34eaad67e11
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/mtd/nvidia,tegra20-nand.yaml
>> @@ -0,0 +1,107 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/mtd/nvidia,tegra20-nand.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: NVIDIA Tegra NAND Flash Controller
>> +
>> +maintainers:
>> +  - Jonathan Hunter <jonathanh@nvidia.com>
>> +
>> +allOf:
>> +  - $ref: nand-controller.yaml
>> +
>> +description:
>> +  The NVIDIA NAND controller provides an interface between NVIDIA SoCs
>> +  and raw NAND flash devices. It supports standard NAND operations,
>> +  hardware-assisted ECC, OOB data access, and DMA transfers, and
>> +  integrates with the Linux MTD NAND subsystem for reliable flash management.
>> +
>> +properties:
>> +  compatible:
>> +    const: nvidia,tegra20-nand
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  interrupts:
>> +    maxItems: 1
>> +
>> +  clocks:
>> +    maxItems: 1
>> +
>> +  clock-names:
>> +    items:
>> +      - const: nand
>> +
>> +  resets:
>> +    maxItems: 1
>> +
>> +  reset-names:
>> +    items:
>> +      - const: nand
>> +
>> +  power-domains:
>> +    maxItems: 1
>> +
>> +  operating-points-v2:
>> +    maxItems: 1
>> +
> 
>> +patternProperties:
>> +  "^nand@[0-5]$":
> 
> '^nand@':
> 
> The unit-address restriction here doesn't restrict anything.
> 
> Single quotes are preferred over double quotes.

Sure, I will use single quotes.

> 
>> +    type: object
>> +    description: Individual NAND chip connected to the NAND controller
>> +    $ref: raw-nand-chip.yaml#
>> +
> 
> properties:
>   reg:
>     maximum: 5

Okay.

> 
>> +    patternProperties:
>> +      "^partition@[0-9a-f]+$":
>> +        description:
>> +          Optional MTD partitions for the NAND chip, as defined in mtd.yaml
>> +        $ref: mtd.yaml#
> 
> Drop. All of this is handled by raw-nand-chip.yaml.
> 
>> +
>> +    required:
>> +      - reg
> 
> Drop. Already required by nand-chip.yaml.

Okay, I will remove the partition child node and required for nand node.

> 
>> +
>> +    unevaluatedProperties: false
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - interrupts
>> +  - clocks
>> +  - clock-names
>> +  - resets
>> +  - reset-names
>> +
>> +unevaluatedProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>> +    #include <dt-bindings/clock/tegra20-car.h>
>> +    #include <dt-bindings/gpio/tegra-gpio.h>
>> +
>> +    nand-controller@70008000 {
>> +        compatible = "nvidia,tegra20-nand";
>> +        reg = <0x70008000 0x100>;
>> +        interrupts = <GIC_SPI 24 IRQ_TYPE_LEVEL_HIGH>;
>> +        clocks = <&tegra_car TEGRA20_CLK_NDFLASH>;
>> +        clock-names = "nand";
>> +        resets = <&tegra_car 13>;
>> +        reset-names = "nand";
>> +        #address-cells = <1>;
>> +        #size-cells = <0>;
>> +
>> +        nand@0 {
>> +            reg = <0>;
>> +            #address-cells = <1>;
>> +            #size-cells = <1>;
>> +            nand-bus-width = <8>;
>> +            nand-on-flash-bbt;
>> +            nand-ecc-algo = "bch";
>> +            nand-ecc-strength = <8>;
>> +            wp-gpios = <&gpio TEGRA_GPIO(S, 0) GPIO_ACTIVE_LOW>;
>> +        };
>> +    };
>> +...
>> diff --git a/Documentation/devicetree/bindings/mtd/nvidia-tegra20-nand.txt b/Documentation/devicetree/bindings/mtd/nvidia-tegra20-nand.txt
>> deleted file mode 100644
>> index 4a00ec2b2540..000000000000
>> --- a/Documentation/devicetree/bindings/mtd/nvidia-tegra20-nand.txt
>> +++ /dev/null
>> @@ -1,64 +0,0 @@
>> -NVIDIA Tegra NAND Flash controller
>> -
>> -Required properties:
>> -- compatible: Must be one of:
>> -  - "nvidia,tegra20-nand"
>> -- reg: MMIO address range
>> -- interrupts: interrupt output of the NFC controller
>> -- clocks: Must contain an entry for each entry in clock-names.
>> -  See ../clocks/clock-bindings.txt for details.
>> -- clock-names: Must include the following entries:
>> -  - nand
>> -- resets: Must contain an entry for each entry in reset-names.
>> -  See ../reset/reset.txt for details.
>> -- reset-names: Must include the following entries:
>> -  - nand
>> -
>> -Optional children nodes:
>> -Individual NAND chips are children of the NAND controller node. Currently
>> -only one NAND chip supported.
>> -
>> -Required children node properties:
>> -- reg: An integer ranging from 1 to 6 representing the CS line to use.
>> -
>> -Optional children node properties:
>> -- nand-ecc-mode: String, operation mode of the NAND ecc mode. Currently only
>> -		 "hw" is supported.
>> -- nand-ecc-algo: string, algorithm of NAND ECC.
>> -		 Supported values with "hw" ECC mode are: "rs", "bch".
>> -- nand-bus-width : See nand-controller.yaml
>> -- nand-on-flash-bbt: See nand-controller.yaml
>> -- nand-ecc-strength: integer representing the number of bits to correct
>> -		     per ECC step (always 512). Supported strength using HW ECC
>> -		     modes are:
>> -		     - RS: 4, 6, 8
>> -		     - BCH: 4, 8, 14, 16
>> -- nand-ecc-maximize: See nand-controller.yaml
>> -- nand-is-boot-medium: Makes sure only ECC strengths supported by the boot ROM
>> -		       are chosen.
>> -- wp-gpios: GPIO specifier for the write protect pin.
>> -
>> -Optional child node of NAND chip nodes:
>> -Partitions: see mtd.yaml
>> -
>> -  Example:
>> -	nand-controller@70008000 {
>> -		compatible = "nvidia,tegra20-nand";
>> -		reg = <0x70008000 0x100>;
>> -		interrupts = <GIC_SPI 24 IRQ_TYPE_LEVEL_HIGH>;
>> -		clocks = <&tegra_car TEGRA20_CLK_NDFLASH>;
>> -		clock-names = "nand";
>> -		resets = <&tegra_car 13>;
>> -		reset-names = "nand";
>> -
>> -		nand@0 {
>> -			reg = <0>;
>> -			#address-cells = <1>;
>> -			#size-cells = <1>;
>> -			nand-bus-width = <8>;
>> -			nand-on-flash-bbt;
>> -			nand-ecc-algo = "bch";
>> -			nand-ecc-strength = <8>;
>> -			wp-gpios = <&gpio TEGRA_GPIO(S, 0) GPIO_ACTIVE_LOW>;
>> -		};
>> -	};
>>
>> ---
>> base-commit: 43edce71d70c603d3f3f1b1c886f65cd02d80c24
>> change-id: 20251011-nvidia-nand-024cc7ae8b0a
>>
>> Best regards,
>> -- 
>> Charan Pedumuru <charan.pedumuru@gmail.com>
>>

-- 
Best Regards,
Charan.

