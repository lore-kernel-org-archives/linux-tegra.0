From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: Re: [PATCH v1 5/5] PM / devfreq: tegra30: Make CPUFreq notifier to
 take into account boosting
Date: Wed, 1 Apr 2020 08:29:31 +0900
Message-ID: <afcc9f80-c102-da42-8f7f-9b66417a9d4d@samsung.com>
References: <20200330231617.17079-1-digetx@gmail.com>
        <CGME20200330232026epcas1p2234ae241b9693555b4df74aab3d8aee9@epcas1p2.samsung.com>
        <20200330231617.17079-6-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <20200330231617.17079-6-digetx@gmail.com>
Content-Language: en-US
Sender: linux-clk-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>, Thierry Reding <thierry.reding@gmail.com>, MyungJoo Ham <myungjoo.ham@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Jonathan Hunter <jonathanh@nvidia.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-pm@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Hi Dmitry,

On 3/31/20 8:16 AM, Dmitry Osipenko wrote:
> MCCPU frequency boosting needs to be taken into account in order to avoid
> scheduling of unnecessary devfreq updates.

"in order to avoid scheduling of unnecessary devfreq updates."
I don't understand the correct meaning of following description.
Could you explain it more detailed?

> 
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/devfreq/tegra30-devfreq.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/devfreq/tegra30-devfreq.c b/drivers/devfreq/tegra30-devfreq.c
> index 34f6291e880c..3b57aac9894c 100644
> --- a/drivers/devfreq/tegra30-devfreq.c
> +++ b/drivers/devfreq/tegra30-devfreq.c
> @@ -420,7 +420,7 @@ tegra_actmon_cpufreq_contribution(struct tegra_devfreq *tegra,
>  
>  	static_cpu_emc_freq = actmon_cpu_to_emc_rate(tegra, cpu_freq);
>  
> -	if (dev_freq >= static_cpu_emc_freq)
> +	if (dev_freq + actmon_dev->boost_freq >= static_cpu_emc_freq)
>  		return 0;
>  
>  	return static_cpu_emc_freq;
> 


-- 
Best Regards,
Chanwoo Choi
Samsung Electronics
