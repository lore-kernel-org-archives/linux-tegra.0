Return-Path: <SRS0=pDv3=DK=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83729C46466
	for <linux-tegra@archiver.kernel.org>; Sat,  3 Oct 2020 04:01:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2F9DA206C3
	for <linux-tegra@archiver.kernel.org>; Sat,  3 Oct 2020 04:01:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mdIKAi0j"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725681AbgJCEBO (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sat, 3 Oct 2020 00:01:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38752 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725648AbgJCEBO (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Sat, 3 Oct 2020 00:01:14 -0400
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com [IPv6:2a00:1450:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AAA7FC0613D0;
        Fri,  2 Oct 2020 21:01:13 -0700 (PDT)
Received: by mail-lf1-x144.google.com with SMTP id w11so4320398lfn.2;
        Fri, 02 Oct 2020 21:01:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=4/c66VVNK2fZAJCWWd//XYQrFuPfF7bPZFCOGDskZLA=;
        b=mdIKAi0jBk+gBPjsj69jEhbol1cZXK/qBB9/Mkh/UZktLcstFuefS7b3t0MJMDQkas
         e/1w4tha2Rra5oZOH36cSyeXPhb36mRvl0IyDsAQ2QAn0/uAnoWS3t21hIMCkzrNye90
         hxaRmEStuKQ6mDDC5sVxD9cmibghrb3++rfCXJJQdFxrSAC+AFj6fExIO9Bqj7YANeJV
         fwGMtYq2dQMsPe3kEsXvV+HCIl/LRZHsZG88kEkA7Bp+9IgzMRSBeczJ/ivsBvkchVKS
         2ZvH8NGOElXhx1BbOA1qfenw7i4Zv8jvr5X5EGW7iZhZHopYjhsCwiZH/GtV9kIpS+u6
         me+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=4/c66VVNK2fZAJCWWd//XYQrFuPfF7bPZFCOGDskZLA=;
        b=SQfQfqESU6djRDHNvUhXSQ7gK0gxL3Hpm9bS7axSsGXeSWalNcodG2KcQC9pd0BbYP
         sgEeuDVtvSwEjYayaoivFjHGHCmsYZ7bERP3jbkSdx+gZytpifGvhnwwoYh+eDa3zAya
         t5vTQiC7Y7Iug6a+n13e/jUGyLy1NkWYI5Wi5RQv4MuzoDlc8edKIyiugEA42wucSgUa
         HgnsuWPA7hEQ09+BIUhuprB4YNogQzjEYzjmJcpr4mmiGXUGlzBoo4B5fOV+8WB6P1rr
         sypWh2tQtdy818tXL3N92BeF9pmXQL1rXvAfttktEBuOrkEiCsuL/sqOkOFtwLaGSorO
         qdbw==
X-Gm-Message-State: AOAM530tAXMSAznldrFK/JoQbQvu/Ni0Uuh6EmRfAY+x4GyQRjO/vQZi
        pj8k9+MB0smjMWZ9fhINiUC98r8qEx0=
X-Google-Smtp-Source: ABdhPJwqYUrBcIBR4L7qcbGhQA2/6ZFGelci0lcwwEoGBABBT77tRyIGIvMAojDM1i9m1c8LkS/juA==
X-Received: by 2002:a19:549:: with SMTP id 70mr2110110lff.529.1601697671885;
        Fri, 02 Oct 2020 21:01:11 -0700 (PDT)
Received: from [192.168.2.145] ([109.252.91.252])
        by smtp.googlemail.com with ESMTPSA id y10sm996183lfj.271.2020.10.02.21.01.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Oct 2020 21:01:11 -0700 (PDT)
Subject: Re: [PATCH v4 1/3] iommu/tegra-smmu: Use fwspec in
 tegra_smmu_(de)attach_dev
To:     Nicolin Chen <nicoleotsuka@gmail.com>
Cc:     thierry.reding@gmail.com, joro@8bytes.org, vdumpa@nvidia.com,
        jonathanh@nvidia.com, linux-tegra@vger.kernel.org,
        iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org
References: <20201002060807.32138-1-nicoleotsuka@gmail.com>
 <20201002060807.32138-2-nicoleotsuka@gmail.com>
 <de0b717f-af5c-8813-eb3e-07d19eff5271@gmail.com>
 <20201002194508.GD29706@Asurada-Nvidia>
 <e594374b-d701-fb6f-93f2-4efb9c5eb608@gmail.com>
 <20201002235329.GA11409@Asurada-Nvidia>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <f61174fc-f8e2-5f2b-23ff-36642be62e87@gmail.com>
Date:   Sat, 3 Oct 2020 07:01:09 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201002235329.GA11409@Asurada-Nvidia>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

03.10.2020 02:53, Nicolin Chen пишет:
> On Fri, Oct 02, 2020 at 11:12:18PM +0300, Dmitry Osipenko wrote:
>> 02.10.2020 22:45, Nicolin Chen пишет:
>>> On Fri, Oct 02, 2020 at 05:41:50PM +0300, Dmitry Osipenko wrote:
>>>> 02.10.2020 09:08, Nicolin Chen пишет:
>>>>>  static int tegra_smmu_attach_dev(struct iommu_domain *domain,
>>>>>  				 struct device *dev)
>>>>>  {
>>>>> +	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
>>>>>  	struct tegra_smmu *smmu = dev_iommu_priv_get(dev);
>>>>>  	struct tegra_smmu_as *as = to_smmu_as(domain);
>>>>> -	struct device_node *np = dev->of_node;
>>>>> -	struct of_phandle_args args;
>>>>>  	unsigned int index = 0;
>>>>>  	int err = 0;
>>>>>  
>>>>> -	while (!of_parse_phandle_with_args(np, "iommus", "#iommu-cells", index,
>>>>> -					   &args)) {
>>>>> -		unsigned int swgroup = args.args[0];
>>>>> -
>>>>> -		if (args.np != smmu->dev->of_node) {
>>>>> -			of_node_put(args.np);
>>>>> -			continue;
>>>>> -		}
>>>>> -
>>>>> -		of_node_put(args.np);
>>>>> +	if (!fwspec)
>>>>> +		return -ENOENT;
>>>>
>>>> Could the !fwspec ever be true here as well?
>>>
>>> There are multiple callers of this function. It's really not that
>>> straightforward to track every one of them. So I'd rather have it
>>> here as other iommu drivers do. We are human beings, so we could
>>> have missed something somewhere, especially callers are not from
>>> tegra-* drivers.
>>>
>>
>> I'm looking at the IOMMU core and it requires device to be in IOMMU
>> group before attach_dev() could be called.
>>
>> The group can't be assigned to device without the fwspec, see
>> tegra_smmu_device_group().
>>
>> Seems majority of IOMMU drivers are checking dev_iommu_priv_get() for
>> NULL in attach_dev(), some not checking anything, some check both and
>> only arm-smmu checks the fwspec.
> 
> As I said a couple of days ago, I don't like to assume that the
> callers won't change. And this time, it's from open code. So I
> don't want to assume that there won't be a change.
> 
> If you are confident that there is no need to add such a check,
> please send patches to remove those checks in those drivers to
> see if others would agree. I would be willing to remove it after
> that. Otherwise, I'd like to keep this.
> 
> Thanks for the review.
> 

I haven't tried to check every code path very thoroughly, expecting you
to do it since you're making this patch. Maybe there is a real reason
why majority of drivers do the checks and it would be good to know why.
Although, it's not critical in this particular case and indeed the
checks could be improved later on.

It looks to me that at least will be a bit better/cleaner to check the
dev_iommu_priv_get() for NULL instead of fwspec because the private
variable depends on the fwspec presence and there is a similar check in
probe_device, hence checks will be more consistent.

