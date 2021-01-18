Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CB2CC433DB
	for <linux-tegra@archiver.kernel.org>; Mon, 18 Jan 2021 11:19:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 40068221FF
	for <linux-tegra@archiver.kernel.org>; Mon, 18 Jan 2021 11:19:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390138AbhARLTD (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 18 Jan 2021 06:19:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41180 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390135AbhARLSv (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 18 Jan 2021 06:18:51 -0500
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com [IPv6:2607:f8b0:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D4A9C061575
        for <linux-tegra@vger.kernel.org>; Mon, 18 Jan 2021 03:18:09 -0800 (PST)
Received: by mail-pg1-x536.google.com with SMTP id p18so10707631pgm.11
        for <linux-tegra@vger.kernel.org>; Mon, 18 Jan 2021 03:18:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=vCOkqFp410/php68wIRNQR6nVYYVNeZ2EZUFKVUPxHE=;
        b=ezT0GZsmJBLOfurM03WOn2TH3aLnuBejXUqCkZ+NK5SRGAz2JKR3x1O6idpx8Lcj1y
         0DLHQbq74VYLZHUDI9nLk3/HEtEDabFAT9XCZqQZCnLGcktr5ymGPSkqescO+8q0zxz6
         4t09QgDxM2HTQpk1L0jpwMc2iy8lqttqsoH8Lb2Rv0jVDXX7GtOeKpbHmgvhHGqaRlZu
         t45b4ndPwrUdB0XBDGk9eQl0K22WmC7Pd1KzoZXyUrQ04URjcKde2N/Hz6kgLB61T82T
         FQDHpgyT3kty8uiNwyuKBJZREsN/LtS86t+ZwNiEh0mPOGk+8zEXwq656s41toAB97Ce
         kG9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=vCOkqFp410/php68wIRNQR6nVYYVNeZ2EZUFKVUPxHE=;
        b=o4TwuVf8w3LnP8YAifFBuA9+F8euR61HA2Vdb1B5j1xpyMv4+jUGFYY4nlfRFo/z+I
         IJEXe/rbe7c0JjZyBzhsUtUCzvgnzfctrE31g/mszv7DzWLiBC9SWdD5DKwVX/ONijrL
         W6NgMT4iMog9qZMH61JJ/T4/K5cd+/zTeLWcdG3bIU3VUh6KzRZoJOTsH8DdzCS1YzIg
         8nrBfB/UPyec/18C46qigT041ZPwF2aNt58hHSYNp1FBOGEr5EK+hHTwGxAIEbNX0qxs
         GuFbFrgmyQyVTi0vadkj5AyCyt33+B+Di0eqDpjeDQG/v17oTJVcxFNP5wveVaJYsT9v
         NsvA==
X-Gm-Message-State: AOAM530ydkEs2ACQuDSRnxFDTunXrV1VhlK33P4EDYUzt7yDz+5NZLll
        pwuHeV46Vy3rPZETKwieAGl2eg==
X-Google-Smtp-Source: ABdhPJyhitKtN+Jw9TBHJr0LGjKjQtmfdaFk9RpKz7yIieZEnFiC+GNt+YuNqD4+blf9WjeEIS9HtQ==
X-Received: by 2002:a62:2e47:0:b029:1b7:840e:edc7 with SMTP id u68-20020a622e470000b02901b7840eedc7mr4547464pfu.52.1610968688492;
        Mon, 18 Jan 2021 03:18:08 -0800 (PST)
Received: from localhost ([122.172.59.240])
        by smtp.gmail.com with ESMTPSA id bv21sm16763805pjb.1.2021.01.18.03.18.07
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 18 Jan 2021 03:18:07 -0800 (PST)
Date:   Mon, 18 Jan 2021 16:48:05 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Mark Brown <broonie@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Peter Geis <pgwipeout@gmail.com>,
        Nicolas Chauvet <kwizart@gmail.com>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Kevin Hilman <khilman@kernel.org>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Viresh Kumar <vireshk@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Nishanth Menon <nm@ti.com>,
        Yangtao Li <tiny.windzz@gmail.com>,
        Matt Merhar <mattmerhar@protonmail.com>,
        linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-pm@vger.kernel.org
Subject: Re: [PATCH v3 11/12] opp: Handle missing OPP table in
 dev_pm_opp_xlate_performance_state()
Message-ID: <20210118111805.ex5sou3ya2kpue4w@vireshk-i7>
References: <20210118005524.27787-1-digetx@gmail.com>
 <20210118005524.27787-12-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210118005524.27787-12-digetx@gmail.com>
User-Agent: NeoMutt/20180716-391-311a52
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 18-01-21, 03:55, Dmitry Osipenko wrote:
> NVIDIA Tegra SoCs have a power domains topology such that child domains
> only clamp a power rail, while parent domain controls shared performance
> state of the multiple child domains. In this case child's domain doesn't
> need to have OPP table. Hence we want to allow children power domains to
> pass performance state to the parent domain if child's domain doesn't have
> OPP table.
> 
> The dev_pm_opp_xlate_performance_state() gets src_table=NULL if a child
> power domain doesn't have OPP table and in this case we should pass the
> performance state to the parent domain.
> 
> Tested-by: Peter Geis <pgwipeout@gmail.com>
> Tested-by: Nicolas Chauvet <kwizart@gmail.com>
> Tested-by: Matt Merhar <mattmerhar@protonmail.com>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/opp/core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/opp/core.c b/drivers/opp/core.c
> index 7726c4c40b53..ca8c6acc29f4 100644
> --- a/drivers/opp/core.c
> +++ b/drivers/opp/core.c
> @@ -2419,7 +2419,7 @@ int dev_pm_opp_xlate_performance_state(struct opp_table *src_table,
>  	 * and so none of them have the "required-opps" property set. Return the
>  	 * pstate of the src_table as it is in such cases.
>  	 */
> -	if (!src_table->required_opp_count)
> +	if (!src_table || !src_table->required_opp_count)
>  		return pstate;
>  
>  	for (i = 0; i < src_table->required_opp_count; i++) {

Applied. Thanks.

-- 
viresh
