From: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH v2 5/6] clocksource/drivers/tegra: Add verbose definition
 for 1MHz constant
Date: Fri, 14 Jun 2019 16:48:41 +0100
Message-ID: <2d890693-20b5-6f1d-89c8-f89533f04f22@nvidia.com>
References: <20190610164400.11830-1-digetx@gmail.com>
 <20190610164400.11830-6-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190610164400.11830-6-digetx@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, Joseph Lo <josephl@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>, Peter De Schrijver <pdeschrijver@nvidia.com>
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


On 10/06/2019 17:43, Dmitry Osipenko wrote:
> Convert all 1MHz literals to a verbose constant for better readability.
> 
> Suggested-by: Daniel Lezcano <daniel.lezcano@linaro.org>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/clocksource/timer-tegra.c | 12 +++++++-----
>  1 file changed, 7 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/clocksource/timer-tegra.c b/drivers/clocksource/timer-tegra.c
> index a7fa12488066..2a428fdf702f 100644
> --- a/drivers/clocksource/timer-tegra.c
> +++ b/drivers/clocksource/timer-tegra.c
> @@ -44,6 +44,8 @@
>  #define TIMER1_IRQ_IDX		0
>  #define TIMER10_IRQ_IDX		10
>  
> +#define TIMER_1MHz		1000000
> +
>  static u32 usec_config;
>  static void __iomem *timer_reg_base;
>  
> @@ -158,7 +160,7 @@ static unsigned long tegra_delay_timer_read_counter_long(void)
>  
>  static struct delay_timer tegra_delay_timer = {
>  	.read_current_timer = tegra_delay_timer_read_counter_long,
> -	.freq = 1000000,
> +	.freq = TIMER_1MHz,
>  };
>  #endif
>  
> @@ -224,7 +226,7 @@ static inline unsigned long tegra_rate_for_timer(struct timer_of *to,
>  	 * parent clock.
>  	 */
>  	if (tegra20)
> -		return 1000000;
> +		return TIMER_1MHz;
>  
>  	return timer_of_rate(to);
>  }
> @@ -313,11 +315,11 @@ static int __init tegra_init_timer(struct device_node *np, bool tegra20,
>  		}
>  	}
>  
> -	sched_clock_register(tegra_read_sched_clock, 32, 1000000);
> +	sched_clock_register(tegra_read_sched_clock, 32, TIMER_1MHz);
>  
>  	ret = clocksource_mmio_init(timer_reg_base + TIMERUS_CNTR_1US,
> -				    "timer_us", 1000000,
> -				    300, 32, clocksource_mmio_readl_up);
> +				    "timer_us", TIMER_1MHz, 300, 32,
> +				    clocksource_mmio_readl_up);
>  	if (ret)
>  		pr_err("failed to register clocksource: %d\n", ret);
>  

Acked-by: Jon Hunter <jonathanh@nvidia.com>

Cheers
Jon

-- 
nvpublic
