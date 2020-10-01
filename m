Return-Path: <SRS0=WsFM=DI=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 098F4C4727E
	for <linux-tegra@archiver.kernel.org>; Thu,  1 Oct 2020 04:05:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B93E721D7D
	for <linux-tegra@archiver.kernel.org>; Thu,  1 Oct 2020 04:05:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M5xaEfBc"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725806AbgJAEFF (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 1 Oct 2020 00:05:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46418 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725800AbgJAEFF (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 1 Oct 2020 00:05:05 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40E8BC061755;
        Wed, 30 Sep 2020 21:05:03 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id w3so3418883ljo.5;
        Wed, 30 Sep 2020 21:05:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=4qFJEZiPLmg9u9W5QYna2OZEUfz9MtyCy7mA+ICTo1g=;
        b=M5xaEfBcC9EtbINBwGw4i/0+Nw+ePBsBY7HpPZsmhZQSsUpvgm99fltKKaQsxwhGgV
         sxXJ72bYTlARe2QzjDpqpeIMSt5urFVIG2fe5YgbevVNO+UWS/CQyEJSAo8rmkRCYnXQ
         pZf7Mued90MklbHxfRJRrhsD4oUcwu+dFTYs6UjD9YKvQyMb38MS+nFecxp2koU9OnwY
         boAg4blzbqNIHuF3P6ty2CMMKTNsE81P5UPei/P+eEAbWUz2viAjzGYPs0Cd+poFoaap
         ITUNvvhsozRcIw0szsVf9aCTbTqPRz90Fk858piggd396svSaN7eNc6vT3Tno73BQ8Hr
         aVGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=4qFJEZiPLmg9u9W5QYna2OZEUfz9MtyCy7mA+ICTo1g=;
        b=LBkkFtS5n5lHdZ4A5DVUP+u+R6EK+3Q+47OGmfnUiqQeb8JUdttDC3PjCw305uhWK4
         bPeqCOjypau1C01H/kTl4DeWHYTIvNoGiCSmqmt2oAphyTX7AgMilRw/jZ80zUYF1Rpm
         9E3e0nKcyIKW7WMNOYRuT3AYd/v1WnQPW5umgqaJ71WAFCkeYFIzdIocNNqB0XkpPZ2h
         /KL8oe+lgcMfB868TifhT9roVuoTnwYVekFhF8Xo8mLrsI0eUfp7i11HYU9lZfPDIjev
         X2MffUpeQhPwIndQbKrh21g5LwyRiCf80KpGS1TAv9GBD7VjY7xx+Mksi9cRRsSx4ytA
         3UcA==
X-Gm-Message-State: AOAM530pyqjTJI5ynjmxcN5Y0ebakIqghXBbuyl0QcsTULfXYDXE8L3Y
        fIqLNb9oK2chmff8CG0U1RXjh5yS7ro=
X-Google-Smtp-Source: ABdhPJzh3h0DBGaC15b1cZr0yr5GTomERNHhtpdt3BwUAiX93aUCGOZ9lOBNc2GdME4cqxx5xQSQEQ==
X-Received: by 2002:a2e:9588:: with SMTP id w8mr1544467ljh.298.1601525101140;
        Wed, 30 Sep 2020 21:05:01 -0700 (PDT)
Received: from [192.168.2.145] ([109.252.91.252])
        by smtp.googlemail.com with ESMTPSA id i7sm314259ljb.44.2020.09.30.21.04.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Sep 2020 21:05:00 -0700 (PDT)
Subject: Re: [PATCH v3 2/3] iommu/tegra-smmu: Rework .probe_device and
 .attach_dev
To:     Nicolin Chen <nicoleotsuka@gmail.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>, joro@8bytes.org,
        krzk@kernel.org, vdumpa@nvidia.com, jonathanh@nvidia.com,
        linux-tegra@vger.kernel.org, iommu@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org
References: <20200930084258.25493-1-nicoleotsuka@gmail.com>
 <20200930084258.25493-3-nicoleotsuka@gmail.com>
 <20200930153131.GB3833404@ulmo> <20200930203618.GC2110@Asurada-Nvidia>
 <13746922-0253-cda7-e9ac-2bd20bf1a17f@gmail.com>
 <20200930213244.GA10573@Asurada-Nvidia>
 <5945a63e-79d8-e3ae-ab53-cee8c220ac7d@gmail.com>
 <20201001012630.GA28240@Asurada-Nvidia>
 <72b11925-5857-8ce5-d084-cab01ca1b396@gmail.com>
 <20201001024850.GA28456@Asurada-Nvidia>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <aad6f530-6b62-b75d-44ad-0376650efc86@gmail.com>
Date:   Thu, 1 Oct 2020 07:04:59 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201001024850.GA28456@Asurada-Nvidia>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

01.10.2020 05:48, Nicolin Chen пишет:
> On Thu, Oct 01, 2020 at 05:06:19AM +0300, Dmitry Osipenko wrote:
>> 01.10.2020 04:26, Nicolin Chen пишет:
>>> On Thu, Oct 01, 2020 at 12:56:46AM +0300, Dmitry Osipenko wrote:
>>>> 01.10.2020 00:32, Nicolin Chen пишет:
>>>>> On Thu, Oct 01, 2020 at 12:24:25AM +0300, Dmitry Osipenko wrote:
>>>>>> ...
>>>>>>>> It looks to me like the only reason why you need this new global API is
>>>>>>>> because PCI devices may not have a device tree node with a phandle to
>>>>>>>> the IOMMU. However, SMMU support for PCI will only be enabled if the
>>>>>>>> root complex has an iommus property, right? In that case, can't we
>>>>>>>> simply do something like this:
>>>>>>>>
>>>>>>>> 	if (dev_is_pci(dev))
>>>>>>>> 		np = find_host_bridge(dev)->of_node;
>>>>>>>> 	else
>>>>>>>> 		np = dev->of_node;
>>>>>>>>
>>>>>>>> ? I'm not sure exactly what find_host_bridge() is called, but I'm pretty
>>>>>>>> sure that exists.
>>>>>>>>
>>>>>>>> Once we have that we can still iterate over the iommus property and do
>>>>>>>> not need to rely on this global variable.
>>>>>>>
>>>>>>> I agree that it'd work. But I was hoping to simplify the code
>>>>>>> here if it's possible. Looks like we have an argument on this
>>>>>>> so I will choose to go with your suggestion above for now.
>>>>>>
>>>>>> This patch removed more lines than were added. If this will be opposite
>>>>>> for the Thierry's suggestion, then it's probably not a great suggestion.
>>>>>
>>>>> Sorry, I don't quite understand this comments. Would you please
>>>>> elaborate what's this "it" being "not a great suggestion"?
>>>>>
>>>>
>>>> I meant that you should try to implement Thierry's solution, but if the
>>>> end result will be worse than the current patch, then you shouldn't make
>>>> a v4, but get back to this discussion in order to choose the best option
>>>> and make everyone agree on it.
>>>
>>> I see. Thanks for the reply. And here is a sample implementation:
>>
>> That's what I supposed to happen :) The new variant adds code and
>> complexity, while old did the opposite. Hence the old variant is clearly
>> more attractive, IMO.
> 
> I personally am not a fan of adding a path for PCI device either,
> since PCI/IOMMU cores could have taken care of it while the same
> path can't be used for other buses.
> 
> If we can't come to an agreement on globalizing mc pointer, would
> it be possible to pass tegra_mc_driver through tegra_smmu_probe()
> so we can continue to use driver_find_device_by_fwnode() as v1?
> 
> v1: https://lkml.org/lkml/2020/9/26/68
> 

I think we already agreed that it will be good to have a common helper.
So far Thierry only objected that the implementation of the helper could
be improved.
