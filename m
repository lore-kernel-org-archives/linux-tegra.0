Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8F19C433E6
	for <linux-tegra@archiver.kernel.org>; Fri, 15 Jan 2021 13:04:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BE92A221FA
	for <linux-tegra@archiver.kernel.org>; Fri, 15 Jan 2021 13:04:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731945AbhAONDi (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 15 Jan 2021 08:03:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45568 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1733115AbhAONDe (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 15 Jan 2021 08:03:34 -0500
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E458C061757;
        Fri, 15 Jan 2021 05:02:53 -0800 (PST)
Received: by mail-lj1-x22b.google.com with SMTP id p13so10320188ljg.2;
        Fri, 15 Jan 2021 05:02:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Ced3NxvYK3fUREKoo4RuGKO8nItMO6rbOL9yPMeNSOA=;
        b=hucXtmX2CLjSjXIeLSPOZ5kLbLG4UtSP8wR/Weha9hA+jClqCuD1CGIg1DAS4NAIVS
         8b+lrciqxAGBr2MJnz5JrRaUc9cGb7AY9E+XRihDqQd/5EYG8xoJ5BJY9Dk4/u4OiEp5
         Udo5JPNQiHQbdP63KJGNhSvQ2pKNCvLiWshOj2XZjFk/73ulW9g5YglPv9n3KQhSd6fR
         GOtp9b/ALqb5L5zm+1ZTYylQeGnuAkanfAjdke63gsHywW70CWSr3eH76r8akVfzhLbw
         N5GHY8YaabL2Apmh50ZOKiMWw6zlZ/oG1djh1V3GSqJl3Of8/hBsww2uW7PuN/il7FUb
         80jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Ced3NxvYK3fUREKoo4RuGKO8nItMO6rbOL9yPMeNSOA=;
        b=HnGdCL1q6PTVJl7YTlLknq3Q4tbH+OF1+ns88xtkv+EZpiDpfdAtAY4fZ8q+3OAeDm
         AC105dA04O6rERCd/+nKbkJ5bn3dwxLXG2N6MZry+gW5PaKNBKuiUBjch36+E1Ae8ziW
         axqACP9NnDURDTQ1YC6gN3sWnFHkz0XBS8fUwax2QBqy54KPmnp/3OVJg7TXpajo4+AI
         hLPz6FxMCidd0dg399GgIN6cbYq70XZSXwj7NgFvdSPRh8d7j1mTsUXntzpLFyIyeV4Y
         5zRMZ4YiVZUTf/YCgnialx0ZnQbG8AleT9wv5QhmS7lSb36u2LHfqiN1BD0wUfPNztnH
         EejA==
X-Gm-Message-State: AOAM5311dnygnv6SoSJ6e8FEDqMm27aLQC1Z0bGBaEk61yqr3QLJx3pW
        M+By8ndST/UqLC5Clp6VBKILiC2eGng=
X-Google-Smtp-Source: ABdhPJy1VyYGCB2G9pvcPq97w0TzAlqZ2ViCpO83g6XVhyil0OoITD43h7+sCiO7pF/mO4Td/ZQ4wQ==
X-Received: by 2002:a05:651c:1282:: with SMTP id 2mr5260045ljc.383.1610715771914;
        Fri, 15 Jan 2021 05:02:51 -0800 (PST)
Received: from [192.168.2.145] (109-252-192-57.dynamic.spd-mgts.ru. [109.252.192.57])
        by smtp.googlemail.com with ESMTPSA id z9sm892667lfs.183.2021.01.15.05.02.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 Jan 2021 05:02:51 -0800 (PST)
Subject: Re: [PATCH v1 5/5] ASoC: tegra: ahub: Reset hardware properly
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Sameer Pujar <spujar@nvidia.com>,
        Peter Geis <pgwipeout@gmail.com>,
        Nicolas Chauvet <kwizart@gmail.com>,
        Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>
Cc:     alsa-devel@alsa-project.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20210112125834.21545-1-digetx@gmail.com>
 <20210112125834.21545-6-digetx@gmail.com>
Message-ID: <5d99eba8-a169-1dc1-c7ab-0734c67c50b7@gmail.com>
Date:   Fri, 15 Jan 2021 16:02:50 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.2
MIME-Version: 1.0
In-Reply-To: <20210112125834.21545-6-digetx@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

12.01.2021 15:58, Dmitry Osipenko пишет:
> Assert hardware reset before clocks are enabled and then de-assert it
> after clocks are enabled. This brings hardware into a predictable state
> and removes relying on implicit de-assertion of resets which is done by
> the clk driver.
> 
> Tested-by: Peter Geis <pgwipeout@gmail.com>
> Tested-by: Nicolas Chauvet <kwizart@gmail.com>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  sound/soc/tegra/tegra30_ahub.c | 33 ++++++++++++++++-----------------
>  sound/soc/tegra/tegra30_ahub.h |  1 +
>  2 files changed, 17 insertions(+), 17 deletions(-)
> 
> diff --git a/sound/soc/tegra/tegra30_ahub.c b/sound/soc/tegra/tegra30_ahub.c
> index 4dbb58f7ea36..246cf6a373a1 100644
> --- a/sound/soc/tegra/tegra30_ahub.c
> +++ b/sound/soc/tegra/tegra30_ahub.c
> @@ -65,10 +65,20 @@ static int tegra30_ahub_runtime_resume(struct device *dev)
>  {
>  	int ret;
>  
> +	ret = reset_control_assert(ahub->reset);
> +	if (ret)
> +		return ret;
> +
>  	ret = clk_bulk_prepare_enable(ahub->nclocks, ahub->clocks);
>  	if (ret)
>  		return ret;
>  
> +	ret = reset_control_reset(ahub->reset);
> +	if (ret) {
> +		clk_bulk_disable_unprepare(ahub->nclocks, ahub->clocks);
> +		return ret;
> +	}
> +
>  	regcache_cache_only(ahub->regmap_apbif, false);
>  	regcache_cache_only(ahub->regmap_ahub, false);

I just realized that this is incorrect version of the patch which misses
the regcache syncing after the h/w reset. I'll make a v2.
