From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: Re: [PATCH v4 13/24] PM / devfreq: tegra30: Constify structs
Date: Tue, 16 Jul 2019 21:26:34 +0900
Message-ID: <e53762a4-3637-b667-ad7d-e078a2284cac@samsung.com>
References: <20190707223303.6755-1-digetx@gmail.com>
        <CGME20190707223543epcas1p359a8a56ca04649c2b5f064c639246694@epcas1p3.samsung.com>
        <20190707223303.6755-14-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190707223303.6755-14-digetx@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>, Thierry Reding <thierry.reding@gmail.com>, MyungJoo Ham <myungjoo.ham@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Jonathan Hunter <jonathanh@nvidia.com>, Tomeu Vizoso <tomeu.vizoso@collabora.com>
Cc: linux-pm@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On 19. 7. 8. 오전 7:32, Dmitry Osipenko wrote:
> Constify unmodifiable structs for consistency.
> 
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/devfreq/tegra30-devfreq.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/devfreq/tegra30-devfreq.c b/drivers/devfreq/tegra30-devfreq.c
> index 1a10df5dbbed..2f59c78930bd 100644
> --- a/drivers/devfreq/tegra30-devfreq.c
> +++ b/drivers/devfreq/tegra30-devfreq.c
> @@ -106,7 +106,7 @@ enum tegra_actmon_device {
>  	MCCPU,
>  };
>  
> -static struct tegra_devfreq_device_config actmon_device_configs[] = {
> +static const struct tegra_devfreq_device_config actmon_device_configs[] = {
>  	{
>  		/* MCALL: All memory accesses (including from the CPUs) */
>  		.offset = 0x1c0,
> @@ -171,7 +171,7 @@ struct tegra_actmon_emc_ratio {
>  	unsigned long emc_freq;
>  };
>  
> -static struct tegra_actmon_emc_ratio actmon_emc_ratios[] = {
> +static const struct tegra_actmon_emc_ratio actmon_emc_ratios[] = {
>  	{ 1400000, ULONG_MAX },
>  	{ 1200000,    750000 },
>  	{ 1100000,    600000 },
> @@ -210,7 +210,7 @@ static inline unsigned long do_percent(unsigned long val, unsigned int pct)
>  
>  static unsigned long actmon_cpu_to_emc_rate(struct tegra_devfreq *tegra)
>  {
> -	struct tegra_actmon_emc_ratio *ratio = actmon_emc_ratios;
> +	const struct tegra_actmon_emc_ratio *ratio = actmon_emc_ratios;
>  	unsigned int cpu_freq = cpufreq_get(0);
>  	unsigned int i;
>  
> 

Reviewed-by: Chanwoo Choi <cw00.choi@samsung.com>

-- 
Best Regards,
Chanwoo Choi
Samsung Electronics
