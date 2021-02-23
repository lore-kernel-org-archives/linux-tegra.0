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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58EC6C433E0
	for <linux-tegra@archiver.kernel.org>; Tue, 23 Feb 2021 05:11:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 186DB64E31
	for <linux-tegra@archiver.kernel.org>; Tue, 23 Feb 2021 05:11:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230417AbhBWFLb (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 23 Feb 2021 00:11:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50740 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230386AbhBWFLZ (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 23 Feb 2021 00:11:25 -0500
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E279C061574;
        Mon, 22 Feb 2021 21:10:44 -0800 (PST)
Received: by mail-lf1-x131.google.com with SMTP id u4so9454102lfs.0;
        Mon, 22 Feb 2021 21:10:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Il79xTcmDqAf6XgpWPsurgMb0lSvbJy0MAk63OdeoEk=;
        b=dp8Y+5TX4ZXGtkpTvZ6t+nZd5AEXCU2IjUXkCuztzt9xlgYxTCFnE/380+T5Qf70RQ
         suTdGgDFNNCn6d1Gzj4MvY+5ih0kKw9Wyrom2bsnY42IhpjPaPWhZtaX8kgvkFCEz3E1
         FjwB8+eR9bIJvY57No+D1mFapKp1z/aaP4qh1CbnP+IPi2iSzAG3YD2ZV4cotnexeLmT
         f3RseJ5+B3aefvm+ntiO+vt38+FzzIgP8Qul0e/AYjrcLo07d1X+jJfXqudGyzqweFpC
         X3VqS/mVySwMD9sj5QYTUAJcu3RBynSl2e5sHnbmy+XwEEkQbLGjJJUm8SpBUei9M6dU
         L1Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Il79xTcmDqAf6XgpWPsurgMb0lSvbJy0MAk63OdeoEk=;
        b=QuWtN77e5qYkfb9ofikMpe24h10NR8NXkorRLTH0XpbgwrcEcGBbjnmxuPovJlYMyy
         zo9piscHkKmGJe4SJO/58XgHNiBb75k9/zs/9YEVk8LvVqRhyPw5iC5jmdYLg1GFrB4m
         HFocK5MiUY50voHVvPj7Z8FJlpTDHNn6e9mZQDoCeSl/IdDJ3h0cYdFCpz7FV0lKVD3X
         6nVFqEj++XGCueZgXxQyS5UZ394CkaiT0k7zdk3E5L+YrF9wpmgUaisB8Ic3diOPCW5Z
         hx5bk+38iCp+OL8NKN9NcTahmDyff79ah7I453nfymtXeEPtx6a4IS8/IoSDekRvnM+3
         w9AA==
X-Gm-Message-State: AOAM53060AkDGXloMJM62yorIgFfLR9HuVOLLe/DBCXehZGfqfIQb5ui
        hCu7G96K/PPIoiOxxGIdiOfhUo2O0kI=
X-Google-Smtp-Source: ABdhPJx+/Kw4XAKnzZ7Hljj37voHLh1WXKBIBEwDoXLE02BdrgSHVIz017subWny3H/f9hu3jfTK8w==
X-Received: by 2002:a05:6512:2295:: with SMTP id f21mr16617041lfu.187.1614057042751;
        Mon, 22 Feb 2021 21:10:42 -0800 (PST)
Received: from [192.168.2.145] (109-252-193-52.dynamic.spd-mgts.ru. [109.252.193.52])
        by smtp.googlemail.com with ESMTPSA id t5sm1148367lfq.2.2021.02.22.21.10.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Feb 2021 21:10:42 -0800 (PST)
Subject: Re: [PATCH] iommu/tegra-smmu: Fix mc errors on tegra124-nyan
To:     Nicolin Chen <nicoleotsuka@gmail.com>
Cc:     joro@8bytes.org, thierry.reding@gmail.com, will@kernel.org,
        guillaume.tucker@collabora.com, vdumpa@nvidia.com,
        jonathanh@nvidia.com, linux-tegra@vger.kernel.org,
        iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org
References: <20210218220702.1962-1-nicoleotsuka@gmail.com>
 <9d6445c0-9574-1650-e327-32b11716f87e@gmail.com>
 <20210223021343.GA6539@Asurada-Nvidia>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <79bb1248-497f-8adf-663b-74448bea3849@gmail.com>
Date:   Tue, 23 Feb 2021 08:10:41 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.2
MIME-Version: 1.0
In-Reply-To: <20210223021343.GA6539@Asurada-Nvidia>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

23.02.2021 05:13, Nicolin Chen пишет:
> Hi Dmitry,
> 
> On Sat, Feb 20, 2021 at 08:16:22AM +0300, Dmitry Osipenko wrote:
>> 19.02.2021 01:07, Nicolin Chen пишет:
>>> Commit 25938c73cd79 ("iommu/tegra-smmu: Rework tegra_smmu_probe_device()")
>>> removed certain hack in the tegra_smmu_probe() by relying on IOMMU core to
>>> of_xlate SMMU's SID per device, so as to get rid of tegra_smmu_find() and
>>> tegra_smmu_configure() that are typically done in the IOMMU core also.
>>>
>>> This approach works for both existing devices that have DT nodes and other
>>> devices (like PCI device) that don't exist in DT, on Tegra210 and Tegra3
>>> upon testing. However, Page Fault errors are reported on tegra124-Nyan:
>>>
>>>   tegra-mc 70019000.memory-controller: display0a: read @0xfe056b40:
>>> 	 EMEM address decode error (SMMU translation error [--S])
>>>   tegra-mc 70019000.memory-controller: display0a: read @0xfe056b40:
>>> 	 Page fault (SMMU translation error [--S])
>>>
>>> After debugging, I found that the mentioned commit changed some function
>>> callback sequence of tegra-smmu's, resulting in enabling SMMU for display
>>> client before display driver gets initialized. I couldn't reproduce exact
>>> same issue on Tegra210 as Tegra124 (arm-32) differs at arch-level code.
>>
>> Hello Nicolin,
>>
>> Could you please explain in a more details what exactly makes the
>> difference for the callback sequence?
> 
> Here is a log with 5.11.0-rc6:
> https://lava.collabora.co.uk/scheduler/job/3187849
> [dump_stack was added in some tegra-smmu functions]
> 
> And here is a corresponding log with reverting the original commit:
> https://lava.collabora.co.uk/scheduler/job/3187851
> 
> Here is a log with 5.11.0-rc7-next-20210210:
> https://lava.collabora.co.uk/scheduler/job/3210245
> 
> And here is a corresponding log with reverting the original commit:
> https://lava.collabora.co.uk/scheduler/job/3210596
> 
> Both failing logs show that mc errors started right after client DC
> got enabled by ->attach_dev() callback that in the passing logs was
> not called until Host1x driver init. And note that two failing logs
> show that ->attach_dev() could be called from two different sources,
> of_dma_configure_id() or arch_setup_dma_ops().
> 
> The reason why ->attach_dev() gets called is probably related to the
> following reasons (sorry, can't be 100% sure as I don't have Tegra124
> or other 32bit Tegra board to test):
> 1) With the commit reverted, all clients are probed in "arch" stage,
>    which is even prior to iommu core initialization -- including it
>    setting default domain type. This probably messed up the type of
>    allocating domains against the default domain type. Also internal
>    group is somehow affected. So some condition check in iommu core
>    failed and then it bypassed ->attach_dev callback in really_probe
>    stage, until Host1x driver does attach_dev again.
> 
> 2) 32bit ARM has arch_setup_dma_ops() does an additional set of iommu
>    domain allocation + attach_dev(), after of_dma_configure_id() did
>    once. This isn't reproducible for me on Tegra210.
> 
> As debugging online isn't very efficient, and given that Thierry has
> been working on the linear mapping of framebuffer carveout, I choose
> to partially revert as a quick fix.

The partially revert should be okay, but it's not clear to me what makes
difference for T124 since I don't see that problem on T30, which also
has active display at a boot time.

