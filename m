Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3F78C43381
	for <linux-tegra@archiver.kernel.org>; Tue, 12 Jan 2021 13:59:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 638292311E
	for <linux-tegra@archiver.kernel.org>; Tue, 12 Jan 2021 13:59:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728458AbhALN64 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 12 Jan 2021 08:58:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58464 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726389AbhALN6z (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 12 Jan 2021 08:58:55 -0500
Received: from mail-ua1-x92d.google.com (mail-ua1-x92d.google.com [IPv6:2607:f8b0:4864:20::92d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B4EDC061786
        for <linux-tegra@vger.kernel.org>; Tue, 12 Jan 2021 05:58:09 -0800 (PST)
Received: by mail-ua1-x92d.google.com with SMTP id i25so847416uat.0
        for <linux-tegra@vger.kernel.org>; Tue, 12 Jan 2021 05:58:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6uzmNSw20ft7oRzWqEZqV9S8k/R5ZsdzLcidOw2rxoo=;
        b=Eg010ubkxaWhfDM0PU8gjarRqkKadjRJQPnOugAHfzhORcyZQXreR7rlmqiFWLZ1MS
         rhaZm7AQ8DBpTgjK335lku1LdgOiSRDSOB3FXw2P9zkiC3bdTiBkOzdD4zLGNImdvbV0
         ZhnmkSzmfad41WOlqhog5GrJ8T1lrGf+DpKLjB3eGGZvesGo2NjPcCE5qYccmICtSq0p
         6KQ6rqtO28fiDVziyS8M+/K2DzxyyRmR0PBDo3xr+0Y3h957EzLDN8Zb/IQ9vuhXUJRF
         IMtP13hwn7GHEijrFz8nwHKVZTeurovdPf0THi6htBwIqVy30gY0ZZlti0yp2sJMWvBU
         66Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6uzmNSw20ft7oRzWqEZqV9S8k/R5ZsdzLcidOw2rxoo=;
        b=Eyg6EfSJF45+SWpnnb3RrIojpwAbdcfo/mDsTTDHUxc59zYDaq6t9iW3V7n2Fv1t6j
         L0c02tLj3Bd+Kie1+F68EtJDl3UYN3SHn2LZpQdLnq1p2zqgFCHJC2mUANEeGpLHPl9n
         uzwFBGCVXYrpDKjksJJf/BtQttWR2t5aw1CZfNlxEnTV9k0z9UwOawZ7U6tgygSezuS+
         DNZm6SK4rKLOLDwSuVowxNVu0hglla+keApCuodgA6taJ1C/zKVixMjGleos5bP36b9X
         1Be7VyZ8agPU14lmfU53dDghUeEzRIFlPu1/itSUDP0Itq7AbCLQcuJxd50cbu//dtJi
         dkwg==
X-Gm-Message-State: AOAM531zxB7YqicXXCYKT+mphTMIw1IPFVzg87GL5kxBivAcqB+BHTsl
        40JXBuFjTuAHMzJgca2lspefdnos/1bDU0VgVxqWsA==
X-Google-Smtp-Source: ABdhPJyfLT2NLNzTnsmwlb+x0g4vZDvoZq8BWXVRnnXD9z7+TH2sy1/fRZM2auZwRQ/DbXlSdHtQ2Xso9GuIsW5C8KE=
X-Received: by 2002:ab0:78d:: with SMTP id c13mr3535166uaf.129.1610459888685;
 Tue, 12 Jan 2021 05:58:08 -0800 (PST)
MIME-Version: 1.0
References: <20201217180638.22748-1-digetx@gmail.com> <20201217180638.22748-29-digetx@gmail.com>
In-Reply-To: <20201217180638.22748-29-digetx@gmail.com>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Tue, 12 Jan 2021 14:57:32 +0100
Message-ID: <CAPDyKFpQFyO_Qfoy0-_=+e3Lp8vRx8yaYjmPReT_5WJZSLet-w@mail.gmail.com>
Subject: Re: [PATCH v2 28/48] soc/tegra: Introduce core power domain driver
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Mark Brown <broonie@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
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
        driverdevel <devel@driverdev.osuosl.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        DTML <devicetree@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        linux-tegra <linux-tegra@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Thu, 17 Dec 2020 at 19:07, Dmitry Osipenko <digetx@gmail.com> wrote:
>
> NVIDIA Tegra SoCs have multiple power domains, each domain corresponds
> to an external SoC power rail. Core power domain covers vast majority of
> hardware blocks within a Tegra SoC. The voltage of a power domain should
> be set to a value which satisfies all devices within a power domain. Add
> driver for the core power domain in order to manage the voltage state of
> the domain. This allows us to support a system-wide DVFS on Tegra.
>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>

FYI: from a genpd provider driver point of view, this looks good to
me. However, withholding my ack for the next version, just to make
sure I take a second look.

Kind regards
Uffe

> ---
>  drivers/soc/tegra/Kconfig             |   6 ++
>  drivers/soc/tegra/Makefile            |   1 +
>  drivers/soc/tegra/core-power-domain.c | 125 ++++++++++++++++++++++++++
>  include/soc/tegra/common.h            |   6 ++
>  4 files changed, 138 insertions(+)
>  create mode 100644 drivers/soc/tegra/core-power-domain.c
>
> diff --git a/drivers/soc/tegra/Kconfig b/drivers/soc/tegra/Kconfig
> index bcd61ae59ba3..fccbc168dd87 100644
> --- a/drivers/soc/tegra/Kconfig
> +++ b/drivers/soc/tegra/Kconfig
> @@ -16,6 +16,7 @@ config ARCH_TEGRA_2x_SOC
>         select SOC_TEGRA_COMMON
>         select SOC_TEGRA_FLOWCTRL
>         select SOC_TEGRA_PMC
> +       select SOC_TEGRA_CORE_POWER_DOMAIN
>         select SOC_TEGRA20_VOLTAGE_COUPLER
>         select TEGRA_TIMER
>         help
> @@ -31,6 +32,7 @@ config ARCH_TEGRA_3x_SOC
>         select SOC_TEGRA_COMMON
>         select SOC_TEGRA_FLOWCTRL
>         select SOC_TEGRA_PMC
> +       select SOC_TEGRA_CORE_POWER_DOMAIN
>         select SOC_TEGRA30_VOLTAGE_COUPLER
>         select TEGRA_TIMER
>         help
> @@ -170,3 +172,7 @@ config SOC_TEGRA20_VOLTAGE_COUPLER
>  config SOC_TEGRA30_VOLTAGE_COUPLER
>         bool "Voltage scaling support for Tegra30 SoCs"
>         depends on ARCH_TEGRA_3x_SOC || COMPILE_TEST
> +
> +config SOC_TEGRA_CORE_POWER_DOMAIN
> +       bool
> +       select PM_GENERIC_DOMAINS
> diff --git a/drivers/soc/tegra/Makefile b/drivers/soc/tegra/Makefile
> index 9c809c1814bd..8f1294f954b4 100644
> --- a/drivers/soc/tegra/Makefile
> +++ b/drivers/soc/tegra/Makefile
> @@ -7,3 +7,4 @@ obj-$(CONFIG_SOC_TEGRA_PMC) += pmc.o
>  obj-$(CONFIG_SOC_TEGRA_POWERGATE_BPMP) += powergate-bpmp.o
>  obj-$(CONFIG_SOC_TEGRA20_VOLTAGE_COUPLER) += regulators-tegra20.o
>  obj-$(CONFIG_SOC_TEGRA30_VOLTAGE_COUPLER) += regulators-tegra30.o
> +obj-$(CONFIG_SOC_TEGRA_CORE_POWER_DOMAIN) += core-power-domain.o
> diff --git a/drivers/soc/tegra/core-power-domain.c b/drivers/soc/tegra/core-power-domain.c
> new file mode 100644
> index 000000000000..7c0cec8c79fd
> --- /dev/null
> +++ b/drivers/soc/tegra/core-power-domain.c
> @@ -0,0 +1,125 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * NVIDIA Tegra SoC Core Power Domain Driver
> + */
> +
> +#include <linux/of_device.h>
> +#include <linux/platform_device.h>
> +#include <linux/pm_domain.h>
> +#include <linux/pm_opp.h>
> +#include <linux/slab.h>
> +
> +#include <soc/tegra/common.h>
> +
> +static struct lock_class_key tegra_core_domain_lock_class;
> +static bool tegra_core_domain_state_synced;
> +
> +static int tegra_genpd_set_performance_state(struct generic_pm_domain *genpd,
> +                                            unsigned int level)
> +{
> +       struct dev_pm_opp *opp;
> +       int err;
> +
> +       opp = dev_pm_opp_find_level_ceil(&genpd->dev, &level);
> +       if (IS_ERR(opp)) {
> +               dev_err(&genpd->dev, "failed to find OPP for level %u: %pe\n",
> +                       level, opp);
> +               return PTR_ERR(opp);
> +       }
> +
> +       err = dev_pm_opp_set_voltage(&genpd->dev, opp);
> +       dev_pm_opp_put(opp);
> +
> +       if (err) {
> +               dev_err(&genpd->dev, "failed to set voltage to %duV: %d\n",
> +                       level, err);
> +               return err;
> +       }
> +
> +       return 0;
> +}
> +
> +static unsigned int
> +tegra_genpd_opp_to_performance_state(struct generic_pm_domain *genpd,
> +                                    struct dev_pm_opp *opp)
> +{
> +       return dev_pm_opp_get_level(opp);
> +}
> +
> +static int tegra_core_domain_probe(struct platform_device *pdev)
> +{
> +       struct generic_pm_domain *genpd;
> +       struct opp_table *opp_table;
> +       const char *rname = "power";
> +       int err;
> +
> +       genpd = devm_kzalloc(&pdev->dev, sizeof(*genpd), GFP_KERNEL);
> +       if (!genpd)
> +               return -ENOMEM;
> +
> +       genpd->name = pdev->dev.of_node->name;
> +       genpd->set_performance_state = tegra_genpd_set_performance_state;
> +       genpd->opp_to_performance_state = tegra_genpd_opp_to_performance_state;
> +
> +       opp_table = devm_pm_opp_set_regulators(&pdev->dev, &rname, 1);
> +       if (IS_ERR(opp_table))
> +               return dev_err_probe(&pdev->dev, PTR_ERR(opp_table),
> +                                    "failed to set OPP regulator\n");
> +
> +       err = pm_genpd_init(genpd, NULL, false);
> +       if (err) {
> +               dev_err(&pdev->dev, "failed to init genpd: %d\n", err);
> +               return err;
> +       }
> +
> +       /*
> +        * We have a "PMC -> Core" hierarchy of the power domains where
> +        * PMC needs to resume and change performance (voltage) of the
> +        * Core domain from the PMC GENPD on/off callbacks, hence we need
> +        * to annotate the lock in order to remove confusion from the
> +        * lockdep checker when a nested access happens.
> +        */
> +       lockdep_set_class(&genpd->mlock, &tegra_core_domain_lock_class);
> +
> +       err = of_genpd_add_provider_simple(pdev->dev.of_node, genpd);
> +       if (err) {
> +               dev_err(&pdev->dev, "failed to add genpd: %d\n", err);
> +               goto remove_genpd;
> +       }
> +
> +       return 0;
> +
> +remove_genpd:
> +       pm_genpd_remove(genpd);
> +
> +       return err;
> +}
> +
> +bool tegra_soc_core_domain_state_synced(void)
> +{
> +       return tegra_core_domain_state_synced;
> +}
> +
> +static void tegra_core_domain_sync_state(struct device *dev)
> +{
> +       tegra_core_domain_state_synced = true;
> +
> +       dev_pm_opp_sync_regulators(dev);
> +}
> +
> +static const struct of_device_id tegra_core_domain_match[] = {
> +       { .compatible = "nvidia,tegra20-core-domain", },
> +       { .compatible = "nvidia,tegra30-core-domain", },
> +       { }
> +};
> +
> +static struct platform_driver tegra_core_domain_driver = {
> +       .driver = {
> +               .name = "tegra-core-power",
> +               .of_match_table = tegra_core_domain_match,
> +               .suppress_bind_attrs = true,
> +               .sync_state = tegra_core_domain_sync_state,
> +       },
> +       .probe = tegra_core_domain_probe,
> +};
> +builtin_platform_driver(tegra_core_domain_driver);
> diff --git a/include/soc/tegra/common.h b/include/soc/tegra/common.h
> index 57b56793a9e5..6c2ccbbbf073 100644
> --- a/include/soc/tegra/common.h
> +++ b/include/soc/tegra/common.h
> @@ -27,6 +27,7 @@ struct tegra_core_opp_params {
>
>  #ifdef CONFIG_ARCH_TEGRA
>  bool soc_is_tegra(void);
> +bool tegra_soc_core_domain_state_synced(void);
>  int devm_tegra_core_dev_init_opp_table(struct device *dev,
>                                        struct tegra_core_opp_params *cfg);
>  #else
> @@ -35,6 +36,11 @@ static inline bool soc_is_tegra(void)
>         return false;
>  }
>
> +static inline bool tegra_soc_core_domain_state_synced(void)
> +{
> +       return false;
> +}
> +
>  static inline int
>  devm_tegra_core_dev_init_opp_table(struct device *dev,
>                                    struct tegra_core_opp_params *cfg)
> --
> 2.29.2
>
