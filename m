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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A7A8C4363D
	for <linux-tegra@archiver.kernel.org>; Fri,  2 Oct 2020 20:12:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2076D206E3
	for <linux-tegra@archiver.kernel.org>; Fri,  2 Oct 2020 20:12:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="vGpoU4NR"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725446AbgJBUMX (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 2 Oct 2020 16:12:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51482 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725300AbgJBUMX (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Fri, 2 Oct 2020 16:12:23 -0400
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com [IPv6:2a00:1450:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E1E58C0613D0;
        Fri,  2 Oct 2020 13:12:21 -0700 (PDT)
Received: by mail-lf1-x144.google.com with SMTP id b22so3315481lfs.13;
        Fri, 02 Oct 2020 13:12:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=1+1gQ3KcXmka62+xebYBiNM/MDx9pvdpWff7sNy5Fn0=;
        b=vGpoU4NRCdk72NAV24Pu6YePTXcoDhSfkcOmKh6ZdPs3y8kqTUF4X0UXexlTSmV98E
         Jn/MZBJcnbQpPUCYx/3j6lnEgBx549dMp0OlTz5mbd/aGmOdLfNTT5FTQ9Bh0wCvJoXy
         PR72pZydGLdM6onTvd9po32qPZM+FVLu+IZ+99kvaww/G+PqaRFEFjil9DxM15z/OT/n
         C5zURxnhFNlsp1dLHn8dVM7iK1Fi9kgtrcLAJ010NJONyBnuF6C8uhUZaoiqppXB83ZU
         Wocxk1Fb5savcKXKb4OO8BOsqwzTp/UIB7Cbdfc/4gck4V4HtSsmTCA9C9+vPFbE6gIG
         ZP1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=1+1gQ3KcXmka62+xebYBiNM/MDx9pvdpWff7sNy5Fn0=;
        b=QHvj6RzZ3BPjsfrHxSXTA6hgyF7CZY5920jdI783our9jiW7pGXK+e31mgK2J2KJhr
         xt7C0RanwWVf8Ib2E+HKgHTsHhs/eAfnHltNn/ssJMkA0FV32bidE1WXkCOTXrz91vNM
         A/U+A2B4jF8Q991h2hxeU97uueANLxHEXzn1UDy75WYkpEAqzdQsJplht4IXwCLCGz0l
         rGnbWzBWrXczFDJCoicHsBUR56rq64dyeFmIGeizIVC2duQrJX293hw8c2Z7/bonQTCz
         7NJ3NBxvwMbrxgM6rC19qwR3lnOwHW4mUJqM6O0Glgz01ivzszfjWsO8b4rp4pgLnBWf
         pxsg==
X-Gm-Message-State: AOAM530hLutD6PeE1BFstv2ZvvAici96QoGirqtyUP5JORH1vvs7QFx6
        Y3FIhOdaAUMNF+0To3cOGkR63egg+68=
X-Google-Smtp-Source: ABdhPJxvlx9NjYQ+2mdUGD5xV9chLS4/3Zl7Mm/Nct2O+LnxQ65vq1HGbtARMbjWc56g3TgN6ieJDQ==
X-Received: by 2002:ac2:511c:: with SMTP id q28mr1342676lfb.411.1601669539800;
        Fri, 02 Oct 2020 13:12:19 -0700 (PDT)
Received: from [192.168.2.145] (109-252-91-252.nat.spd-mgts.ru. [109.252.91.252])
        by smtp.googlemail.com with ESMTPSA id w17sm571611lfn.55.2020.10.02.13.12.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Oct 2020 13:12:19 -0700 (PDT)
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
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <e594374b-d701-fb6f-93f2-4efb9c5eb608@gmail.com>
Date:   Fri, 2 Oct 2020 23:12:18 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201002194508.GD29706@Asurada-Nvidia>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

02.10.2020 22:45, Nicolin Chen пишет:
> On Fri, Oct 02, 2020 at 05:41:50PM +0300, Dmitry Osipenko wrote:
>> 02.10.2020 09:08, Nicolin Chen пишет:
>>>  static int tegra_smmu_attach_dev(struct iommu_domain *domain,
>>>  				 struct device *dev)
>>>  {
>>> +	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
>>>  	struct tegra_smmu *smmu = dev_iommu_priv_get(dev);
>>>  	struct tegra_smmu_as *as = to_smmu_as(domain);
>>> -	struct device_node *np = dev->of_node;
>>> -	struct of_phandle_args args;
>>>  	unsigned int index = 0;
>>>  	int err = 0;
>>>  
>>> -	while (!of_parse_phandle_with_args(np, "iommus", "#iommu-cells", index,
>>> -					   &args)) {
>>> -		unsigned int swgroup = args.args[0];
>>> -
>>> -		if (args.np != smmu->dev->of_node) {
>>> -			of_node_put(args.np);
>>> -			continue;
>>> -		}
>>> -
>>> -		of_node_put(args.np);
>>> +	if (!fwspec)
>>> +		return -ENOENT;
>>
>> Could the !fwspec ever be true here as well?
> 
> There are multiple callers of this function. It's really not that
> straightforward to track every one of them. So I'd rather have it
> here as other iommu drivers do. We are human beings, so we could
> have missed something somewhere, especially callers are not from
> tegra-* drivers.
> 

I'm looking at the IOMMU core and it requires device to be in IOMMU
group before attach_dev() could be called.

The group can't be assigned to device without the fwspec, see
tegra_smmu_device_group().

Seems majority of IOMMU drivers are checking dev_iommu_priv_get() for
NULL in attach_dev(), some not checking anything, some check both and
only arm-smmu checks the fwspec.
