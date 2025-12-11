Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C281D2D73B8
	for <linux-tegra@vger.kernel.org>; Thu, 11 Dec 2025 16:29:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765470577; cv=none; b=tmrz0PHBlAwopVklGZmUVdCSIfEAFzPLkBSWUYhJvguPxL5BSWTd79z6pdqLMurH8goDa/L6BDrxN9wusfZYV76H00XJ1QJjddNYtckv3TBEn0jWcK8xXR/3rM+fKkqVES9xaCLX042Lv25eYREsEDkRRSVhFw1aOi5b9PcvvIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765470577; c=relaxed/simple;
	bh=axH9+ML3iDQ94phCY/ovWj6g1PfWab2qlgyPUs88ia0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ad53+hC6smW8D28fGxFVfIrLizNi4cdOEw6yLpap/+Hz9EaPPPkuBwCtY096Bbnea4HCdFZ2HOB9096T2gxXmLS4701Y00dsKZ2gmHmZRtEISIt2Fnyn3orC0qoVU69fEBy/76B1EZW4VzYkIFUj5poVw03/ire9FisSm6mioz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BLTPdJ8q; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BLTPdJ8q"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-7b852bb31d9so331221b3a.0
        for <linux-tegra@vger.kernel.org>; Thu, 11 Dec 2025 08:29:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765470575; x=1766075375; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=awr8DF0rOP11yNcKK692Kf3EHuJbOE7t15SvXNPQdiU=;
        b=BLTPdJ8q73HYxewRzHEHDOovib99Xp0gk8nilXhzwNbI34UoWZWWXv98PL1h4e8Nyn
         vlOk/bDmYjuh1UH9WU7HwOCBGEUTYhIaAU95oQT84223Jf8BV9w+A0MMvnYSML+G2PZW
         Zo3MD0bH6UAjOQMbbiJfAqwlBJyVtdRjYub3WG+B2RTmByy12jEwd0sBkZHWTbJ2Jxpg
         xRzuy/9yhNCTl/u1etg9HGToChAeZAT+r5T4Knoj1zwqIehPcPMwSd7Sw8aNvN+v6qbK
         DjRkbXj5tfVtLxaW28BsN7UaVQCvPrewMGrNqhywouAnpNXhfnpBA64vc2y5bWYvHFq4
         3VRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765470575; x=1766075375;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=awr8DF0rOP11yNcKK692Kf3EHuJbOE7t15SvXNPQdiU=;
        b=AhGboGrVCXvsjnKX5hRpnGXXlKuZDGgnhNdmf+4qIRjuR/V9MZTuCBNGvwuz0S5feX
         eNpkSchRfv+PbINMOCJSJiaGRfckYdpn7JdGBDPItNp7KMZdQacmBO9YJstGMmF0zJWF
         oUjH9Vce7qH1sllOGZKpmnIT4awfRMg1oKYVD15NnE/zg1qmoF2LS98ZTZcVmqyEO6cY
         l/DoahVsQictz7JDX46cefZKoiBsObFIbVsgezFHvYik9lpYzTx5aUQjsd/8jImeaA5c
         iu2CJvS+HcXRfrfb+Vg5+sVoVZykUrHIw9YKPs6PsipPQJNLO7RatMhnnFwQST3mUpG8
         Rzpw==
X-Forwarded-Encrypted: i=1; AJvYcCUNXjzE4w6N8gduva11H7ztcjBHnj8VhZ19PYrIpLH4OkUCU04ZeGZYN+TIpORTwgZx9EzxF/ehKwaRUQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxcI+qXdBcPDiF5N65OUjjnN+cYydkN+FATf+JIC4cLbDnzLOon
	JECfGI4MqrSS1maRNX5xyHUeZvAVV0uR0Pj/w8OY9nagCslStfKFtkVe
X-Gm-Gg: AY/fxX4KtZipVmTeEj/DlQKQXCZ5gVYO3yYIqVyHXt4WFqfrtIEatnFFaelGpAvgDCW
	E28HGiyT0bEe0p2AvZpttau2vIv+9R9WCuTiCGFw+h+tpCZXHVmql/uQu9KQUpGaTCmDf7tzk/J
	iFM2R3tNBGpMrluf1cK9l189rRlkUl6Pwyj0tTUt7K/A+Odx3SLz+pxQqc3BQEOq9kAIYH4sqpo
	buCiHoFXVGuVX0yKKnTi/1z0cf0HYyXDgl3iIfMA/iFOdfsSpMixalA4s5HVboPjnGq3/Dx8lio
	CS1A5JEzQI2+XtIO94nxnxzCXLmqp/EwNmMI/lUlgszVIup6F2Ag2+j+YUz3QbONcLXdVqfWXKe
	orWNV9Z2WJJUGTD0L6mqG2CrVX2vWJXjiXiT2qQ8hU/gV3u+1nlhRkrEMfBdaAPAtm/IntVXHms
	2xM2RuIkpGWPGRThZGoUeNWr27kgYHJ5AfyEk=
X-Google-Smtp-Source: AGHT+IGm8+dgYyRDv3gJ1XDI1aFNCRMzHlfROQeOfZxqRqUrkSy07arPhVguaQ6k7761nOnWCZjbgg==
X-Received: by 2002:a05:6a00:a0a:b0:7b8:758c:7e86 with SMTP id d2e1a72fcca58-7f22e0a1307mr7024548b3a.15.1765470574904;
        Thu, 11 Dec 2025 08:29:34 -0800 (PST)
Received: from [192.168.1.5] ([115.99.253.182])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7f4c54812c5sm2952433b3a.59.2025.12.11.08.29.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Dec 2025 08:29:34 -0800 (PST)
Message-ID: <62b62814-29a5-4809-969c-a258da8eb415@gmail.com>
Date: Thu, 11 Dec 2025 21:59:28 +0530
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: mtd: nvidia,tegra20-nand: convert to DT
 schema
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Thierry Reding
 <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>,
 Stefan Agner <stefan@agner.ch>, Lucas Stach <dev@lynxeye.de>,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251030-nvidia-nand-v1-1-7614e1428292@gmail.com>
 <20251104-prompt-rampant-cat-30fd9a@kuoka>
Content-Language: en-US
From: Charan Pedumuru <charan.pedumuru@gmail.com>
In-Reply-To: <20251104-prompt-rampant-cat-30fd9a@kuoka>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 04-11-2025 15:33, Krzysztof Kozlowski wrote:
> On Thu, Oct 30, 2025 at 06:47:25PM +0000, Charan Pedumuru wrote:
>> Convert NVIDIA Tegra NAND Flash Controller binding to YAML format.
>> Changes during Conversion:
>> - Define new properties `power-domains` and `operating-points-v2`
>>   to resolve errors generated by `dtb_check`.
> 
> instead - because existing in-tree DTS uses them.
> 
>> - Add the `#address-cells` and `#size-cells` properties to the parent
>>   node to fix errors reported by `dt_check`, and include these properties
> 
> What is dt_check? Aren't you adding them because other schema requires
> them? Then say that (and which schema...).

Sure, I will modify accordingly.

> 
> 
>>   in the `required` section, as they are not mentioned in the text binding.
>>
>> Signed-off-by: Charan Pedumuru <charan.pedumuru@gmail.com>
>> ---
>>  .../bindings/mtd/nvidia,tegra20-nand.yaml          | 157 +++++++++++++++++++++
>>  .../bindings/mtd/nvidia-tegra20-nand.txt           |  64 ---------
>>  2 files changed, 157 insertions(+), 64 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/mtd/nvidia,tegra20-nand.yaml b/Documentation/devicetree/bindings/mtd/nvidia,tegra20-nand.yaml
>> new file mode 100644
>> index 000000000000..67b3c45566db
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/mtd/nvidia,tegra20-nand.yaml
>> @@ -0,0 +1,157 @@
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
>> +description:
>> +  Device tree bindings for the NVIDIA Tegra NAND Flash Controller (NFC).
> 
> Drop sentencem completely redundant. Title already said that.

Okay.

> 
>> +  The controller supports a single NAND chip with specific properties.
> 
> What is/are "specific properties"? Can properties be unspecific?

I will modify the description.

> 
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
>> +  '#address-cells':
>> +    const: 1
>> +
>> +  '#size-cells':
>> +    const: 0
>> +
>> +  power-domains:
>> +    maxItems: 1
>> +
>> +  operating-points-v2:
>> +    maxItems: 1
>> +
>> +patternProperties:
>> +  "^nand@[0-5]$":
> 
> Keep consistent quotes, either ' or "

Sure.

> 
>> +    type: object
>> +    description: Individual NAND chip connected to the NAND controller
>> +    properties:
>> +      reg:
>> +        maxItems: 1
>> +
>> +      nand-ecc-mode:
>> +        description:
>> +          Operation mode of the NAND ECC, currently only hardware
>> +          mode supported
>> +        const: hw
>> +
>> +      nand-ecc-algo:
>> +        description: Algorithm for NAND ECC when using hw ECC mode
>> +        enum:
>> +          - rs
>> +          - bch
>> +
>> +      nand-bus-width:
>> +        description: Width of the NAND flash bus in bits
>> +        enum: [8, 16]
>> +        default: 8
>> +
>> +      nand-on-flash-bbt:
>> +        description: Use an on-flash bad block table to track bad blocks
>> +        type: boolean
>> +
>> +      nand-ecc-maximize:
> 
> Why are you duplicating all these properties from nand schema?

Sure, I will make nand-chip as ref and remove duplicate properties.

> 
>> +        description:
>> +          Maximize ECC strength for the NAND chip, overriding
>> +          default strength selection
>> +        type: boolean
>> +
>> +      nand-ecc-strength:
>> +        description: Number of bits to correct per ECC step (512 bytes)
>> +        enum: [4, 6, 8, 14, 16]
>> +
>> +      nand-is-boot-medium:
>> +        description: Ensures ECC strengths are compatible with the boot ROM
>> +        type: boolean
>> +
>> +      wp-gpios:
>> +        description: GPIO specifier for the write protect pin
>> +        maxItems: 1
>> +
>> +      '#address-cells':
>> +        const: 1
>> +
>> +      '#size-cells':
>> +        const: 1
>> +
>> +    patternProperties:
>> +      "^partition@[0-9a-f]+$":
>> +        $ref: /schemas/mtd/mtd.yaml#
>> +        description:
>> +          Optional MTD partitions for the NAND chip, as defined in mtd.yaml
>> +
>> +    required:
>> +      - reg
>> +
>> +    unevaluatedProperties: false
> 
> So this should tell you that you miss proper ref
> 
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - interrupts
>> +  - clocks
>> +  - clock-names
>> +  - resets
>> +  - reset-names
>> +  - '#address-cells'
>> +  - '#size-cells'
>> +
>> +unevaluatedProperties: false
> 
> Same here. Why do you use unevaluatedProperties if there is no ref?
> Please open other bindings to understand how MTD binding should be
> written.

I will add appropriate common nand-controller ref to the schema.

> 
> Best regards,
> Krzysztof
> 

-- 
Best Regards,
Charan.

