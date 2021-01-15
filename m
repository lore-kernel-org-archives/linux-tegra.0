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
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4FAEC433DB
	for <linux-tegra@archiver.kernel.org>; Fri, 15 Jan 2021 14:25:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6AB8F23877
	for <linux-tegra@archiver.kernel.org>; Fri, 15 Jan 2021 14:25:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731520AbhAOOZq (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 15 Jan 2021 09:25:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35164 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726381AbhAOOZp (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 15 Jan 2021 09:25:45 -0500
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D262C061757;
        Fri, 15 Jan 2021 06:25:05 -0800 (PST)
Received: by mail-lj1-x229.google.com with SMTP id u11so10527936ljo.13;
        Fri, 15 Jan 2021 06:25:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=B72xa1Z3cOYdg64nqMeoT+FFfbyXEgVFnkRuV0aXWnY=;
        b=PtZv0SV0LObhYS5i8xaO6ZsiV3yoxqB9sr/IRdLTsTnoxaYCmejXmQQHwONCzM8SIy
         ghAONVdW95VGqcvJuBDb6DoCw0LAqvj7CTuG8MYE/eR3GJmfnOjOlnFr6DozuhpklJDI
         JNtl5daB9VhIt3DG+DRp8VWHw+r+INbPN2J6q8iikilympwOhpHwwr7xl0guhOA9dEf6
         tA3rqgTHGxkOFlHz66xuBPI8NjfzOvo7FcPr1/VQX3WCrqdae1A1TR4ISQOdJvvDTpk9
         oKFTsyYXo6bcAvUU4CK98M74WSsoocV/hJVwNFwvWKdMU/XZIkFLevHfppFphCvWM8Hm
         z4pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=B72xa1Z3cOYdg64nqMeoT+FFfbyXEgVFnkRuV0aXWnY=;
        b=BsYd1xWwmIYFj+0XtpFXEthxFcopjgBwlgTe9VRok5GKncWY0TDNlvtJ+wx2fpWpHi
         +/RGCxvSDEhzJ9sa/l2SGrkB5mG1Gr9wuwjyCqWqLQVa4EoQw0+BAOEOimttMZuUVEWA
         W33QilLz2qPlsyB8i6BQfUClCUQ/zQUUi18RM9ACDgt2SkJQ3KJ9Dri+FukTptkdgL4b
         C6SDv7c7ibVc7E5hZhz507+n60YxdMN3cQRdo4wTXY9fd9GK0iYAe+CgGBI7ZggZxpqz
         Fjk/ys8ZykSSGNR8JiLeXPZ0AfgMWrneuleDsTHqq0/kKWmA7O5BitsivRc4w0CZXC6K
         w1jg==
X-Gm-Message-State: AOAM533LZOnQBJuE6FlXkykkP09pqpKxxm0n/PJmdgrmT4BPBtcWQ1qp
        qQsiKSnWAa4W523kfXXERKhN2tCyCIY=
X-Google-Smtp-Source: ABdhPJyQR8A4raiauC6Oux5Eix29ocPO8hsJ8VWhVtU1B1qTvGdjjVfujN8b7B0ZIe80K7G3SEnPig==
X-Received: by 2002:a2e:9f13:: with SMTP id u19mr5448066ljk.69.1610720703604;
        Fri, 15 Jan 2021 06:25:03 -0800 (PST)
Received: from [192.168.2.145] (109-252-192-57.dynamic.spd-mgts.ru. [109.252.192.57])
        by smtp.googlemail.com with ESMTPSA id c3sm824341ljk.88.2021.01.15.06.25.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 Jan 2021 06:25:02 -0800 (PST)
Subject: Re: [PATCH v2 5/5] ASoC: tegra: ahub: Reset hardware properly
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Sameer Pujar <spujar@nvidia.com>,
        Peter Geis <pgwipeout@gmail.com>,
        Nicolas Chauvet <kwizart@gmail.com>,
        Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>
Cc:     alsa-devel@alsa-project.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20210115140145.10668-1-digetx@gmail.com>
 <20210115140145.10668-6-digetx@gmail.com>
Message-ID: <f1a5beae-00c7-5a9c-5189-a52081efd137@gmail.com>
Date:   Fri, 15 Jan 2021 17:25:02 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.2
MIME-Version: 1.0
In-Reply-To: <20210115140145.10668-6-digetx@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

15.01.2021 17:01, Dmitry Osipenko пишет:
> @@ -65,12 +65,32 @@ static int tegra30_ahub_runtime_resume(struct device *dev)
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
> +	regcache_mark_dirty(ahub->regmap_apbif);
> +	regcache_mark_dirty(ahub->regmap_ahub);
> +
> +	ret = regcache_sync(ahub->regmap_apbif);
> +	if (ret)
> +		return ret;
> +
> +	ret = regcache_sync(ahub->regmap_ahub);
> +	if (ret)
> +		return ret;
>  

The regcache syncing is corrected now in v2, but I missed to disable the
clocks in the error path :) I'll make a v3 around next Tuesday. If
you'll spot anything else that needs to be improved, please let me know.
