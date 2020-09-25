Return-Path: <SRS0=4r7m=DC=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 358A4C4363D
	for <linux-tegra@archiver.kernel.org>; Fri, 25 Sep 2020 13:52:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E09742086A
	for <linux-tegra@archiver.kernel.org>; Fri, 25 Sep 2020 13:52:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pTIzvOQJ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728365AbgIYNwy (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 25 Sep 2020 09:52:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48026 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727290AbgIYNwy (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 25 Sep 2020 09:52:54 -0400
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D3262C0613CE;
        Fri, 25 Sep 2020 06:52:53 -0700 (PDT)
Received: by mail-lf1-x142.google.com with SMTP id z19so2896021lfr.4;
        Fri, 25 Sep 2020 06:52:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=lVuxNTWKiK7ZzebA+S325g8VsDZU2WkHa9Rw4/y6Yh4=;
        b=pTIzvOQJ8QsKu3mgWbzEEJ3JvOe2YMiNzgtvwsVqRK+mV3ahvoDKYbpJT7+dM8teuu
         7OlanG3JLRYT4r1cr8toZ9gME34gWzYaeiq2BuJMZJa1zg2It+40BhM0QLZEYQnZH15o
         wi3oY4UJLTUOFH88dnU1eKZzuDmll8ulFuNG+F+5D7K9m/MYsLbVusZYDAy/CgyrxOY1
         cgTBxpATSlDm+7r/r3nHGgaZmdyy+QVeOWfyZZhGiY/OB5Z2a1fnjqq1RRTpVMyf0Q4z
         SWaSJO4N5YKvnIEZJRAlp5wImESRxxOWHP5M1RL/CLSluvNJ5DKubuXX7Uiz+CFpj9A4
         2iHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=lVuxNTWKiK7ZzebA+S325g8VsDZU2WkHa9Rw4/y6Yh4=;
        b=eBSsgaZl+rUpf7kvYkdx2KJzSJVgiqcvHdm0rmq3Ichgiq1s2qe1Zk9vgeHMRsjJaX
         B1lj4k0P33UpdsAtTzajdfLuvSkq+VLVVmxaAOVy0JT0avg9JoSKEYICta6xVUSWPIy4
         0eJ3j4AEJYTmeDEXHpIXAI9nC8N3wH0r6NLedFisHGxkhZLvrUo7hZ+VtkwvVb2mx8+e
         w6ivxgJXR/5gnOte8QeR3nMCmH6gybj0LFqlev2f6qRkqtyofl8ZF6bFRtrE+kEJ0GfS
         QEWI6wotQA9kaZbModTACi0tqSoaZpeg05zkxab7EVc2+uzMs/iU+NbKBRC78ECIBLbJ
         wz6w==
X-Gm-Message-State: AOAM5320AzIZfGpB9P7LqbSqDn2eoQjN1a2ofsulfqCtIO+pgx9L87K2
        9TDHZZJSv5NBZSo1zdElmAltPUaqsN4=
X-Google-Smtp-Source: ABdhPJyDzk4d7CznX8Ks8Mm705Zqxc2zjQZQizPGHHFGmcHoZL/BsmhhRSbIGQIQRkv2RxGZsm0fZA==
X-Received: by 2002:a05:6512:3e8:: with SMTP id n8mr1380475lfq.492.1601041971979;
        Fri, 25 Sep 2020 06:52:51 -0700 (PDT)
Received: from [192.168.2.145] (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.googlemail.com with ESMTPSA id n18sm2342159lfe.7.2020.09.25.06.52.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Sep 2020 06:52:51 -0700 (PDT)
Subject: Re: [PATCH v2 1/4] dt-bindings: reserved-memory: Document "active"
 property
To:     Robin Murphy <robin.murphy@arm.com>,
        Thierry Reding <thierry.reding@gmail.com>
Cc:     Joerg Roedel <joro@8bytes.org>, Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Will Deacon <will@kernel.org>,
        iommu@lists.linux-foundation.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
References: <20200904130000.691933-1-thierry.reding@gmail.com>
 <d3d69cb4-b0f9-40b0-b526-52fdc1a4b876@gmail.com>
 <20200924140130.GA2527337@ulmo>
 <ba16b795-34df-8f8c-3376-3d629cc30f8b@gmail.com>
 <484b9e90-7395-6161-577c-4d3f3716997e@arm.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <4f35bf17-a354-6ffb-fd4a-063027d83ccc@gmail.com>
Date:   Fri, 25 Sep 2020 16:52:50 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <484b9e90-7395-6161-577c-4d3f3716997e@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

25.09.2020 15:39, Robin Murphy пишет:
...
>> Yes, my understanding that this is what Robin suggested here:
>>
>> https://lore.kernel.org/linux-iommu/cb12808b-7316-19db-7413-b7f852a6f8ae@arm.com/
>>
> 
> Just to clarify, what I was talking about there is largely orthogonal to
> the issue here. That was about systems with limited translation
> resources letting translation be specifically opt-in by IOMMU-aware
> drivers. It probably *would* happen to obviate the issue of disrupting
> live DMA at boot time on these particular Tegra platforms, but we still
> need something like Thierry's solution in general, since IOMMU drivers
> may have no other way to determine whether devices are active at boot
> and they have to take care to avoid breaking anything - e.g. SMMUv3 will
> at a bare minimum need to set up *some* form of valid stream table entry
> for the relevant device(s) right at the beginning where we first probe
> and reset the SMMU itself, regardless of what happens with domains and
> addresses later down the line.

Yes, I only meant that yours suggestion also should be useful here.
Anyways, thank you for the clarification :)

I agree that the Thierry's proposal is good! But it needs some more
thought yet because it's not very applicable to the current devices.

>>> The primary goal here is to move towards using the DMA API rather than
>>> the IOMMU API directly, so we don't really have the option of replacing
>>> with an explicitly created domain. Unless we have code in the DMA/IOMMU
>>> code that does this somehow.
>>>
>>> But I'm not sure what would be a good way to mark certain devices as
>>> needing an identity domain by default. Do we still use the reserved-
>>> memory node for that?
>>
>> The reserved-memory indeed shouldn't be needed for resolving the
>> implicit IOMMU problem since we could mark certain devices within the
>> kernel IOMMU driver.
>>
>> I haven't got around to trying to implement the implicit IOMMU support
>> yet, but I suppose we could implement the def_domain_type() hook in the
>> SMMU driver and then return IOMMU_DOMAIN_IDENTITY for the Display/VDE
>> devices. Then the Display/VDE drivers will take over the identity domain
>> and replace it with the explicit domain.
> 
> FWIW I've already cooked up identity domain support for tegra-gart; I
> was planning on tackling it for tegra-smmu as well for the next version
> of my arm default domains series (which will be after the next -rc1 now
> since I'm just about to take some long-overdue holiday).

Very nice! Maybe we will have some more food for the discussion by the
time you'll return. Have a good time!
