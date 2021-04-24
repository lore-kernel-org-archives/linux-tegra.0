Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE869C433B4
	for <linux-tegra@archiver.kernel.org>; Sat, 24 Apr 2021 20:27:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AF4A161151
	for <linux-tegra@archiver.kernel.org>; Sat, 24 Apr 2021 20:27:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235452AbhDXU1x (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sat, 24 Apr 2021 16:27:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35496 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232708AbhDXU1x (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sat, 24 Apr 2021 16:27:53 -0400
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27861C061574;
        Sat, 24 Apr 2021 13:27:13 -0700 (PDT)
Received: by mail-lj1-x22b.google.com with SMTP id b38so18341236ljf.5;
        Sat, 24 Apr 2021 13:27:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=akaFyjlJawcZhlN19BfOzYv3nfkA3HMJk9vvTeGaZDE=;
        b=KnWdVZ27vn/9TonspL6cS/l0i7OahlQ7Vgk3cqUAx9ic3LEkRs256To8zXcyC9PNvl
         CzLaGM9heWk5QUs/yR7Q/+lEX/mHuxo99EIt0/TkdxSqxotrUyARQ7ln7EogwISFGXzC
         DDi4AooQ1cnPBVDvWPxDCCLlPqh8e6E3bDEsCs1u5s8hDfAGTWOiKJxnEYeAEHIicfhI
         kUKx5v/n0I+1O3HBYREvY9CzFF8qI+6qH63LecgR7zR4Chvwrbm/zlmTXv6niwxF9g/b
         QhWXMzxXMQmf21uudddtdil1IFRdqxe/9YsRl65HyMzbC/8Rx2wsZBV7Dp5niMHn6kjv
         9bpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=akaFyjlJawcZhlN19BfOzYv3nfkA3HMJk9vvTeGaZDE=;
        b=CzbyA+q6/mdZGawrueQPRcrVsgJX5StAhvavcYfpFpojRi7MdxSCBQrsGW6AzbwAYJ
         VirLeQeT6Ni5s+cTf3XgCM1sPMxLQHjtizIIoVqabG2wKoOCRjP4tO5emIkKmA7cygMQ
         pveTsFZFWXWrQW6+74GOKzVJvnd1gg3fdNuAfbGnYH+sXN0awLZr1FMUtiaspTbXu4CU
         aEDW221YCtJcHIs7Uft8w9aOCQknAsW1uDwQO+KOsX44lxTM65H502gCg8pz1Rl3MWgX
         MPd4u0NVAjYACFZa5sCfgalfCzeRtEUkX7EOASITGQpTqjjyol4OV/Zyr8q2cCT4e6Ik
         f8fQ==
X-Gm-Message-State: AOAM532yimE31mNl5mJ+q5dSvknUVij/jes1rlzFEbF2oPERpApc6ePB
        PuVm21+rXmkz5s9aFgK2BEg6fw9FkK8=
X-Google-Smtp-Source: ABdhPJyTXOXVdWtPeJpKdv3M/Hf7CSGsvwvwmmNuIjKxmGoNq6aa/Iog4SIz+cgrfVekK/A6PrfZLQ==
X-Received: by 2002:a2e:b6c4:: with SMTP id m4mr6989287ljo.185.1619296031440;
        Sat, 24 Apr 2021 13:27:11 -0700 (PDT)
Received: from [192.168.2.145] (109-252-193-103.dynamic.spd-mgts.ru. [109.252.193.103])
        by smtp.googlemail.com with ESMTPSA id y16sm938774ljh.13.2021.04.24.13.27.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 24 Apr 2021 13:27:11 -0700 (PDT)
Subject: Re: [PATCH v1 2/2] iommu/tegra-smmu: Revert workaround that was
 needed for Nyan Big Chromebook
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Guillaume Tucker <guillaume.tucker@collabora.com>,
        Nicolin Chen <nicoleotsuka@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>
Cc:     Joerg Roedel <joro@8bytes.org>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Krishna Reddy <vdumpa@nvidia.com>,
        Will Deacon <will@kernel.org>,
        iommu@lists.linux-foundation.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20210328233256.20494-1-digetx@gmail.com>
 <20210328233256.20494-2-digetx@gmail.com>
 <20210401085549.GA31146@Asurada-Nvidia>
 <50a7e4c7-0e72-534a-a317-366e455213c1@gmail.com>
 <d01ccde4-5fa9-2aa7-c28b-b3899cc54c54@collabora.com>
 <724e683f-5317-cdf7-7351-fcfd42b7b607@gmail.com>
Message-ID: <5ec2be61-a70e-e3b1-9267-414793c32a04@gmail.com>
Date:   Sat, 24 Apr 2021 23:27:10 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <724e683f-5317-cdf7-7351-fcfd42b7b607@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

23.04.2021 18:23, Dmitry Osipenko пишет:
> 23.04.2021 18:01, Guillaume Tucker пишет:
>> On 02/04/2021 15:40, Dmitry Osipenko wrote:
>>> 01.04.2021 11:55, Nicolin Chen пишет:
>>>> On Mon, Mar 29, 2021 at 02:32:56AM +0300, Dmitry Osipenko wrote:
>>>>> The previous commit fixes problem where display client was attaching too
>>>>> early to IOMMU during kernel boot in a multi-platform kernel configuration
>>>>> which enables CONFIG_ARM_DMA_USE_IOMMU=y. The workaround that helped to
>>>>> defer the IOMMU attachment for Nyan Big Chromebook isn't needed anymore,
>>>>> revert it.
>>>>
>>>> Sorry for the late reply. I have been busy with downstream tasks.
>>>>
>>>> I will give them a try by the end of the week. Yet, probably it'd
>>>> be better to include Guillaume also as he has the Nyan platform.
>>>>
>>>
>>> Indeed, thanks. Although, I'm pretty sure that it's the same issue which
>>> I reproduced on Nexus 7.
>>>
>>> Guillaume, could you please give a test to these patches on Nyan Big?
>>> There should be no EMEM errors in the kernel log with this patches.
>>>
>>> https://patchwork.ozlabs.org/project/linux-tegra/list/?series=236215
>>
>> So sorry for the very late reply.  I have tried the patches but
>> hit some issues on linux-next, it's not reaching a login prompt
>> with next-20210422.  So I then tried with next-20210419 which
>> does boot but shows the IOMMU error:
>>
>> <6>[    2.995341] tegra-dc 54200000.dc: Adding to iommu group 1
>> <4>[    3.001070] Failed to attached device 54200000.dc to IOMMU_mapping  
>>
>>   https://lava.collabora.co.uk/scheduler/job/3570052#L1120
>>
>> The branch I'm using with the patches applied can be found here:
>>
>>   https://gitlab.collabora.com/gtucker/linux/-/commits/next-20210419-nyan-big-drm-read/
>>
>> Hope this helps, let me know if you need anything else to be
>> tested.
> 
> 
> Hello Guillaume,
> 
> The current linux-next doesn't boot on all ARM (AFAIK), the older
> next-20210413 works. The above message should be unrelated to the boot
> problem. It should be okay to ignore that message as it should be
> harmless in yours case.
> 

Although, the 20210419 should be good.

Thierry, do you know what those SOR and Nouveau issues are about?
