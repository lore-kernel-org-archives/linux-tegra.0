Return-Path: <SRS0=WsFM=DI=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6B25C4727E
	for <linux-tegra@archiver.kernel.org>; Thu,  1 Oct 2020 20:33:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7BE6220739
	for <linux-tegra@archiver.kernel.org>; Thu,  1 Oct 2020 20:33:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ss8dIJh6"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726964AbgJAUdn (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 1 Oct 2020 16:33:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57674 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726515AbgJAUdn (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 1 Oct 2020 16:33:43 -0400
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 90B11C0613D0;
        Thu,  1 Oct 2020 13:33:42 -0700 (PDT)
Received: by mail-lf1-x142.google.com with SMTP id m5so209241lfp.7;
        Thu, 01 Oct 2020 13:33:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=HFskIQxSh3pcFkxZ3RI+nqtU31LBSYrV7T+aRIb+B54=;
        b=ss8dIJh6Gvzh5FabnueDMuIgWAM2w32VQ/xq+kK5CLOYOKw2OlM7XLIsQ0cYHnx5ES
         3BHVFeOTTpJgE2c3Y+V3nC7Gr/aHHuQ11LtIDJRGy2WTI2vZLZ7mkKeY2u3ZqoWLv5Dr
         lrb2tZsmmX2feonsncEhcrza8CMi+IHQL9/28Iz+9TS19gP8TIJMrB9Kcow9NAyjvWFd
         SKY3CU5jcl5YDlpVzxe8TRBPkM6DS97MnwlFKrgCSvVIFROKikpN7OeURpH51mUgrqfw
         9C4xEDaQJPzDvTvsf7BemRUrWsU/cGNvyF6e+3qR9KZ6H8s7UmOqTqIrjd3tIu1HEOmB
         hkpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=HFskIQxSh3pcFkxZ3RI+nqtU31LBSYrV7T+aRIb+B54=;
        b=JKxq3fxxjAMfVLKqHCOvlx4RyKiFyRlXZFkmrS/SH0cRclEFQKSCscpWNXaVrYT/rR
         fwdWKN2m04jeMk0b6vCQAjDYjs8zRrfodTNLwTRPjSXnzUmq+sYR7gZMzAhDt5WP0Iav
         gUnwoeHrzdgVC/rmhTu7vxVpwFBVoNY59T+w7iuHvWXB5w2sfzl1jmVt6MRYBclUMVOV
         IyH3UNrow8tVXG7/Sa3amSF9PnsYXzGZagACkRNrWWFXzFxDuqWsIua7I36AJT6IGaKd
         KE32dR2kpGRXCyo8PXpssUYnCRDQP44eYgGvymcbCn4R5SjpfT6WcdAkat4z+hazdomy
         4G0w==
X-Gm-Message-State: AOAM531nQp6dU/zrUaRQXncha60I6efk+ldx8Unxfa1KI6uRmM1qwDy4
        GzUnSq2fUFT/h6fe5jnvjrQQoEDQ9eM=
X-Google-Smtp-Source: ABdhPJyQOTivvirQ4d8xHsycKRqajTI4M3B2EKt9xsYhtahkMy7MbqjV7kf5VuIh77ZWMp3+IjXxLg==
X-Received: by 2002:ac2:4d8e:: with SMTP id g14mr3647566lfe.386.1601584420568;
        Thu, 01 Oct 2020 13:33:40 -0700 (PDT)
Received: from [192.168.2.145] ([109.252.91.252])
        by smtp.googlemail.com with ESMTPSA id a12sm551799ljk.109.2020.10.01.13.33.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Oct 2020 13:33:39 -0700 (PDT)
Subject: Re: [PATCH v3 2/3] iommu/tegra-smmu: Rework .probe_device and
 .attach_dev
To:     Nicolin Chen <nicoleotsuka@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>
Cc:     joro@8bytes.org, krzk@kernel.org, vdumpa@nvidia.com,
        jonathanh@nvidia.com, linux-tegra@vger.kernel.org,
        iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org
References: <20200930084258.25493-3-nicoleotsuka@gmail.com>
 <20200930153131.GB3833404@ulmo> <20200930203618.GC2110@Asurada-Nvidia>
 <13746922-0253-cda7-e9ac-2bd20bf1a17f@gmail.com>
 <20200930213244.GA10573@Asurada-Nvidia>
 <5945a63e-79d8-e3ae-ab53-cee8c220ac7d@gmail.com>
 <20201001012630.GA28240@Asurada-Nvidia>
 <72b11925-5857-8ce5-d084-cab01ca1b396@gmail.com>
 <20201001024850.GA28456@Asurada-Nvidia> <20201001102316.GF3919720@ulmo>
 <20201001110425.GB1272@Asurada>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <b966844e-4289-3ff0-9512-852f8419a664@gmail.com>
Date:   Thu, 1 Oct 2020 23:33:38 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201001110425.GB1272@Asurada>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

01.10.2020 14:04, Nicolin Chen пишет:
> On Thu, Oct 01, 2020 at 12:23:16PM +0200, Thierry Reding wrote:
>  > > >>>>>> It looks to me like the only reason why you need this new global API is
>>>>>>>>>> because PCI devices may not have a device tree node with a phandle to
>>>>>>>>>> the IOMMU. However, SMMU support for PCI will only be enabled if the
>>>>>>>>>> root complex has an iommus property, right? In that case, can't we
>>>>>>>>>> simply do something like this:
>>>>>>>>>>
>>>>>>>>>> 	if (dev_is_pci(dev))
>>>>>>>>>> 		np = find_host_bridge(dev)->of_node;
>>>>>>>>>> 	else
>>>>>>>>>> 		np = dev->of_node;
> 
>>> I personally am not a fan of adding a path for PCI device either,
>>> since PCI/IOMMU cores could have taken care of it while the same
>>> path can't be used for other buses.
>>
>> There's already plenty of other drivers that do something similar to
>> this. Take a look at the arm-smmu driver, for example, which seems to be
>> doing exactly the same thing to finding the right device tree node to
>> look at (see dev_get_dev_node() in drivers/iommu/arm-smmu/arm-smmu.c).
> 
> Hmm..okay..that is quite convincing then...

Not very convincing to me. I don't see a "plenty of other drivers",
there is only one arm-smmu driver.

The dev_get_dev_node() is under CONFIG_ARM_SMMU_LEGACY_DT_BINDINGS (!).
Guys, doesn't it look strange to you? :)

The arm-smmu driver does a similar thing for the modern bindings to what
Nicolin's v3 is doing.

>>> If we can't come to an agreement on globalizing mc pointer, would
>>> it be possible to pass tegra_mc_driver through tegra_smmu_probe()
>>> so we can continue to use driver_find_device_by_fwnode() as v1?
>>>
>>> v1: https://lkml.org/lkml/2020/9/26/68
>>
>> tegra_smmu_probe() already takes a struct tegra_mc *. Did you mean
>> tegra_smmu_probe_device()? I don't think we can do that because it isn't
> 
> I was saying to have a global parent_driver pointer: similar to
> my v1, yet rather than "extern" the tegra_mc_driver, we pass it
> through egra_smmu_probe() and store it in a static global value
> so as to call tegra_smmu_get_by_fwnode() in ->probe_device().
> 
> Though I agree that creating a global device pointer (mc) might
> be controversial, yet having a global parent_driver pointer may
> not be against the rule, considering that it is common in iommu
> drivers to call driver_find_device_by_fwnode in probe_device().

You don't need the global pointer if you have SMMU OF node.

You could also get driver pointer from mc->dev->driver.

But I don't think you need to do this at all. The probe_device() could
be invoked only for the tegra_smmu_ops and then seems you could use
dev_iommu_priv_set() in tegra_smmu_of_xlate(), like sun50i-iommu driver
does.
