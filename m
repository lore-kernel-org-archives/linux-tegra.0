Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.5 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88B76C07E9C
	for <linux-tegra@archiver.kernel.org>; Thu,  8 Jul 2021 15:13:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 613CD61625
	for <linux-tegra@archiver.kernel.org>; Thu,  8 Jul 2021 15:13:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231624AbhGHPPz (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 8 Jul 2021 11:15:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59142 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229738AbhGHPPz (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 8 Jul 2021 11:15:55 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A667C061574
        for <linux-tegra@vger.kernel.org>; Thu,  8 Jul 2021 08:13:13 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id u18so6973318lfl.2
        for <linux-tegra@vger.kernel.org>; Thu, 08 Jul 2021 08:13:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=2MMJ3zjZJFIbkKd/TzuHfSkaeMKJORSkk9qfj614AYA=;
        b=glLqpVJtvi2kolhiEgKpStODvfleeFpHVkjPwXQoA7YiBJCAUaJar0oZyKFoqL3W80
         l5lxGVSGO5SnR2qNp6lRJPI606S2Zyhn6QPrUFEBbPzl/WP2TZjGGrjfCE3z0C1bCwTT
         zhlYaIfQ9dh4UCcPpO/LA6s9T9332Y6yVUF/Nqd+kg+wwlRkErZwjHenNQoOH2Tbjkgz
         mhNXp/yfBqoRGyW4PDL1K0+KV+h+wAT7WGoj0zR4UnIyYv0SNyI3bLmxFw2kVW29FJpy
         ruB2ysgAyyybj1R6Es1KvvjtPv98jBOXrJHjR1LuVMgqNm26pnj4TwaYwGi6UrbeYGs+
         Y7Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=2MMJ3zjZJFIbkKd/TzuHfSkaeMKJORSkk9qfj614AYA=;
        b=TtvczetM7x/SARcIhkANQ4nOIMvhPCdGPAdXYQZFoskE0CvtSH9p3qyhnVCfaa0HR8
         P8Zb9GMFSCcYhbMB14kT0pnjmiyGYJD5cUE/KcYEBBcOFao0zAWrEIIPTQx0LsTisjOL
         +OV+l9QUMsjqmIxb817s8FLDFBSrWftzPYXQLLQnl67Pgd4v2e7QTtKqBOaBpuowGmPo
         nzj6rOjFXcgPPnz/HkOsNfHGDU1HFt3dB7+K+2es0qjsJ9iJieaPzQ6rxpbbj6OZqUte
         eKo9SX/SHMdgGb9QTsXfu0yDDnx7nYgUSQ0hAD3jUR95FhKvmpdU1rIsMrVMLbjg2w2q
         ukfg==
X-Gm-Message-State: AOAM531K4SetlDXIb9g2mc5cFj1Y0oZQZmBvZkgNyEd4taqvAsQ/FqAS
        LZ66aae4CMUmFYiMpbni3vkOAySP9nI=
X-Google-Smtp-Source: ABdhPJy+MLDUPvqWL5jqIRphVK212skB9D6h/+IuoXWEHMvjEcBSwD7kbvjywhCjf8JdKBl4E/Ifnw==
X-Received: by 2002:ac2:51cd:: with SMTP id u13mr19887023lfm.435.1625757191191;
        Thu, 08 Jul 2021 08:13:11 -0700 (PDT)
Received: from [192.168.2.145] (94-29-37-113.dynamic.spd-mgts.ru. [94.29.37.113])
        by smtp.googlemail.com with ESMTPSA id i2sm221286lfe.38.2021.07.08.08.13.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Jul 2021 08:13:10 -0700 (PDT)
Subject: Re: [PATCH] drm/tegra: gr2d: Explicitly control module reset
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
References: <20210708143736.2018135-1-thierry.reding@gmail.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <d9112247-ce69-9281-75e6-6cb3296d19a7@gmail.com>
Date:   Thu, 8 Jul 2021 18:13:10 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210708143736.2018135-1-thierry.reding@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

08.07.2021 17:37, Thierry Reding пишет:
> From: Thierry Reding <treding@nvidia.com>
> 
> As of commit 4782c0a5dd88 ("clk: tegra: Don't deassert reset on enabling
> clocks"), module resets are no longer automatically deasserted when the
> module clock is enabled. To make sure that the gr2d module continues to
> work, we need to explicitly control the module reset.
> 
> Fixes: 4782c0a5dd88 ("clk: tegra: Don't deassert reset on enabling clocks")
> Signed-off-by: Thierry Reding <treding@nvidia.com>

On which board do see this problem?

TRM says that 2d should be in reset by default, but somehow it's not a
problem on devices that use fastboot.. why would it touch the 2d reset?

> ---
>  drivers/gpu/drm/tegra/gr2d.c | 33 +++++++++++++++++++++++++++++++--
>  1 file changed, 31 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/tegra/gr2d.c b/drivers/gpu/drm/tegra/gr2d.c
> index de288cba3905..ba3722f1b865 100644
> --- a/drivers/gpu/drm/tegra/gr2d.c
> +++ b/drivers/gpu/drm/tegra/gr2d.c
> @@ -4,9 +4,11 @@
>   */
>  
>  #include <linux/clk.h>
> +#include <linux/delay.h>
>  #include <linux/iommu.h>
>  #include <linux/module.h>
>  #include <linux/of_device.h>
> +#include <linux/reset.h>
>  
>  #include "drm.h"
>  #include "gem.h"
> @@ -19,6 +21,7 @@ struct gr2d_soc {
>  struct gr2d {
>  	struct tegra_drm_client client;
>  	struct host1x_channel *channel;
> +	struct reset_control *rst;

Unused variable?

>  	struct clk *clk;
>  
>  	const struct gr2d_soc *soc;
> @@ -208,6 +211,12 @@ static int gr2d_probe(struct platform_device *pdev)
>  	if (!syncpts)
>  		return -ENOMEM;
>  
> +	gr2d->rst = devm_reset_control_get(dev, NULL);
> +	if (IS_ERR(gr2d->rst)) {
> +		dev_err(dev, "cannot get reset\n");
> +		return PTR_ERR(gr2d->rst);
> +	}
> +
>  	gr2d->clk = devm_clk_get(dev, NULL);
>  	if (IS_ERR(gr2d->clk)) {
>  		dev_err(dev, "cannot get clock\n");
> @@ -220,6 +229,14 @@ static int gr2d_probe(struct platform_device *pdev)
>  		return err;
>  	}
>  
> +	usleep_range(2000, 4000);
> +
> +	err = reset_control_deassert(gr2d->rst);
> +	if (err < 0) {
> +		dev_err(dev, "failed to deassert reset: %d\n", err);
> +		goto disable_clk;
> +	}
> +
>  	INIT_LIST_HEAD(&gr2d->client.base.list);
>  	gr2d->client.base.ops = &gr2d_client_ops;
>  	gr2d->client.base.dev = dev;
> @@ -234,8 +251,7 @@ static int gr2d_probe(struct platform_device *pdev)
>  	err = host1x_client_register(&gr2d->client.base);
>  	if (err < 0) {
>  		dev_err(dev, "failed to register host1x client: %d\n", err);
> -		clk_disable_unprepare(gr2d->clk);
> -		return err;
> +		goto assert_rst;
>  	}
>  
>  	/* initialize address register map */
> @@ -245,6 +261,13 @@ static int gr2d_probe(struct platform_device *pdev)
>  	platform_set_drvdata(pdev, gr2d);
>  
>  	return 0;
> +
> +assert_rst:
> +	(void)reset_control_assert(gr2d->rst);

(void)?
