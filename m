Return-Path: <SRS0=fCh6=DH=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73526C4727C
	for <linux-tegra@archiver.kernel.org>; Wed, 30 Sep 2020 14:41:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 29386206FC
	for <linux-tegra@archiver.kernel.org>; Wed, 30 Sep 2020 14:41:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JNkZLJZ5"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728496AbgI3Olb (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 30 Sep 2020 10:41:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728149AbgI3Olb (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 30 Sep 2020 10:41:31 -0400
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com [IPv6:2a00:1450:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30A08C061755;
        Wed, 30 Sep 2020 07:41:31 -0700 (PDT)
Received: by mail-lf1-x144.google.com with SMTP id x69so2464693lff.3;
        Wed, 30 Sep 2020 07:41:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=6Lys2W6r4uZ+JX1Onj0nOj2DyGILV+GiicWVaaDTbhY=;
        b=JNkZLJZ5MRllsBCJdpRE1u37X/c/q+oLZP1F3LbzZqGrxmckGpJY1wzFXFntooiqf2
         Dq4ZuCHwjgbTQc2wZMmjUNwhJ6tqgcd0l7i2fDpyKp3WZlK/J3bFqiptDqZEhscCRES2
         NWvYyPr02rFZV2fhwK26+p3v1viIJTajPF59U2bWQYrzQ53ote0tQqY8kLhN4oZbjeQO
         bWtweB34MvLdZarKsjtCMdgN4mJ2PEJ3MFvZYq9x4LOtId/KS42HlUUzosFOKLEPlJJJ
         eb4M8m7kD/mo83ymWXeFTeCgay65yiUnTvOkD1/bIdMBsoJxtt2tUmlDSiwo8fDSHdBm
         oQqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=6Lys2W6r4uZ+JX1Onj0nOj2DyGILV+GiicWVaaDTbhY=;
        b=PLqusE2mzyoFfViWxfAKtrWFtnIuPEmfMkR0//0hOsX/EJ0fLNV/cV/02gsFg8xQoP
         xTndFEZrOYG3BSrA5p4tUWdF1AR6P0M6k5B80f7v03IGu9gvu4rRC+94w1wFycQxfJqf
         Fs+RrTISHuSzuIxtjlnkHwmuQLm/hgJhdRaQXRVVapI6WAIzFdiidhJWiNoiddrlKJqD
         Dm9gv+ZdTF9+Zxq8a/u4shjH5mEnj64aRD9M0p6nMNvnC5Ce9vGPFppo2WpQDQ+VHpQ8
         UH40Og+UyiSx7VCBlOOpN8kCd5cGI4zi7XU08jHpsecuHleToIO2u3TLxOAlFnuLMrW6
         tmeg==
X-Gm-Message-State: AOAM530bnFiZmlHxo0lp/89O2znGGfqwlrjCQkDGSnJ3G1bKPwxXcrHZ
        HZYbaYEM1Je2eKyaWFyqVnzuaQOE7vk=
X-Google-Smtp-Source: ABdhPJxZteRnCj4CyjWFcyNQ7qma6ukKblkKDrRwCBv2GJXz+iCTYWRhMG04fbUpOIdXG+DUQQJSeg==
X-Received: by 2002:a19:e03:: with SMTP id 3mr902474lfo.488.1601476889348;
        Wed, 30 Sep 2020 07:41:29 -0700 (PDT)
Received: from [192.168.2.145] (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.googlemail.com with ESMTPSA id e14sm175616ljp.15.2020.09.30.07.41.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Sep 2020 07:41:28 -0700 (PDT)
Subject: Re: [PATCH v3 1/3] memory: tegra: Add
 devm_tegra_get_memory_controller()
To:     Nicolin Chen <nicoleotsuka@gmail.com>, thierry.reding@gmail.com,
        joro@8bytes.org, krzk@kernel.org
Cc:     vdumpa@nvidia.com, jonathanh@nvidia.com,
        linux-tegra@vger.kernel.org, iommu@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org
References: <20200930084258.25493-1-nicoleotsuka@gmail.com>
 <20200930084258.25493-2-nicoleotsuka@gmail.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <f9712d4c-8497-ca84-0d8a-d33eb6abc513@gmail.com>
Date:   Wed, 30 Sep 2020 17:41:27 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200930084258.25493-2-nicoleotsuka@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

...
> +struct tegra_mc *devm_tegra_get_memory_controller(struct device *dev)
> +{
> +	struct platform_device *pdev;
> +	struct device_node *np;
> +	struct tegra_mc *mc;
> +	int err;
> +
> +	np = of_find_matching_node_and_match(NULL, tegra_mc_of_match, NULL);
> +	if (!np)
> +		return ERR_PTR(-ENOENT);
> +
> +	pdev = of_find_device_by_node(np);
> +	of_node_put(np);
> +	if (!pdev)
> +		return ERR_PTR(-ENODEV);
> +
> +	mc = platform_get_drvdata(pdev);
> +	if (!mc) {
> +		put_device(mc->dev);

This should be put_device(&pdev->dev). Please always be careful while
copying someones else code :)
