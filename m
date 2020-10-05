Return-Path: <SRS0=kAmo=DM=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31BE6C4363A
	for <linux-tegra@archiver.kernel.org>; Mon,  5 Oct 2020 08:41:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E3B1320781
	for <linux-tegra@archiver.kernel.org>; Mon,  5 Oct 2020 08:41:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Wty8ziIf"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725893AbgJEIlM (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 5 Oct 2020 04:41:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725885AbgJEIlM (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Mon, 5 Oct 2020 04:41:12 -0400
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com [IPv6:2a00:1450:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 19B26C0613CE;
        Mon,  5 Oct 2020 01:41:12 -0700 (PDT)
Received: by mail-lf1-x143.google.com with SMTP id r127so5309732lff.12;
        Mon, 05 Oct 2020 01:41:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=MsKeV687zvpIWY1pcnq1tlTAUwQK7/R0c1Aynnt5TJY=;
        b=Wty8ziIf2Hrfe42+YlSSl5tktChzWE81QKDiBkuM2/nvcPuSIgj/g4GcTm2gZlJQft
         gAU+UxeVlIIiUyaE5F/WkWKPHKj57QSHLHEYN8ccyfoUU/7tWI3OTj/thyo8Ssex6prj
         QvtlPc90Xobpn9PiaBe1S54+WCTyUgEeNxVMiI0SMbt22g1eWTTZ6C0feE2fNm8JNr6v
         CyX1CZryMdzDeHR3qTinKTcyHPpizkimjQSapeJg9DjFRkqNt83tq0GGxm4aiZvd+3q8
         Zu8eQufSA2e5uTGqk30ztBKzgKUe5J+Lfx6OzWjJ0+mTmvQmFuU1U6ApQuRuYtATguiM
         udzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=MsKeV687zvpIWY1pcnq1tlTAUwQK7/R0c1Aynnt5TJY=;
        b=Xr3Eh6vogW/rGxMi8p9ab2eAfeYhgHZqUTi1a/0t5KjoWOOJdsVmVHhiFonsx7PY1k
         AxlCWFcr75zhK7UkUiL/RtAq8DdNiv5K0QnMR3h4iocZ5ml9QTW+fgfBV8DJ1DZHTPNO
         aNxUlFgSeEBGQLPZ4+cJlezglxHs+Ub3/yT1+tbi22KsTV19hS6CXdkLXaThzpt52CMV
         mwMAnvGVaxWwWDlMsnbRrUahlOGLctaEQKU12GdfOI8sshs19KK4Ti/SBGlmjO6ftYx8
         WHW1Ea6oeZqXQ9S06Z6iipZdlR7JGGYUjJtqs8kmsJuddMZman21Nc0kMXHvCNkKSTsw
         RL8A==
X-Gm-Message-State: AOAM532jfxQ7rJhRptqT0clwRo+cExl6D90RijnxtvuNe/ZJCls8Jrj2
        EeoxuXHytQ3iSc9aPK0ilAoem4wCJFM=
X-Google-Smtp-Source: ABdhPJztHJe7GZ/49WkyTe9DZT5/nQIc2yWZLW43qLuyMt3TK3Y2/RBL6rSEmnYHZWfZLludzWTIMg==
X-Received: by 2002:a19:2291:: with SMTP id i139mr4992120lfi.387.1601887270291;
        Mon, 05 Oct 2020 01:41:10 -0700 (PDT)
Received: from [192.168.2.145] ([109.252.91.252])
        by smtp.googlemail.com with ESMTPSA id o24sm2455776ljj.49.2020.10.05.01.41.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Oct 2020 01:41:09 -0700 (PDT)
Subject: Re: [PATCH v5 2/3] iommu/tegra-smmu: Rework tegra_smmu_probe_device()
To:     Nicolin Chen <nicoleotsuka@gmail.com>
Cc:     thierry.reding@gmail.com, joro@8bytes.org, vdumpa@nvidia.com,
        jonathanh@nvidia.com, linux-tegra@vger.kernel.org,
        iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org
References: <20201003065947.18671-1-nicoleotsuka@gmail.com>
 <20201003065947.18671-3-nicoleotsuka@gmail.com>
 <4a5a5b1c-080a-327a-1e2f-dc087948e1a1@gmail.com>
 <20201004215731.GA21420@Asurada-Nvidia>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <689c3d90-e05c-d36a-bf37-0bec100040f5@gmail.com>
Date:   Mon, 5 Oct 2020 11:41:08 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201004215731.GA21420@Asurada-Nvidia>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

05.10.2020 00:57, Nicolin Chen пишет:
> On Sat, Oct 03, 2020 at 05:06:42PM +0300, Dmitry Osipenko wrote:
>> 03.10.2020 09:59, Nicolin Chen пишет:
>>>  static int tegra_smmu_of_xlate(struct device *dev,
>>>  			       struct of_phandle_args *args)
>>>  {
>>> +	struct platform_device *iommu_pdev = of_find_device_by_node(args->np);
>>> +	struct tegra_mc *mc = platform_get_drvdata(iommu_pdev);
>>>  	u32 id = args->args[0];
>>>  
>>> +	put_device(&iommu_pdev->dev);
>>> +
>>> +	if (!mc || !mc->smmu)
>>> +		return -EPROBE_DEFER;
>>
>> I'm not very excited by seeing code in the patches that can't be
>> explained by the patch authors and will appreciate if you could provide
>> a detailed explanation about why this NULL checking is needed because I
>> think it is unneeded, especially given that other IOMMU drivers don't
>> have such check.
> 
> This function could be called from of_iommu_configure(), which is
> a part of other driver's probe(). So I think it's safer to have a
> check. Yet, given mc driver is added to the "arch_initcall" stage,
> you are probably right that there's no really need at this moment
> because all clients should be called after mc/smmu are inited. So
> I'll resend a v6, if that makes you happy.

I wanted to get the explanation :) I'm very curious why it's actually
needed because I'm not 100% sure whether it's not needed at all.

I'd assume that the only possible problem could be if some device is
created in parallel with the MC probing and there is no locking that
could prevent this in the drivers core. It's not apparent to me whether
this situation could happen at all in practice.

The MC is created early and at that time everything is sequential, so
it's indeed should be safe to remove the check.

>> I'm asking this question second time now, please don't ignore review
>> comments next time.
> 
> I think I missed your reply or misunderstood it.
> 

Okay!
