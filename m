Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F30C9C433E0
	for <linux-tegra@archiver.kernel.org>; Wed, 20 Jan 2021 04:41:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9F4B223137
	for <linux-tegra@archiver.kernel.org>; Wed, 20 Jan 2021 04:41:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726155AbhATElN (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 19 Jan 2021 23:41:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39030 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727140AbhATEkT (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 19 Jan 2021 23:40:19 -0500
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E391C061757
        for <linux-tegra@vger.kernel.org>; Tue, 19 Jan 2021 20:39:39 -0800 (PST)
Received: by mail-pj1-x102f.google.com with SMTP id md11so1372120pjb.0
        for <linux-tegra@vger.kernel.org>; Tue, 19 Jan 2021 20:39:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=3Mw9kpTWYLs3GYeFCfv2XLbWScki4E8QbYrJLATCMOM=;
        b=NSOrtz9JoqUpYLUCCHjbFEdlVTD56bqaffClcuXWTCrFL897Lom+Qbl/QZRG8jUavo
         3BVHucGwNpSvG0TN0uzfs/15kOixsoGwr8cAkkZLHw1iKT1Fd/re6YcN3qoWaR4RSryj
         X5cI35dcMrlx6A+1XOsn10yQZuQ+JvIwix4AF9qhS4cpacFOSXlaol/YjhXX32T+kMLd
         WcknRbRNUX85FbG4GwK36nACqMC3Jc0LCvtv7cFCZCKK1+jL4ieziZFp8Vfi20lCTTbN
         Dt8QtG7YTyV/mN0q68LmIAzplQu6gYW0MGfJmEzp+44ebL/CksaqbgtbMJ1+DX9F8TlH
         8lLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=3Mw9kpTWYLs3GYeFCfv2XLbWScki4E8QbYrJLATCMOM=;
        b=CZXcHiTDeWiZCVDT/VTkWHBeqZ2AohbTfly1Gq/ZKGAxxzlxar/Knh1ERGvxn8CdRP
         YgAJJbG+JdChXbd5U2csP6ziFpUNcn1vp9IK+jJj/HA0qbiWyy3w9RVD2AuVRpXKfN1g
         9hFY8DXmPMsW66VLpQ+20PGGONTdDxZEALMHYo9af++euLjKJONO3QfUg4nhpPOR0Ioa
         gJyozRPvjplD1DnqeKx286FqL67HMEyLcAwmUPjGIufCI0lPiUCbY0tcwAwmOquw3EFb
         DB/Sq1yIAQsjiSNlFVnvGLSU8ejK/P6Trp/AMrA1KfsV6JndaNm8/nLeGe8gv9O65Ta5
         83cg==
X-Gm-Message-State: AOAM531/Yu2qNd42f3w2pBKbnMei3EXWD14xqBGtvGturLhIzsVBlR13
        J6uR9QQh9LDVMf/JQAz90FOG9Q==
X-Google-Smtp-Source: ABdhPJxWrwGkrMAt216utAgHlcqTJR4nbRCrGF/RIvEBvOStwKqO/SPw4ZkPZWTjLIEYXgSFndBaEA==
X-Received: by 2002:a17:902:b692:b029:de:43aa:6537 with SMTP id c18-20020a170902b692b02900de43aa6537mr8177507pls.65.1611117578969;
        Tue, 19 Jan 2021 20:39:38 -0800 (PST)
Received: from localhost ([122.172.59.240])
        by smtp.gmail.com with ESMTPSA id u68sm620672pfb.70.2021.01.19.20.39.37
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 19 Jan 2021 20:39:38 -0800 (PST)
Date:   Wed, 20 Jan 2021 10:09:33 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Peter Geis <pgwipeout@gmail.com>,
        Nicolas Chauvet <kwizart@gmail.com>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Kevin Hilman <khilman@kernel.org>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Viresh Kumar <vireshk@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Matt Merhar <mattmerhar@protonmail.com>,
        linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-pm@vger.kernel.org
Subject: Re: [PATCH v4 1/3] PM: domains: Make set_performance_state()
 callback optional
Message-ID: <20210120043933.6ilryvgkhvnsrei7@vireshk-i7>
References: <20210120015010.14191-1-digetx@gmail.com>
 <20210120015010.14191-2-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210120015010.14191-2-digetx@gmail.com>
User-Agent: NeoMutt/20180716-391-311a52
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 20-01-21, 04:50, Dmitry Osipenko wrote:
> Make set_performance_state() callback optional in order to remove the
> need from power domain drivers to implement a dummy callback. If callback
> isn't implemented by a GENPD driver, then the performance state is passed
> to the parent domain.
> 
> Tested-by: Peter Geis <pgwipeout@gmail.com>
> Tested-by: Nicolas Chauvet <kwizart@gmail.com>
> Tested-by: Matt Merhar <mattmerhar@protonmail.com>
> [tested on NVIDIA Tegra20/30/124 SoCs]
> Suggested-by: Ulf Hansson <ulf.hansson@linaro.org>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/base/power/domain.c | 33 ++++++++++++++++++---------------
>  1 file changed, 18 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/base/power/domain.c b/drivers/base/power/domain.c
> index 9a14eedacb92..0bd0cdc30393 100644
> --- a/drivers/base/power/domain.c
> +++ b/drivers/base/power/domain.c
> @@ -297,6 +297,18 @@ static int _genpd_reeval_performance_state(struct generic_pm_domain *genpd,
>  	return state;
>  }
>  
> +static int _genpd_xlate_performance_state(struct generic_pm_domain *src_genpd,
> +					  struct generic_pm_domain *dst_genpd,
> +					  unsigned int pstate)

I would name them as genpd and parent, that makes it more readable for it.

-- 
viresh
