Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EB15C433DB
	for <linux-tegra@archiver.kernel.org>; Mon, 18 Jan 2021 07:33:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CADBD2074D
	for <linux-tegra@archiver.kernel.org>; Mon, 18 Jan 2021 07:33:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730146AbhARHdg (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 18 Jan 2021 02:33:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49292 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729956AbhARHde (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 18 Jan 2021 02:33:34 -0500
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com [IPv6:2607:f8b0:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DABB5C061575
        for <linux-tegra@vger.kernel.org>; Sun, 17 Jan 2021 23:32:53 -0800 (PST)
Received: by mail-pg1-x52d.google.com with SMTP id c22so10364314pgg.13
        for <linux-tegra@vger.kernel.org>; Sun, 17 Jan 2021 23:32:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=UMhJL5caw4dKw1CwGX77mZFeexFjGH0aeWN6ZWr6ovk=;
        b=KNJq3bPA96Dpa1yTGGu7jo/+fTh545mXilJRgYcQVPbZ3WA00tAIWiRT0ZXQ5dXtAM
         2pPPihlpGf3Jkz9Pf4hfGq4OXsLii7MUELzf/WlnbFYEf6/sydw5JCWsxkT8lI1zGTSI
         8dd/HLSswG8cwdAXk4dJACtvdhWbv9fEHfNQcDL63etrlATSHLhmk2/Cr7y4fJudE0f+
         wgB2mx4WrDc4DkLZAF1hQrQBGFsSC9TFA4Fhw68uBGvuClGQUkqv+sJyetLBbfYqDNE1
         k9+YfPfy4n0pWUBx+6TdY9+PiU5tTsEgX0vx2fGsXczaYb2VPbztquQBIVUn+XKdYmt9
         R4ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=UMhJL5caw4dKw1CwGX77mZFeexFjGH0aeWN6ZWr6ovk=;
        b=jBHtjfvSmqWv9PEjDvR/2JgJELAuvvKs9mpfQY7xQkbaN2oLnfkPJ8or31FgAE4Eq1
         U6tqGGbUBLT6wmGpMTwCBJB487WRtfxYAPNTS1iySI0JDpBXz0fis7JfMj/DMXqELQVt
         6DPHV0duUUGBUxTGArWuFBG18BCVHJjgwZMtsS7KJULRKvE3Mm1DiGMYj2L2qijJ3UzP
         PVZiPHrDlPr8cZ5ERZO/qtneB3+YJ6i8fO8ivLv0L8sSzwMmif7y1hEDVta80pHpZLpB
         FZkPmDfON8baAew9XCSieQ/u6wQab5lhozZnzBhjwDsPXVAz0aT9ujOKKl6CS3s4g0DF
         LL4A==
X-Gm-Message-State: AOAM532nNwaOU94t/d98d8DuxHWBKrI5nAGfcyoisB6PcocEgJCltVDY
        88vXEBHIM66MkdpHjpf8BloMKA==
X-Google-Smtp-Source: ABdhPJyGHTcyAjvaqRv8UDt1A+Jek+BzWSxBgjBJxtGGC2K3IQSUk9vQkJOu4Ijmg8jOlUy/8ZeLog==
X-Received: by 2002:aa7:978c:0:b029:1a9:1989:a07 with SMTP id o12-20020aa7978c0000b02901a919890a07mr25291846pfp.30.1610955173429;
        Sun, 17 Jan 2021 23:32:53 -0800 (PST)
Received: from localhost ([122.172.59.240])
        by smtp.gmail.com with ESMTPSA id j123sm1904965pfg.36.2021.01.17.23.32.52
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 17 Jan 2021 23:32:52 -0800 (PST)
Date:   Mon, 18 Jan 2021 13:02:50 +0530
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
Subject: Re: [PATCH v3 3/3] PM: domains: Make of_genpd_add_subdomain() to
 return -EPROBE_DEFER
Message-ID: <20210118073250.nw3herzysrguuxib@vireshk-i7>
References: <20210118011330.4145-1-digetx@gmail.com>
 <20210118011330.4145-4-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210118011330.4145-4-digetx@gmail.com>
User-Agent: NeoMutt/20180716-391-311a52
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 18-01-21, 04:13, Dmitry Osipenko wrote:
> Driver of a power domain provider may not be ready at the time of
> of_genpd_add_subdomain() invocation. Make this function to return
> -EPROBE_DEFER instead of -ENOENT in order to remove a need from
> power domain drivers to handle the error code specially.
> 
> Suggested-by: Ulf Hansson <ulf.hansson@linaro.org>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/base/power/domain.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/base/power/domain.c b/drivers/base/power/domain.c
> index 2ab77aa516eb..7ef6764ee30f 100644
> --- a/drivers/base/power/domain.c
> +++ b/drivers/base/power/domain.c
> @@ -2462,7 +2462,7 @@ int of_genpd_add_subdomain(struct of_phandle_args *parent_spec,
>  out:
>  	mutex_unlock(&gpd_list_lock);
>  
> -	return ret;
> +	return ret == -ENOENT ? -EPROBE_DEFER : ret;
>  }
>  EXPORT_SYMBOL_GPL(of_genpd_add_subdomain);
>  

Reviewed-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
