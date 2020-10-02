Return-Path: <SRS0=6fDB=DJ=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 700E8C4363D
	for <linux-tegra@archiver.kernel.org>; Fri,  2 Oct 2020 18:20:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 28D2520795
	for <linux-tegra@archiver.kernel.org>; Fri,  2 Oct 2020 18:20:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TsanysFF"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726215AbgJBSUs (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 2 Oct 2020 14:20:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34156 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725991AbgJBSUr (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Fri, 2 Oct 2020 14:20:47 -0400
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com [IPv6:2a00:1450:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56690C0613D0;
        Fri,  2 Oct 2020 11:20:47 -0700 (PDT)
Received: by mail-lf1-x143.google.com with SMTP id w11so2998421lfn.2;
        Fri, 02 Oct 2020 11:20:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=EJ8SUAQ3Ep8nykC7R4KdWG2ClAiUfrI8OV4YNM+FLtM=;
        b=TsanysFFkQ79U4TBm6nvg9Yo+quujpAx660+ZpuraPKrgpIpPOyjFfDJYatKidtSoB
         dObEpNaYrDN0/JvPfI4hT9ygTLkeq0Xt28Z7neft0jvPXt4jRYOqCabWnxneXblCUYdL
         bTG3UveiRP4GQAtl3x8rQL1/ckevLNq6JTsPT7PVNElPFZbQyzrDlCwxabW9Jm/2P0Sa
         MUKfA//i4fYSG6+MAS4MIxmtqMG1EB+pv+GtIC9wbeXwwQ8jZa2ujDI5QlKAdZdtgunB
         MM8G9hZzlZQ7vX9O5yaciiMf1MXshw2Uq7YpTOKIbvDIgfLRiI1oh6+VzObvARlx6Lbo
         KjNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=EJ8SUAQ3Ep8nykC7R4KdWG2ClAiUfrI8OV4YNM+FLtM=;
        b=E6NXBHHpI+BK4xNVSDsOi5gFtTfFXGWiVMi/hU/ugdgmE9NDKC+B1/TWurm6AlV9XA
         t3vkcMQDKwZB8usw2TM6Kx2hQs5SlVHMZGtPDFA/gF5k+Lf2INmWP5dFVcyPrDaKCz0i
         KOPmkRmESOoBrt0XSQ1Q8VzIEQo7km2vRoIb/GoFn+EOVRoQ3Znsf7l8tYMXdZdeyC5O
         1pAtfUyFR/fbQcIINMkuzxCBk6csXyB3SrYd7bkh/0OZijAulHMul8+OW74uUdIkN7E4
         FgbW0ZznRWim7YNlRaNvW3SxwK2ZfHM/RoU12BcOs0aEM7vbomqqbuNHin7r93VYHXap
         DRMQ==
X-Gm-Message-State: AOAM532FMSVdKWJs1T13JIBT7sAjwaiFSdzx7MMhNC5/pW9WIK8soSlW
        JyESMyCeRJdnx6RBgrQlQuWj1QdUnEY=
X-Google-Smtp-Source: ABdhPJxvQFlVxqSll8ZIGtobg/4XNVi83XCZGq9LKA9AmED3IrYKz0bS/913AI7QKU97HsYs7XJhRw==
X-Received: by 2002:a19:7604:: with SMTP id c4mr1441873lff.132.1601662845192;
        Fri, 02 Oct 2020 11:20:45 -0700 (PDT)
Received: from [192.168.2.145] (109-252-91-252.nat.spd-mgts.ru. [109.252.91.252])
        by smtp.googlemail.com with ESMTPSA id b197sm471451lfd.251.2020.10.02.11.20.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Oct 2020 11:20:43 -0700 (PDT)
Subject: Re: [PATCH v4 2/3] iommu/tegra-smmu: Rework tegra_smmu_probe_device()
To:     Nicolin Chen <nicoleotsuka@gmail.com>
Cc:     thierry.reding@gmail.com, joro@8bytes.org, vdumpa@nvidia.com,
        jonathanh@nvidia.com, linux-tegra@vger.kernel.org,
        iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org
References: <20201002060807.32138-1-nicoleotsuka@gmail.com>
 <20201002060807.32138-3-nicoleotsuka@gmail.com>
 <070a13b2-cde2-ab9e-7ee0-8fb71fb64d5d@gmail.com>
 <20201002180120.GB29706@Asurada-Nvidia>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <11aae4e2-6173-bf83-5970-a03f09e31c47@gmail.com>
Date:   Fri, 2 Oct 2020 21:20:43 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201002180120.GB29706@Asurada-Nvidia>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

02.10.2020 21:01, Nicolin Chen пишет:
> On Fri, Oct 02, 2020 at 05:23:14PM +0300, Dmitry Osipenko wrote:
>> 02.10.2020 09:08, Nicolin Chen пишет:
>>>  static struct iommu_device *tegra_smmu_probe_device(struct device *dev)
>>>  {
>>> -	struct device_node *np = dev->of_node;
>>> -	struct tegra_smmu *smmu = NULL;
>>> -	struct of_phandle_args args;
>>> -	unsigned int index = 0;
>>> -	int err;
>>> -
>>> -	while (of_parse_phandle_with_args(np, "iommus", "#iommu-cells", index,
>>> -					  &args) == 0) {
>>> -		smmu = tegra_smmu_find(args.np);
>>> -		if (smmu) {
>>> -			err = tegra_smmu_configure(smmu, dev, &args);
>>> -			of_node_put(args.np);
>>> -
>>> -			if (err < 0)
>>> -				return ERR_PTR(err);
>>> -
>>> -			/*
>>> -			 * Only a single IOMMU master interface is currently
>>> -			 * supported by the Linux kernel, so abort after the
>>> -			 * first match.
>>> -			 */
>>> -			dev_iommu_priv_set(dev, smmu);
>>> -
>>> -			break;
>>> -		}
>>> -
>>> -		of_node_put(args.np);
>>> -		index++;
>>> -	}
>>> +	struct tegra_smmu *smmu = dev_iommu_priv_get(dev);
>>>  
>>>  	if (!smmu)
>>>  		return ERR_PTR(-ENODEV);
>>
>> The !smmu can't ever be true now, isn't it? Then please remove it.
> 
> How can you be so sure? Have you read my commit message? The whole
> point of removing the hack in tegra_smmu_probe() is to return the
> ERR_PTR(-ENODEV) here. The bus_set_iommu() will call this function
> when mc->smmu is not assigned it, as it's assigned after we return
> tegra_smmu_probe() while bus_set_iommu() is still in the middle of
> the tegra_smmu_probe().
> 

My bad, I probably missed that was looking at the probe_device(), looks
good then.
