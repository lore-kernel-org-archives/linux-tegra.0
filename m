Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B43B9C5519F
	for <linux-tegra@archiver.kernel.org>; Sat, 14 Nov 2020 05:34:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 616FF206D4
	for <linux-tegra@archiver.kernel.org>; Sat, 14 Nov 2020 05:34:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FcSUwiof"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726327AbgKNFdw (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sat, 14 Nov 2020 00:33:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58948 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726285AbgKNFdv (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sat, 14 Nov 2020 00:33:51 -0500
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6AD2DC0613D1;
        Fri, 13 Nov 2020 21:33:51 -0800 (PST)
Received: by mail-lj1-x243.google.com with SMTP id v20so13544267ljk.8;
        Fri, 13 Nov 2020 21:33:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=dR4mGgmhZgGJoVxUF+6N7w60j7hr3cRgL33UX4smJhk=;
        b=FcSUwiofK9SPf9GmcXIcnQH8LOtmtg8mfpjFNnp4GNNk/LQUq/fEERtozOm9IKCtaX
         +lU7Oo6EpQEuVkgZwRjZad61N45/wFbvyAlg4WHeIqxxdRg3A8rfkVY42fw0csVamYIi
         kDW+mdTpUyQ0JrsAQb2wqcauXbH5+cXDb0Airj40ddcZAhVivhbxq19gxIEOyHDzhdUz
         /OIeqMke0N02l+SnJ2hF0Ge1RZ4O6/K6QeBKPRfJQjj3uRntAs6NKB5lj6tCXHQ+0YKi
         NO7ZnkA4/za1ruLVFqW8nBqaMfSZ93GLCoW50MLrWdvV/HYwxB6wdFDGy5OrHIgND7dy
         Vy0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=dR4mGgmhZgGJoVxUF+6N7w60j7hr3cRgL33UX4smJhk=;
        b=WHlgkkgSIV74pDFUR1w1OIEwsImGL60gIDh0l/7GsejD0EiTqIYY+NVdbsA+BdfQhu
         +1QXq5ePklmxzieGtzJeTqX1qz8ufo5kRZoMLgdFNDaRMObArOYLsMdPzuPHaRcwV160
         PKOljc53QwBhss/1eR0Jr6anob4vkRjFLvH2z8jvL+TBtkgI2DDNfK0EiWIsGvCIta1G
         eL9cwz8rDEhaAFCEQq5z66nnDb9uI9KywVPv7J295FlqjNIMsNoLsFVNPHqefnxPjGiY
         M/CCRqa/+nbaWtyP3awfmElIO6ucVUbP9nrWxS+H9SW3EnYxfMhP2E1vzhIL6EHZwtql
         9Ecg==
X-Gm-Message-State: AOAM5330MhlmudzirLTV01/fCfksCI7R3eMY001AQ0hWQ9Mk9VLot2NU
        B6Lj4B+YOcAB9HRmYJpPY607cFAr9yM=
X-Google-Smtp-Source: ABdhPJx+cQWcVp/wwcjkoLPTVpjqyRCu4z4idIuMz43WNdzH65qVx2TU4Bxl8j96Nc7e4VNgfu2gCg==
X-Received: by 2002:a2e:50d:: with SMTP id 13mr2438358ljf.41.1605332029522;
        Fri, 13 Nov 2020 21:33:49 -0800 (PST)
Received: from [192.168.2.145] (109-252-193-159.dynamic.spd-mgts.ru. [109.252.193.159])
        by smtp.googlemail.com with ESMTPSA id x18sm1850787ljh.125.2020.11.13.21.33.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2020 21:33:48 -0800 (PST)
Subject: Re: [PATCH] memory: tegra20-emc: remove redundant error message
To:     Nigel Christian <nigel.l.christian@gmail.com>, krzk@kernel.org
Cc:     thierry.reding@gmail.com, jonathanh@nvidia.com,
        linux-tegra@vger.kernel.org, kernel-janitors@vger.kernel.org
References: <20201114051219.GA4746@fedora-project>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <1ab114f2-b63e-464d-2022-6571fbf02511@gmail.com>
Date:   Sat, 14 Nov 2020 08:33:47 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.2
MIME-Version: 1.0
In-Reply-To: <20201114051219.GA4746@fedora-project>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

14.11.2020 08:12, Nigel Christian пишет:
> There is no need for dev_err() since irq already prints an error. 
> Eliminate unnecessary curly braces for single statement block.
> 
> Signed-off-by: Nigel Christian <nigel.l.christian@gmail.com>
> ---
>  drivers/memory/tegra/tegra20-emc.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/memory/tegra/tegra20-emc.c b/drivers/memory/tegra/tegra20-emc.c
> index 5e10aa97809f..181a360d7d6b 100644
> --- a/drivers/memory/tegra/tegra20-emc.c
> +++ b/drivers/memory/tegra/tegra20-emc.c
> @@ -959,10 +959,8 @@ static int tegra_emc_probe(struct platform_device *pdev)
>  	int irq, err;
>  
>  	irq = platform_get_irq(pdev, 0);
> -	if (irq < 0) {
> -		dev_err(&pdev->dev, "please update your device tree\n");
> +	if (irq < 0)
>  		return irq;
> -	}
>  
>  	emc = devm_kzalloc(&pdev->dev, sizeof(*emc), GFP_KERNEL);
>  	if (!emc)
> 

This message has a special purpose, it shouldn't be removed. Please
always check what auto-generated patches actually do.
