From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: Re: [PATCH v7 17/19] PM / devfreq: tegra30: Support variable
 polling interval
Date: Fri, 1 Nov 2019 16:41:57 +0900
Message-ID: <00ddcbd5-262b-2130-6242-b1ec364825f3@samsung.com>
References: <20191029220019.26773-1-digetx@gmail.com>
        <CGME20191029220636epcas2p279bee6ee40d9253cdfbcf5d6da6b3a14@epcas2p2.samsung.com>
        <20191029220019.26773-18-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191029220019.26773-18-digetx@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>, Thierry Reding <thierry.reding@gmail.com>, MyungJoo Ham <myungjoo.ham@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Jonathan Hunter <jonathanh@nvidia.com>, Tomeu Vizoso <tomeu.vizoso@collabora.com>, Peter Geis <pgwipeout@gmail.com>
Cc: linux-pm@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On 19. 10. 30. 오전 7:00, Dmitry Osipenko wrote:
> The ACTMON governor is interrupt-driven and currently hardware's polling
> interval is fixed to 16ms in the driver. Devfreq supports variable polling
> interval by the generic governors, let's re-use the generic interface for
> changing of the polling interval. Now the polling interval can be changed
> dynamically via /sys/class/devfreq/devfreq0/polling_interval.
> 
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/devfreq/tegra30-devfreq.c | 35 ++++++++++++++++++++++++-------
>  1 file changed, 28 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/devfreq/tegra30-devfreq.c b/drivers/devfreq/tegra30-devfreq.c
> index b745a973c35a..d0dd42856e5b 100644
> --- a/drivers/devfreq/tegra30-devfreq.c
> +++ b/drivers/devfreq/tegra30-devfreq.c
> @@ -218,7 +218,7 @@ static void tegra_devfreq_update_avg_wmark(struct tegra_devfreq *tegra,
>  {
>  	u32 avg = dev->avg_count;
>  	u32 avg_band_freq = tegra->max_freq * ACTMON_DEFAULT_AVG_BAND / KHZ;
> -	u32 band = avg_band_freq * ACTMON_SAMPLING_PERIOD;
> +	u32 band = avg_band_freq * tegra->devfreq->profile->polling_ms;
>  
>  	device_writel(dev, avg + band, ACTMON_DEV_AVG_UPPER_WMARK);
>  
> @@ -229,7 +229,7 @@ static void tegra_devfreq_update_avg_wmark(struct tegra_devfreq *tegra,
>  static void tegra_devfreq_update_wmark(struct tegra_devfreq *tegra,
>  				       struct tegra_devfreq_device *dev)
>  {
> -	u32 val = tegra->cur_freq * ACTMON_SAMPLING_PERIOD;
> +	u32 val = tegra->cur_freq * tegra->devfreq->profile->polling_ms;
>  
>  	device_writel(dev, do_percent(val, dev->config->boost_up_threshold),
>  		      ACTMON_DEV_UPPER_WMARK);
> @@ -308,7 +308,7 @@ static unsigned long actmon_device_target_freq(struct tegra_devfreq *tegra,
>  	unsigned int avg_sustain_coef;
>  	unsigned long target_freq;
>  
> -	target_freq = dev->avg_count / ACTMON_SAMPLING_PERIOD;
> +	target_freq = dev->avg_count / tegra->devfreq->profile->polling_ms;
>  	avg_sustain_coef = 100 * 100 / dev->config->boost_up_threshold;
>  	target_freq = do_percent(target_freq, avg_sustain_coef);
>  	target_freq += dev->boost_freq;
> @@ -465,7 +465,7 @@ static void tegra_actmon_configure_device(struct tegra_devfreq *tegra,
>  
>  	dev->target_freq = tegra->cur_freq;
>  
> -	dev->avg_count = tegra->cur_freq * ACTMON_SAMPLING_PERIOD;
> +	dev->avg_count = tegra->cur_freq * tegra->devfreq->profile->polling_ms;
>  	device_writel(dev, dev->avg_count, ACTMON_DEV_INIT_AVG);
>  
>  	tegra_devfreq_update_avg_wmark(tegra, dev);
> @@ -506,7 +506,11 @@ static int tegra_actmon_start(struct tegra_devfreq *tegra)
>  	unsigned int i;
>  	int err;
>  
> -	actmon_writel(tegra, ACTMON_SAMPLING_PERIOD - 1,
> +	if (!tegra->devfreq->profile->polling_ms ||
> +	    tegra->devfreq->stop_polling)

I think that the access of 'devfreq->stop_polling' is not good
on governor. It is possible to alter with DEVFREQ_GOV_START/STOP/SUSPEND/RESUME
notification.

> +		return 0;> +
> +	actmon_writel(tegra, tegra->devfreq->profile->polling_ms - 1,
>  		      ACTMON_GLB_PERIOD_CTRL);
>  
>  	/*
> @@ -554,6 +558,10 @@ static int tegra_actmon_start(struct tegra_devfreq *tegra)
>  
>  static void tegra_actmon_stop(struct tegra_devfreq *tegra)
>  {
> +	if (!tegra->devfreq->profile->polling_ms ||
> +	    tegra->devfreq->stop_polling)

ditto.

> +		return;
> +
>  	disable_irq(tegra->irq);
>  
>  	cpufreq_unregister_notifier(&tegra->cpu_rate_change_nb,
> @@ -623,7 +631,7 @@ static int tegra_devfreq_get_dev_status(struct device *dev,
>  	stat->busy_time *= 100 / BUS_SATURATION_RATIO;
>  
>  	/* Number of cycles in a sampling period */
> -	stat->total_time = ACTMON_SAMPLING_PERIOD * cur_freq;
> +	stat->total_time = tegra->devfreq->profile->polling_ms * cur_freq;
>  
>  	stat->busy_time = min(stat->busy_time, stat->total_time);
>  
> @@ -631,7 +639,7 @@ static int tegra_devfreq_get_dev_status(struct device *dev,
>  }
>  
>  static struct devfreq_dev_profile tegra_devfreq_profile = {
> -	.polling_ms	= 0,
> +	.polling_ms	= ACTMON_SAMPLING_PERIOD,
>  	.target		= tegra_devfreq_target,
>  	.get_dev_status	= tegra_devfreq_get_dev_status,
>  };
> @@ -671,6 +679,7 @@ static int tegra_governor_event_handler(struct devfreq *devfreq,
>  					unsigned int event, void *data)
>  {
>  	struct tegra_devfreq *tegra = dev_get_drvdata(devfreq->dev.parent);
> +	unsigned int *new_delay = data;
>  	int ret = 0;
>  
>  	/*
> @@ -690,6 +699,17 @@ static int tegra_governor_event_handler(struct devfreq *devfreq,
>  		devfreq_monitor_stop(devfreq);
>  		break;
>  
> +	case DEVFREQ_GOV_INTERVAL:
> +		if (*new_delay > 256) {

Need to add the comment why the maximum delay is under 256 ms.

> +			ret = -EINVAL;
> +			break;
> +		}
> +
> +		tegra_actmon_stop(tegra);
> +		devfreq_interval_update(devfreq, new_delay);
> +		ret = tegra_actmon_start(tegra);
> +		break;
> +
>  	case DEVFREQ_GOV_SUSPEND:
>  		tegra_actmon_stop(tegra);
>  		devfreq_monitor_suspend(devfreq);
> @@ -709,6 +729,7 @@ static struct devfreq_governor tegra_devfreq_governor = {
>  	.get_target_freq = tegra_governor_get_target,
>  	.event_handler = tegra_governor_event_handler,
>  	.immutable = true,
> +	.interrupt_driven = true,
>  };
>  
>  static int tegra_devfreq_probe(struct platform_device *pdev)
> 


-- 
Best Regards,
Chanwoo Choi
Samsung Electronics
