From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] sdhci: tegra: Avoid reading autocal timeout values when
 not applicable
Date: Fri, 22 May 2020 15:28:32 +0300
Message-ID: <4ac18003-e855-43d1-91d2-b4fa7904dba4@gmail.com>
References: <1590005337-1087-1-git-send-email-skomatineni@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1590005337-1087-1-git-send-email-skomatineni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sowjanya Komatineni <skomatineni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, adrian.hunter-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, ulf.hansson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mmc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

20.05.2020 23:08, Sowjanya Komatineni пишет:
> When auto calibration timeouts, calibration is disabled and fail-safe
> drive strength values are programmed based on the signal voltage.
> 
> Different fail-safe drive strength values based on voltage are
> applicable only for SoCs supporting 3V3 and 1V8 pad controls.
> 
> So, this patch avoids reading these properties from the device tree
> for SoCs not using pad controls and the warning of missing properties
> will not show up on these SoC platforms.
> 
> Signed-off-by: Sowjanya Komatineni <skomatineni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  drivers/mmc/host/sdhci-tegra.c | 57 ++++++++++++++++++++++++------------------
>  1 file changed, 33 insertions(+), 24 deletions(-)
> 
> diff --git a/drivers/mmc/host/sdhci-tegra.c b/drivers/mmc/host/sdhci-tegra.c
> index 3e2c510..141b49b 100644
> --- a/drivers/mmc/host/sdhci-tegra.c
> +++ b/drivers/mmc/host/sdhci-tegra.c
> @@ -605,6 +605,39 @@ static void tegra_sdhci_parse_pad_autocal_dt(struct sdhci_host *host)
>  		autocal->pull_down_1v8 = 0;
>  
>  	err = device_property_read_u32(host->mmc->parent,
> +			"nvidia,pad-autocal-pull-up-offset-sdr104",
> +			&autocal->pull_up_sdr104);
> +	if (err)
> +		autocal->pull_up_sdr104 = autocal->pull_up_1v8;
> +
> +	err = device_property_read_u32(host->mmc->parent,
> +			"nvidia,pad-autocal-pull-down-offset-sdr104",
> +			&autocal->pull_down_sdr104);
> +	if (err)
> +		autocal->pull_down_sdr104 = autocal->pull_down_1v8;
> +
> +	err = device_property_read_u32(host->mmc->parent,
> +			"nvidia,pad-autocal-pull-up-offset-hs400",
> +			&autocal->pull_up_hs400);
> +	if (err)
> +		autocal->pull_up_hs400 = autocal->pull_up_1v8;
> +
> +	err = device_property_read_u32(host->mmc->parent,
> +			"nvidia,pad-autocal-pull-down-offset-hs400",
> +			&autocal->pull_down_hs400);
> +	if (err)
> +		autocal->pull_down_hs400 = autocal->pull_down_1v8;
> +
> +	/*
> +	 * Different fail-safe drive strength values based on the signaling
> +	 * voltage are applicable for SoCs supporting 3V3 and 1V8 pad controls.
> +	 * So, avoid reading below device tree properies for SoCs that don't

typo s/properies/properties/                      ^^^

> +	 * have NVQUIRK_NEEDS_PAD_CONTROL.
> +	 */
...
