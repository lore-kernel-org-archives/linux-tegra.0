Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5D61C433B4
	for <linux-tegra@archiver.kernel.org>; Fri, 23 Apr 2021 15:23:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9EE7161425
	for <linux-tegra@archiver.kernel.org>; Fri, 23 Apr 2021 15:23:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231437AbhDWPYE (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 23 Apr 2021 11:24:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54556 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230330AbhDWPYE (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 23 Apr 2021 11:24:04 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 172F1C061574;
        Fri, 23 Apr 2021 08:23:26 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id j18so78129072lfg.5;
        Fri, 23 Apr 2021 08:23:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=n5/P3oLW/T875nhk38fWvvBcXE+/GVaIkWm4ulWT5wE=;
        b=W5cQCMg7NNkYQKAZqRvcb4c8g4HSECVX1Edc17mn3r0emGHFU3Z/4HKbnvPlLO5C07
         GkucuOR+TdOONwnH/ikfN+nQnJOvd1FqUu8by2KhZ/NjfEAtKOv9cIn6tfr7LS5qTMtB
         tCGaFtIMZC6hiTmkuOH42dUk3YOZzaxKsR1Hc0n2Wi7YK1WQegQNS6jcvKxOAfZvQ8AG
         RBeuBFoVvbOqnAG1+sERGib8EMpkNXAhCnhPlrsZEgKITr0S0LVoQ4xmbgNahqfQv4jT
         peix0RW3vtyN4lypDBjppnK7TFL6iRJPhlUm3dlHQP++mKkM2ANyxaUx8sFs9Nywh8hs
         vsbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=n5/P3oLW/T875nhk38fWvvBcXE+/GVaIkWm4ulWT5wE=;
        b=k0M6LgTyCpihCMb/nJlVQeHFk1HV2rf2tnU+5yWui96cPvk1J7E+gyru6NPOuN317V
         MROv+sJ1NVAt8OoBr1rCEag7yOheEkEV/jCcO3u6wO9hH2j5UOQ1sRWN5B9ZwU1B2sqp
         suhA9sT+Q8sMJKENIPcNn9QEoP5NvLTvqUy+xJ0JRsoIK7zQBequ+GlCZPg15/iusX9w
         pDiggG8U+FhmkU/y6Zsd7w37DdvtLJ5JY1I5f1/3nF8RU/UnbhBElVV+//Qp8KxU5/Xj
         amBwCLs1aT2yfw3nm0qJ1Hi0J6Gj+Dpagel4zhkDYW7FsV53Pwj1mCmxrKF/Z9wVckPN
         wLNQ==
X-Gm-Message-State: AOAM5324CJtG7rQ/7sftafx5mSuJzTCtwN0kN+HGT0+H33468jDixi/O
        TY9rUofQ8XpIc00TuW+Wa5EDuRPUsxA=
X-Google-Smtp-Source: ABdhPJx7dckk2pxEp/9xgSTGhkwCinZbZk3SLiXmMuI4u5wtA2nNSFJjJcolacRxt2TyFsCkVflzfw==
X-Received: by 2002:ac2:5299:: with SMTP id q25mr3354496lfm.594.1619191404448;
        Fri, 23 Apr 2021 08:23:24 -0700 (PDT)
Received: from [192.168.2.145] (109-252-193-103.dynamic.spd-mgts.ru. [109.252.193.103])
        by smtp.googlemail.com with ESMTPSA id c2sm581127lfi.143.2021.04.23.08.23.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Apr 2021 08:23:24 -0700 (PDT)
Subject: Re: [PATCH v1 2/2] iommu/tegra-smmu: Revert workaround that was
 needed for Nyan Big Chromebook
To:     Guillaume Tucker <guillaume.tucker@collabora.com>,
        Nicolin Chen <nicoleotsuka@gmail.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
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
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <724e683f-5317-cdf7-7351-fcfd42b7b607@gmail.com>
Date:   Fri, 23 Apr 2021 18:23:22 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <d01ccde4-5fa9-2aa7-c28b-b3899cc54c54@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

23.04.2021 18:01, Guillaume Tucker пишет:
> On 02/04/2021 15:40, Dmitry Osipenko wrote:
>> 01.04.2021 11:55, Nicolin Chen пишет:
>>> On Mon, Mar 29, 2021 at 02:32:56AM +0300, Dmitry Osipenko wrote:
>>>> The previous commit fixes problem where display client was attaching too
>>>> early to IOMMU during kernel boot in a multi-platform kernel configuration
>>>> which enables CONFIG_ARM_DMA_USE_IOMMU=y. The workaround that helped to
>>>> defer the IOMMU attachment for Nyan Big Chromebook isn't needed anymore,
>>>> revert it.
>>>
>>> Sorry for the late reply. I have been busy with downstream tasks.
>>>
>>> I will give them a try by the end of the week. Yet, probably it'd
>>> be better to include Guillaume also as he has the Nyan platform.
>>>
>>
>> Indeed, thanks. Although, I'm pretty sure that it's the same issue which
>> I reproduced on Nexus 7.
>>
>> Guillaume, could you please give a test to these patches on Nyan Big?
>> There should be no EMEM errors in the kernel log with this patches.
>>
>> https://patchwork.ozlabs.org/project/linux-tegra/list/?series=236215
> 
> So sorry for the very late reply.  I have tried the patches but
> hit some issues on linux-next, it's not reaching a login prompt
> with next-20210422.  So I then tried with next-20210419 which
> does boot but shows the IOMMU error:
> 
> <6>[    2.995341] tegra-dc 54200000.dc: Adding to iommu group 1
> <4>[    3.001070] Failed to attached device 54200000.dc to IOMMU_mapping  
> 
>   https://lava.collabora.co.uk/scheduler/job/3570052#L1120
> 
> The branch I'm using with the patches applied can be found here:
> 
>   https://gitlab.collabora.com/gtucker/linux/-/commits/next-20210419-nyan-big-drm-read/
> 
> Hope this helps, let me know if you need anything else to be
> tested.


Hello Guillaume,

The current linux-next doesn't boot on all ARM (AFAIK), the older
next-20210413 works. The above message should be unrelated to the boot
problem. It should be okay to ignore that message as it should be
harmless in yours case.
