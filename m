Return-Path: <SRS0=6fDB=DJ=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79BD7C4727E
	for <linux-tegra@archiver.kernel.org>; Fri,  2 Oct 2020 01:55:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 35F84206FA
	for <linux-tegra@archiver.kernel.org>; Fri,  2 Oct 2020 01:55:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LdI/iOqz"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733275AbgJBBzj (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 1 Oct 2020 21:55:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51920 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727780AbgJBBzi (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 1 Oct 2020 21:55:38 -0400
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com [IPv6:2a00:1450:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 54A2EC0613D0;
        Thu,  1 Oct 2020 18:55:38 -0700 (PDT)
Received: by mail-lf1-x143.google.com with SMTP id m5so969803lfp.7;
        Thu, 01 Oct 2020 18:55:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=d/jfnZjmPSZbXLzxLJUrhHvktSEChDG0ruelVh2We8c=;
        b=LdI/iOqzsh13yR+VtuzO5yEQdwQy024GjCcCbyf+w2DbfWV7HQ+NR8DVHD23jb4u7x
         9aPYdNB0OzUjhYJHpUTiHpZaY0w2JyH8B7vu/CdpuGunG6i1bET8xz4DekLksx3I+2xJ
         55RTXzVIYJDwfSPL9+TpkRhXvnxlRHSWuoN+lM/0o/f8VqpT53dNetC4KMIwyk7ErCQz
         t/NMlDDH2MrTBCijVpD6LQZM1A/pii8sAwK3tALZ008ZeQck9ilF0f292vq0UNmHqsxy
         BB/GiJlHA7Bafhs5aUdiPGF62skA84mp6hlmfTViyM7MPTCbWl2jeMMFvNew1HXDynFZ
         D6hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=d/jfnZjmPSZbXLzxLJUrhHvktSEChDG0ruelVh2We8c=;
        b=TH0eTEIilIz1YPHse4jxgATAGXs2yXqjXNb9IsuOhPeTNjx8Qs+rxZB6EbFruNncUh
         UM0A87O8yXqf4G4bbkBCuMgvh2DeDS1TrEm9RHN7j9/Sa57B4QwnNLFLdvQnW5vLz+gO
         H+fQagQzMwsHrHdkqXSzxpRMNQRquXxT1fDPe8Xu7nS4vpArj3NhHdBWCjWxbqABe7UU
         Gg3lqIWHwUibveqw+IKp9Aix8O6oRkhTR90SPEYZyJKgoZRV7/lmTXIRYibhWW2s335R
         h4UtY0zoXh2EYpQ+BVCfw90VKvL3tF/ImgEOt4ReLGGOZQEWhjQscj+G1PmB/ozQrhbV
         3w0A==
X-Gm-Message-State: AOAM532MxbVTkByfdwjTIzhU9oVwi5+QzB2gyfkfMxTfj49Yo/K5Y7bH
        F9Db//QM6A3b+PtvaxTNrRQ63PZC99A=
X-Google-Smtp-Source: ABdhPJxfEc+BUt81l+JJuVcWI5Lb0o0GFy5kc1x+mWl7WPZIkagzwp+mAGXufL5S8bLXzD9Sn03dzw==
X-Received: by 2002:a19:52:: with SMTP id 79mr979lfa.222.1601603736179;
        Thu, 01 Oct 2020 18:55:36 -0700 (PDT)
Received: from [192.168.2.145] (109-252-91-252.nat.spd-mgts.ru. [109.252.91.252])
        by smtp.googlemail.com with ESMTPSA id j7sm7661lfb.41.2020.10.01.18.55.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Oct 2020 18:55:35 -0700 (PDT)
Subject: Re: [PATCH v3 2/3] iommu/tegra-smmu: Rework .probe_device and
 .attach_dev
To:     Nicolin Chen <nicoleotsuka@gmail.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>, joro@8bytes.org,
        krzk@kernel.org, vdumpa@nvidia.com, jonathanh@nvidia.com,
        linux-tegra@vger.kernel.org, iommu@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org
References: <20200930203618.GC2110@Asurada-Nvidia>
 <13746922-0253-cda7-e9ac-2bd20bf1a17f@gmail.com>
 <20200930213244.GA10573@Asurada-Nvidia>
 <5945a63e-79d8-e3ae-ab53-cee8c220ac7d@gmail.com>
 <20201001012630.GA28240@Asurada-Nvidia>
 <72b11925-5857-8ce5-d084-cab01ca1b396@gmail.com>
 <20201001024850.GA28456@Asurada-Nvidia> <20201001102316.GF3919720@ulmo>
 <20201001110425.GB1272@Asurada>
 <b966844e-4289-3ff0-9512-852f8419a664@gmail.com>
 <20201002010751.GA26971@Asurada-Nvidia>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <1b621b9d-cdc3-c7aa-2fa2-d728ae2bbc5d@gmail.com>
Date:   Fri, 2 Oct 2020 04:55:34 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201002010751.GA26971@Asurada-Nvidia>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

02.10.2020 04:07, Nicolin Chen пишет:
> On Thu, Oct 01, 2020 at 11:33:38PM +0300, Dmitry Osipenko wrote:
>>>>> If we can't come to an agreement on globalizing mc pointer, would
>>>>> it be possible to pass tegra_mc_driver through tegra_smmu_probe()
>>>>> so we can continue to use driver_find_device_by_fwnode() as v1?
>>>>>
>>>>> v1: https://lkml.org/lkml/2020/9/26/68
>>>>
>>>> tegra_smmu_probe() already takes a struct tegra_mc *. Did you mean
>>>> tegra_smmu_probe_device()? I don't think we can do that because it isn't
>>>
>>> I was saying to have a global parent_driver pointer: similar to
>>> my v1, yet rather than "extern" the tegra_mc_driver, we pass it
>>> through egra_smmu_probe() and store it in a static global value
>>> so as to call tegra_smmu_get_by_fwnode() in ->probe_device().
>>>
>>> Though I agree that creating a global device pointer (mc) might
>>> be controversial, yet having a global parent_driver pointer may
>>> not be against the rule, considering that it is common in iommu
>>> drivers to call driver_find_device_by_fwnode in probe_device().
>>
>> You don't need the global pointer if you have SMMU OF node.
>>
>> You could also get driver pointer from mc->dev->driver.
>>
>> But I don't think you need to do this at all. The probe_device() could
>> be invoked only for the tegra_smmu_ops and then seems you could use
>> dev_iommu_priv_set() in tegra_smmu_of_xlate(), like sun50i-iommu driver
>> does.
> 
> Getting iommu device pointer using driver_find_device_by_fwnode()
> is a common practice in ->probe_device() of other iommu drivers.

Please give me a full list of the IOMMU drivers which use this method.

> But this requires a device_driver pointer that tegra-smmu doesn't
> have. So passing tegra_mc_driver through tegra_smmu_probe() will
> address it.
> 

If you're borrowing code and ideas from other drivers, then at least
please borrow them from a modern good-looking drivers. And I already
pointed out that following cargo cult is not always a good idea.

ARM-SMMU isn't a modern driver and it has legacy code. You shouldn't
copy it blindly. The sun50i-iommu driver was added half year ago, you
may use it as a reference.

Always consult the IOMMU core code. If you're too unsure about
something, then maybe better to start a new thread and ask Joerg about
the best modern practices that IOMMU drivers should use.
