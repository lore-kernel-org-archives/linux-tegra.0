From: Viresh Kumar <viresh.kumar-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/2] cpufreq: tegra186: Fix initial frequency
Date: Mon, 13 Jul 2020 08:55:54 +0530
Message-ID: <20200713032554.cykywnygxln6ukrl@vireshk-i7>
References: <20200712100645.13927-1-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20200712100645.13927-1-jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "Rafael J . Wysocki" <rjw-LthD3rsA81gm4RdzfppkhA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 12-07-20, 11:06, Jon Hunter wrote:
> Commit 6cc3d0e9a097 ("cpufreq: tegra186: add
> CPUFREQ_NEED_INITIAL_FREQ_CHECK flag") fixed CPUFREQ support for
> Tegra186 but as a consequence the following warnings are now seen on
> boot ...
> 
>  cpufreq: cpufreq_online: CPU0: Running at unlisted freq: 0 KHz
>  cpufreq: cpufreq_online: CPU0: Unlisted initial frequency changed to: 2035200 KHz
>  cpufreq: cpufreq_online: CPU1: Running at unlisted freq: 0 KHz
>  cpufreq: cpufreq_online: CPU1: Unlisted initial frequency changed to: 2035200 KHz
>  cpufreq: cpufreq_online: CPU2: Running at unlisted freq: 0 KHz
>  cpufreq: cpufreq_online: CPU2: Unlisted initial frequency changed to: 2035200 KHz
>  cpufreq: cpufreq_online: CPU3: Running at unlisted freq: 0 KHz
>  cpufreq: cpufreq_online: CPU3: Unlisted initial frequency changed to: 2035200 KHz
>  cpufreq: cpufreq_online: CPU4: Running at unlisted freq: 0 KHz
>  cpufreq: cpufreq_online: CPU4: Unlisted initial frequency changed to: 2035200 KHz
>  cpufreq: cpufreq_online: CPU5: Running at unlisted freq: 0 KHz
>  cpufreq: cpufreq_online: CPU5: Unlisted initial frequency changed to: 2035200 KHz
> 
> Although we could fix this by adding a 'get' operator for the Tegra186
> CPUFREQ driver, there is really little point because the CPUFREQ on
> Tegra186 is set by writing a value stored in the frequency table to a
> register and we just need to set the initial frequency.

The hardware still runs at the frequency requested by cpufreq core here, right ?
It is better to provide the get() callback as it is also used to show the
current frequency in userspace.

> So for Tegra186
> the simplest way to fix this is read the register that sets the
> frequency for each CPU and set the initial frequency when initialising
> the CPUFREQ driver.
> 
> Signed-off-by: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  drivers/cpufreq/tegra186-cpufreq.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/cpufreq/tegra186-cpufreq.c b/drivers/cpufreq/tegra186-cpufreq.c
> index 3d2f143748ef..c44190ce3f03 100644
> --- a/drivers/cpufreq/tegra186-cpufreq.c
> +++ b/drivers/cpufreq/tegra186-cpufreq.c
> @@ -59,6 +59,7 @@ static int tegra186_cpufreq_init(struct cpufreq_policy *policy)
>  		struct tegra186_cpufreq_cluster *cluster = &data->clusters[i];
>  		const struct tegra186_cpufreq_cluster_info *info =
>  			cluster->info;
> +		u32 edvd_val;
>  		int core;
>  
>  		for (core = 0; core < ARRAY_SIZE(info->cpus); core++) {
> @@ -71,6 +72,13 @@ static int tegra186_cpufreq_init(struct cpufreq_policy *policy)
>  		policy->driver_data =
>  			data->regs + info->offset + EDVD_CORE_VOLT_FREQ(core);
>  		policy->freq_table = cluster->table;
> +
> +		edvd_val = readl(policy->driver_data);
> +
> +		for (i = 0; cluster->table[i].frequency != CPUFREQ_TABLE_END; i++) {
> +			if (cluster->table[i].driver_data == edvd_val)
> +				policy->cur = cluster->table[i].frequency;
> +		}
>  		break;
>  	}
>  
> -- 
> 2.17.1

-- 
viresh
