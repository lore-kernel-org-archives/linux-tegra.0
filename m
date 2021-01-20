Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07B82C10F0B
	for <linux-tegra@archiver.kernel.org>; Wed, 20 Jan 2021 11:21:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D322223331
	for <linux-tegra@archiver.kernel.org>; Wed, 20 Jan 2021 11:21:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725779AbhATLUb (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 20 Jan 2021 06:20:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48906 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731679AbhATJrf (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 20 Jan 2021 04:47:35 -0500
Received: from mail-vs1-xe2d.google.com (mail-vs1-xe2d.google.com [IPv6:2607:f8b0:4864:20::e2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B4C2C061757
        for <linux-tegra@vger.kernel.org>; Wed, 20 Jan 2021 01:46:51 -0800 (PST)
Received: by mail-vs1-xe2d.google.com with SMTP id o186so4916182vso.1
        for <linux-tegra@vger.kernel.org>; Wed, 20 Jan 2021 01:46:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=nhkW5Un12MQxFKkR9JsfkRF/gz1LnCi9m0FMvMURDwI=;
        b=EDHUMoJhmI1vDbf8WoGqzB0P8ceHOj5SdAnr2Fra+YO2uuty8NaFRqlpwt1+fuHAbu
         btkX0AfouIJVoNP4D95p9U/fmMZco3eBu7FcIEdWDZqvfghi7T8Z1V2P9l+VF9KpOfDJ
         WJOSPi+ZFWYoaZ1CUtwlfV5exs58PEPnZDh1t+DRVhTOQ8jd1OIrOUBctpJtNrWX2uOY
         E6lwdvlFe7m1GwvtJESG69Q+SsqsbG0Jy/2IjdQx+k9rqUrVB4ilgjP/sAT7SQupFwPV
         IMRUpCQ5EwwbE14Z9WPtQWh8Eeo180qitc4WtpQYUVRuhPWdz70SGwIox3WTVWzZencA
         CzTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nhkW5Un12MQxFKkR9JsfkRF/gz1LnCi9m0FMvMURDwI=;
        b=Uko3OAUJljYRLxOw99m1yDgJJWmpEVsISaK0wiBbfuenwKffxL7DeI2vb3B4/MK39P
         hvAOEeXAOOxv3pB5Cbq7ZOtYDSGq8/sjjaig9N+lmNqxwA/POOwMRiycrRoxmE4MWJ2l
         3tU9ghS3z2/Vdkh6g4DI2Y62lfchUKsePwMA/Qo98XrRyTCmSAQSh+5pdVu91Hyse3lS
         20nkAqczvpEcdOaBhY/CW8vSzvz23Ukg5x0IdTshYYxxYtkDbkwEalFzpaxkfrvGi29n
         rTxSUnRwIq2/a7oxAo5MiICCjaAR6U1Z9iXyNCwzn3EeMrFv/WKamgNoSlZWqYScC9nd
         e3rQ==
X-Gm-Message-State: AOAM532v6ZXcF/FMQtQUqv8icHHS1Ig7mg7NTBGd6OF7fe8kfwf970Xc
        DBLlGhrJGq+wMZpzwVx2xcDZzi70hseyc/jSRePqQA==
X-Google-Smtp-Source: ABdhPJwO6uu53BOw77rfLTS5GBUN3JZG76q4E0f/Siu6uksMYN3b96L0snD4x7kn508rPkM54zSM0QQ2t+NOS+nO6Rs=
X-Received: by 2002:a67:f997:: with SMTP id b23mr5655937vsq.34.1611136010227;
 Wed, 20 Jan 2021 01:46:50 -0800 (PST)
MIME-Version: 1.0
References: <20210120015010.14191-1-digetx@gmail.com> <20210120015010.14191-2-digetx@gmail.com>
 <20210120043933.6ilryvgkhvnsrei7@vireshk-i7>
In-Reply-To: <20210120043933.6ilryvgkhvnsrei7@vireshk-i7>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Wed, 20 Jan 2021 10:46:14 +0100
Message-ID: <CAPDyKFp-7CEY42PCEGa97_89Ew6QysbV7pBBQOSLwBKAZwFpvg@mail.gmail.com>
Subject: Re: [PATCH v4 1/3] PM: domains: Make set_performance_state() callback optional
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Viresh Kumar <viresh.kumar@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Peter Geis <pgwipeout@gmail.com>,
        Nicolas Chauvet <kwizart@gmail.com>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Kevin Hilman <khilman@kernel.org>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Viresh Kumar <vireshk@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Matt Merhar <mattmerhar@protonmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-tegra <linux-tegra@vger.kernel.org>,
        Linux PM <linux-pm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Wed, 20 Jan 2021 at 05:39, Viresh Kumar <viresh.kumar@linaro.org> wrote:
>
> On 20-01-21, 04:50, Dmitry Osipenko wrote:
> > Make set_performance_state() callback optional in order to remove the
> > need from power domain drivers to implement a dummy callback. If callback
> > isn't implemented by a GENPD driver, then the performance state is passed
> > to the parent domain.
> >
> > Tested-by: Peter Geis <pgwipeout@gmail.com>
> > Tested-by: Nicolas Chauvet <kwizart@gmail.com>
> > Tested-by: Matt Merhar <mattmerhar@protonmail.com>
> > [tested on NVIDIA Tegra20/30/124 SoCs]
> > Suggested-by: Ulf Hansson <ulf.hansson@linaro.org>
> > Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> > ---
> >  drivers/base/power/domain.c | 33 ++++++++++++++++++---------------
> >  1 file changed, 18 insertions(+), 15 deletions(-)
> >
> > diff --git a/drivers/base/power/domain.c b/drivers/base/power/domain.c
> > index 9a14eedacb92..0bd0cdc30393 100644
> > --- a/drivers/base/power/domain.c
> > +++ b/drivers/base/power/domain.c
> > @@ -297,6 +297,18 @@ static int _genpd_reeval_performance_state(struct generic_pm_domain *genpd,
> >       return state;
> >  }
> >
> > +static int _genpd_xlate_performance_state(struct generic_pm_domain *src_genpd,
> > +                                       struct generic_pm_domain *dst_genpd,
> > +                                       unsigned int pstate)
>
> I would name them as genpd and parent, that makes it more readable for it.

... and while at it, probably also drop the "_" as the prefix of the
function name.

Other than that, please add:

Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>

Kind regards
Uffe
