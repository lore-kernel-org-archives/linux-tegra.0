From: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH v3 7/8] clocksource/drivers/tegra: Cycles can't be 0
Date: Tue, 18 Jun 2019 18:51:59 +0100
Message-ID: <d93f2367-b14e-2a98-eb52-098883ba8b19@nvidia.com>
References: <20190618140358.13148-1-digetx@gmail.com>
 <20190618140358.13148-8-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190618140358.13148-8-digetx@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, Thierry Reding <thierry.reding@gmail.com>, Peter De Schrijver <pdeschrijver@nvidia.com>
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


On 18/06/2019 15:03, Dmitry Osipenko wrote:
> Tegra's timer uses n+1 scheme for the counter, i.e. timer will fire after
> one tick if 0 is loaded. The minimum and maximum numbers of oneshot ticks
> are defined by clockevents_config_and_register(min, max) invocation and
> the min value is set to 1 tick. Hence "cycles" value can't ever be 0,
> unless it's a bug in clocksource core.
> 
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/clocksource/timer-tegra.c | 13 ++++++++++---
>  1 file changed, 10 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/clocksource/timer-tegra.c b/drivers/clocksource/timer-tegra.c
> index 2673b6e0caa8..b84324288749 100644
> --- a/drivers/clocksource/timer-tegra.c
> +++ b/drivers/clocksource/timer-tegra.c
> @@ -54,9 +54,16 @@ static int tegra_timer_set_next_event(unsigned long cycles,
>  {
>  	void __iomem *reg_base = timer_of_base(to_timer_of(evt));
>  
> -	writel_relaxed(TIMER_PTV_EN |
> -		       ((cycles > 1) ? (cycles - 1) : 0), /* n+1 scheme */
> -		       reg_base + TIMER_PTV);
> +	/*
> +	 * Tegra's timer uses n+1 scheme for the counter, i.e. timer will
> +	 * fire after one tick if 0 is loaded.
> +	 *
> +	 * The minimum and maximum numbers of oneshot ticks are defined
> +	 * by clockevents_config_and_register(1, 0x1fffffff + 1) invocation
> +	 * below in the code. Hence the cycles (ticks) can't be outside of
> +	 * a range supportable by hardware.
> +	 */
> +	writel_relaxed(TIMER_PTV_EN | (cycles - 1), reg_base + TIMER_PTV);
>  
>  	return 0;
>  }
> 


Acked-by: Jon Hunter <jonathanh@nvidia.com>

Cheers
Jon

-- 
nvpublic
