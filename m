From: Ulf Hansson <ulf.hansson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v1] sdhci: tegra: Remove warnings about missing
 device-tree properties
Date: Tue, 19 May 2020 09:28:43 +0200
Message-ID: <CAPDyKFo_Xp-zipqE26iMv4CFwUoMCQZy3Zr63Cp=uzePgWX7BA@mail.gmail.com>
References: <20200516154314.14769-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200516154314.14769-1-digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Adrian Hunter <adrian.hunter-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, "linux-mmc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-mmc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-tegra <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Sat, 16 May 2020 at 17:44, Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>
> Several people asked me about the MMC warnings in the KMSG log and
> I had to tell to ignore them because these warning are irrelevant to
> pre-Tegra210 SoCs.

Why are the warnings irrelevant?

> It should be up to a board's device-tree writer to
> properly describe all the necessary properties. Secondly, eventually all
> device-tree bindings will be converted to YAML, which allows to validate
> board DT files, giving a warning about missing properties. Hence let's
> remove the noisy warnings to stop the confusion.

Yep, makes sense. However, perhaps we should do this conversion then,
rather than first drop the warnings?

Kind regards
Uffe

>
> Signed-off-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  drivers/mmc/host/sdhci-tegra.c | 28 ++++------------------------
>  1 file changed, 4 insertions(+), 24 deletions(-)
>
> diff --git a/drivers/mmc/host/sdhci-tegra.c b/drivers/mmc/host/sdhci-tegra.c
> index 3e2c5101291d..83867629013d 100644
> --- a/drivers/mmc/host/sdhci-tegra.c
> +++ b/drivers/mmc/host/sdhci-tegra.c
> @@ -607,46 +607,26 @@ static void tegra_sdhci_parse_pad_autocal_dt(struct sdhci_host *host)
>         err = device_property_read_u32(host->mmc->parent,
>                         "nvidia,pad-autocal-pull-up-offset-3v3-timeout",
>                         &autocal->pull_up_3v3_timeout);
> -       if (err) {
> -               if (!IS_ERR(tegra_host->pinctrl_state_3v3) &&
> -                       (tegra_host->pinctrl_state_3v3_drv == NULL))
> -                       pr_warn("%s: Missing autocal timeout 3v3-pad drvs\n",
> -                               mmc_hostname(host->mmc));
> +       if (err)
>                 autocal->pull_up_3v3_timeout = 0;
> -       }
>
>         err = device_property_read_u32(host->mmc->parent,
>                         "nvidia,pad-autocal-pull-down-offset-3v3-timeout",
>                         &autocal->pull_down_3v3_timeout);
> -       if (err) {
> -               if (!IS_ERR(tegra_host->pinctrl_state_3v3) &&
> -                       (tegra_host->pinctrl_state_3v3_drv == NULL))
> -                       pr_warn("%s: Missing autocal timeout 3v3-pad drvs\n",
> -                               mmc_hostname(host->mmc));
> +       if (err)
>                 autocal->pull_down_3v3_timeout = 0;
> -       }
>
>         err = device_property_read_u32(host->mmc->parent,
>                         "nvidia,pad-autocal-pull-up-offset-1v8-timeout",
>                         &autocal->pull_up_1v8_timeout);
> -       if (err) {
> -               if (!IS_ERR(tegra_host->pinctrl_state_1v8) &&
> -                       (tegra_host->pinctrl_state_1v8_drv == NULL))
> -                       pr_warn("%s: Missing autocal timeout 1v8-pad drvs\n",
> -                               mmc_hostname(host->mmc));
> +       if (err)
>                 autocal->pull_up_1v8_timeout = 0;
> -       }
>
>         err = device_property_read_u32(host->mmc->parent,
>                         "nvidia,pad-autocal-pull-down-offset-1v8-timeout",
>                         &autocal->pull_down_1v8_timeout);
> -       if (err) {
> -               if (!IS_ERR(tegra_host->pinctrl_state_1v8) &&
> -                       (tegra_host->pinctrl_state_1v8_drv == NULL))
> -                       pr_warn("%s: Missing autocal timeout 1v8-pad drvs\n",
> -                               mmc_hostname(host->mmc));
> +       if (err)
>                 autocal->pull_down_1v8_timeout = 0;
> -       }
>
>         err = device_property_read_u32(host->mmc->parent,
>                         "nvidia,pad-autocal-pull-up-offset-sdr104",
> --
> 2.26.0
>
