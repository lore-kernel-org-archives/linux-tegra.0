Return-Path: <SRS0=kAmo=DM=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2900C4363A
	for <linux-tegra@archiver.kernel.org>; Mon,  5 Oct 2020 13:28:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6DFCD20756
	for <linux-tegra@archiver.kernel.org>; Mon,  5 Oct 2020 13:28:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XHwHZs6I"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726000AbgJEN25 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 5 Oct 2020 09:28:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58276 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725914AbgJEN24 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Mon, 5 Oct 2020 09:28:56 -0400
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D9C6C0613CE;
        Mon,  5 Oct 2020 06:28:56 -0700 (PDT)
Received: by mail-lf1-x142.google.com with SMTP id u8so10878664lff.1;
        Mon, 05 Oct 2020 06:28:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=pDfp+8jOaUeqI88f58G9d3pgrodgYrD29BLFi8aPWHs=;
        b=XHwHZs6I/CK3sd9jDKPmF1UqwJYJ53JBn2m9d89uwdZVrxeYSUI3vD9v3uiGWcVgkt
         RKn1CcbnELQ+4OV9z8d+pGkmSiC9QrGQrVfhjSloGJ30C6vd+dUjVO/GIpewsP6DGNsl
         3nbBPzeg37N3K/MoLJoHyTJ4JcND13yAFqvwPPqIdbNFKEzZ55mNQl2cOHQLjsF0ePK/
         OD7X3ca/9b0qE2AS2CYKlvLGNphlCTFilptvxGFYRnvAicaP56jSFGSZgOgX618WjQbp
         UmMqzFm2umphzrt7unSi5tv1Vqqv96QPiseiYX9RZOLrkOzIj+no+ELeZCSGlGd24KWv
         nGhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=pDfp+8jOaUeqI88f58G9d3pgrodgYrD29BLFi8aPWHs=;
        b=rPn1Ri2/O+FyIBrkCkI+ozK8yfa75fqx16JRRDq4j0rQeLkrd4uWBt3SAosaXTCXJ5
         DcDrVXsJeSY9fC4xmmfxD3iOReXl3v5jbvgCmJkMZJgT3YyHnjTteSfQ6ekdZZMFlAOF
         ATHA/ycGxoYuKigWVQTmIasKVSrQwwB3DC/lz2U/wyiRRgNXqqKhwxUjyRoC5rcF9PHO
         aeRy4MM7WPoPm23F7tt4g7kms1YhUgRO/4LPbqk7SpW5uq3ItPvyf6tGGy1mfi6glVt8
         YjRH9Copb8GmjYwH1sNeZ4R8dZvPALT0Mvxs/xHmRRG/pO/W0wI0FvjNRNrgMjzA0fhV
         HXHA==
X-Gm-Message-State: AOAM530Ulpo7YWZkatQtheNk7JgWxQWWac9aZ1xyxPcds7d7z0TdBiuU
        7NxiVMrgH9LLNyPrAWB+p3+d3egvxjM=
X-Google-Smtp-Source: ABdhPJzYnCEZuOgmvTnVXNmuhQidi8+UND8HD9ZaURgVJOb85YF35KkKZhBGO5IvLcC/lQpRq4nEiA==
X-Received: by 2002:a19:b4b:: with SMTP id 72mr5295868lfl.590.1601904534662;
        Mon, 05 Oct 2020 06:28:54 -0700 (PDT)
Received: from [192.168.2.145] (109-252-91-252.nat.spd-mgts.ru. [109.252.91.252])
        by smtp.googlemail.com with ESMTPSA id b16sm2594099ljh.34.2020.10.05.06.28.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Oct 2020 06:28:54 -0700 (PDT)
Subject: Re: [PATCH v4 2/3] iommu/tegra-smmu: Rework tegra_smmu_probe_device()
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Nicolin Chen <nicoleotsuka@gmail.com>, joro@8bytes.org,
        vdumpa@nvidia.com, jonathanh@nvidia.com,
        linux-tegra@vger.kernel.org, iommu@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org
References: <20201002060807.32138-1-nicoleotsuka@gmail.com>
 <20201002060807.32138-3-nicoleotsuka@gmail.com>
 <b1a195cf-0127-0531-f6d1-835367511f57@gmail.com>
 <0c66bab9-0132-d3fb-ea4e-de1278cf2b04@gmail.com>
 <20201005095351.GI425362@ulmo>
 <ae48aaaf-fe10-6de4-06bb-2afbde799168@gmail.com>
 <20201005111547.GQ425362@ulmo>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <39cb0056-1447-2232-d33c-adb17114740a@gmail.com>
Date:   Mon, 5 Oct 2020 16:28:53 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201005111547.GQ425362@ulmo>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

05.10.2020 14:15, Thierry Reding пишет:
> On Mon, Oct 05, 2020 at 01:36:55PM +0300, Dmitry Osipenko wrote:
>> 05.10.2020 12:53, Thierry Reding пишет:
>>> On Fri, Oct 02, 2020 at 05:50:08PM +0300, Dmitry Osipenko wrote:
>>>> 02.10.2020 17:22, Dmitry Osipenko пишет:
>>>>>>  static int tegra_smmu_of_xlate(struct device *dev,
>>>>>>  			       struct of_phandle_args *args)
>>>>>>  {
>>>>>> +	struct platform_device *iommu_pdev = of_find_device_by_node(args->np);
>>>>>> +	struct tegra_mc *mc = platform_get_drvdata(iommu_pdev);
>>>>>>  	u32 id = args->args[0];
>>>>>>  
>>>>>> +	of_node_put(args->np);
>>>>>> +
>>>>>> +	if (!mc || !mc->smmu)
>>>>>> +		return -EPROBE_DEFER;
>>>>> platform_get_drvdata(NULL) will crash.
>>>>>
>>>>
>>>> Actually, platform_get_drvdata(NULL) can't happen. I overlooked this.
>>>
>>> How so? It's technically possible for the iommus property to reference a
>>> device tree node for which no platform device will ever be created, in
>>> which case of_find_device_by_node() will return NULL. That's very
>>> unlikely and perhaps worth just crashing on to make sure it gets fixed
>>> immediately.
>>
>> The tegra_smmu_ops are registered from the SMMU driver itself and MC
>> driver sets platform data before SMMU is initialized, hence device is
>> guaranteed to exist and mc can't be NULL.
> 
> Yes, but that assumes that args->np points to the memory controller's
> device tree node. It's obviously a mistake to do this, but I don't think
> anyone will prevent you from doing this:
> 
> 	iommus = <&{/chosen} 0>;
> 
> In that case, since no platform device is created for the /chosen node,
> iommu_pdev will end up being NULL and platform_get_drvdata() will crash.

But then Tegra SMMU isn't associated with the device's IOMMU path, and
thus, tegra_smmu_of_xlate() won't be invoked for this device.

> That said, I'm fine with not adding a check for that. If anyone really
> does end up messing this up they deserve the crash.
> 
> I'm still a bit undecided about the mc->smmu check because I haven't
> convinced myself yet that it can't happen.

For now I can't see any realistic situation where mc->smmu could be NULL.
