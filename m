Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A783EC433DB
	for <linux-tegra@archiver.kernel.org>; Mon, 11 Jan 2021 09:12:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4472522AAB
	for <linux-tegra@archiver.kernel.org>; Mon, 11 Jan 2021 09:12:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727976AbhAKJLy (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 11 Jan 2021 04:11:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54034 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727623AbhAKJLy (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 11 Jan 2021 04:11:54 -0500
Received: from mail-vs1-xe36.google.com (mail-vs1-xe36.google.com [IPv6:2607:f8b0:4864:20::e36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF10EC061786
        for <linux-tegra@vger.kernel.org>; Mon, 11 Jan 2021 01:11:13 -0800 (PST)
Received: by mail-vs1-xe36.google.com with SMTP id h6so9325108vsr.6
        for <linux-tegra@vger.kernel.org>; Mon, 11 Jan 2021 01:11:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rzsqb244fAIaB0c3Hwq/Q8yeHQrbTVz3BLbnT43mepE=;
        b=RpjsJo01PdFt62gzMkdlO86lMnwyovgap9eY12cGxMf3hDn8GwbNuVluZLOvm1JEo9
         dXxUa1/loNb8fF2e5MZDtxUm5+sa6RX3psbO8UbyGN6o6zSp+eUPCGrj/kvdAtkpqZrM
         TFFI+Q/fVHNTx2BG2y3lf4l8dgDIcnb8PVidXWvsNrXkktt1CWr0ma6rD8UtTyfixOzd
         t5eCg0nJXTm9eOeN0W2xLdBx1itJBAeIoGmtNjgIUBSEM4MYqWfzOBr211UAPKsWvhi5
         7T3npWvl/XQFa5vIMaheXCf0kdHsjstZz4lCl8GxnidCnh036wvkcdIoRpAzJhXKnWGt
         2Rww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rzsqb244fAIaB0c3Hwq/Q8yeHQrbTVz3BLbnT43mepE=;
        b=a45vae2igSNcWbdxQt8ZAKE0SL4UWdVEScszszqTORZ9LciuYgBrCs++6wEMvXPMjL
         9yKDpRjaXZ1uJGpKASpMwnoUGAM4bxaIyXrCa5+Ngt4H8OA0QV4gTV9ky+BLP5V0cQlx
         avbYllNr8/dJYQNdfOulkVVATd9FIUtLxm04+Bya3v1BNa2aphyFivOBciDo17+EK0+A
         X0yUX4RnbMvoAaVkEPowT1w1Xz1sHp196B7G2OTp5dtCKDU9feKSjKiU62ShZbCHrNYr
         1HR0MtyBzSa3cOFz1BzvLLOYMa79NPpqsJSQvEgkgFQPohyOG6N4lNPGCj5YKci3Lf+q
         2ibQ==
X-Gm-Message-State: AOAM533MR/bi/k+FuN4TElFQW8219Gyjw3bv2aOEuaRir8jl3murcd1e
        07g/ZYgd84kFjGUXTvtpY1nwtbh5lk9Nvbsf4nbzDA==
X-Google-Smtp-Source: ABdhPJxfQRto1X00FIn3dyo94DunInqE+v0CkSyA5YHYpNlEegjIQEQyhhdsn0xw6MoEjOK1Fms4ez7UWeuBFR/o/7g=
X-Received: by 2002:a67:e286:: with SMTP id g6mr12425479vsf.42.1610356272969;
 Mon, 11 Jan 2021 01:11:12 -0800 (PST)
MIME-Version: 1.0
References: <20201217180638.22748-1-digetx@gmail.com> <20201217180638.22748-21-digetx@gmail.com>
In-Reply-To: <20201217180638.22748-21-digetx@gmail.com>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Mon, 11 Jan 2021 10:10:36 +0100
Message-ID: <CAPDyKFpc+YqPU0_mNFuRm6H+2c536BOd=PiHawNTUwfv1ZS_7g@mail.gmail.com>
Subject: Re: [PATCH v2 20/48] PM: domains: Make set_performance_state()
 callback optional
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Kevin Hilman <khilman@kernel.org>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Viresh Kumar <vireshk@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-tegra <linux-tegra@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Thu, 17 Dec 2020 at 19:07, Dmitry Osipenko <digetx@gmail.com> wrote:
>
> Make set_performance_state() callback optional in order to remove the
> need from power domain drivers to implement a dummy callback. If callback
> isn't implemented by a GENPD driver, then the performance state is passed
> to the parent domain.
>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>

Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>

This should be ready to be picked up, but maybe it's easier if you
could send this to the linux-pm mailing list separately. Then Rafael
can pick it up.

Kind regards
Uffe

> ---
>  drivers/base/power/domain.c | 11 +++++------
>  1 file changed, 5 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/base/power/domain.c b/drivers/base/power/domain.c
> index 9a14eedacb92..a3e1bfc233d4 100644
> --- a/drivers/base/power/domain.c
> +++ b/drivers/base/power/domain.c
> @@ -339,9 +339,11 @@ static int _genpd_set_performance_state(struct generic_pm_domain *genpd,
>                         goto err;
>         }
>
> -       ret = genpd->set_performance_state(genpd, state);
> -       if (ret)
> -               goto err;
> +       if (genpd->set_performance_state) {
> +               ret = genpd->set_performance_state(genpd, state);
> +               if (ret)
> +                       goto err;
> +       }
>
>         genpd->performance_state = state;
>         return 0;
> @@ -399,9 +401,6 @@ int dev_pm_genpd_set_performance_state(struct device *dev, unsigned int state)
>         if (!genpd)
>                 return -ENODEV;
>
> -       if (unlikely(!genpd->set_performance_state))
> -               return -EINVAL;
> -
>         if (WARN_ON(!dev->power.subsys_data ||
>                      !dev->power.subsys_data->domain_data))
>                 return -EINVAL;
> --
> 2.29.2
>
