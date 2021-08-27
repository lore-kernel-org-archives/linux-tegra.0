Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DE93C432BE
	for <linux-tegra@archiver.kernel.org>; Fri, 27 Aug 2021 14:24:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4D98F6101C
	for <linux-tegra@archiver.kernel.org>; Fri, 27 Aug 2021 14:24:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245223AbhH0OZG (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 27 Aug 2021 10:25:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47578 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233282AbhH0OZF (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 27 Aug 2021 10:25:05 -0400
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 78BBAC061757
        for <linux-tegra@vger.kernel.org>; Fri, 27 Aug 2021 07:24:16 -0700 (PDT)
Received: by mail-lj1-x22b.google.com with SMTP id f2so11780797ljn.1
        for <linux-tegra@vger.kernel.org>; Fri, 27 Aug 2021 07:24:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=bXOZzmBEt0Fm+6WjGbwh30k7Cu1VzrKXxzkcT37QPJc=;
        b=JB5jzj8kSOuO1igcguQIEXYo2hx0zf6mDL55EA+hRqWPaHIthyapEkKzED8VvYOGvG
         +OB2Ul5lStBGJbZTpSbqfSi3O7TO6h7buQ7IwSDBp0/yH7L7630zV722l9wjw94TthFg
         ackTa0ps55GFEs03YqHF0eD/AH5pTW0hvphQWkNXC4703YFRoi0CL+0ZhjrAnalUylmK
         nWdKm052W/0EsTE8uD/NdeLtXL9HfSFZfBLh5wksEgQ48FujcZfNATT8S3XIvmuegQxE
         OWFVcoNmXoO/6pfx4cQacgK8H1CwEiRRRD7gE6FS6pEntFTEJc5Yf9bw0Dl92Eiy73gF
         4KyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=bXOZzmBEt0Fm+6WjGbwh30k7Cu1VzrKXxzkcT37QPJc=;
        b=szYiXN7bLx2qT5bVrYUxQ9zs4mPzkoyn4ZSOTlno86ORyaIobijLmgHPEIL5muniK6
         JBOhMFD3H5A/aMFKgPg4/JCffW8AOG3ADz5qeED8BB/K9AipH/ZXB1NEv3gGfHVO9ZTG
         0VQvVGdcqEAVoSwsp8c/+5UbS/GORmXVgrijotSzkrp/qJ3M+MCDAcZVFv7dsLXqHNkO
         Em4cUMg2285+n9bBsYKtSRM5yBPLi+01+OIwZbiWvpb1UhU5wn+0fbCLlK5dOY6FNwMv
         M1oql4DggSby37K7cFO1h2R6ZijaYLnx3IPwwMAKDnywMdbMGrAcpzk3wB/ly4m+l3Q+
         pmgw==
X-Gm-Message-State: AOAM531zkpEb27h3Fn/ok4mqh656XCGFkNGT9jHmfgf3Ood0vyObsgBY
        IjiUvhNC3wUrMMg9W58uK0TAyQRG9Mo5KcJUwZdNxg==
X-Google-Smtp-Source: ABdhPJzTlKeElmonIFy7CztdpHqQdCOYNiO4vdm/GGq26xTAY//iB9JurYYiJh+N/c2b78xL4DEVMlMrCetx1YehllY=
X-Received: by 2002:a2e:a410:: with SMTP id p16mr8105081ljn.364.1630074253320;
 Fri, 27 Aug 2021 07:24:13 -0700 (PDT)
MIME-Version: 1.0
References: <20210827013415.24027-1-digetx@gmail.com> <20210827013415.24027-5-digetx@gmail.com>
In-Reply-To: <20210827013415.24027-5-digetx@gmail.com>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Fri, 27 Aug 2021 16:23:36 +0200
Message-ID: <CAPDyKFqYWxY9znP1BEzogu0k7J1KRMXoSkUOeN4xHRq=gCHvTw@mail.gmail.com>
Subject: Re: [PATCH v9 4/8] PM: domains: Add get_performance_state() callback
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
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

On Fri, 27 Aug 2021 at 03:37, Dmitry Osipenko <digetx@gmail.com> wrote:
>
> Add get_performance_state() callback that retrieves and initializes
> performance state of a device attached to a power domain. This removes
> inconsistency of the performance state with hardware state.

Can you please try to elaborate a bit more on the use case. Users need
to know when it makes sense to implement the callback - and so far we
tend to document this through detailed commit messages.

Moreover, please state that implementing the callback is optional.

>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/base/power/domain.c | 32 +++++++++++++++++++++++++++++---
>  include/linux/pm_domain.h   |  2 ++
>  2 files changed, 31 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/base/power/domain.c b/drivers/base/power/domain.c
> index 3a13a942d012..8b828dcdf7f8 100644
> --- a/drivers/base/power/domain.c
> +++ b/drivers/base/power/domain.c
> @@ -2700,15 +2700,41 @@ static int __genpd_dev_pm_attach(struct device *dev, struct device *base_dev,
>                 goto err;
>         } else if (pstate > 0) {
>                 ret = dev_pm_genpd_set_performance_state(dev, pstate);
> -               if (ret)
> +               if (ret) {
> +                       dev_err(dev, "failed to set required performance state for power-domain %s: %d\n",
> +                               pd->name, ret);

Moving the dev_err() here, leads to that we won't print an error if
of_get_required_opp_performance_state() fails, a few lines above, is
that intentional?

>                         goto err;
> +               }
>                 dev_gpd_data(dev)->default_pstate = pstate;
>         }
> +
> +       if (pd->get_performance_state && !dev_gpd_data(dev)->default_pstate) {
> +               bool dev_suspended = false;
> +
> +               ret = pd->get_performance_state(pd, base_dev, &dev_suspended);
> +               if (ret < 0) {
> +                       dev_err(dev, "failed to get performance state for power-domain %s: %d\n",
> +                               pd->name, ret);
> +                       goto err;
> +               }
> +
> +               pstate = ret;
> +
> +               if (dev_suspended) {

The dev_suspended thing looks weird.

Perhaps it was needed before dev_pm_genpd_set_performance_state()
didn't check pm_runtime_disabled()?

> +                       dev_gpd_data(dev)->rpm_pstate = pstate;
> +               } else if (pstate > 0) {
> +                       ret = dev_pm_genpd_set_performance_state(dev, pstate);
> +                       if (ret) {
> +                               dev_err(dev, "failed to set required performance state for power-domain %s: %d\n",
> +                                       pd->name, ret);
> +                               goto err;
> +                       }
> +               }
> +       }

Overall, what we seem to be doing here, is to retrieve a value for an
initial/default performance state for a device and then we want to set
it to make sure the vote becomes aggregated and finally set for the
genpd.

With your suggested change, there are now two ways to get the
initial/default state. One is through the existing
of_get_required_opp_performance_state() and the other is by using a
new genpd callback.

That said, perhaps we would get a bit cleaner code by moving the "get
initial/default performance state" thingy, into a separate function
and then call it from here. If this function returns a valid
performance state, then we should continue to set the state, by
calling dev_pm_genpd_set_performance_state() and update
dev_gpd_data(dev)->default_pstate accordingly.

Would that work, do you think?

> +
>         return 1;
>
>  err:
> -       dev_err(dev, "failed to set required performance state for power-domain %s: %d\n",
> -               pd->name, ret);
>         genpd_remove_device(pd, dev);
>         return ret;
>  }
> diff --git a/include/linux/pm_domain.h b/include/linux/pm_domain.h
> index 67017c9390c8..4f78b31791ae 100644
> --- a/include/linux/pm_domain.h
> +++ b/include/linux/pm_domain.h
> @@ -133,6 +133,8 @@ struct generic_pm_domain {
>                                                  struct dev_pm_opp *opp);
>         int (*set_performance_state)(struct generic_pm_domain *genpd,
>                                      unsigned int state);
> +       int (*get_performance_state)(struct generic_pm_domain *genpd,
> +                                    struct device *dev, bool *dev_suspended);

Comparing the ->set_performance_state() callback, which sets a
performance state for the PM domain (genpd) - this new callback is
about retrieving the *initial/default* performance state for a
*device* that gets attached to a genpd.

That said, may I suggest renaming the callback to
"dev_get_performance_state", or something along those lines.

>         struct gpd_dev_ops dev_ops;
>         s64 max_off_time_ns;    /* Maximum allowed "suspended" time. */
>         ktime_t next_wakeup;    /* Maintained by the domain governor */
> --
> 2.32.0
>

Kind regards
Uffe
