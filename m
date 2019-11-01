From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: Re: [PATCH v7 15/19] PM / devfreq: tegra30: Disable consecutive
 interrupts when appropriate
Date: Fri, 1 Nov 2019 16:01:05 +0900
Message-ID: <1e363539-c9fb-0b1c-8cf7-b1cf320a2d28@samsung.com>
References: <20191029220019.26773-1-digetx@gmail.com>
        <CGME20191029220657epcas3p42c1eccf4499f36a57cdbd89a750fb60b@epcas3p4.samsung.com>
        <20191029220019.26773-16-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191029220019.26773-16-digetx@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>, Thierry Reding <thierry.reding@gmail.com>, MyungJoo Ham <myungjoo.ham@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Jonathan Hunter <jonathanh@nvidia.com>, Tomeu Vizoso <tomeu.vizoso@collabora.com>, Peter Geis <pgwipeout@gmail.com>
Cc: linux-pm@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On 19. 10. 30. 오전 7:00, Dmitry Osipenko wrote:
> Consecutive interrupts should be disabled when boosting is completed.
> 
> Currently the disabling of "lower" interrupt happens only for MCCPU
> monitor that uses dependency threshold, but even in a case of MCCPU the
> interrupt isn't getting disabled if CPU's activity is above the threshold.
> This results in a lot of dummy interrupt requests. The boosting feature is
> used by both MCCPU and MCALL, boosting should be stopped once it reaches 0
> for both of the monitors and regardless of the activity level.
> 
> The boosting stops to grow once the maximum limit is hit and thus the
> "upper" interrupt needs to be disabled when the limit is reached.
> 
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/devfreq/tegra30-devfreq.c | 15 ++++++---------
>  1 file changed, 6 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/devfreq/tegra30-devfreq.c b/drivers/devfreq/tegra30-devfreq.c
> index a9336cf4b37a..b745a973c35a 100644
> --- a/drivers/devfreq/tegra30-devfreq.c
> +++ b/drivers/devfreq/tegra30-devfreq.c
> @@ -259,8 +259,10 @@ static void actmon_isr_device(struct tegra_devfreq *tegra,
>  
>  		dev_ctrl |= ACTMON_DEV_CTRL_CONSECUTIVE_BELOW_WMARK_EN;
>  
> -		if (dev->boost_freq >= tegra->max_freq)
> +		if (dev->boost_freq >= tegra->max_freq) {
> +			dev_ctrl &= ~ACTMON_DEV_CTRL_CONSECUTIVE_ABOVE_WMARK_EN;
>  			dev->boost_freq = tegra->max_freq;
> +		}
>  	} else if (intr_status & ACTMON_DEV_INTR_CONSECUTIVE_LOWER) {
>  		/*
>  		 * new_boost = old_boost * down_coef
> @@ -271,15 +273,10 @@ static void actmon_isr_device(struct tegra_devfreq *tegra,
>  
>  		dev_ctrl |= ACTMON_DEV_CTRL_CONSECUTIVE_ABOVE_WMARK_EN;
>  
> -		if (dev->boost_freq < (ACTMON_BOOST_FREQ_STEP >> 1))
> -			dev->boost_freq = 0;
> -	}
> -
> -	if (dev->config->avg_dependency_threshold) {
> -		if (dev->avg_count >= dev->config->avg_dependency_threshold)
> -			dev_ctrl |= ACTMON_DEV_CTRL_CONSECUTIVE_BELOW_WMARK_EN;
> -		else if (dev->boost_freq == 0)
> +		if (dev->boost_freq < (ACTMON_BOOST_FREQ_STEP >> 1)) {
>  			dev_ctrl &= ~ACTMON_DEV_CTRL_CONSECUTIVE_BELOW_WMARK_EN;
> +			dev->boost_freq = 0;
> +		}
>  	}
>  
>  	device_writel(dev, dev_ctrl, ACTMON_DEV_CTRL);
> 

Reviewed-by: Chanwoo Choi <cw00.choi@samsung.com>

-- 
Best Regards,
Chanwoo Choi
Samsung Electronics
