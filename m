Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A44BC433DB
	for <linux-tegra@archiver.kernel.org>; Tue, 22 Dec 2020 09:02:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DB6772312D
	for <linux-tegra@archiver.kernel.org>; Tue, 22 Dec 2020 09:02:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725909AbgLVJCX (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 22 Dec 2020 04:02:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725895AbgLVJCW (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 22 Dec 2020 04:02:22 -0500
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com [IPv6:2607:f8b0:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 240F1C0617A6
        for <linux-tegra@vger.kernel.org>; Tue, 22 Dec 2020 01:01:42 -0800 (PST)
Received: by mail-pg1-x534.google.com with SMTP id w5so7993610pgj.3
        for <linux-tegra@vger.kernel.org>; Tue, 22 Dec 2020 01:01:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=3q7nnCnJmd4O4D32PC0P8xH1+bdbk1CdNF9NmfMW4t0=;
        b=Sw8hWqsmWEV28OZ97FyOgXyFgk5shKHWAxZzHcRzRhaM/6+T4brrF3/aXanmbfPjRw
         /A9CHWFxY/26ovZDBEoLzvrVEQgYuX/8xBOFFAOh2S++/KtpIaGJfhKZuA8vaiEUG6N5
         RDqNcxOViH+za8EEfeOTF4OJ0FgNLYkqGyciyEF6yFonDS/ytj6QebompmK2qd5iwMxT
         f60gJWZOOaEE42z2GFxRM7tJMnnNTqxHJqeFzNzO5GVHLT7/VnICWMEMwFNfUuNd7lT8
         CMqaiMF7EhSgACQ9J+vlj6sz3hYK3bX6+CzSrtrtNmrSTvIrdM+em0PwSBTuQL1T2brh
         GG/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=3q7nnCnJmd4O4D32PC0P8xH1+bdbk1CdNF9NmfMW4t0=;
        b=dmVw/bxRFSho2NMUnHrRfy7GK0ncjZew22QIH0Tf339ARbLcx5XTD8h4h1uA/Z2hvz
         wRSd5mwvpKFAdjftkQaDyRJXQsNygWxqdjmOGmCWm0XsbFvhIsr/XIGcWaNNIUTyI33g
         ZIY4VP8/hySKFNLLktI3xUCWlt0d6FMDZwOmdkgPtwc5lp/TpgZ2OxHHSABuKFhhqBeo
         E2tUU3ok5ZbHNHs980E+rgOxBKecOcdA3BCj5u1BTUzDWUFmWteSmdeUhf4QAg0NgnwR
         KdQtNGQTHgKmooaorDK2HE7PhI2kUrGr9I40oF9IpD4ezb4+jHDQKQ7KnWnpwHYXPmSg
         e5FQ==
X-Gm-Message-State: AOAM530KMcByRcg2rSE/BCJJ3iOBJFdRPZnIjV2DET9t6T67FgkzX6hH
        HPO+5/NiVf/BtOyOvlPD88heYA==
X-Google-Smtp-Source: ABdhPJzpaUuhCwigtZPkt7tXXBF91xrRM3nJ/y/UBldoNdmIzxgqD3l3BVqGdS+DNg3W0X8ggHASsA==
X-Received: by 2002:a62:864e:0:b029:1ab:e82c:d724 with SMTP id x75-20020a62864e0000b02901abe82cd724mr15830943pfd.9.1608627701598;
        Tue, 22 Dec 2020 01:01:41 -0800 (PST)
Received: from localhost ([122.172.20.109])
        by smtp.gmail.com with ESMTPSA id o14sm14548124pgr.44.2020.12.22.01.01.40
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 22 Dec 2020 01:01:40 -0800 (PST)
Date:   Tue, 22 Dec 2020 14:31:39 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Mark Brown <broonie@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Peter Geis <pgwipeout@gmail.com>,
        Nicolas Chauvet <kwizart@gmail.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Kevin Hilman <khilman@kernel.org>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Viresh Kumar <vireshk@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-clk@vger.kernel.org
Subject: Re: [PATCH v2 15/48] opp: Support set_opp() customization without
 requiring to use regulators
Message-ID: <20201222090139.vopgc2ju72kr4ujy@vireshk-i7>
References: <20201217180638.22748-1-digetx@gmail.com>
 <20201217180638.22748-16-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201217180638.22748-16-digetx@gmail.com>
User-Agent: NeoMutt/20180716-391-311a52
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 17-12-20, 21:06, Dmitry Osipenko wrote:
> Support set_opp() customization without requiring to use regulators. This
> is needed by drivers which want to use dev_pm_opp_set_rate() for changing
> rates of a multiple clocks and don't need to touch regulator.
> 
> One example is NVIDIA Tegra30/114 SoCs which have two sibling 3D hardware
> units which should be use to the same clock rate, meanwhile voltage
> scaling is done using a power domain. In this case OPP table doesn't have
> a regulator, causing a NULL dereference in _set_opp_custom().
> 
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/opp/core.c | 16 ++++++++++++----
>  1 file changed, 12 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/opp/core.c b/drivers/opp/core.c
> index 3d02fe33630b..625dae7a5ecb 100644
> --- a/drivers/opp/core.c
> +++ b/drivers/opp/core.c
> @@ -828,17 +828,25 @@ static int _set_opp_custom(const struct opp_table *opp_table,
>  			   struct dev_pm_opp_supply *old_supply,
>  			   struct dev_pm_opp_supply *new_supply)
>  {
> -	struct dev_pm_set_opp_data *data;
> +	struct dev_pm_set_opp_data *data, tmp_data;
> +	unsigned int regulator_count;
>  	int size;
>  
> -	data = opp_table->set_opp_data;
> +	if (opp_table->set_opp_data) {
> +		data = opp_table->set_opp_data;
> +		regulator_count = opp_table->regulator_count;
> +	} else {
> +		data = &tmp_data;
> +		regulator_count = 0;
> +	}
> +
>  	data->regulators = opp_table->regulators;
> -	data->regulator_count = opp_table->regulator_count;
> +	data->regulator_count = regulator_count;
>  	data->clk = opp_table->clk;
>  	data->dev = dev;
>  
>  	data->old_opp.rate = old_freq;
> -	size = sizeof(*old_supply) * opp_table->regulator_count;
> +	size = sizeof(*old_supply) * regulator_count;
>  	if (!old_supply)
>  		memset(data->old_opp.supplies, 0, size);
>  	else

I don't see you making use of this in this patchset. How did you get this to
crash ?

-- 
viresh
