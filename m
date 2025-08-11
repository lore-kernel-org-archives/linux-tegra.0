Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com [209.85.219.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 179D1239E82
	for <linux-tegra@vger.kernel.org>; Mon, 11 Aug 2025 10:38:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754908684; cv=none; b=W2Y8c3Eqpg1NdEFTRt4cUSMK6xV5JCmZUoA/GqyR19Uohi6qHeauq0s5Remh9elVPOgrWRtUQYOFgMqOv6XJ5kuyRIpA1+5fcQ840k1FKrqv+E/EgwFo7IBK3eMvdtIl7lVBZPjf8kXO+FDR69XGYI9RlnEV8ojzEQWaVygph+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754908684; c=relaxed/simple;
	bh=XZHF0n8H867XHlXPQx2Z568uWIDx/pPp7gDATLqqwAU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=P6zIMme6GBximMcJ/gFSkgbGKDU48LngohrEi+0yVdntdgGD+zj680yKj2zSLRmR5NvBf2nn6AC3kExHMi/ksYReodIQy5wDmQhm5Z8NORodXFUQ6SGPvEWK6YKqOSGCUNUWkfu86u4nlFL42yqgm89teMgwVHj0FLaoFW0bKfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QBVNPWfY; arc=none smtp.client-ip=209.85.219.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QBVNPWfY"
Received: by mail-yb1-f175.google.com with SMTP id 3f1490d57ef6-e9066f408efso909206276.3
        for <linux-tegra@vger.kernel.org>; Mon, 11 Aug 2025 03:38:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1754908682; x=1755513482; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ffyxwyw8addnqKr26EOluv0zD0sB03PTkKSi1k3qjZ0=;
        b=QBVNPWfYUnVjJ/h2dKDHPWriO8EQtwd0AvO27RuUkrfBtDPZy92FelwHid+WzJFgi4
         brOEozdk3dQKdj7UIM7t7hS2OLbduf9EbuYPdZdCmuG4ywN8z8km1C+bFgFwTIkx/gxn
         h2riOr9VOOHw0j8gc69gPcOUs+amtmJxn9FAkAqKZr1lj8nRQfBFJIVHlSRgh/38Ecoo
         ejS+WpKVOsPiWLDn4UNDIM0I8zYeeot6nBf6h31Pt7bd1ctpe8nubteSxJrQ7S1REICP
         JFTEMUjusEQ2fKzWkePMKe+qMMzktJ7rYc/9tT1iCLlBkwO9SPYHEzusW+uw57gm2H4W
         e07A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754908682; x=1755513482;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ffyxwyw8addnqKr26EOluv0zD0sB03PTkKSi1k3qjZ0=;
        b=r8hIHbhfjYDPUgfQ/wVKHJ8J/CIueaXlcoING2mfjAEbwJDbCfVpI+K7ZsQtzyx14+
         ToBC7bXwgkesHD+91vuIn2dV1s2yzfqnX44sLLvA+X7S0EmqHkWnpQAZRzJpNvnGL8SO
         QpjQnnalW0TTI2qNwiuTMD2B8POMvgXY2ajfRJ23sX96ibzsvlsFmWUpnbBUVVpcn1LO
         KuwpIM44TT2lGDsB73L4/WnRnP7XDlWMmyk44BF8cqeQfafGPU90aq8T4PhX32Z6Ka0o
         a47u1uoY24qqrERLKoIZpy5B4JkbSgRVujtG64Y0DlBkiChtvaCj9NrdZPeyqisqeGsp
         AKwg==
X-Forwarded-Encrypted: i=1; AJvYcCUWsRsiIYoZPHszyUW4dLNLWzMOvci9xoSVuYiw96/sZFfbaasw43g9rgwgCo6opglfw77EKIw1DQQpoQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YznQV36+yU2BazRmJAKURcZ/KBVb1+ufHk9dur4oDUyKrqRcT0d
	rFtpsCOFHe3dJgDNq48YvzP9oapl/wMaZBM4WiSVnbM6cGPLzHVUw2n86ovpQDVVqQDLUb3iHOD
	TEHhZsxJnPVk+YJAdCZH3LerXw+R1IQmvSRb8K++5XA==
X-Gm-Gg: ASbGncu9al1a04/OIuY86X36uTXZxvzHL6M6C53clFzLFyzK3V16CAXr8Pdw++cVY+i
	4tFUYNBrzdgB+qA9RfYL8pvYugrAVAuIYvJndj7wFnj9uh6wwNtDuhX4cu57Y6o+N4ZOCc8462G
	FzB2Bc0HuVxFplMLcXzV/pZ6XAxwi7LMcGb7JPZS3rUg8NC7K+23cED+Yh3kROvEh+Lz73G9h1s
	c7zf0Q0
X-Google-Smtp-Source: AGHT+IHq7z8MGrZL9eQUvunOFR10BiyWjOBDwC6IHPp2y0K4MhVzM8oV5A4a9S2mJl00/AReb6Fgx328t2eQplBjq1o=
X-Received: by 2002:a05:690c:a4c1:20b0:71c:bf3:afb5 with SMTP id
 00721157ae682-71c0bf3b6b5mr61002717b3.17.1754908681687; Mon, 11 Aug 2025
 03:38:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250731121832.213671-1-jonathanh@nvidia.com>
In-Reply-To: <20250731121832.213671-1-jonathanh@nvidia.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 11 Aug 2025 12:37:25 +0200
X-Gm-Features: Ac12FXwal9A2ewQ1W53HjXWlcznLW4YwFGVrs-kYpRR0tXOk-MhSRWh0vo7aZ1s
Message-ID: <CAPDyKFr+uVDYBMvsN+L9XPToaD+Wr9P=SnnXyKB6ucqQ7se=7A@mail.gmail.com>
Subject: Re: [PATCH] soc/tegra: pmc: Ensure power-domains are in a known state
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 31 Jul 2025 at 14:18, Jon Hunter <jonathanh@nvidia.com> wrote:
>
> After commit 13a4b7fb6260 ("pmdomain: core: Leave powered-on genpds on
> until late_initcall_sync") was applied, the Tegra210 Jetson TX1 board
> failed to boot. Looking into this issue, before this commit was applied,
> if any of the Tegra power-domains were in 'on' state when the kernel
> booted, they were being turned off by the genpd core before any driver
> had chance to request them. This was purely by luck and a consequence of
> the power-domains being turned off earlier during boot. After this
> commit was applied, any power-domains in the 'on' state are kept on for
> longer during boot and therefore, may never transitioned to the off
> state before they are requested/used. The hang on the Tegra210 Jetson
> TX1 is caused because devices in some power-domains are accessed without
> the power-domain being turned off and on, indicating that the
> power-domain is not in a completely on state.
>
> From reviewing the Tegra PMC driver code, if a power-domain is in the
> 'on' state there is no guarantee that all the necessary clocks
> associated with the power-domain are on and even if they are they would
> not have been requested via the clock framework and so could be turned
> off later. Some power-domains also have a 'clamping' register that needs
> to be configured as well. In short, if a power-domain is already 'on' it
> is difficult to know if it has been configured correctly. Given that the
> power-domains happened to be switched off during boot previously, to
> ensure that they are in a good known state on boot, fix this by
> switching off any power-domains that are on initially when registering
> the power-domains with the genpd framework.
>
> Note that commit 05cfb988a4d0 ("soc/tegra: pmc: Initialise resets
> associated with a power partition") updated the
> tegra_powergate_of_get_resets() function to pass the 'off' to ensure
> that the resets for the power-domain are in the correct state on boot.
> However, now that we may power off a domain on boot, if it is on, it is
> better to move this logic into the tegra_powergate_add() function so
> that there is a single place where we are handling the initial state of
> the power-domain.
>
> Fixes: a38045121bf4 ("soc/tegra: pmc: Add generic PM domain support")
> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>

Thanks for looking into this!

I have picked this up via my pmdomain tree and applied it as a fix
with a stable tag. Please let me know if you prefer to take this via
your soc tree instead.

That said, I guess we have some use-cases on Tegra where it actually
would make sense to allow powered-on PM-domains to stay on during
boot. Although, at this point, it seems better to deal with those on a
case by case basis, as improvements on top.

Kind regards
Uffe


> ---
> Please note the commit hash 13a4b7fb6260 is based upon the current hash
> in -next. I have used the initial commit that added genpd support for
> Tegra in the fixes-tag because this issue has really existed since this
> was implemented.
>
>  drivers/soc/tegra/pmc.c | 51 +++++++++++++++++++++++------------------
>  1 file changed, 29 insertions(+), 22 deletions(-)
>
> diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
> index 2a5f24ee858c..034a2a535a1e 100644
> --- a/drivers/soc/tegra/pmc.c
> +++ b/drivers/soc/tegra/pmc.c
> @@ -1232,7 +1232,7 @@ static int tegra_powergate_of_get_clks(struct tegra_powergate *pg,
>  }
>
>  static int tegra_powergate_of_get_resets(struct tegra_powergate *pg,
> -                                        struct device_node *np, bool off)
> +                                        struct device_node *np)
>  {
>         struct device *dev = pg->pmc->dev;
>         int err;
> @@ -1247,22 +1247,6 @@ static int tegra_powergate_of_get_resets(struct tegra_powergate *pg,
>         err = reset_control_acquire(pg->reset);
>         if (err < 0) {
>                 pr_err("failed to acquire resets: %d\n", err);
> -               goto out;
> -       }
> -
> -       if (off) {
> -               err = reset_control_assert(pg->reset);
> -       } else {
> -               err = reset_control_deassert(pg->reset);
> -               if (err < 0)
> -                       goto out;
> -
> -               reset_control_release(pg->reset);
> -       }
> -
> -out:
> -       if (err) {
> -               reset_control_release(pg->reset);
>                 reset_control_put(pg->reset);
>         }
>
> @@ -1308,20 +1292,43 @@ static int tegra_powergate_add(struct tegra_pmc *pmc, struct device_node *np)
>                 goto set_available;
>         }
>
> -       err = tegra_powergate_of_get_resets(pg, np, off);
> +       err = tegra_powergate_of_get_resets(pg, np);
>         if (err < 0) {
>                 dev_err(dev, "failed to get resets for %pOFn: %d\n", np, err);
>                 goto remove_clks;
>         }
>
> -       if (!IS_ENABLED(CONFIG_PM_GENERIC_DOMAINS)) {
> -               if (off)
> -                       WARN_ON(tegra_powergate_power_up(pg, true));
> +       /*
> +        * If the power-domain is off, then ensure the resets are asserted.
> +        * If the power-domain is on, then power down to ensure that when is
> +        * it turned on the power-domain, clocks and resets are all in the
> +        * expected state.
> +        */
> +       if (off) {
> +               err = reset_control_assert(pg->reset);
> +               if (err) {
> +                       pr_err("failed to assert resets: %d\n", err);
> +                       goto remove_resets;
> +               }
> +       } else {
> +               err = tegra_powergate_power_down(pg);
> +               if (err) {
> +                       dev_err(dev, "failed to turn off PM domain %s: %d\n",
> +                               pg->genpd.name, err);
> +                       goto remove_resets;
> +               }
> +       }
>
> +       /*
> +        * If PM_GENERIC_DOMAINS is not enabled, power-on
> +        * the domain and skip the genpd registration.
> +        */
> +       if (!IS_ENABLED(CONFIG_PM_GENERIC_DOMAINS)) {
> +               WARN_ON(tegra_powergate_power_up(pg, true));
>                 goto remove_resets;
>         }
>
> -       err = pm_genpd_init(&pg->genpd, NULL, off);
> +       err = pm_genpd_init(&pg->genpd, NULL, true);
>         if (err < 0) {
>                 dev_err(dev, "failed to initialise PM domain %pOFn: %d\n", np,
>                        err);
> --
> 2.43.0
>
