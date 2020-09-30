Return-Path: <SRS0=fCh6=DH=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53DFFC4727C
	for <linux-tegra@archiver.kernel.org>; Wed, 30 Sep 2020 16:25:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 071DB20674
	for <linux-tegra@archiver.kernel.org>; Wed, 30 Sep 2020 16:25:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T+KQ1Wug"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725860AbgI3QZp (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 30 Sep 2020 12:25:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51114 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725355AbgI3QZp (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 30 Sep 2020 12:25:45 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4AEEC061755;
        Wed, 30 Sep 2020 09:25:44 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id c2so2108720ljj.12;
        Wed, 30 Sep 2020 09:25:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=eyUZYRPbpEe8Xucnlf6VT0i7AdXH7hbbrA44nxtiGcs=;
        b=T+KQ1WugVPRaX8Oz2opiwH3BBdNvtzqut2uC9HwY8ZKQH/OmXc2yqrDJ4mB3coJAur
         NYbu4kQe85gxMWot76j1r6+IjNXXUylNt0TuJJWVTrO2yNDkFE7HmU+Y22Uw72axKXEx
         xS59j2a+4HCVNkrGQugCvUV3WQmasSY8kUCskOBGhvtz8893s9eHZtjtWUipzQ02+VF8
         V5m4WVZR3DybUuEwvmHnbCQyy3OelFRNwnfZKCa5Ve2Y4/jfrOAxtYQ5MyhxJRoTsudS
         h3Tl3lEzQaPCqSm6fiz8mLDFejnCcoYVmO3RRyvLmajHEMAxBaSS1rUBxZZZFQFnfgsM
         VXyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=eyUZYRPbpEe8Xucnlf6VT0i7AdXH7hbbrA44nxtiGcs=;
        b=qBd1t95gFy8USOuoiwhRBiYAo+uXl70TCjRFaMn0KfX/ZH02Nf7pSD0zh9J8avBVIm
         FQD2Zsu2JYwinhdFIAjp36J+yLfTiJBmphezC9eU8OZ0pxIUiRS8TAT0iPBXJ9EFsjgb
         yozy2+3VI169b+o6CBw48CMIBd/2H7Pe+ij5lGUF5/jtvV8FBke3pRrnVIA7s3eCYxhz
         1KWZVw5bE9tO7UMz/3E8tIWLTGSGNXFeoXYGMPFVzvHCHwiNAWaEw47xapSAM5sdKZs6
         rnPzNacZcHAraJolVfQGUrYYveZLJ1nXYW/IKfTS3S+BtQMIRKoMwwicNOII61BNUJj2
         Xo3w==
X-Gm-Message-State: AOAM530j/dvgJSvnRaS9hbDKvZxi6Ec2BfKRhkUMBmEy6Wlj6qXZoWHa
        Rx1iPISoS56IB14VLyfDhalnISkZRQY=
X-Google-Smtp-Source: ABdhPJzISBhhY0DYwhpMSG3iAvAG8GJXBj4u1poszj5WLUWEX2TwbwUe1hDFPGPXltlCSMgrEb76BQ==
X-Received: by 2002:a2e:b5d9:: with SMTP id g25mr1015028ljn.335.1601483143047;
        Wed, 30 Sep 2020 09:25:43 -0700 (PDT)
Received: from [192.168.2.145] (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.googlemail.com with ESMTPSA id l3sm243635lfc.34.2020.09.30.09.25.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Sep 2020 09:25:42 -0700 (PDT)
Subject: Re: [PATCH v3 2/3] iommu/tegra-smmu: Rework .probe_device and
 .attach_dev
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Nicolin Chen <nicoleotsuka@gmail.com>, joro@8bytes.org,
        krzk@kernel.org, vdumpa@nvidia.com, jonathanh@nvidia.com,
        linux-tegra@vger.kernel.org, iommu@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org
References: <20200930084258.25493-1-nicoleotsuka@gmail.com>
 <20200930084258.25493-3-nicoleotsuka@gmail.com>
 <20200930153131.GB3833404@ulmo>
 <ece615ad-8d6b-96ae-d8b4-9667aef17281@gmail.com>
 <20200930160626.GD3833404@ulmo>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <f11d7d8a-8ce6-a53c-6219-ceec05432002@gmail.com>
Date:   Wed, 30 Sep 2020 19:25:41 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200930160626.GD3833404@ulmo>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

30.09.2020 19:06, Thierry Reding пишет:
> On Wed, Sep 30, 2020 at 06:36:52PM +0300, Dmitry Osipenko wrote:
>>  I'...
>>>> +	struct tegra_mc *mc = devm_tegra_get_memory_controller(dev);
>>>> +	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
>>>
>>> It looks to me like the only reason why you need this new global API is
>>> because PCI devices may not have a device tree node with a phandle to
>>> the IOMMU. However, SMMU support for PCI will only be enabled if the
>>> root complex has an iommus property, right? In that case, can't we
>>> simply do something like this:
>>>
>>> 	if (dev_is_pci(dev))
>>> 		np = find_host_bridge(dev)->of_node;
>>> 	else
>>> 		np = dev->of_node;
>>>
>>> ? I'm not sure exactly what find_host_bridge() is called, but I'm pretty
>>> sure that exists.
>>>
>>> Once we have that we can still iterate over the iommus property and do
>>> not need to rely on this global variable.
>>
>> This sounds more complicated than the current variant.
>>
>> Secondly, I'm already about to use the new tegra_get_memory_controller()
>> API for all the T20/30/124/210 EMC and devfreq drivers.
> 
> Why do we need it there? They seem to work fine without it right now.

All the Tegra30/124/210 EMC drivers are already duplicating that MC
lookup code and only the recent T210 driver does it properly.

> If it is required for new functionality, we can always make the dependent
> on a DT reference via phandle without breaking any existing code.

That's correct, it will be also needed for the new functionality as
well, hence even more drivers will need to perform the MC lookup.

I don't quite understand why you're asking for the phandle reference,
it's absolutely not needed for the MC lookup and won't work for the
older DTs if DT change will be needed. Please give a detailed explanation.
