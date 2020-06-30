From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v1] cpuidle: tegra: Correctly handle result of
 arm_cpuidle_simple_enter()
Date: Tue, 30 Jun 2020 10:02:42 +0100
Message-ID: <d9efb0f5-d6ab-f3db-540e-c6ae1b42e45e@nvidia.com>
References: <20200629222625.674-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200629222625.674-1-digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "Rafael J. Wysocki" <rjw-LthD3rsA81gm4RdzfppkhA@public.gmane.org>, Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: linux-pm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


On 29/06/2020 23:26, Dmitry Osipenko wrote:
> The arm_cpuidle_simple_enter() returns the entered idle-index and not a
> error code. It happened that TEGRA_C1=index=err=0, and hence this typo
> was difficult to notice in the code since everything happened to work
> properly. This patch fixes the minor typo, it doesn't fix any problem.

I guess that is dependent on if CPUIDLE is enabled ...

#ifdef CONFIG_CPU_IDLE
extern int arm_cpuidle_simple_enter(struct cpuidle_device *dev,
                struct cpuidle_driver *drv, int index);
#else
static inline int arm_cpuidle_simple_enter(struct cpuidle_device *dev,
                 struct cpuidle_driver *drv, int index) { return -ENODEV; }
#endif

Looks like it could return an error.
 
> Signed-off-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  drivers/cpuidle/cpuidle-tegra.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/cpuidle/cpuidle-tegra.c b/drivers/cpuidle/cpuidle-tegra.c
> index 150045849d78..9e9a9cccd755 100644
> --- a/drivers/cpuidle/cpuidle-tegra.c
> +++ b/drivers/cpuidle/cpuidle-tegra.c
> @@ -236,14 +236,14 @@ static int tegra_cpuidle_enter(struct cpuidle_device *dev,
>  			       int index)
>  {
>  	unsigned int cpu = cpu_logical_map(dev->cpu);
> -	int err;
> +	int err = 0;
>  
>  	index = tegra_cpuidle_adjust_state_index(index, cpu);
>  	if (dev->states_usage[index].disable)
>  		return -1;
>  
>  	if (index == TEGRA_C1)
> -		err = arm_cpuidle_simple_enter(dev, drv, index);
> +		index = arm_cpuidle_simple_enter(dev, drv, index);
>  	else
>  		err = tegra_cpuidle_state_enter(dev, index, cpu);
>  
> 

However, I do think that there is something not right in the error handling
here. Would also be nice to get rid of these -1.

Jon

-- 
nvpublic
