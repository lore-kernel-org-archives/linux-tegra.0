Return-Path: <SRS0=kaSA=DG=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDBCFC4727C
	for <linux-tegra@archiver.kernel.org>; Tue, 29 Sep 2020 17:41:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6CEBA207F7
	for <linux-tegra@archiver.kernel.org>; Tue, 29 Sep 2020 17:41:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UTNWEu8S"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728563AbgI2Rlz (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 29 Sep 2020 13:41:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38468 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728547AbgI2Rlz (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 29 Sep 2020 13:41:55 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C8C1C061755;
        Tue, 29 Sep 2020 10:41:54 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id b19so4717909lji.11;
        Tue, 29 Sep 2020 10:41:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=ymf5DYD10J/gVTCAgJb77WubJ0BcbD1SvX37zhc4xHQ=;
        b=UTNWEu8SbvBNm+yTMk4E/UBIu63yOeKo7iE/cZdxuQS8KVZ3Q8fmCHpA2lFIltSDM5
         TIQs/0w4di/n+3R2+zuKEf2NR4Af/gAGbSzUbRr7QXg/9U/m5CV7x6QOJdltuNDtNMkP
         fSKpLY32uiQ8KngfUD3rHRwoBscvlORD5fu2qid+pfubqIezgvfVhenTb3NBfCEbaZY7
         RaMrpPH3loaAlvNQcMtknj1jsUzewl93Cn3Y283ufDGHWHufGkF72MtYhhvQ8OkY4Kwc
         lA2FE/V6ewd+Rl8pN+CIcvH0M11byZ4ggpfI8DSgxjghVYDspQXB6O/DvDQUmbIezxN6
         1C9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ymf5DYD10J/gVTCAgJb77WubJ0BcbD1SvX37zhc4xHQ=;
        b=qxxTcVKYVqICks0LFC3IBXWaZr9Kyp5HdBUzL0CNSpELumPEY7PThsULFjohaXdNVd
         h4Gy1lsbEDhs7q1k0BeUF4PAg9fEihTZGbdeVqkAHhPgAe7d4+Dc5gXez3r0eLAcSFyx
         koe2ZKJCC+OTiJw50dJZNzcuh2iiO/1Zwc+52d5s7KLU+u5UZJhlPXRNqI1KKqO7P5uo
         yDd75p4qsW38cpInlhIjyEtVc6x4ls1ygUPCptaI29fN+2WRIapUk2CJ/jhl0lkmxuNh
         1iz0ps+XiXApOxMSGNdXKF0lo0uOOHxHP0oG7BLU9yF3u9evWFjHf8QquUonODFTD7YW
         YLqQ==
X-Gm-Message-State: AOAM530d2/nL7WubhTBRhARaQfq4A5ODX5VbY2NDoHbQPr5Cy+/r/D+d
        bFIfWkn9OaZ26UCZ7n1Jn4aK/GzWJts=
X-Google-Smtp-Source: ABdhPJxgxZwr/emgReyZHJBvOhNw6KNXbB6nWSbYq1wE+ONV0NzfQv3hgDwYmnZeLzriu75KYzgu4w==
X-Received: by 2002:a2e:889a:: with SMTP id k26mr1457792lji.214.1601401311318;
        Tue, 29 Sep 2020 10:41:51 -0700 (PDT)
Received: from [192.168.2.145] (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.googlemail.com with ESMTPSA id o17sm3170303lfi.261.2020.09.29.10.41.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Sep 2020 10:41:50 -0700 (PDT)
Subject: Re: [PATCH v4 1/2] iommu/tegra-smmu: Unwrap tegra_smmu_group_get
To:     Nicolin Chen <nicoleotsuka@gmail.com>, thierry.reding@gmail.com,
        joro@8bytes.org
Cc:     vdumpa@nvidia.com, jonathanh@nvidia.com,
        linux-tegra@vger.kernel.org, iommu@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org, hch@infradead.org
References: <20200929061325.10197-1-nicoleotsuka@gmail.com>
 <20200929061325.10197-2-nicoleotsuka@gmail.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <35d789ae-7deb-7f8c-0556-98fe73f5999f@gmail.com>
Date:   Tue, 29 Sep 2020 20:41:49 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200929061325.10197-2-nicoleotsuka@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

29.09.2020 09:13, Nicolin Chen пишет:
> The tegra_smmu_group_get was added to group devices in different
> SWGROUPs and it'd return a NULL group pointer upon a mismatch at
> tegra_smmu_find_group(), so for most of clients/devices, it very
> likely would mismatch and need a fallback generic_device_group().
> 
> But now tegra_smmu_group_get handles devices in same SWGROUP too,
> which means that it would allocate a group for every new SWGROUP
> or would directly return an existing one upon matching a SWGROUP,
> i.e. any device will go through this function.
> 
> So possibility of having a NULL group pointer in device_group()
> is upon failure of either devm_kzalloc() or iommu_group_alloc().
> In either case, calling generic_device_group() no longer makes a
> sense. Especially for devm_kzalloc() failing case, it'd cause a
> problem if it fails at devm_kzalloc() yet succeeds at a fallback
> generic_device_group(), because it does not create a group->list
> for other devices to match.
> 
> This patch simply unwraps the function to clean it up.
> 
> Signed-off-by: Nicolin Chen <nicoleotsuka@gmail.com>
> ---

Reviewed-by: Dmitry Osipenko <digetx@gmail.com>

