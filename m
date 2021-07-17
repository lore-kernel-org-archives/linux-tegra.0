Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7DD6C636CB
	for <linux-tegra@archiver.kernel.org>; Sat, 17 Jul 2021 11:07:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C6B6C613C4
	for <linux-tegra@archiver.kernel.org>; Sat, 17 Jul 2021 11:07:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233065AbhGQLKQ (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sat, 17 Jul 2021 07:10:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33498 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229471AbhGQLKP (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sat, 17 Jul 2021 07:10:15 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 714E4C06175F;
        Sat, 17 Jul 2021 04:07:15 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id a12so20420309lfb.7;
        Sat, 17 Jul 2021 04:07:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=qMrX7WvYGhD3GqZFeNbtHDq067pHxr3zLsoCTOyMBjM=;
        b=dsijzo4vEj8KZtdurdc114VSsLZXXsuRpxBH/77DKFEgr/0Z0oGC9T3wrbLdgSVVzd
         N0xMxrQHPTgo4YgqNjcmN6CA9NsIVx+zmuDMhE/omHYRa2i4renzGAZUQW0asqFFB2hn
         DzPa3ZJA8HPdcaoxC9NRXJir2+hr0oRBa/hgsCXoIt6ZZ+hszLr7osVGVQLT1PJYBaF0
         v/l9vxMYMHbqW6enlLa5MEG5MfIy8BqJ0//zv6hQHSH/DwG79bCYesgOd1MmRjux3XEO
         eaE4NAMa7yLM8tmFELXnIaTR5QklMLZP82MLcgmQJDvEM5Ysl/DcMspkB0DIfi5MON+2
         xwwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=qMrX7WvYGhD3GqZFeNbtHDq067pHxr3zLsoCTOyMBjM=;
        b=lO/hWSyaRwPjz2ERDDvjgyKrYvy5SxWpuvZhFZNXY/8KJCsXQSwnwYCXHWjioUaPpv
         iO6lbTxvVVFyCS0sRakDB4XXWuMTG2NPT5qF6xBZCiGtKnMZVqd5cZNZ2lmU33olUEdV
         uYF0Jkd1D8wAk9gxPr7S5ijFPoI1+eI402X2dSbLlQ2x7tMiK2rJg2piAJx5LhBtokWK
         kadL2y3XFWJPZJ58CphyuZE0VWquX/5hwB16e8yqtYt3B9svvAfp5hV7WcWgXh2U4gQ8
         IHS/w1b20sLS0pkeaTvE9cHJ374jXAWnZiOO+Kb7kszqXl5KbxcAROla2hzeBNpdXlX2
         Tegg==
X-Gm-Message-State: AOAM530qISzOW5CzKPp7+AGN69gvSTT/WMHSYlvxxfWGEw2x0160tlhw
        JFYhRaOzhjF2G3/sz7Vas+k=
X-Google-Smtp-Source: ABdhPJwJP3MZ4dXQV76Rrrje6RXF9KzFJnHPoRcHmpFN8/3gCS4H618y8JDLvB2jlNlyu1FGtCl11g==
X-Received: by 2002:ac2:483b:: with SMTP id 27mr10954908lft.397.1626520033755;
        Sat, 17 Jul 2021 04:07:13 -0700 (PDT)
Received: from [192.168.2.145] (46-138-17-250.dynamic.spd-mgts.ru. [46.138.17.250])
        by smtp.googlemail.com with ESMTPSA id n23sm1224010ljc.23.2021.07.17.04.07.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 17 Jul 2021 04:07:12 -0700 (PDT)
Subject: Re: [PATCH v2 2/5] iommu: Implement of_iommu_get_resv_regions()
To:     Rob Herring <robh+dt@kernel.org>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Nicolin Chen <nicolinc@nvidia.com>,
        Krishna Reddy <vdumpa@nvidia.com>, devicetree@vger.kernel.org,
        Linux IOMMU <iommu@lists.linux-foundation.org>,
        linux-tegra <linux-tegra@vger.kernel.org>,
        Frank Rowand <frowand.list@gmail.com>
References: <20210423163234.3651547-1-thierry.reding@gmail.com>
 <20210423163234.3651547-3-thierry.reding@gmail.com>
 <bdc42077-d1f3-f561-2e4d-647b5fceb7b6@gmail.com>
 <CAL_Jsq+jSY-OLau3gLPsDL02AYaE_TySOGrd9-tNLFaYvLHZ6A@mail.gmail.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <7f5c8094-6e4f-5a94-2257-1003a78ba92f@gmail.com>
Date:   Sat, 17 Jul 2021 14:07:12 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAL_Jsq+jSY-OLau3gLPsDL02AYaE_TySOGrd9-tNLFaYvLHZ6A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

16.07.2021 17:41, Rob Herring пишет:
> On Fri, Jul 2, 2021 at 8:05 AM Dmitry Osipenko <digetx@gmail.com> wrote:
>>
>> 23.04.2021 19:32, Thierry Reding пишет:
>>> +void of_iommu_get_resv_regions(struct device *dev, struct list_head *list)
>>> +{
>>> +     struct of_phandle_iterator it;
>>> +     int err;
>>> +
>>> +     of_for_each_phandle(&it, err, dev->of_node, "memory-region", "#memory-region-cells", 0) {
>>> +             struct iommu_resv_region *region;
>>> +             struct of_phandle_args args;
>>> +             struct resource res;
>>> +
>>> +             args.args_count = of_phandle_iterator_args(&it, args.args, MAX_PHANDLE_ARGS);
>>> +
>>> +             err = of_address_to_resource(it.node, 0, &res);
>>> +             if (err < 0) {
>>> +                     dev_err(dev, "failed to parse memory region %pOF: %d\n",
>>> +                             it.node, err);
>>> +                     continue;
>>> +             }
>>> +
>>> +             if (args.args_count > 0) {
>>> +                     /*
>>> +                      * Active memory regions are expected to be accessed by hardware during
>>> +                      * boot and must therefore have an identity mapping created prior to the
>>> +                      * driver taking control of the hardware. This ensures that non-quiescent
>>> +                      * hardware doesn't cause IOMMU faults during boot.
>>> +                      */
>>> +                     if (args.args[0] & MEMORY_REGION_IDENTITY_MAPPING) {
>>> +                             region = iommu_alloc_resv_region(res.start, resource_size(&res),
>>> +                                                              IOMMU_READ | IOMMU_WRITE,
>>> +                                                              IOMMU_RESV_DIRECT_RELAXABLE);
>>> +                             if (!region)
>>> +                                     continue;
>>> +
>>> +                             list_add_tail(&region->list, list);
>>> +                     }
>>> +             }
>>> +     }
>>> +}
>>> +EXPORT_SYMBOL(of_iommu_get_resv_regions);
>>
>> Any reason why this is not EXPORT_SYMBOL_GPL? I'm curious what is the
>> logic behind the OF symbols in general since it looks like half of them
>> are GPL.
> 
> Generally, new ones are _GPL. Old ones probably predate _GPL.
> 
> This one is up to the IOMMU maintainers.

Thank you.

