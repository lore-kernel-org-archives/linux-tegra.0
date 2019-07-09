From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v1 6/6] cpuidle: tegra: Remove CPUIDLE_FLAG_TIMER_STOP
 from all states
Date: Tue, 9 Jul 2019 08:49:37 +0300
Message-ID: <89baad3d-36f3-a2ac-3794-e174fbeb953a@gmail.com>
References: <20190707233809.14400-1-digetx@gmail.com>
 <20190707233809.14400-7-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190707233809.14400-7-digetx@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: linux-pm@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

08.07.2019 2:38, Dmitry Osipenko пишет:
> The Tegra's clocksource driver got some rework recently and now the
> internal/local CPU timers usage is discouraged on Tegra20/30 SoCs in
> a favor of the platform-specific timers that are assigned as per-CPU
> clocksources because they do not suffer from the CPU-freq changes and
> are always-ON during of CPU-idling. That happened in the commit
> f6d50ec5f85c ("clocksource/drivers/tegra: Support per-CPU timers on all
> Tegra's"). The Tegra's clocksource driver is the essential arch-driver
> that is guaranteed to always present on all Tegra SoCs up to Tegra124.
> 
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/cpuidle/cpuidle-tegra.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/cpuidle/cpuidle-tegra.c b/drivers/cpuidle/cpuidle-tegra.c
> index 464b2376905a..e2aa46231c05 100644
> --- a/drivers/cpuidle/cpuidle-tegra.c
> +++ b/drivers/cpuidle/cpuidle-tegra.c
> @@ -143,7 +143,6 @@ static struct cpuidle_driver tegra_idle_driver = {
>  			.exit_latency		= 2000,
>  			.target_residency	= 2200,
>  			.power_usage		= 0,
> -			.flags			= CPUIDLE_FLAG_TIMER_STOP,
>  			.name			= "powered-down",
>  			.desc			= "CPU core powered-off",
>  		},
> @@ -152,8 +151,7 @@ static struct cpuidle_driver tegra_idle_driver = {
>  			.exit_latency		= 5000,
>  			.target_residency	= 10000,
>  			.power_usage		= 0,
> -			.flags			= CPUIDLE_FLAG_COUPLED |
> -						  CPUIDLE_FLAG_TIMER_STOP,
> +			.flags			= CPUIDLE_FLAG_COUPLED,
>  			.name			= "powered-down",
>  			.desc			= "CPU cluster powered-off",
>  		},
> 

Actually, it should be fine to keep this flag because I found that
tick_broadcast_oneshot_control() checks for the C3STOP flag and thus
CPUIDLE_FLAG_TIMER_STOP has no effect in that case. Will drop this patch in the next revision.
