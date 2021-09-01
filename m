Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21BB3C432BE
	for <linux-tegra@archiver.kernel.org>; Wed,  1 Sep 2021 04:42:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0014D60BD3
	for <linux-tegra@archiver.kernel.org>; Wed,  1 Sep 2021 04:42:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241858AbhIAEne (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 1 Sep 2021 00:43:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33854 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241827AbhIAEnd (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 1 Sep 2021 00:43:33 -0400
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ADB5CC061760
        for <linux-tegra@vger.kernel.org>; Tue, 31 Aug 2021 21:42:37 -0700 (PDT)
Received: by mail-pf1-x429.google.com with SMTP id y17so1034393pfl.13
        for <linux-tegra@vger.kernel.org>; Tue, 31 Aug 2021 21:42:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=aqRbC7OOz0ApYRD7bkXLn6fuH45+VCn9w1jsepqRlwo=;
        b=rmYbuOxTZ+6f1mjLuKFFeXrXBEq+QAkPP1aN8DhuASGDG4MeFgKpJRvIT/d1WvZkw8
         /YYMBKdBrUUuXhHKPj4yEFdLRPXmFZYZmmxAy+dZ/rkRhZFLEBjFU7QvXdGW8W8Hv3nx
         RBFHkE8ldm6CKEmHXxAMtmOCpR/38i4QmyqvEtzbTX3bh6cTVTcabJ6sUdTwptFKxhqc
         B/r/Rfx2mPPaAM9Ngv1pz4aBNWJ3Vy1cdVIJGUpVy2m783J7M4r9zORinvNj0wFRUM2i
         j+Z0QP99zMtU+S/APlD4UYvzjdMCibSiY0vX736A4lcESZpPRtcwbUDWPQ2DlPdf5nhy
         AlhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=aqRbC7OOz0ApYRD7bkXLn6fuH45+VCn9w1jsepqRlwo=;
        b=EOrlx9OEkGIiUO2KXGCC3VjQJPWEw7UDdcLgv7Z81TU8yaTOc9HIpBDbxo6V7XQGWu
         R1vhnIyj+euo/BhrBnSYCrRsz0lt3AkJJE+570wmSqVqKxip3GhooIaizz51PXfwDBGZ
         7IiTrDO7C6cbMsMWL9lM8pplXSwPm8VgHPH1XNHeahUb7zfw8GdsydvIgYpxfZL7OlrI
         xlp5c11TN5JPJK3t3Due68/40bYaQ4gH+A8df7AK1d8NsDd6MAMTZIMB0Ak8P4gthAaV
         dKcTb6EfoNPO9e8uZyVIBx55ZCgW55BBjEcJUskNNP4xfkf/oge1U7S2QB/DP9+mvegx
         hIWA==
X-Gm-Message-State: AOAM5311Yaydm/QrvC5vU1Nur0DGS5Vnip8rREfR5og6JCljywghM2bw
        UZs9A4Jf3oeA42OiXVQdvSpxW6K5jM+o+A==
X-Google-Smtp-Source: ABdhPJxBLmO5TuD7amKUzz3cLmrbwBzUCWEtO7lH32rA7hSv3e5M0kUewmugYpzwLQwteyHfKDsIJQ==
X-Received: by 2002:a62:cf86:0:b029:3e0:7cef:9e03 with SMTP id b128-20020a62cf860000b02903e07cef9e03mr32469702pfg.0.1630471357279;
        Tue, 31 Aug 2021 21:42:37 -0700 (PDT)
Received: from localhost ([122.172.201.85])
        by smtp.gmail.com with ESMTPSA id 31sm22105352pgy.26.2021.08.31.21.42.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Aug 2021 21:42:36 -0700 (PDT)
Date:   Wed, 1 Sep 2021 10:12:35 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Kevin Hilman <khilman@kernel.org>,
        Viresh Kumar <vireshk@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Nishanth Menon <nm@ti.com>,
        linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-pm@vger.kernel.org
Subject: Re: [PATCH v10 2/8] opp: Allow dev_pm_opp_set_clkname() to replace
 released clock
Message-ID: <20210901044235.2je35y3ajtctrall@vireshk-i7>
References: <20210831135450.26070-1-digetx@gmail.com>
 <20210831135450.26070-3-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210831135450.26070-3-digetx@gmail.com>
User-Agent: NeoMutt/20180716-391-311a52
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 31-08-21, 16:54, Dmitry Osipenko wrote:
> The opp_table->clk is set to error once clock is released by
> dev_pm_opp_put_clkname(). This doesn't allow to set clock again,

I am not sure why are you required to set the clk again here ? I mean,
users aren't expected to put clkname in the middle of using it. The
set-name API also checks that the OPP list should be empty in such a
case.

> until OPP table is re-created from scratch. Check opp_table->clk
> for both NULL and ERR_PTR to allow the clock's replacement.
> 
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/opp/core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/opp/core.c b/drivers/opp/core.c
> index dde8a5cc948c..602e502d092e 100644
> --- a/drivers/opp/core.c
> +++ b/drivers/opp/core.c
> @@ -2146,7 +2146,7 @@ struct opp_table *dev_pm_opp_set_clkname(struct device *dev, const char *name)
>  	}
>  
>  	/* clk shouldn't be initialized at this point */
> -	if (WARN_ON(opp_table->clk)) {
> +	if (WARN_ON(!IS_ERR_OR_NULL(opp_table->clk))) {
>  		ret = -EBUSY;
>  		goto err;
>  	}
> -- 
> 2.32.0

-- 
viresh
