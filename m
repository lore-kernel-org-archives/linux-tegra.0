Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF1A2C4320A
	for <linux-tegra@archiver.kernel.org>; Tue, 24 Aug 2021 07:52:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CD0896135F
	for <linux-tegra@archiver.kernel.org>; Tue, 24 Aug 2021 07:52:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235043AbhHXHvT (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 24 Aug 2021 03:51:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40552 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235010AbhHXHvJ (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 24 Aug 2021 03:51:09 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC27DC061760
        for <linux-tegra@vger.kernel.org>; Tue, 24 Aug 2021 00:50:25 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id z2so43582247lft.1
        for <linux-tegra@vger.kernel.org>; Tue, 24 Aug 2021 00:50:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6QO1D4em1C1nHhx4CrZWdcZbA0xiY6t0RyCdsuKnSIc=;
        b=J+teq1gJxTGcdDdovG62/xyX0zhT90ekovliPz6FUvv+cDrIGlMWqeec3K5DhZKc9b
         sKzRTQMDvL7dFH9FPd5CtBuQJg+Yl4y2aHt19H1ZJaWGBeM6vKMdd16e3XeygeCCjpwz
         NZiY7+ewI6hasOprk90Ru4OtMSeauYeCE98rWJRp1keD1ZA9nOf0sBR2SfnGSQWWzcaj
         R9KJMY2CwAl6NH5DniF+cYgkyI8g7cQ3kPTvSyUA1+NWay+IXQ63Aovfs1ejma4xWtu/
         gezld7YZjfEnqsbWHNjvm7FZyx1xsix2sDbJjPRzLGU0RwB0mzKXgXdKc0C05/kRKjdc
         Vxtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6QO1D4em1C1nHhx4CrZWdcZbA0xiY6t0RyCdsuKnSIc=;
        b=R+MLfDgDvUr8RMmFO3BPURHjogQNUdQJ3gZegRG4bGk65k0wJlTJ/et3pw/mL0vwT6
         IItWo73iKXZ8RcBLT5vDFmt5V6HWNMgJbOgUHPfnleracid+AYYcazufEiCbau6vrdlG
         +RrNb/yX3yZul3ZyZdzlwqarl25Jz06tM+QtBgDaImrrkrqSRYU5KJuPPpeYKJdkKMj5
         RZAlyH2iH/Zw2TnKXsJPH6+sgkSf/jBZIs7G+Fn02qqU/BRNTVb5uwtA5cLYk+IAqG4a
         zI9mJ4q7a64HPljcqPsNVTmfGg6XEOg1WFNYlv9Tp1mTXxRpr2k99cP2pCeEz7EntL41
         NyoQ==
X-Gm-Message-State: AOAM530iHokJQLtxZV+aypzyAYGI1JCd/Yll0aJ3d6RBtHYOHQQNsvE1
        S24Fii4GjmDo27jKzTr0MjwQ+pRV+RfRySX1CJ9DsA==
X-Google-Smtp-Source: ABdhPJwx4dKcJvjHiOTt9/eKDcemiVgAnjhvJZRoh7bVIfSjwhVemY3ea6OxjbXR0eqxvl8sAu2ZYiMgikuVkG90MF0=
X-Received: by 2002:ac2:4d1c:: with SMTP id r28mr287872lfi.584.1629791424267;
 Tue, 24 Aug 2021 00:50:24 -0700 (PDT)
MIME-Version: 1.0
References: <20210823202412.25716-1-digetx@gmail.com>
In-Reply-To: <20210823202412.25716-1-digetx@gmail.com>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Tue, 24 Aug 2021 09:49:47 +0200
Message-ID: <CAPDyKFpsEMmuF4XzUX=ko4H3iBSu_77_+vozETg9njC94x8goA@mail.gmail.com>
Subject: Re: [PATCH v1] PM: domains: Improve runtime PM performance state handling
To:     Dmitry Osipenko <digetx@gmail.com>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Kevin Hilman <khilman@kernel.org>,
        Viresh Kumar <vireshk@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Nishanth Menon <nm@ti.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-tegra <linux-tegra@vger.kernel.org>,
        Linux PM <linux-pm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Mon, 23 Aug 2021 at 22:25, Dmitry Osipenko <digetx@gmail.com> wrote:
>
> GENPD core doesn't support handling performance state changes while
> consumer device is runtime-suspended or when runtime PM is disabled.
> GENPD core may override performance state that was configured by device
> driver while RPM of the device was disabled or device was RPM-suspended.
> Let's close that gap by allowing drivers to control performance state
> while RPM of a consumer device is disabled and to set up performance
> state of RPM-suspended device that will be applied by GENPD core on
> RPM-resume of the device.
>
> Fixes: 5937c3ce2122 ("PM: domains: Drop/restore performance state votes for devices at runtime PM")
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>

Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>

Rafael, if not too late, can you please queue this as a fix for v5.14?
I haven't heard about any regression, but the error is there.

Kind regards
Uffe

> ---
>  drivers/base/power/domain.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/base/power/domain.c b/drivers/base/power/domain.c
> index e1c8994ae225..3a13a942d012 100644
> --- a/drivers/base/power/domain.c
> +++ b/drivers/base/power/domain.c
> @@ -435,7 +435,7 @@ static void genpd_restore_performance_state(struct device *dev,
>  int dev_pm_genpd_set_performance_state(struct device *dev, unsigned int state)
>  {
>         struct generic_pm_domain *genpd;
> -       int ret;
> +       int ret = 0;
>
>         genpd = dev_to_genpd_safe(dev);
>         if (!genpd)
> @@ -446,7 +446,13 @@ int dev_pm_genpd_set_performance_state(struct device *dev, unsigned int state)
>                 return -EINVAL;
>
>         genpd_lock(genpd);
> -       ret = genpd_set_performance_state(dev, state);
> +       if (pm_runtime_suspended(dev)) {
> +               dev_gpd_data(dev)->rpm_pstate = state;
> +       } else {
> +               ret = genpd_set_performance_state(dev, state);
> +               if (!ret)
> +                       dev_gpd_data(dev)->rpm_pstate = 0;
> +       }
>         genpd_unlock(genpd);
>
>         return ret;
> --
> 2.32.0
>
