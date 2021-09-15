Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5704BC433F5
	for <linux-tegra@archiver.kernel.org>; Wed, 15 Sep 2021 12:09:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2F3A061262
	for <linux-tegra@archiver.kernel.org>; Wed, 15 Sep 2021 12:09:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232882AbhIOMLM (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 15 Sep 2021 08:11:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55240 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231500AbhIOMLL (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 15 Sep 2021 08:11:11 -0400
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C7A5CC061574;
        Wed, 15 Sep 2021 05:09:52 -0700 (PDT)
Received: by mail-lj1-x22c.google.com with SMTP id c33so576249ljr.8;
        Wed, 15 Sep 2021 05:09:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=nsbC/14C+kMeJoOAkh98qBGl2wGnLGSFlhXpNUqwCFE=;
        b=LhPdYdNBwz8NgzDrN2yfcZ22U38rnPVJDJATIRjG63cwjSqJeLcOJ7rb7Mqkfcwr33
         3/auLAlxO62WVV4QiDO2Df8ksHGq6u9HEH3oLpPwx4Cq9Qj5dUy22XthraTolzPolOaJ
         E96kLqsddIYf83sJUP/zJ5eyEXN+fxcw2imlkHqzTrIeUZsdad/E3q0cC2y9z5UUqlI5
         ifZGau8FbHZDNZXkRREq1RuEUHjYLqRrIEK/pF3SQczPs6bpDrNI64nHDcCj81CzN4Na
         aEB1HaqB8+/GWyI0+TrO8Fh4E1l5bJCHLuFwLvlPKH5nysZxgvKVRb9jvMnVkARREFoB
         MD8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=nsbC/14C+kMeJoOAkh98qBGl2wGnLGSFlhXpNUqwCFE=;
        b=zfOnTH9OFXyayjiRl5LJEcwe17/vaMAyFiJwtGShVMTHRc5fSs/CwDZxbVmCKK14Jm
         rE5N1E0o0HUZ58fWrcbbDwiEetVebsFSs2JOFl53IvfCqLGW1sUmEOT3zQwl2kHa1gHg
         9wkASa+qn4M4SdhuK6gfcnlKmIFP9/YpvT5CZ+h81qhu0GZXKVyPrPtTBkqk0dsfx0Ko
         zUsXIHJcOBQnq94vggih2OvZwLYCQ9aa+rmU5VWZIHiC/f11J2cbVnfMlZt8TwYQ3oGf
         B67kkNXS110AucDkf2tEbTlltc9OnvmPqX0LuIYV9+OiOpLw4A3lPn3NYZ2WZZwmCdGz
         tGQw==
X-Gm-Message-State: AOAM532Y235VCzstQ77kVtq2ZsZNi+7m+EPiKd+DUS0GMUZxhlFoJYS5
        PH4ym0E28aGePZGNbtjYSb+dYSRF6zc=
X-Google-Smtp-Source: ABdhPJzOIae3cS6tf91ZADkHw1B21IDeEToB3I4V6VKYcoxN7S0aHhdx0UnbwyEdNqZF0e1u7b1E9g==
X-Received: by 2002:a2e:8804:: with SMTP id x4mr18646458ljh.437.1631707789844;
        Wed, 15 Sep 2021 05:09:49 -0700 (PDT)
Received: from [192.168.2.145] (94-29-62-67.dynamic.spd-mgts.ru. [94.29.62.67])
        by smtp.googlemail.com with ESMTPSA id u16sm1798222ljl.9.2021.09.15.05.09.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Sep 2021 05:09:49 -0700 (PDT)
Subject: Re: [PATCH v6 6/6] iommu/tegra-smmu: Add pagetable mappings to
 debugfs
To:     Nicolin Chen <nicoleotsuka@gmail.com>
Cc:     thierry.reding@gmail.com, joro@8bytes.org, will@kernel.org,
        vdumpa@nvidia.com, jonathanh@nvidia.com,
        linux-tegra@vger.kernel.org, iommu@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org
References: <20210914013858.31192-1-nicoleotsuka@gmail.com>
 <20210914013858.31192-7-nicoleotsuka@gmail.com>
 <31501a62-3312-9f04-3bb8-790d0481746c@gmail.com>
 <20210914184933.GA32705@Asurada-Nvidia>
 <25d68aff-323a-df54-45f9-55b22f3089e0@gmail.com>
 <20210915043806.GA19185@Asurada-Nvidia>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <a5a77169-8711-2983-d2cb-4b94061741b9@gmail.com>
Date:   Wed, 15 Sep 2021 15:09:48 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210915043806.GA19185@Asurada-Nvidia>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

15.09.2021 07:38, Nicolin Chen пишет:
> On Tue, Sep 14, 2021 at 10:20:30PM +0300, Dmitry Osipenko wrote:
>> 14.09.2021 21:49, Nicolin Chen пишет:
>>> On Tue, Sep 14, 2021 at 04:29:15PM +0300, Dmitry Osipenko wrote:
>>>> 14.09.2021 04:38, Nicolin Chen пишет:
>>>>> +static unsigned long pd_pt_index_iova(unsigned int pd_index, unsigned int pt_index)
>>>>> +{
>>>>> +	return ((dma_addr_t)pd_index & (SMMU_NUM_PDE - 1)) << SMMU_PDE_SHIFT |
>>>>> +	       ((dma_addr_t)pt_index & (SMMU_NUM_PTE - 1)) << SMMU_PTE_SHIFT;
>>>>> +}
>>>>
>>>> We know that IOVA is fixed to u32 for this controller. Can we avoid all
>>>> these dma_addr_t castings? It should make code cleaner a tad, IMO.
>>>
>>> Tegra210 actually supports 34-bit IOVA...
>>>
>>
>> It doesn't. 34-bit is PA, 32-bit is VA.
>>
>> Quote from T210 TRM:
>>
>> "The SMMU is a centralized virtual-to-physical translation for MSS. It
>> maps a 32-bit virtual address to a 34-bit physical address. If the
>> client address is 40 bits then bits 39:32 are ignored."
> 
> If you scroll down by a couple of sections, you can see 34-bit
> virtual addresses in section 18.6.1.2; and if checking one ASID
> register, you can see it mention the extra two bits va[33:32].

Thanks for the pointer. It says that only certain memory clients allow
to combine 4 ASIDs to form 34bit VA space. In this case the PA space is
split into 4GB areas and there are additional bitfields which configure
the ASID mapping of each 4GB area. Still each ASID is 32bit.

This is what TRM says:

"For the GPU and other clients with 34-bit address interfaces, the ASID
registers are extended to point to four ASIDs. The SMMU supports 4GB of
virtual address space per ASID, so mapping addr[33:32] into ASID[1:0]
extends the virtual address space of a client to 16GB."

> However, the driver currently sets its geometry.aperture_end to
> 32-bit, and we can only get 32-bit IOVAs using PDE and PTE only,
> so I think it should be safe to remove the castings here. I'll
> wait for a couple of days and see if there'd be other comments
> for me to address in next version.

You will need to read the special "ASID Assignment Register" which
supports 4 sub-ASIDs to translate the PA address into the actual VA. By
default all clients are limited to a single ASID and upstream kernel
doesn't support programming of 34bit VAs. So doesn't worth the effort to
fully translate the VA, IMO.

>> Even if it supported more than 32bit, then the returned ulong is 32bit,
>> which doesn't make sense.
> 
> On ARM64 (Tegra210), isn't ulong 64-bit?

Yes, indeed.
