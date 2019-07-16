From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: Re: [PATCH v4 14/24] PM / devfreq: tegra30: Ensure that target freq
 won't overflow
Date: Tue, 16 Jul 2019 21:30:39 +0900
Message-ID: <e6b53ba0-ac98-bda6-b087-553088a43d9f@samsung.com>
References: <20190707223303.6755-1-digetx@gmail.com>
        <CGME20190707223631epcas4p42012d0364a4c952d90f078fb45982722@epcas4p4.samsung.com>
        <20190707223303.6755-15-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190707223303.6755-15-digetx@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>, Thierry Reding <thierry.reding@gmail.com>, MyungJoo Ham <myungjoo.ham@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Jonathan Hunter <jonathanh@nvidia.com>, Tomeu Vizoso <tomeu.vizoso@collabora.com>
Cc: linux-pm@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On 19. 7. 8. 오전 7:32, Dmitry Osipenko wrote:
> Potentially very high boosting could cause an integer overflow for a
> highly clocked memory after conversion to MHz.
> 
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/devfreq/tegra30-devfreq.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/devfreq/tegra30-devfreq.c b/drivers/devfreq/tegra30-devfreq.c
> index 2f59c78930bd..0de1efdaabf4 100644
> --- a/drivers/devfreq/tegra30-devfreq.c
> +++ b/drivers/devfreq/tegra30-devfreq.c
> @@ -460,6 +460,7 @@ static unsigned long actmon_update_target(struct tegra_devfreq *tegra,
>  	unsigned long target_freq;
>  
>  	target_freq = dev->avg_count / ACTMON_SAMPLING_PERIOD + dev->boost_freq;
> +	target_freq = min(target_freq, ULONG_MAX / KHZ);

Did you meet this corner case?
If have to change it, you better to use 'tegra->max_freq' as following:
	min(target_freq, tegra->max_freq);

>  	target_freq = tegra_actmon_account_cpu_freq(tegra, dev, target_freq);
>  
>  	return target_freq;
> 


-- 
Best Regards,
Chanwoo Choi
Samsung Electronics
