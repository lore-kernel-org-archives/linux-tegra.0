From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: Re: [PATCH v4 19/24] PM / devfreq: tegra30: Optimize upper
 consecutive watermark selection
Date: Thu, 18 Jul 2019 18:51:02 +0900
Message-ID: <17fabbaf-ceca-7551-0a58-9c8a0e7027ed@samsung.com>
References: <20190707223303.6755-1-digetx@gmail.com>
        <CGME20190707223622epcas4p48ec0d7e6fa26bc2397fa4351c0bd0c2d@epcas4p4.samsung.com>
        <20190707223303.6755-20-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190707223303.6755-20-digetx@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>, Thierry Reding <thierry.reding@gmail.com>, MyungJoo Ham <myungjoo.ham@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Jonathan Hunter <jonathanh@nvidia.com>, Tomeu Vizoso <tomeu.vizoso@collabora.com>
Cc: linux-pm@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On 19. 7. 8. 오전 7:32, Dmitry Osipenko wrote:
> The memory activity counter may get a bit higher than a watermark which
> is selected based on OPP that corresponds to a highest EMC rate, in this
> case watermark is lower than the actual memory activity is and thus
> results in unwanted "upper" interrupts.
> 
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/devfreq/tegra30-devfreq.c | 13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)

It seems that you can combine patch19 with patch20.

> 
> diff --git a/drivers/devfreq/tegra30-devfreq.c b/drivers/devfreq/tegra30-devfreq.c
> index 8d6bf6e9f1ae..c3cf87231d25 100644
> --- a/drivers/devfreq/tegra30-devfreq.c
> +++ b/drivers/devfreq/tegra30-devfreq.c
> @@ -363,7 +363,18 @@ static void tegra_devfreq_update_wmark(struct tegra_devfreq *tegra,
>  	tegra_actmon_get_lower_upper(tegra, dev, freq - 1, &lower, &upper);
>  
>  	delta = do_percent(upper - lower, dev->config->boost_up_threshold);
> -	device_writel(dev, lower + delta, ACTMON_DEV_UPPER_WMARK);
> +
> +	/*
> +	 * The memory events count could go a bit higher than the maximum
> +	 * defined by the OPPs, hence make the upper watermark infinitely
> +	 * high to avoid unnecessary upper interrupts in that case.
> +	 */
> +	if (freq == tegra->max_freq)
> +		upper = ULONG_MAX;
> +	else
> +		upper = lower + delta;
> +
> +	device_writel(dev, upper, ACTMON_DEV_UPPER_WMARK);
>  
>  	/*
>  	 * Meanwhile the lower mark is based on the average value
> 


-- 
Best Regards,
Chanwoo Choi
Samsung Electronics
