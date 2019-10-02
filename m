From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: Re: [PATCH v6 14/19] PM / devfreq: tegra30: Don't enable
 consecutive-down interrupt on startup
Date: Wed, 2 Oct 2019 09:04:38 +0900
Message-ID: <ebde3133-d2dd-6c3c-c898-9afb7eab5a6c@samsung.com>
References: <20190811212315.12689-1-digetx@gmail.com>
        <CGME20190811212521epcas5p3570e492f3984401f59f1f82a25ddcf7f@epcas5p3.samsung.com>
        <20190811212315.12689-15-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190811212315.12689-15-digetx@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>, Thierry Reding <thierry.reding@gmail.com>, MyungJoo Ham <myungjoo.ham@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Jonathan Hunter <jonathanh@nvidia.com>, Tomeu Vizoso <tomeu.vizoso@collabora.com>
Cc: linux-pm@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On 19. 8. 12. 오전 6:23, Dmitry Osipenko wrote:
> The consecutive-down event tells that we should perform frequency
> de-boosting, but boosting is in a reset state on start and hence the
> event won't do anything useful for us and it will be just a dummy
> interrupt request.
> 
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/devfreq/tegra30-devfreq.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/devfreq/tegra30-devfreq.c b/drivers/devfreq/tegra30-devfreq.c
> index 5002dca4c403..a0a1ac09a824 100644
> --- a/drivers/devfreq/tegra30-devfreq.c
> +++ b/drivers/devfreq/tegra30-devfreq.c
> @@ -708,7 +708,6 @@ static void tegra_actmon_configure_device(struct tegra_devfreq *tegra,
>  		<< ACTMON_DEV_CTRL_CONSECUTIVE_ABOVE_WMARK_NUM_SHIFT;
>  	val |= ACTMON_DEV_CTRL_AVG_ABOVE_WMARK_EN;
>  	val |= ACTMON_DEV_CTRL_AVG_BELOW_WMARK_EN;
> -	val |= ACTMON_DEV_CTRL_CONSECUTIVE_BELOW_WMARK_EN;
>  	val |= ACTMON_DEV_CTRL_CONSECUTIVE_ABOVE_WMARK_EN;
>  	val |= ACTMON_DEV_CTRL_ENB;
>  
> 

Reviewed-by: Chanwoo Choi <cw00.choi@samsung.com>

-- 
Best Regards,
Chanwoo Choi
Samsung Electronics
