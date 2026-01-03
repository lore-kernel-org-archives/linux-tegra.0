Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2D4F2C181
	for <linux-tegra@vger.kernel.org>; Sat,  3 Jan 2026 04:50:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767415827; cv=none; b=G7cHqb/N0B1xWRP0mBF0ASPh77drk4/gRJtWycGHUoRAYPeiPpYiHfUHP05M6A+z4H8//oNgahRrzn/dDWeXj5MgbXXmnRsQisRlRQoAbYscoaK5hZLOvzF17PXRbna2zqZBVpr8yiWFdaKS22L7Xi0FEt9g3ropt9vaThCKsVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767415827; c=relaxed/simple;
	bh=uJOO1UjvJlDrDnXbpfz3DTtk4hztzw6AFdKIyH+wOsI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=W6VIGnEt6urpc0npE9oRIRiMK+NE27I7/+pL9m9iZlHx4X2Op5mF8976PkkAByuE79pDXocBPCVFZ8Sms+lYVLJAyQs4/17Fa039fYc6xvYYlTAyWTyBuFBe5mKcm9m8WddbZ54kypdOaWTyTvMh9VumVuEalrmqjpFtQjr1++4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZtbGLOJY; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZtbGLOJY"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-7baf61be569so13134788b3a.3
        for <linux-tegra@vger.kernel.org>; Fri, 02 Jan 2026 20:50:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767415825; x=1768020625; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YsHYW0GcvEr1wxZPwcWK3GbPG5TTUN++8f/TrGKFv8c=;
        b=ZtbGLOJY8khshQzN3ezC9LwWCekiOWYstv26JrVJE4f4wOnGIgIR4npfX0LO8M1cR8
         dP7sAeGs7m4TU2hX4TBwe3WvAygD/RIdAgv/+TmcKml5Wu0dqD8h7fKmlb+ydrtPeqf4
         yXlIArtl6NhBiUp6yAPlVdkcuyY9Ru0ggATiasFAy2c8j7y1+GfQ5rVigIXrCUrdwKg8
         2kWwu/XMrukMZcr8coQWSpwvFd5/8u3cmtQYPySuqxLbIu3bdMQzyr0gRW7qdwV5maCs
         Md3enc9Cw3L6uSr1bfEFwFTXoOq5jBOa25raNzOwEv2eL7UojklTJY/OB8XAEvWB5YFD
         V1Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767415825; x=1768020625;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YsHYW0GcvEr1wxZPwcWK3GbPG5TTUN++8f/TrGKFv8c=;
        b=ksEJWeU6HYNkA0ywtj/TkM6yg2VdyZ/4ZbpMSw92uHbuP9e0i+XmMdHVcH4rjKbRid
         2+bWFbDTUSXN2QlFAXNmBpaA50sIrWjMbJ7BbTanLV9UyWsIPP60ITcBPJX7gerY0THa
         8+RfmGVxsfECyDUvgD1Ogld0zH2ZRowP0LE2274g2Wak+Wf65K5OSfmAOifYxNv4DzDA
         urAlktf8m+q2LGTIuAcutDN7kAewHlJD7gCgWgukk7ThIUbW9HAO4IV8tfBuk0BuJFFg
         pTIWlr5XQ9Gk00ZwsmxFl1G8zqOKTiGm1cHJ3ULjyx5WO7qR0n/1OfOK0rIZa9pdzE19
         S04A==
X-Forwarded-Encrypted: i=1; AJvYcCUdEFL7BOK4nk452pPPetkn7L9wIl0X46fWlKHMG5dSwP5VFECp7mj3F/zBAhnt9CT51ekIISSjdKccMQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwQUtuRUp4r8GQaxOh9lUYqMXliBuuS2vMehERk6rpDp8cVV5EC
	lvqtJvC+HxL8yOpP1RalH5zEXHMiMCBzqQjMgWrXIOUWBnH325zE/REISJqPLg==
X-Gm-Gg: AY/fxX5bOiUrzn/suSN9YpdzH9t1khb35V4TFYIIayC/xObuxxhHQQ5t51f4fzmEjGo
	PawTDtc9pKt6tZY8NaTR0GdgCUoZFSfVjX5zakmwwlNMHg9DVVEn2n1W+/G5C6cPsBrIv+Q3etq
	67460Wt0dkKhc/BgLgq+5alo5kQdU9J5IC/TKrqGYQq2e7YCrjTapNrmociS2kP/Xkk13RgXcaT
	IjLwjiC+4fZ+itllRI6BegLzs/6f0MVQTj+5LLkI9YC3Xnk2ORgfghJW5GdaUS290h48CcGUJax
	1kSST8t1k4MTYZbKd9KgL0TLQzOb+Dg7IrWeRp2sUtAy01t6P/P+nra9pxpRu+bFbGm8ldq1889
	KZcRCemiNRa6X5KJsAPd9IR8bxUsuWOJ+O7vMKd5bzJRdmPrJ51rOtjcNw5NppTFFoU7CRY0h2q
	tuD175ZxvQHmHfD8CKAcJxgoVjvWPBiE1cxCQ=
X-Google-Smtp-Source: AGHT+IF90F2fmF2eDjyjEfoyNC/ZcIHn8WEhhBEdVO3NdOHkunZm7QOXXUBNNdZq4w6luowRDJ47oA==
X-Received: by 2002:a05:6a20:9389:b0:371:5a31:e477 with SMTP id adf61e73a8af0-376a8eb7dfamr41941867637.25.1767415825019;
        Fri, 02 Jan 2026 20:50:25 -0800 (PST)
Received: from [192.168.1.4] ([122.181.60.165])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c1e7bd61b40sm36952261a12.23.2026.01.02.20.50.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Jan 2026 20:50:24 -0800 (PST)
Message-ID: <180afaec-c9fb-4845-a1b9-6adc7b9c7434@gmail.com>
Date: Sat, 3 Jan 2026 10:20:18 +0530
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] dt-bindings: mtd: nvidia,tegra20-nand: convert to DT
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
References: <20251231-nvidia-nand-v3-1-2e67664d3674@gmail.com>
 <20260102155837.GA3840725-robh@kernel.org>
Content-Language: en-US
From: Charan Pedumuru <charan.pedumuru@gmail.com>
In-Reply-To: <20260102155837.GA3840725-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 02-01-2026 21:28, Rob Herring wrote:
> On Wed, Dec 31, 2025 at 09:29:32AM +0000, Charan Pedumuru wrote:
>> Convert NVIDIA Tegra NAND Flash Controller binding to YAML format.
>> Changes during Conversion:
>> - Define new properties `power-domains` and `operating-points-v2`
>>   because the existing in tree DTS uses them.
>>
>> Signed-off-by: Charan Pedumuru <charan.pedumuru@gmail.com>
>> ---
>> Changes in v3:
>> - Removed pattern properties for partition.
>> - Used single quotes for nand string in pattern properties.
>> - Modified maxItems value and added minItems to reg property under nand child node.
>> - Link to v2: https://lore.kernel.org/r/20251229-nvidia-nand-v2-1-b697d9724b0b@gmail.com
>>
>> Changes in v2:
>> - Edited the commit description to match the updated changes.
>> - Modified the description for the YAML.
>> - Removed all the duplicated properties, defined a proper ref for both parent
>>   and child nodes.
>> - Removed unnecessary properties from the required following the old
>>   text binding.
>> - Link to v1: https://lore.kernel.org/r/20251030-nvidia-nand-v1-1-7614e1428292@gmail.com
>> ---
>>  .../bindings/mtd/nvidia,tegra20-nand.yaml          | 103 +++++++++++++++++++++
>>  .../bindings/mtd/nvidia-tegra20-nand.txt           |  64 -------------
>>  2 files changed, 103 insertions(+), 64 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/mtd/nvidia,tegra20-nand.yaml b/Documentation/devicetree/bindings/mtd/nvidia,tegra20-nand.yaml
>> new file mode 100644
>> index 000000000000..632cfd7dc5e2
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/mtd/nvidia,tegra20-nand.yaml
>> @@ -0,0 +1,103 @@
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
>> +patternProperties:
>> +  '^nand@':
>> +    type: object
>> +    description: Individual NAND chip connected to the NAND controller
>> +    $ref: raw-nand-chip.yaml#
>> +
>> +    properties:
>> +      reg:
>> +        minItems: 1
>> +        maxItems: 5
> 
> Sigh. I gave you the exact schema to use. How is 5 address ENTRIES 
> valid? Again:
> 
> reg:
>   maximum: 5

Okay, I thought it's an invalid syntax as I never used it to represent reg property before, I will fix it in the next revision. Thanks.

> 
> Rob

-- 
Best Regards,
Charan.

