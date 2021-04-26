Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A317C43460
	for <linux-tegra@archiver.kernel.org>; Mon, 26 Apr 2021 07:41:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DADCB61166
	for <linux-tegra@archiver.kernel.org>; Mon, 26 Apr 2021 07:41:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233625AbhDZHm1 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 26 Apr 2021 03:42:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39068 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232933AbhDZHkN (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 26 Apr 2021 03:40:13 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A909BC06175F;
        Mon, 26 Apr 2021 00:39:28 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id d27so29974761lfv.9;
        Mon, 26 Apr 2021 00:39:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=4x5tRF7HTHU6jnLJwm1CHDLupwBUyqj6xcR0SHL/i2Y=;
        b=U94b76338mQDuCwPjjXcxuRR+LS8qwlxBg3fcGw3WhyM0J3ty/C+nCE14HVnlPZ7Ed
         7Su+9lVB4crNKUx/FToCIru2kibDav2YCUDYuNoX17HytlvfTkY+DFkszZjqXdkLYmOj
         FDbBgwN8DyFOtIMCasOLwhio+JoeHRum9qKsD/BFI6yxPGr0gl1TZ0Qgf2WdzwWnsLTl
         FfR3FQk6YgpbFU9YgUBxljcEWj90q6fmgev1U5cdZp3x66s7PXK+EstK9PcRT0eaTlYW
         slgm5gsyJ41RbU2X5yY/zt1f8mQP3J4W5aytiGOxBsXLhkplJ2dkOCoxF43ocpJa3C6H
         F4ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=4x5tRF7HTHU6jnLJwm1CHDLupwBUyqj6xcR0SHL/i2Y=;
        b=Gy3PDWRx8tIlq5vNkmOz7nLKhJUkyPhf12CO2wWVTZ+s77FARw38sKMelymYZr4vr9
         9PcTVgvbeAbnBdhBWkTKCT/q7FBiw+xUEcElHtHCKPZ/piobadF9mWGEDSo0k4+vFPcN
         RnhDCdAhRleVP2bu7M5RYPw4o6k0JrAEQlYBld4VGBDuy3FsVzRzxYROf2Ls180zLAAf
         ZRafscI7ovN4MRrNyPSHelz9rnMMhvyV93mEG1gdIzCQ6am21tjz/+BwzzDybhtu1iOH
         mUiGaW5CmJJBpoArwqWodKjFuVuFciqoqjQMX7kIcW6G3TRpduRpQACC3Iz9Lb6/dk48
         US1A==
X-Gm-Message-State: AOAM530q/xALySFY1bRfUFO7KEyDwpejPoIRGADuo9oxFXXsHNZsapDz
        Q2kOi1O5MXZm655GFFAdTiM8WpXRDEc=
X-Google-Smtp-Source: ABdhPJz9hvSQ4kEn15pg4GdXhHEmP9dU+nu4iURs7wnT5KqepvkOcPZyRizzupf9HviKy/JMZf0maw==
X-Received: by 2002:a19:ed13:: with SMTP id y19mr12118860lfy.338.1619422766438;
        Mon, 26 Apr 2021 00:39:26 -0700 (PDT)
Received: from [192.168.2.145] (109-252-193-102.dynamic.spd-mgts.ru. [109.252.193.102])
        by smtp.googlemail.com with ESMTPSA id d15sm1329008lfn.7.2021.04.26.00.39.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Apr 2021 00:39:26 -0700 (PDT)
Subject: Re: [PATCH v1 2/2] iommu/tegra-smmu: Revert workaround that was
 needed for Nyan Big Chromebook
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Guillaume Tucker <guillaume.tucker@collabora.com>,
        Nicolin Chen <nicoleotsuka@gmail.com>,
        Joerg Roedel <joro@8bytes.org>,
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
 <5ec2be61-a70e-e3b1-9267-414793c32a04@gmail.com>
 <YIZocTpPPM0vF4Wk@orome.fritz.box>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <19834018-4ac7-a8fd-f7df-199128b04e4e@gmail.com>
Date:   Mon, 26 Apr 2021 10:39:25 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YIZocTpPPM0vF4Wk@orome.fritz.box>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

26.04.2021 10:14, Thierry Reding пишет:
> On Sat, Apr 24, 2021 at 11:27:10PM +0300, Dmitry Osipenko wrote:
>> 23.04.2021 18:23, Dmitry Osipenko пишет:
>>> 23.04.2021 18:01, Guillaume Tucker пишет:
>>>> On 02/04/2021 15:40, Dmitry Osipenko wrote:
>>>>> 01.04.2021 11:55, Nicolin Chen пишет:
>>>>>> On Mon, Mar 29, 2021 at 02:32:56AM +0300, Dmitry Osipenko wrote:
>>>>>>> The previous commit fixes problem where display client was attaching too
>>>>>>> early to IOMMU during kernel boot in a multi-platform kernel configuration
>>>>>>> which enables CONFIG_ARM_DMA_USE_IOMMU=y. The workaround that helped to
>>>>>>> defer the IOMMU attachment for Nyan Big Chromebook isn't needed anymore,
>>>>>>> revert it.
>>>>>>
>>>>>> Sorry for the late reply. I have been busy with downstream tasks.
>>>>>>
>>>>>> I will give them a try by the end of the week. Yet, probably it'd
>>>>>> be better to include Guillaume also as he has the Nyan platform.
>>>>>>
>>>>>
>>>>> Indeed, thanks. Although, I'm pretty sure that it's the same issue which
>>>>> I reproduced on Nexus 7.
>>>>>
>>>>> Guillaume, could you please give a test to these patches on Nyan Big?
>>>>> There should be no EMEM errors in the kernel log with this patches.
>>>>>
>>>>> https://patchwork.ozlabs.org/project/linux-tegra/list/?series=236215
>>>>
>>>> So sorry for the very late reply.  I have tried the patches but
>>>> hit some issues on linux-next, it's not reaching a login prompt
>>>> with next-20210422.  So I then tried with next-20210419 which
>>>> does boot but shows the IOMMU error:
>>>>
>>>> <6>[    2.995341] tegra-dc 54200000.dc: Adding to iommu group 1
>>>> <4>[    3.001070] Failed to attached device 54200000.dc to IOMMU_mapping  
>>>>
>>>>   https://lava.collabora.co.uk/scheduler/job/3570052#L1120
>>>>
>>>> The branch I'm using with the patches applied can be found here:
>>>>
>>>>   https://gitlab.collabora.com/gtucker/linux/-/commits/next-20210419-nyan-big-drm-read/
>>>>
>>>> Hope this helps, let me know if you need anything else to be
>>>> tested.
>>>
>>>
>>> Hello Guillaume,
>>>
>>> The current linux-next doesn't boot on all ARM (AFAIK), the older
>>> next-20210413 works. The above message should be unrelated to the boot
>>> problem. It should be okay to ignore that message as it should be
>>> harmless in yours case.
>>>
>>
>> Although, the 20210419 should be good.
>>
>> Thierry, do you know what those SOR and Nouveau issues are about?
> 
> There's a use-after-free (though it's really a use-before-init) issue in
> linux-next at the moment, but a fix has been suggested. The fix for this
> along with an additional leak plug is here:
> 
> 	http://patchwork.ozlabs.org/project/linux-tegra/list/?series=240569

Nice, thank you. Maybe Guillaume could give it a test.

> I'm not aware of any Nouveau issues. What version and platform are those
> happening on? Are there any logs? I can't seem to find them in this
> thread.

This all is on Nyan Big using linux-next-20210419. There is a link to the full log above.

I see this Nouveau failure:

<6>[   19.323113] nouveau 57000000.gpu: Adding to iommu group 2
<6>[   19.323615] nouveau 57000000.gpu: NVIDIA GK20A (0ea000a1)
<6>[   19.323668] nouveau 57000000.gpu: imem: using IOMMU
<3>[   19.323795] nouveau 57000000.gpu: gr ctor failed: -2
<4>[   19.323983] nouveau: probe of 57000000.gpu failed with error -2

