From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: Re: [PATCH v7 14/19] PM / devfreq: tegra30: Don't enable already
 enabled consecutive interrupts
Date: Fri, 1 Nov 2019 16:00:59 +0900
Message-ID: <6b98cb58-7487-3e0d-705a-fa1d8e4e43bd@samsung.com>
References: <20191029220019.26773-1-digetx@gmail.com>
        <CGME20191029220705epcas5p2ea4d8a7c244b4ba35f98fba05cfab646@epcas5p2.samsung.com>
        <20191029220019.26773-15-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191029220019.26773-15-digetx@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>, Thierry Reding <thierry.reding@gmail.com>, MyungJoo Ham <myungjoo.ham@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Jonathan Hunter <jonathanh@nvidia.com>, Tomeu Vizoso <tomeu.vizoso@collabora.com>, Peter Geis <pgwipeout@gmail.com>
Cc: linux-pm@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On 19. 10. 30. 오전 7:00, Dmitry Osipenko wrote:
> Consecutive up/down interrupt-bit is set in the interrupt status register
> only if that interrupt was previously enabled. Thus enabling the already
> enabled interrupt doesn't do much for us.
> 
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/devfreq/tegra30-devfreq.c | 4 ----
>  1 file changed, 4 deletions(-)
> 
> diff --git a/drivers/devfreq/tegra30-devfreq.c b/drivers/devfreq/tegra30-devfreq.c
> index 9cbee82880ff..a9336cf4b37a 100644
> --- a/drivers/devfreq/tegra30-devfreq.c
> +++ b/drivers/devfreq/tegra30-devfreq.c
> @@ -261,8 +261,6 @@ static void actmon_isr_device(struct tegra_devfreq *tegra,
>  
>  		if (dev->boost_freq >= tegra->max_freq)
>  			dev->boost_freq = tegra->max_freq;
> -		else
> -			dev_ctrl |= ACTMON_DEV_CTRL_CONSECUTIVE_ABOVE_WMARK_EN;
>  	} else if (intr_status & ACTMON_DEV_INTR_CONSECUTIVE_LOWER) {
>  		/*
>  		 * new_boost = old_boost * down_coef
> @@ -275,8 +273,6 @@ static void actmon_isr_device(struct tegra_devfreq *tegra,
>  
>  		if (dev->boost_freq < (ACTMON_BOOST_FREQ_STEP >> 1))
>  			dev->boost_freq = 0;
> -		else
> -			dev_ctrl |= ACTMON_DEV_CTRL_CONSECUTIVE_BELOW_WMARK_EN;
>  	}
>  
>  	if (dev->config->avg_dependency_threshold) {
> 

Reviewed-by: Chanwoo Choi <cw00.choi@samsung.com>

-- 
Best Regards,
Chanwoo Choi
Samsung Electronics
