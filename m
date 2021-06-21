Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DC67C48BE5
	for <linux-tegra@archiver.kernel.org>; Mon, 21 Jun 2021 06:47:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2BC8561042
	for <linux-tegra@archiver.kernel.org>; Mon, 21 Jun 2021 06:47:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229908AbhFUGtN (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 21 Jun 2021 02:49:13 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:36352 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229583AbhFUGtM (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 21 Jun 2021 02:49:12 -0400
Received: from mail-ed1-f71.google.com ([209.85.208.71])
        by youngberry.canonical.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.93)
        (envelope-from <krzysztof.kozlowski@canonical.com>)
        id 1lvDhx-0004mZ-Qg
        for linux-tegra@vger.kernel.org; Mon, 21 Jun 2021 06:46:57 +0000
Received: by mail-ed1-f71.google.com with SMTP id p19-20020aa7c4d30000b0290394bdda6d9cso328250edr.21
        for <linux-tegra@vger.kernel.org>; Sun, 20 Jun 2021 23:46:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=HBV8dNLDqIEAfk7W6R3y2yg9WhGkmywydr9E1vv22xo=;
        b=pVe8/c28IrLExRz7KylqHPoFWKQDVpINf0fSPX99jvSV9iW4XmmxoVDzP43xTWNaZc
         GlZ0EhicE7GYlaVc0b099SDemQ1DcqvVeVguOQkcTM3kEKjGVSzhpDOiU6bGHt/qurY5
         MT/agJ1DEI3yJdcygUJe/sEMz17sMiy/feSttEAGC4ZezSCVQwEHYGYCHRGUWdx175Y5
         WPk9UksyRgV/261UBjxXjkr5O9/HTPg42FcxDPg2bsS7wQFWDI3oVyOoD0HzYR/4eptK
         xHqe3Es9mJrpDQKAb2xnCZYoOBssr3n5+4+KS3hSr00xFv2aZ6Vh/R9J1OIK7AAtzl+p
         rTBQ==
X-Gm-Message-State: AOAM5311foh9T9GosozAxQ8E8ZQADL0E1tVSZj+6jaZ3075MbquLHKyL
        ghjbBTp0WwIspP5RpVgKNj+TVRn/Zyl4rYJzp2rqWrH9lUFfUpNDsTDrw+iZ36WD6C3Z9Lgz7At
        FF1BYUrDXMkfZl/gH9Ayovxg8qYedWQ28PRKIiG0f
X-Received: by 2002:aa7:cb43:: with SMTP id w3mr11978033edt.126.1624258016708;
        Sun, 20 Jun 2021 23:46:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwW7f8aTJ93Kkruw0X6I/5OojOVeM3oazExumrI1P2lMRb9QkgVXDIlJDsddLfp5/Vdq5FSOA==
X-Received: by 2002:aa7:cb43:: with SMTP id w3mr11977987edt.126.1624258016218;
        Sun, 20 Jun 2021 23:46:56 -0700 (PDT)
Received: from [192.168.1.115] (xdsl-188-155-177-222.adslplus.ch. [188.155.177.222])
        by smtp.gmail.com with ESMTPSA id w8sm9950041edc.39.2021.06.20.23.46.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 20 Jun 2021 23:46:55 -0700 (PDT)
Subject: Re: [PATCH v3 2/9] dt-bindings: arm-smmu: Add Tegra186 compatible
 string
To:     Rob Herring <robh@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Will Deacon <will@kernel.org>
Cc:     Joerg Roedel <joro@8bytes.org>,
        Linux IOMMU <iommu@lists.linux-foundation.org>,
        Jon Hunter <jonathanh@nvidia.com>,
        Nicolin Chen <nicolinc@nvidia.com>,
        linux-tegra <linux-tegra@vger.kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
References: <20210603164632.1000458-1-thierry.reding@gmail.com>
 <20210603164632.1000458-3-thierry.reding@gmail.com>
 <CAL_JsqLDKxwANn2Pba0Db6J9337pK0dNL=bBN8ucn-k4DZ3gyg@mail.gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <14551e79-853d-471f-bb5e-0d2d6581a9b6@canonical.com>
Date:   Mon, 21 Jun 2021 08:46:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAL_JsqLDKxwANn2Pba0Db6J9337pK0dNL=bBN8ucn-k4DZ3gyg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 18/06/2021 21:47, Rob Herring wrote:
> On Thu, Jun 3, 2021 at 10:49 AM Thierry Reding <thierry.reding@gmail.com> wrote:
>>
>> From: Thierry Reding <treding@nvidia.com>
>>
>> The ARM SMMU instantiations found on Tegra186 and later need inter-
>> operation with the memory controller in order to correctly program
>> stream ID overrides.
>>
>> Furthermore, on Tegra194 multiple instances of the SMMU can gang up
>> to achieve higher throughput. In order to do this, they have to be
>> programmed identically so that the memory controller can interleave
>> memory accesses between them.
>>
>> Add the Tegra186 compatible string to make sure the interoperation
>> with the memory controller can be enabled on that SoC generation.
>>
>> Signed-off-by: Thierry Reding <treding@nvidia.com>
>> ---
>>  Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 11 +++++++++--
>>  1 file changed, 9 insertions(+), 2 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
>> index 9d27aa5111d4..1181b590db71 100644
>> --- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
>> +++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
>> @@ -54,8 +54,14 @@ properties:
>>            - const: arm,mmu-500
>>        - description: NVIDIA SoCs that program two ARM MMU-500s identically
>>          items:
>> +      - description: NVIDIA SoCs that require memory controller interaction
> 
> This is not valid jsonschema:
> 
> /builds/robherring/linux-dt/Documentation/devicetree/bindings/iommu/arm,smmu.yaml:
> properties:compatible:oneOf:4:items: 'anyOf' conditional failed, one
> must be fixed:
> None is not of type 'object', 'boolean'
> None is not of type 'array'
> from schema $id: http://json-schema.org/draft-07/schema#
> /builds/robherring/linux-dt/Documentation/devicetree/bindings/iommu/arm,smmu.yaml:
> properties:compatible:oneOf:4:items: 'oneOf' conditional failed, one
> must be fixed:
> None is not of type 'object'
> None is not of type 'array'
> from schema $id: http://devicetree.org/meta-schemas/keywords.yaml#
> /builds/robherring/linux-dt/Documentation/devicetree/bindings/iommu/arm,smmu.yaml:
> properties:compatible:oneOf:4:items: 'oneOf' conditional failed, one
> must be fixed:
> None is not of type 'object'
> None is not of type 'array'
> from schema $id: http://devicetree.org/meta-schemas/string-array.yaml#
> /builds/robherring/linux-dt/Documentation/devicetree/bindings/iommu/arm,smmu.yaml:
> properties:compatible:oneOf:5:items: 'oneOf' conditional failed, one
> must be fixed:
> [{'enum': [{'const': 'nvidia,tegra194-smmu'}, {'const':
> 'nvidia,tegra186-smmu'}]}, {'const': 'nvidia,smmu-500'}] is not of
> type 'object'
> {'const': 'nvidia,tegra194-smmu'} is not of type 'string'
> {'const': 'nvidia,tegra186-smmu'} is not of type 'string'
> from schema $id: http://devicetree.org/meta-schemas/string-array.yaml#
> 
> 
> This was not reviewed nor tested since the DT list was not Cc'ed.

Ugh, I see now weird empty item on a list... and not only DT list was
skipped - Thierry did not Cc you either.

My bad, I did not check that patch thoroughly before applying.

Thierry, please Cc folks mentioned by get_maintainer.pl. Either sent a
fix or a revert, if fix needs more time.

Additionally, why the patch changes reg to "minItems: 1" for
nvidia,tegra194-smmu?

Best regards,
Krzysztof
