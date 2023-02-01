Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA37AC05027
	for <linux-tegra@archiver.kernel.org>; Wed,  1 Feb 2023 23:19:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229770AbjBAXTk (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 1 Feb 2023 18:19:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46856 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231561AbjBAXTi (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 1 Feb 2023 18:19:38 -0500
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com [IPv6:2607:f8b0:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B73AD23320
        for <linux-tegra@vger.kernel.org>; Wed,  1 Feb 2023 15:19:37 -0800 (PST)
Received: by mail-pg1-x535.google.com with SMTP id q9so98778pgq.5
        for <linux-tegra@vger.kernel.org>; Wed, 01 Feb 2023 15:19:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UfvfdYoklJloAro8ZE+SRmZ2YsAYATSVu+Qj+tuYXzs=;
        b=ndoZUIiiXWibJX2FI3qUcRHP9YcXJd3NDudb2WUoXWuvbltA3Ox2R7fcgJIg2rgSWB
         C4HtH9soZJG4frvEWKXm61nj0xe8Qrz7qBMV9k/DZsQb4go6lyojJhqNYiPj211zca5o
         BMKNteONR293rcXzYN5HKQPV58Ke4WUud+StdtLyuKqeriV9ZSQQPfCX/3zQKt76Mp6o
         hvcu5ZrnVpstxJ/h0Ns3wrXJcBP3LKy4EbBYEqWYk1miTpLjyVOXq2fh+XD8Bl58+34U
         GJ24GI8dk26Dm/DUphHrG3VIDsfVw5u812C/8X/BBX4WD7gtLVFJB8SOYLcF335lMBPc
         J6rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UfvfdYoklJloAro8ZE+SRmZ2YsAYATSVu+Qj+tuYXzs=;
        b=Fl5LcfVTeY3t+50mDzClT4BinXm+uHvscPi0x0nf9e0y4soeC/BTpZ58qEMdltm9Y6
         ow9U8N5ndXh6bjiW0zVQVR6YCLhsXGSzFkSFy+RnC2zHxBQrKgMFI6Ylv082GU813+xH
         qisboD/MnVIjtMd6XjDYV6wAyoKryzS6tuLIBzw/0P20asx+3CVoHbn5w9mUmssywAqV
         hjKGvkIVMHjNIswViCavLpXju71TcvMhOR+IOr0X8fihlGc4rOTTlZ3t4Nsy33S3amJp
         tIMoteLQa2fH+3k+PmXXCwwBldSf9MXsH3mhlVyzxvVn430iiGkNEq5WZCJkoNpStcDe
         xghQ==
X-Gm-Message-State: AO0yUKVhH6jNWjizre9HFW5jsYigaIyAo3onpgj5TnuGlvxDMUTgWhs2
        xETT2GFz0BVRzjZkqJuaS2vayQ==
X-Google-Smtp-Source: AK7set9inbJv/M/vfdju8z207Qoxp12XibCyhHzDRAcGnrVUKe0FvFj3EQzothiblU4uGo1rVlTICQ==
X-Received: by 2002:a62:b41a:0:b0:593:d7fd:aaf7 with SMTP id h26-20020a62b41a000000b00593d7fdaaf7mr413693pfn.16.1675293576923;
        Wed, 01 Feb 2023 15:19:36 -0800 (PST)
Received: from google.com ([2620:15c:2d1:203:341e:6979:102e:c9d9])
        by smtp.gmail.com with ESMTPSA id t26-20020aa7947a000000b0058bbe1240easm349789pfq.190.2023.02.01.15.19.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Feb 2023 15:19:36 -0800 (PST)
Date:   Wed, 1 Feb 2023 15:19:31 -0800
From:   Nick Desaulniers <ndesaulniers@google.com>
To:     Arnd Bergmann <arnd@kernel.org>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>, Arnd Bergmann <arnd@arndb.de>,
        Nathan Chancellor <nathan@kernel.org>,
        Tom Rix <trix@redhat.com>,
        Mikko Perttunen <mperttunen@nvidia.com>,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        Robin Murphy <robin.murphy@arm.com>,
        dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH] gpu: host1x: fix uninitialized variable use
Message-ID: <Y9rzg9Mizckjf+Fp@google.com>
References: <20230127221418.2522612-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230127221418.2522612-1-arnd@kernel.org>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Fri, Jan 27, 2023 at 11:14:00PM +0100, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The error handling for platform_get_irq() failing no longer
> works after a recent change, clang now points this out with
> a warning:
> 
> drivers/gpu/host1x/dev.c:520:6: error: variable 'syncpt_irq' is uninitialized when used here [-Werror,-Wuninitialized]
>         if (syncpt_irq < 0)
>             ^~~~~~~~~~
> 
> Fix this by removing the variable and checking the correct
> error status.
> 
> Fixes: 625d4ffb438c ("gpu: host1x: Rewrite syncpoint interrupt handling")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Thanks Arnd, I saw some reports from kernelci about this, too.
https://lore.kernel.org/linux-next/?q=warning%3A+variable+%27syncpt_irq%27+is+uninitialized+when+used+here

Reported-by: "kernelci.org bot" <bot@kernelci.org>
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

> ---
>  drivers/gpu/host1x/dev.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/host1x/dev.c b/drivers/gpu/host1x/dev.c
> index 4872d183d860..aae2efeef503 100644
> --- a/drivers/gpu/host1x/dev.c
> +++ b/drivers/gpu/host1x/dev.c
> @@ -487,7 +487,6 @@ static int host1x_get_resets(struct host1x *host)
>  static int host1x_probe(struct platform_device *pdev)
>  {
>  	struct host1x *host;
> -	int syncpt_irq;
>  	int err;
>  
>  	host = devm_kzalloc(&pdev->dev, sizeof(*host), GFP_KERNEL);
> @@ -517,8 +516,8 @@ static int host1x_probe(struct platform_device *pdev)
>  	}
>  
>  	host->syncpt_irq = platform_get_irq(pdev, 0);
> -	if (syncpt_irq < 0)
> -		return syncpt_irq;
> +	if (host->syncpt_irq < 0)
> +		return host->syncpt_irq;
>  
>  	mutex_init(&host->devices_lock);
>  	INIT_LIST_HEAD(&host->devices);
> -- 
> 2.39.0
> 
> 
