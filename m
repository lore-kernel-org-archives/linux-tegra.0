Return-Path: <SRS0=aGvU=EK=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2E34C388F7
	for <linux-tegra@archiver.kernel.org>; Wed,  4 Nov 2020 10:49:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3BC91223AB
	for <linux-tegra@archiver.kernel.org>; Wed,  4 Nov 2020 10:49:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q5pwsc4C"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729647AbgKDKtV (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 4 Nov 2020 05:49:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38778 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728287AbgKDKtV (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 4 Nov 2020 05:49:21 -0500
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 32FDAC0613D3;
        Wed,  4 Nov 2020 02:49:19 -0800 (PST)
Received: by mail-lj1-x243.google.com with SMTP id 23so22418174ljv.7;
        Wed, 04 Nov 2020 02:49:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=hW9JciFa2DMWNwaN8kCGLx85t5PIMbOk3IaZH3qou+A=;
        b=Q5pwsc4CIjBxOiXbSFkw5Dl/kuHxM5HDSgOHCjpUtbrGAALGo8K1fD7gOTqLKFCAmm
         MFVeiKOG2tUB8iv2hhg8ZSBaDI5vPNfissEl0aXiKtostfXerKPvm5ob2PyCeotWCmL3
         dkTHzG8ZkgpbrBy7umJzKVIHdWfPAKm3bf03idMqvClQvPIYDAjySacuItkuc4KZ/BJA
         8hlFWHpYVsyodU/dI4b9KCPK+WKN6ZaQXfZ1ci9LfAwLo4qYgLSY5DirgxoK1w97IMbB
         NToV3J/yOgd7+bgodp1FZ43G7KVWke5dpIUfZekhdAjrMg/++BIhjSQRy1bcrbTMAJWy
         BSOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=hW9JciFa2DMWNwaN8kCGLx85t5PIMbOk3IaZH3qou+A=;
        b=GNJ0W+Ev8RkkJBySB8ptOr/y/dG7TyDT+834/Lz3U9FZMmXb/PK3Ozil5DCuZfRG+q
         SXujH4OZp6k0mbYs07sWhIGscAXG3GfrH5R5IfyOB4D/oSxCuSdkgcUKEYmM7MQiLzmB
         w6+bfcqjWMjNYcbfbx703gcyEzzgrG4MU32NmaXuYLxez7Y4w2FHIr6suvJcRTbc9yX1
         MsM1v/+Hk3EWU+e0HyIvHbkaiNw2Fg0Lgc4Gx/WPRQDtK5n1hbF5I/+e0HFpTo4CpNFQ
         YKj0pq2F8aK9+5jM0/hi4cJwGdo4vs8pY+0bk2y27naAskWZeY/D6wF9mNUV5RCBiIzi
         fOCA==
X-Gm-Message-State: AOAM531DGKK5YnDs1ABDZqgPqqdjj8DmmH60F2kYmFysYm5Hem9o32a6
        lapsdbCQNB8nPRrcYLCurXUoGQUU1Nw=
X-Google-Smtp-Source: ABdhPJzzLUKlILds5RKowUnpmArH4wHItQ9txy25FaUm1y8574Xkf4n6JLnrEn8ms7n5JDphgTdq0Q==
X-Received: by 2002:a2e:9cc9:: with SMTP id g9mr10866780ljj.20.1604486957372;
        Wed, 04 Nov 2020 02:49:17 -0800 (PST)
Received: from [192.168.2.145] (109-252-192-83.dynamic.spd-mgts.ru. [109.252.192.83])
        by smtp.googlemail.com with ESMTPSA id w29sm19857lfc.49.2020.11.04.02.49.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2020 02:49:16 -0800 (PST)
Subject: Re: [PATCH V2] drm/tegra: sor: Don't warn on probe deferral
To:     Jon Hunter <jonathanh@nvidia.com>,
        Thierry Reding <thierry.reding@gmail.com>
Cc:     David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
References: <20201104092328.659169-1-jonathanh@nvidia.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <420d8e9e-47d5-0d46-a774-a47bcb52bdeb@gmail.com>
Date:   Wed, 4 Nov 2020 13:49:15 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201104092328.659169-1-jonathanh@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

04.11.2020 12:23, Jon Hunter пишет:
> Deferred probe is an expected return value for tegra_output_probe().
> Given that the driver deals with it properly, there's no need to output
> a warning that may potentially confuse users.
> 
> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
> ---
> 
> Changes since V1:
> - This time, I actually validated it!
> 
>  drivers/gpu/drm/tegra/sor.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/tegra/sor.c b/drivers/gpu/drm/tegra/sor.c
> index e88a17c2937f..898a80ca37fa 100644
> --- a/drivers/gpu/drm/tegra/sor.c
> +++ b/drivers/gpu/drm/tegra/sor.c
> @@ -3764,10 +3764,9 @@ static int tegra_sor_probe(struct platform_device *pdev)
>  		return err;
>  
>  	err = tegra_output_probe(&sor->output);
> -	if (err < 0) {
> -		dev_err(&pdev->dev, "failed to probe output: %d\n", err);
> -		return err;
> -	}
> +	if (err < 0)
> +		return dev_err_probe(&pdev->dev, err,
> +				     "failed to probe output: %d\n", err);

Hello Jon,

There is no need to duplicate the error code in the message [1]. Perhaps
worth making a v3? :)

[1]
https://elixir.bootlin.com/linux/v5.10-rc2/source/drivers/base/core.c#L4240
