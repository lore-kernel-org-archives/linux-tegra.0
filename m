Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B24D0C433E0
	for <linux-tegra@archiver.kernel.org>; Mon, 18 Jan 2021 07:32:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5F5452074D
	for <linux-tegra@archiver.kernel.org>; Mon, 18 Jan 2021 07:32:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732292AbhARHcD (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 18 Jan 2021 02:32:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48956 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731683AbhARHcC (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 18 Jan 2021 02:32:02 -0500
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D9835C061573
        for <linux-tegra@vger.kernel.org>; Sun, 17 Jan 2021 23:31:21 -0800 (PST)
Received: by mail-pj1-x102e.google.com with SMTP id m5so9199779pjv.5
        for <linux-tegra@vger.kernel.org>; Sun, 17 Jan 2021 23:31:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=PY0uy6NXL8Q8EhFZDU06lNu4ol3ZElDrwc3qLIkcY6E=;
        b=QxkL/hD3cZtT6xsDMdredDyexX/gVCLtud6YWfXxraeNUpTL7FK5gmsLJTg2iVRJS7
         aoW4P83dcUpME4hiOW7YpF+gEKLqfRP4cEtW6Z0nhIAldPvvtsYMG49Imi2QoRhdb81m
         odNyrCDIsen2O0zuFNPX/7OZfw8vuykMeRcEFXQDFEYEU5kn0vf6s25IU8N0xqC0k17J
         4h+5MgsTwxKQcNK56JwZMfuzcz0KI/QoLOOUb+dWHpqkQb4hHk4jo/2BxTphHkk7b6bW
         ZTW08XbiD2079rZa1XV41h0/d53lnpjJBgqc3PM3o+JYtnfBpV5qPT9Vf7PyFCzTownv
         6PnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=PY0uy6NXL8Q8EhFZDU06lNu4ol3ZElDrwc3qLIkcY6E=;
        b=TXWdsN/SfdX0ry5Vig0YK5SQvAjfJmgXt5LQmYKIWK/3+hFGLpnPZTLm+Q5+1WLg6C
         gHrOg0KQZdpKqftc9/f3Oi0+zobHLZfQmvG9exnvhj2gZA7VVwCTVUnZ+OBHeFjbrJHk
         ssRQJgbSa3bRAsR6jCBWu3AZ1YyF7RAAoPFHCyje/xjvvLhP/eSNAR9ZQVv2uWQlf4se
         bB8fgVFGRs1RDJhGWiZKQfvA2LTWZhzLGIVsgoljw46iF9gwIPrwEf4+SQW5iyUvYMRg
         PyltdK5brwesaHYtWGZsTyq/5A3Qc/CJD0TG2OcbgT1qZCZtVUetBD2bFRdNQlVb4qn6
         D7JA==
X-Gm-Message-State: AOAM530i5cuNOwEVCGSdbFAT7vRLPRBGqXnrUQYqa887C32EW9Cro7NJ
        nb6oyMTvH5bxjHA8aedgSIeq9A==
X-Google-Smtp-Source: ABdhPJweEUfWcdHK+dCgzPndeMpxWzZu5dAGXt6u1P7BynaV6YJLA3RS8+nkC7AXuntnG9scmL7MEw==
X-Received: by 2002:a17:90a:9915:: with SMTP id b21mr24701361pjp.101.1610955081417;
        Sun, 17 Jan 2021 23:31:21 -0800 (PST)
Received: from localhost ([122.172.59.240])
        by smtp.gmail.com with ESMTPSA id q35sm15685655pjh.38.2021.01.17.23.31.20
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 17 Jan 2021 23:31:20 -0800 (PST)
Date:   Mon, 18 Jan 2021 13:01:18 +0530
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
Subject: Re: [PATCH v3 2/3] PM: domains: Add "performance" column to debug
 summary
Message-ID: <20210118073118.lwf4q2fcsx3n7n7c@vireshk-i7>
References: <20210118011330.4145-1-digetx@gmail.com>
 <20210118011330.4145-3-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210118011330.4145-3-digetx@gmail.com>
User-Agent: NeoMutt/20180716-391-311a52
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 18-01-21, 04:13, Dmitry Osipenko wrote:
> Add "performance" column to debug summary which shows performance state
> of all power domains and theirs devices.
> 
> Tested-by: Peter Geis <pgwipeout@gmail.com>
> Tested-by: Nicolas Chauvet <kwizart@gmail.com>
> Tested-by: Matt Merhar <mattmerhar@protonmail.com>
> Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/base/power/domain.c | 19 +++++++++++++++----
>  1 file changed, 15 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/base/power/domain.c b/drivers/base/power/domain.c
> index a3e1bfc233d4..2ab77aa516eb 100644
> --- a/drivers/base/power/domain.c
> +++ b/drivers/base/power/domain.c
> @@ -2951,7 +2951,15 @@ static void rtpm_status_str(struct seq_file *s, struct device *dev)
>  	else
>  		WARN_ON(1);
>  
> -	seq_puts(s, p);
> +	seq_printf(s, "%-25s  ", p);
> +}
> +
> +static void perf_status_str(struct seq_file *s, struct device *dev)
> +{
> +	struct generic_pm_domain_data *gpd_data;
> +
> +	gpd_data = to_gpd_data(dev->power.subsys_data->domain_data);
> +	seq_put_decimal_ull(s, "", gpd_data->performance_state);
>  }
>  
>  static int genpd_summary_one(struct seq_file *s,
> @@ -2979,7 +2987,7 @@ static int genpd_summary_one(struct seq_file *s,
>  	else
>  		snprintf(state, sizeof(state), "%s",
>  			 status_lookup[genpd->status]);
> -	seq_printf(s, "%-30s  %-15s ", genpd->name, state);
> +	seq_printf(s, "%-30s  %-50s %u", genpd->name, state, genpd->performance_state);
>  
>  	/*
>  	 * Modifications on the list require holding locks on both
> @@ -2987,6 +2995,8 @@ static int genpd_summary_one(struct seq_file *s,
>  	 * Also genpd->name is immutable.
>  	 */
>  	list_for_each_entry(link, &genpd->parent_links, parent_node) {
> +		if (list_is_first(&link->parent_node, &genpd->parent_links))
> +			seq_printf(s, "\n%48s", " ");
>  		seq_printf(s, "%s", link->child->name);
>  		if (!list_is_last(&link->parent_node, &genpd->parent_links))
>  			seq_puts(s, ", ");
> @@ -3001,6 +3011,7 @@ static int genpd_summary_one(struct seq_file *s,
>  
>  		seq_printf(s, "\n    %-50s  ", kobj_path);
>  		rtpm_status_str(s, pm_data->dev);
> +		perf_status_str(s, pm_data->dev);
>  		kfree(kobj_path);
>  	}
>  
> @@ -3016,9 +3027,9 @@ static int summary_show(struct seq_file *s, void *data)
>  	struct generic_pm_domain *genpd;
>  	int ret = 0;
>  
> -	seq_puts(s, "domain                          status          children\n");
> +	seq_puts(s, "domain                          status          children                           performance\n");
>  	seq_puts(s, "    /device                                             runtime status\n");
> -	seq_puts(s, "----------------------------------------------------------------------\n");
> +	seq_puts(s, "----------------------------------------------------------------------------------------------\n");
>  
>  	ret = mutex_lock_interruptible(&gpd_list_lock);
>  	if (ret)

Reviewed-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
