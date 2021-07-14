Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64656C07E9A
	for <linux-tegra@archiver.kernel.org>; Wed, 14 Jul 2021 11:17:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4557D613B2
	for <linux-tegra@archiver.kernel.org>; Wed, 14 Jul 2021 11:17:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232161AbhGNLUo (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 14 Jul 2021 07:20:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45568 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230437AbhGNLUo (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 14 Jul 2021 07:20:44 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF7FAC06175F;
        Wed, 14 Jul 2021 04:17:52 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id t17so3054175lfq.0;
        Wed, 14 Jul 2021 04:17:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=S9CrgQqGn5mkur2H1auPSMo6yYyTfwNd3lzn8O6SIGw=;
        b=riPdNj4nnn9+vFqNzMZJogEZahBnodLVfG8St8ipsNT0UBjxKFX2vW3ci3rdWcmZ88
         VRiImWCPQK7fykq639PSAazmul6V971xU7kpsDGmx80lalx05Nz04pd90+wjhlejxlYe
         K8A89OJw/gI4YKCUMYhLiOe7h/8Z9Mdrrmcws8fsS4IDnLPMEgqppuoAsqsJz8JAFw/L
         7p5eEU2P4SZLtekb/5hikLzOQKAT4iRISXSBwq9cv80cLXMvYn/5BKjFVTOng0qcJfjs
         Ck2DzRyg9VQuUZfhstr0bbbk8yfcLI9RdK9iFuZYq9lIr8FdYd5CA25uItRMQg1O+E0g
         yjIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=S9CrgQqGn5mkur2H1auPSMo6yYyTfwNd3lzn8O6SIGw=;
        b=KVkxzLGU79It/ptRsDqhwI0LaGpZu+PBgoONcpnh7yhX67ywrvcIfGYU4YoCb9eNiO
         /6hQKJAj9mj3lGmyIIGMNnTUIzu2akh2spdB3RkM0EFIq604tzGtLeLr2UgFGR9PFav0
         1gWKpS477WS6WNQ5cKieQIqGG6gNo1lLTtodiUVFVMAHpNrLRV7oIbBMrGA7C0ktjyZI
         9metBYpz/uLx5fN1gqY+/7OIQHjhfvVrblig86HXP14aF/dKS5QXWSxb0hO8Cned9Px5
         htwLj5kX4pKx6HOO/ITdKmO2FCkAzff27PbyGTXskPp5t+IWSklTgh0Iu2EBgZXW/15I
         P2Rw==
X-Gm-Message-State: AOAM5321cGThzmPoGzCV8TotPRRdE/dhTn3ngiRTgd4lY3MPFdTvxOZc
        5NcmfabbhlFK7QpxuuMBFnN2z4V+kkU=
X-Google-Smtp-Source: ABdhPJyB+72mH8f+hRwoSWwuew4QNci28WM3A0pjoJ19MaVqYMg2UaIgTNSbVLIAJhMLj+x+uuuFVA==
X-Received: by 2002:a05:6512:34d1:: with SMTP id w17mr7752370lfr.439.1626261469836;
        Wed, 14 Jul 2021 04:17:49 -0700 (PDT)
Received: from [192.168.2.145] (94-29-37-113.dynamic.spd-mgts.ru. [94.29.37.113])
        by smtp.googlemail.com with ESMTPSA id b4sm141504lfp.223.2021.07.14.04.17.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Jul 2021 04:17:49 -0700 (PDT)
Subject: Re: [PATCH v1] iommu/tegra-smmu: Change debugfs directory name
To:     Joerg Roedel <joro@8bytes.org>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Krishna Reddy <vdumpa@nvidia.com>,
        Will Deacon <will@kernel.org>, linux-tegra@vger.kernel.org,
        iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org
References: <20210712001341.11166-1-digetx@gmail.com>
 <YO7B56Mkz3kx5U5Q@8bytes.org>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <43abb785-8b6a-555b-7d66-fa1911d2f8a0@gmail.com>
Date:   Wed, 14 Jul 2021 14:17:48 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YO7B56Mkz3kx5U5Q@8bytes.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

14.07.2021 13:52, Joerg Roedel пишет:
> On Mon, Jul 12, 2021 at 03:13:41AM +0300, Dmitry Osipenko wrote:
>> -	err = iommu_device_sysfs_add(&smmu->iommu, dev, NULL, dev_name(dev));
>> +	err = iommu_device_sysfs_add(&smmu->iommu, dev, NULL, "smmu");
> 
> Are you sure no one is relying on the old name so that this change
> breaks ABI?

IIUC, Thierry and Jon have a testing suite that uses the old name, but
it shouldn't be a problem to support the new name in addition to the old
name since it's internal/private testing suite.

The reason I'm proposing this change is because it's not obvious where
the SMMU debug is located when you look at the debugfs directory, it
takes some effort to find it.

> Also this change means that there is always be only one SMMU
> per system. Is that guaranteed too?

A single SMMU is guaranteed here. Only latest Tegra SoCs have two SMMUs
and those are ARM SMMUs, while this is a legacy Tegra SMMU here.
