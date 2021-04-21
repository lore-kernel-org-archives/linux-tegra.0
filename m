Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0229BC433ED
	for <linux-tegra@archiver.kernel.org>; Wed, 21 Apr 2021 11:46:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B27C76143D
	for <linux-tegra@archiver.kernel.org>; Wed, 21 Apr 2021 11:46:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238112AbhDULrC (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 21 Apr 2021 07:47:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49262 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238106AbhDULrB (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 21 Apr 2021 07:47:01 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 046E0C06174A
        for <linux-tegra@vger.kernel.org>; Wed, 21 Apr 2021 04:46:27 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id t14so9285512lfe.1
        for <linux-tegra@vger.kernel.org>; Wed, 21 Apr 2021 04:46:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=qpdaMkUzLOu/+kHbCIqYLJehL/ZbReLa98hu90/26WE=;
        b=chaHEL2bi3vi7MzzbUPhpNXkoxfiTermUA6aoNJzsLl1rh5qIDIA67P3bWffYFccRO
         8BkWpYuYDlK5MPIDAyPkKFw6e7YZVGwvEifAG+23Paq5RCYQNFzzgCHqOmgGTLshGcCx
         MwNbKiw6rY7UW4t8+qTnMv4+0/mUgTdAI6T1imcnENwXVFDaIJZjDGKEI+pjlv1aU1+4
         Zb5zmiTnLDRg59XBL/FUP1pf8Ix3KIDCQ9oMYjgP/mHimRTE9/xik+wBHaW2cY4/Kepr
         BZYR2AP+oZu6/DnTsG6TvE3iLoHZ+ClH9oUEJ4KrXHU/dfwCzzGVI/vaSUyh6/pLmAzg
         nGfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=qpdaMkUzLOu/+kHbCIqYLJehL/ZbReLa98hu90/26WE=;
        b=n1t1pe5/1ztJCJFRoQnYTC80ETlPaqMPyJPnZ5dgB3KLsV0JLtPvJdBUYUkfvvpH4h
         od+AH3PldgryoL16yS2ls4MYdCbruqFf3+QeiOYrHU8BKhUGUpDCBXvtnBC7xZrZj7Zx
         e6pBznc36v8lHtM/+p9wCtZSLPD20PHigL4WWG5ZBKYykIeIo3+bESIP2jeMvu56o4R9
         w4FAhDVsI2xP5cLIaV2510zY85Lf+hPO4GgdZutCr1CR+pX5IjYJbooFT8UIlDr7jVUz
         7Bba0nDBouYJrv3ToHKCFlJuK7TnzRrIgs50/TfS7j/YxO2rZSMXiD5bpBqvmkmTzGN/
         osSA==
X-Gm-Message-State: AOAM531d6pMtRoCK0C5wgQMioSOThmFgtXdohSOYv4ufywHR6OGqlJDc
        n52BfRVZAxgSUtGzCc/vD40=
X-Google-Smtp-Source: ABdhPJySCO0jN1NKUHeIQosU48rosFZp41OgejUfm3uYvhGInZ5nja4Kf72GcvYxRjNKjncbV/eQJw==
X-Received: by 2002:a05:6512:3332:: with SMTP id l18mr8309589lfe.181.1619005585567;
        Wed, 21 Apr 2021 04:46:25 -0700 (PDT)
Received: from [192.168.2.145] (109-252-193-103.dynamic.spd-mgts.ru. [109.252.193.103])
        by smtp.googlemail.com with ESMTPSA id m10sm187589lfr.189.2021.04.21.04.46.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Apr 2021 04:46:25 -0700 (PDT)
Subject: Re: [PATCH 08/10] memory: tegra: Unify drivers
To:     Thierry Reding <thierry.reding@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <20210420165237.3523732-1-thierry.reding@gmail.com>
 <20210420165237.3523732-9-thierry.reding@gmail.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <a4d73dca-92a3-d5e5-677f-498f84aa0457@gmail.com>
Date:   Wed, 21 Apr 2021 14:46:24 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210420165237.3523732-9-thierry.reding@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

20.04.2021 19:52, Thierry Reding пишет:
> +/*
> + * XXX The Tegra186 memory controller driver used to be able to do this. Once
> + * removing the driver is supported on all chips, this can be uncommented.
> + */
> +/*
> +static int tegra_mc_remove(struct platform_device *pdev)
> +{
> +	struct tegra_mc *mc = platform_get_drvdata(pdev);
> +
> +	if (mc->soc->ops && mc->soc->ops->remove)
> +		mc->soc->ops->remove(mc);
> +
> +	return 0;
> +}
> +*/
> +
>  static int __maybe_unused tegra_mc_suspend(struct device *dev)
>  {
>  	struct tegra_mc *mc = dev_get_drvdata(dev);
> @@ -834,6 +856,9 @@ static struct platform_driver tegra_mc_driver = {
>  	},
>  	.prevent_deferred_probe = true,
>  	.probe = tegra_mc_probe,
> +	/*
> +	.remove = tegra_mc_remove,
> +	*/
>  };

The commented lines shouldn't be in the final version of the patch, IMO.
These lines either should be uncommented and the remove() callback
should return -EOPNOTSUPP or they should be removed for now.

The rest of the patches look good to me for now, I'll take another look
after testing the patches. Thank you.
