Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28A94C433EF
	for <linux-tegra@archiver.kernel.org>; Mon,  4 Oct 2021 16:53:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 03D0B613C8
	for <linux-tegra@archiver.kernel.org>; Mon,  4 Oct 2021 16:53:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237574AbhJDQzj (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 4 Oct 2021 12:55:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237561AbhJDQzi (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Mon, 4 Oct 2021 12:55:38 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 77277C061745;
        Mon,  4 Oct 2021 09:53:49 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id u18so74569974lfd.12;
        Mon, 04 Oct 2021 09:53:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=IYufgetYgN5Af3F6AhLYRvvGvd8Al8WSTlIRzeXPu0g=;
        b=JeHQkQq/Os+wSi3VIhwtQHsNkq70w4aypJssTJfOH7uiHIzknRJm6p7vlNgxhHiHVM
         L2sq+5wEzhL5wTXCHiksHfwkyRHohWAcFKxWlAIyJL4nf4nfyPk8piwIa5E9DpF7Hdun
         A35ZKfelovtMmW9DRfCtfeVIpDUfGOzLHF2pv3t2Dj5jQMEvhsAY2h8Tr/4y5K7LXoiV
         cIL8LshcmkWbnKXRNF/3IBsfJYVB8JPsFIArJgLivdWzGDK5FS8ecxZtYpO0DdK03Uyx
         v5pSAFG4NJRh3lTzSnH4Ln81jtgCzx/LPYlrnejePJKefTilCE0dp5STVKdJ59viNDjx
         di6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=IYufgetYgN5Af3F6AhLYRvvGvd8Al8WSTlIRzeXPu0g=;
        b=BaOHjNOZSbSu3fmw+RfJJ1m1nJ+sUPI3PmlxOZGXnhiN3FzhKvQ67BOJH5gDDLp3lu
         glqGBuky3r1z423XAv0MYTg6LF9ShcshSjMdhE1OFzGjCKWlu8GVWqWf1Hj7Dfw6I6Pl
         u37qtzkJljtdJzMafuIX0AdZF5zQDbJoCF6wD4dgBv1SP63uj7XEDiO00JZtihlH52V7
         SVqdpnP7dtyBRXAphrVMKS/EcAefl0FEc6bGj39vibyTrTJS3bkklUakrq17/n3kzCwC
         VGeW/XbBQ8lSE+OIpemElQZaflkLu2yyRUx24XmfpJ3HsG2bBQ12WOo60Yc36Ynguqzg
         cu3g==
X-Gm-Message-State: AOAM530DBKSDNLsGC0EH6879dNSYHbM2jJMm9XDwdBivbTusBLmeMh+I
        dh9t9h9Mj9kYs31fXOD5omsdVGxi8Q4=
X-Google-Smtp-Source: ABdhPJxOTFCOmQNL8mjcH8NLzqqutpPUD0DMa5F0kUegHty3/J6WKxvKqISCs2YBdyMxDamFLJl7ZA==
X-Received: by 2002:a05:6512:ac9:: with SMTP id n9mr15610379lfu.469.1633366427564;
        Mon, 04 Oct 2021 09:53:47 -0700 (PDT)
Received: from [192.168.2.145] (79-139-163-57.dynamic.spd-mgts.ru. [79.139.163.57])
        by smtp.googlemail.com with ESMTPSA id c3sm1405934ljh.58.2021.10.04.09.53.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Oct 2021 09:53:47 -0700 (PDT)
Subject: Re: [PATCH v3 1/4] dt-bindings: memory: Add LPDDR2 binding
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-tegra@vger.kernel.org
References: <20211003013235.2357-1-digetx@gmail.com>
 <20211003013235.2357-2-digetx@gmail.com>
 <4c5643de-d39d-2b1a-12ae-ec5247fe2976@canonical.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <4ad137c0-1199-56bc-f77e-0ea8dcc4ba9c@gmail.com>
Date:   Mon, 4 Oct 2021 19:53:46 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <4c5643de-d39d-2b1a-12ae-ec5247fe2976@canonical.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

04.10.2021 10:42, Krzysztof Kozlowski пишет:
> On 03/10/2021 03:32, Dmitry Osipenko wrote:
>> Add binding for standard LPDDR2 memory chip properties.
>>
>> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
>> ---
>>  .../memory-controllers/jedec,lpddr2.yaml      | 80 +++++++++++++++++++
>>  include/dt-bindings/memory/lpddr2.h           | 25 ++++++
> 
> Hi Dmitry,
> 
> Thanks for doing this. I think I should be slightly more descriptive in
> my previous comment. What I meant, is to use existing DDR bindings
> (which might include or require converting them to YAML):
> Documentation/devicetree/bindings/ddr/
> 
> The bindings are already used:
> arch/arm/boot/dts/elpida_ecb240abacn.dtsi
> arch/arm/boot/dts/exynos5422-odroid-core.dtsi
> drivers/memory/samsung/exynos5422-dmc.c

Thanks! I missed that there is ddr/ subdir.

> You can remove the Documentation/devicetree/bindings/ddr/lpddr2.txt
> after full conversion, so also including AC timings and AC timing
> parameters. The timing parameters could be a separate YAML, if you want
> to convert everything. You can also skip it, because it is not necessary
> for your work.
> 
> 
> Rob,
> Any advice from your side where to put LPDDR2 dtschema bindings? The
> existing location was bindings/ddr/ but maybe this should be part of
> memory-controllers (although it is not actually a controller but rather
> used by the controller)?

+1 for having it inside of memory-controllers/

>>  2 files changed, 105 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/memory-controllers/jedec,lpddr2.yaml
>>  create mode 100644 include/dt-bindings/memory/lpddr2.h
>>
>> diff --git a/Documentation/devicetree/bindings/memory-controllers/jedec,lpddr2.yaml b/Documentation/devicetree/bindings/memory-controllers/jedec,lpddr2.yaml
>> new file mode 100644
>> index 000000000000..ef227eba1e4a
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/memory-controllers/jedec,lpddr2.yaml
>> @@ -0,0 +1,80 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/memory-controllers/jedec,lpddr2.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: JEDEC LPDDR2 SDRAM
>> +
>> +maintainers:
>> +  - Krzysztof Kozlowski <krzk@kernel.org>
>> +
>> +properties:
> 
> You need compatible (see lpddr2.txt)
> 
>> +  jedec,lpddr2-manufacturer-id:
>> +    $ref: /schemas/types.yaml#/definitions/uint32
>> +    maximum: 255
>> +    description: |
>> +      Unique manufacturer ID of SDRAM chip. See MR5 description in JESD209-2.
> 
> Plus:
> "See include/dt-bindings/memory/lpddr2.h for known manufactured IDs."
> 
> However I wonder whether we need it. It should be taken from the vendor
> part of compatible.

It shouldn't be needed if compatible is used.

>> +
>> +  jedec,lpddr2-revision-id1:
>> +    $ref: /schemas/types.yaml#/definitions/uint32
>> +    maximum: 255
>> +    description: |
>> +      Revision 1 value of SDRAM chip.
>> +      See MR6 description in chip vendor specification.
>> +
>> +  jedec,lpddr2-revision-id2:
>> +    $ref: /schemas/types.yaml#/definitions/uint32
>> +    maximum: 255
>> +    description: |
>> +      Revision 2 value of SDRAM chip.
>> +      See MR7 description in chip vendor specification.
>> +
>> +  jedec,lpddr2-density-mbits:
>> +    $ref: /schemas/types.yaml#/definitions/uint32
>> +    description: |
>> +      Density in megabits of SDRAM chip. See MR8 description in JESD209-2.
>> +    enum:
>> +      - 64
>> +      - 128
>> +      - 256
>> +      - 512
>> +      - 1024
>> +      - 2048
>> +      - 4096
>> +      - 8192
>> +      - 16384
>> +      - 32768
>> +
>> +  jedec,lpddr2-io-width-bits:
>> +    $ref: /schemas/types.yaml#/definitions/uint32
>> +    description: |
>> +      IO bus width in bits of SDRAM chip. See MR8 description in JESD209-2.
>> +    enum:
>> +      - 32
>> +      - 16
>> +      - 8
>> +
>> +  jedec,lpddr2-type:
>> +    $ref: /schemas/types.yaml#/definitions/uint32
>> +    description: |
>> +      LPDDR type which corresponds to a number of words SDRAM pre-fetches
>> +      per column request. See MR8 description in JESD209-2.
>> +    enum:
>> +      - 0 # S4 (4 words prefetch architecture)
>> +      - 1 # S2 (2 words prefetch architecture)
>> +      - 2 # NVM (Non-volatile memory)
> 
> Type should not be needed but instead taken from compatible. Unless Rob
> has here preference and maybe change the DDR bindings?
> 
> requiredProperties for compatible, density, io-width.

Alright
