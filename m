From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: Re: [PATCH v6 08/19] PM / devfreq: tegra30: Ensure that target freq
 won't overflow
Date: Tue, 20 Aug 2019 09:23:23 +0900
Message-ID: <c85dbd27-7536-9c51-19a2-fe1c2c6342b9@samsung.com>
References: <20190811212315.12689-1-digetx@gmail.com>
        <CGME20190811212546epcas1p22be9fefe18908cdd17a518950d296983@epcas1p2.samsung.com>
        <20190811212315.12689-9-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190811212315.12689-9-digetx@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>, Thierry Reding <thierry.reding@gmail.com>, MyungJoo Ham <myungjoo.ham@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Jonathan Hunter <jonathanh@nvidia.com>, Tomeu Vizoso <tomeu.vizoso@collabora.com>
Cc: linux-pm@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On 19. 8. 12. 오전 6:23, Dmitry Osipenko wrote:
> We already had few integer overflow bugs, let's limit the freq for
> consistency.
> 
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/devfreq/tegra30-devfreq.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/devfreq/tegra30-devfreq.c b/drivers/devfreq/tegra30-devfreq.c
> index 70dce58212a4..ca499368ee81 100644
> --- a/drivers/devfreq/tegra30-devfreq.c
> +++ b/drivers/devfreq/tegra30-devfreq.c
> @@ -430,7 +430,7 @@ static unsigned long actmon_update_target(struct tegra_devfreq *tegra,
>  	target_freq = dev->avg_count / ACTMON_SAMPLING_PERIOD + dev->boost_freq;
>  	target_freq = tegra_actmon_account_cpu_freq(tegra, dev, target_freq);
>  
> -	return target_freq;
> +	return min(target_freq, tegra->max_freq);

Once again, did you meet this case sometimes?

Usually, we can prevent the overflow of target_freq
when calculating the target frequency or this style.

I think that if the overflow of target frequency happen frequently,
it might have the problem of calculation way. 

>  }
>  
>  static irqreturn_t actmon_thread_isr(int irq, void *data)
> 


-- 
Best Regards,
Chanwoo Choi
Samsung Electronics
