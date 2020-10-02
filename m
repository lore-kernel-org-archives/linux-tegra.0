Return-Path: <SRS0=6fDB=DJ=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD671C4727D
	for <linux-tegra@archiver.kernel.org>; Fri,  2 Oct 2020 14:52:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9E7E720708
	for <linux-tegra@archiver.kernel.org>; Fri,  2 Oct 2020 14:52:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="p7HE9TVw"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388160AbgJBOwE (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 2 Oct 2020 10:52:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57982 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726386AbgJBOwE (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Fri, 2 Oct 2020 10:52:04 -0400
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AFEC3C0613D0;
        Fri,  2 Oct 2020 07:52:03 -0700 (PDT)
Received: by mail-lf1-x142.google.com with SMTP id w11so2216463lfn.2;
        Fri, 02 Oct 2020 07:52:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=cFiu94si6MLOrMmlNSPY2MN6ADJKMSBfebqq1SCmYCM=;
        b=p7HE9TVwD2q0fm2z18cHPxGP+a8ISNnzlYr+yR/x090A/zGwcNY5ZW9flfsG16aj98
         BnTp1gR014Gb3zDdg0lieJgOQ5GA6woCADJrSFqeFRiiTd+i7YGkJQcHezPyfydDEPaA
         0kh8AsyND1uv/1Y/rmjqHprWiC7cZaKvfqdioxLeuvh+ZileKopxodwjucv1LCKxCkGc
         KzShaALH5U2KiCE3l6cItae2tqBt5q+rdmtOpoEbsYG3cOOy5Qj1oX9gvJ+6a6ZrNocp
         /ooo9OVwoK59vZQgoDnRD8TRWjOy/yhnbMGZCgZJiRD0g5vLLKXYBs2vNwjo2ipWjWcO
         lghQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=cFiu94si6MLOrMmlNSPY2MN6ADJKMSBfebqq1SCmYCM=;
        b=OWZ0+60kqjCsjrsE8VPzkOJBt1A/GxQ+Kmbp+ftDeTpLuvuty2UYuMVr55ssBdXT4b
         55PDWre1ANcSSCYpHfYpys8NXBnSPNy8XEfFtLIOnMVIKMv2yIh3cekyWgv4pyXdH3+P
         RAbLYAroa2oZ/hZZlZPNDOjuki4leDa9fPEM8/72GFxfB1zuDfbhxQeg2CUKnWo8f3wq
         ayZP0f0ifsx71cO+s4WUBBf+dXBsVQJ1C+VP0knV4Tu7cZwJnLc/ynH/hryxnYNwk2vD
         ZosAfOTSNquQcBzabDLOw/TdhXDGlK71HFP4FPQ3pvXXeBuiVeu3eetM73GAySqGjxdH
         4OvQ==
X-Gm-Message-State: AOAM531jMaZIph0cl1uFZUxL+YsAdtlBw7lDjEpk88iO/BvqVUo1XKUW
        pgzTl1cehIq5yXHXYFBBrWO3p5M5CPo=
X-Google-Smtp-Source: ABdhPJx/9txQPQLd4WiPCXriCCAjKKTfo2dbLn4ocnWSslz5gzwVhdj4WmsQmM19m6/YSyg2AWu93Q==
X-Received: by 2002:a05:6512:3692:: with SMTP id d18mr937803lfs.62.1601650322015;
        Fri, 02 Oct 2020 07:52:02 -0700 (PDT)
Received: from [192.168.2.145] (109-252-91-252.nat.spd-mgts.ru. [109.252.91.252])
        by smtp.googlemail.com with ESMTPSA id m4sm256309ljb.58.2020.10.02.07.52.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Oct 2020 07:52:01 -0700 (PDT)
Subject: Re: [PATCH v4 1/3] iommu/tegra-smmu: Use fwspec in
 tegra_smmu_(de)attach_dev
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Nicolin Chen <nicoleotsuka@gmail.com>, thierry.reding@gmail.com,
        joro@8bytes.org
Cc:     vdumpa@nvidia.com, jonathanh@nvidia.com,
        linux-tegra@vger.kernel.org, iommu@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org
References: <20201002060807.32138-1-nicoleotsuka@gmail.com>
 <20201002060807.32138-2-nicoleotsuka@gmail.com>
 <75ad716f-aa2f-743a-7d9a-7083eda03672@gmail.com>
Message-ID: <cb90ebab-9800-c9b4-6fb7-3d53875195a0@gmail.com>
Date:   Fri, 2 Oct 2020 17:52:00 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <75ad716f-aa2f-743a-7d9a-7083eda03672@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

02.10.2020 17:22, Dmitry Osipenko пишет:
> 02.10.2020 09:08, Nicolin Chen пишет:
>>  static int tegra_smmu_attach_dev(struct iommu_domain *domain,
>>  				 struct device *dev)
>>  {
>> +	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
>>  	struct tegra_smmu *smmu = dev_iommu_priv_get(dev);
>>  	struct tegra_smmu_as *as = to_smmu_as(domain);
>> -	struct device_node *np = dev->of_node;
>> -	struct of_phandle_args args;
>>  	unsigned int index = 0;
>>  	int err = 0;
> 
> Looks like there is no need to initialize 'index' and 'err' variables
> anymore.
> 

Same for tegra_smmu_detach_dev().
