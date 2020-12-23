Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9518C43381
	for <linux-tegra@archiver.kernel.org>; Wed, 23 Dec 2020 04:36:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7ABE020E65
	for <linux-tegra@archiver.kernel.org>; Wed, 23 Dec 2020 04:36:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727277AbgLWEf4 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 22 Dec 2020 23:35:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56878 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727038AbgLWEfz (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 22 Dec 2020 23:35:55 -0500
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com [IPv6:2607:f8b0:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3EA62C061257
        for <linux-tegra@vger.kernel.org>; Tue, 22 Dec 2020 20:34:50 -0800 (PST)
Received: by mail-pg1-x52e.google.com with SMTP id 15so9808646pgx.7
        for <linux-tegra@vger.kernel.org>; Tue, 22 Dec 2020 20:34:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=n/wQ/8FF3ZQQmDW8wRJInIGGffY6h+3NeQmSLgJVsG0=;
        b=OFVqi0FZly+cr6h2L4MgV3W+0bqGCFrv37DumbpBBHHWKR10mlk8j96RhehvYC0ZKZ
         A7gveeGO4wUPNnptPGhKrlG+oY9ETV8EggwWNNJcSxmSKnIhp4D6iv6jEddwltALPRsH
         XoYuBifhBdhegWVRfh980lFbJW3ZCSqNzWxi8omP37WhPmGjiRZ+cWui/1OKijohx3Ni
         VZ3o0KDN4OIc1fPJ6UYDAexLzU558i9zpREZpptiCrCuZwWp74C+otCB7ziEAp6JpBCe
         /0WINPCLg0o7wHc+WB03uTQnpOkKqeEM2Jo/o42Mju6zYgkhMy6UlsZnrI4SeRLP+Rxr
         M+6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=n/wQ/8FF3ZQQmDW8wRJInIGGffY6h+3NeQmSLgJVsG0=;
        b=EotiapozAYLzJBUdL3DMFzWpjtvkKEvVFtsKL0eDBDysbLWH3DMqI9t/qD4tWkArEQ
         pur2w6AFq8L5Gtcov/9UMAq7fqwDh+mna4iI0Wq/onoGHL2koQLomq907X/iAHd5MwdT
         vKXVikAFO36DjXvxtO+7uj43lrHw8D0jXrvwEDfJPkiPwOYqVUP9/e/OlJqoli79Dl/K
         MlHwQFHgXOBS85OUEWuJNZW9o+m73HiZk5X4g20z48mhu/MPMg8t0SuXcUCTOhhNKqbL
         t8aFpsxm8ohJYjpje5cPR6736ESWrdjoNWg+rkFftbDcAy4qx4zQ2DGzPF8gZFY0eXxg
         hR+g==
X-Gm-Message-State: AOAM530ict4k07uMdgceB+/IUr5L9k+Io58VbyHihjD6bwJj69HeI8ch
        n/3Pgw36q1AnU5Qvz8G6sPDHKg==
X-Google-Smtp-Source: ABdhPJy/6iEXMfinC0IgZ7fpt7I2g+zIxTjZQnxLRTk8cjqPdAagKq6g9nUKUea3gO9B/DZE0Q9zrw==
X-Received: by 2002:a63:6305:: with SMTP id x5mr22354072pgb.216.1608698089700;
        Tue, 22 Dec 2020 20:34:49 -0800 (PST)
Received: from localhost ([122.172.20.109])
        by smtp.gmail.com with ESMTPSA id p16sm21154516pju.47.2020.12.22.20.34.48
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 22 Dec 2020 20:34:48 -0800 (PST)
Date:   Wed, 23 Dec 2020 10:04:43 +0530
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
Subject: Re: [PATCH v2 19/48] opp: Fix adding OPP entries in a wrong order if
 rate is unavailable
Message-ID: <20201223043443.rklw5er6hck3gl4y@vireshk-i7>
References: <20201217180638.22748-1-digetx@gmail.com>
 <20201217180638.22748-20-digetx@gmail.com>
 <20201222091255.wentz5hyt726qezg@vireshk-i7>
 <db6273e6-8406-b7ae-b51d-48ceb6d21962@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <db6273e6-8406-b7ae-b51d-48ceb6d21962@gmail.com>
User-Agent: NeoMutt/20180716-391-311a52
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 22-12-20, 22:19, Dmitry Osipenko wrote:
> 22.12.2020 12:12, Viresh Kumar пишет:
> > On 17-12-20, 21:06, Dmitry Osipenko wrote:
> >> Fix adding OPP entries in a wrong (opposite) order if OPP rate is
> >> unavailable. The OPP comparison is erroneously skipped if OPP rate is
> >> missing, thus OPPs are left unsorted.
> >>
> >> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> >> ---
> >>  drivers/opp/core.c | 23 ++++++++++++-----------
> >>  drivers/opp/opp.h  |  2 +-
> >>  2 files changed, 13 insertions(+), 12 deletions(-)
> >>
> >> diff --git a/drivers/opp/core.c b/drivers/opp/core.c
> >> index 34f7e530d941..5c7f130a8de2 100644
> >> --- a/drivers/opp/core.c
> >> +++ b/drivers/opp/core.c
> >> @@ -1531,9 +1531,10 @@ static bool _opp_supported_by_regulators(struct dev_pm_opp *opp,
> >>  	return true;
> >>  }
> >>  
> >> -int _opp_compare_key(struct dev_pm_opp *opp1, struct dev_pm_opp *opp2)
> >> +int _opp_compare_key(struct dev_pm_opp *opp1, struct dev_pm_opp *opp2,
> >> +		     bool rate_not_available)
> >>  {
> >> -	if (opp1->rate != opp2->rate)
> >> +	if (!rate_not_available && opp1->rate != opp2->rate)
> > 
> > rate will be 0 for both the OPPs here if rate_not_available is true and so this
> > change shouldn't be required.
> 
> The rate_not_available is negated in the condition. This change is
> required because both rates are 0 and then we should proceed to the
> levels comparison.

Won't that happen without this patch ?

> I guess it's not clear by looking at this patch, please see a full
> version of the function:
> 
> int _opp_compare_key(struct dev_pm_opp *opp1, struct dev_pm_opp *opp2,
>          bool rate_not_available)
> {
>   if (!rate_not_available && opp1->rate != opp2->rate)
>     return opp1->rate < opp2->rate ? -1 : 1;
>   if (opp1->bandwidth && opp2->bandwidth &&
>       opp1->bandwidth[0].peak != opp2->bandwidth[0].peak)
>     return opp1->bandwidth[0].peak < opp2->bandwidth[0].peak ? -1 : 1;
>   if (opp1->level != opp2->level)
>     return opp1->level < opp2->level ? -1 : 1;
>   return 0;
> }
> 
> Perhaps we could check whether opp1->rate=0, like it's done for the
> opp1->bandwidth. I'll consider this variant for v3, thanks.

-- 
viresh
