Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04432C433E0
	for <linux-tegra@archiver.kernel.org>; Mon, 18 Jan 2021 10:48:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D0B94229C6
	for <linux-tegra@archiver.kernel.org>; Mon, 18 Jan 2021 10:48:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388989AbhARKsQ (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 18 Jan 2021 05:48:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59766 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390202AbhARKeb (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 18 Jan 2021 05:34:31 -0500
Received: from mail-vs1-xe36.google.com (mail-vs1-xe36.google.com [IPv6:2607:f8b0:4864:20::e36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A0509C061575
        for <linux-tegra@vger.kernel.org>; Mon, 18 Jan 2021 02:33:26 -0800 (PST)
Received: by mail-vs1-xe36.google.com with SMTP id r24so8895322vsg.10
        for <linux-tegra@vger.kernel.org>; Mon, 18 Jan 2021 02:33:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=adiPbiEP1YT6K9N1O0mWeeG4Pxclh7kWVlewQqbqeNE=;
        b=I3qVuBr5uDMMAfGcazh4VHKHknGJ0eoa0uFRy3D86VXscngmO6tKadEb8Tf2J9n3rY
         Wk6qdTAlcNr2fk4JZjTwHDYfs1/VYbw1AFxrB8AW28CwyG+Y+8XVdpzq4llf/epKoR9k
         iZniMhqgneDNT6L6Wjpyapo/qMi/m+7C7A7EN7HZLGMnKFVv3c8LSjXZkXN3dZiQg4pN
         yKdif6tHIgU3b373dIpgsnOyC/d38I9Js8UYY9lpS1Bk/TCj7cBiILsGEGCRvuR+Boa/
         22QUys2sv67Jll9loPfC0rqQBGwqY6hAPPuSDD+BDM4QKipHQ4T0SQ/wZoxMugDQuXCj
         4Lhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=adiPbiEP1YT6K9N1O0mWeeG4Pxclh7kWVlewQqbqeNE=;
        b=N+0RfXb0t+JKh+cQdix8IrWbFvSmHsi++f5LV2xTO66WkcvkJiHL6Sx4oiI68UQ97p
         w3lgiqO9WeTTmJmXOmygZvr4eCEVX5xB4ovE+GLvn4YEildGbLypxXoUrTwum/4dBgC7
         Ydifv7lWlX0RmdNskB7/Bxsz/DRm8QEVJb1KwWoKC0DW2Mi4LBPDZoocDUMu0wc70IWK
         Moyzw6v84h3hdbMLdNOin43hkp0o1kRlmMJmCmJHYE/QmVCSwDdS642aT8bUrgzgprtn
         IaQKOO20uviwuqc3NEtbeuujWjiFBtG0V7GLg/oUG9kfzWeRpibQ9zFr3mfUnjxHjoV7
         vS1A==
X-Gm-Message-State: AOAM5308SStVR139NmR/skOtS1ZWctfIiC3Vm7qZXUNQF5SmpZP+l50C
        9UePj/5mxEK9ElktcII/5ms8aZg6RwjAJLygahC2Ig==
X-Google-Smtp-Source: ABdhPJz7J/RbHIZCaRXKtv4bI/4J9V1bWxYQzBjJDzVZXkaPGqqSpE/x0WWPE3R4rM1rIh4V9JZj+GO+3R+IOR7Ne3c=
X-Received: by 2002:a67:c787:: with SMTP id t7mr7915130vsk.48.1610966005685;
 Mon, 18 Jan 2021 02:33:25 -0800 (PST)
MIME-Version: 1.0
References: <20210118011330.4145-1-digetx@gmail.com> <20210118011330.4145-4-digetx@gmail.com>
In-Reply-To: <20210118011330.4145-4-digetx@gmail.com>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Mon, 18 Jan 2021 11:32:48 +0100
Message-ID: <CAPDyKFpKHQQjbeBdnx1AVHmYJFD0XaXSqps8XZUyCK_9VB5FeA@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] PM: domains: Make of_genpd_add_subdomain() to
 return -EPROBE_DEFER
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
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

On Mon, 18 Jan 2021 at 02:13, Dmitry Osipenko <digetx@gmail.com> wrote:
>
> Driver of a power domain provider may not be ready at the time of
> of_genpd_add_subdomain() invocation. Make this function to return
> -EPROBE_DEFER instead of -ENOENT in order to remove a need from
> power domain drivers to handle the error code specially.
>
> Suggested-by: Ulf Hansson <ulf.hansson@linaro.org>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>

Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>

Kind regards
Uffe

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
>         mutex_unlock(&gpd_list_lock);
>
> -       return ret;
> +       return ret == -ENOENT ? -EPROBE_DEFER : ret;
>  }
>  EXPORT_SYMBOL_GPL(of_genpd_add_subdomain);
>
> --
> 2.29.2
>
