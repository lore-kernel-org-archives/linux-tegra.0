From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH 1/2] clocksource: tegra: Use rating when registering clock
 source
Date: Fri, 14 Jun 2019 15:24:07 +0300
Message-ID: <8ff5d2da-907e-611c-ec82-bbe50197c2f4@gmail.com>
References: <20190614104747.19712-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190614104747.19712-1-thierry.reding@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, Alessandro Zummo <a.zummo@towertech.it>, Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Jonathan Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org, linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

14.06.2019 13:47, Thierry Reding пишет:
> From: Thierry Reding <treding@nvidia.com>
> 
> The rating is parameterized depending on SoC generation to make sure it
> takes precedence on implementations where the architected timer can't be
> used. This rating is already used for the clock event device. Use the
> same rating for the clock source to be consistent.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  drivers/clocksource/timer-tegra.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/clocksource/timer-tegra.c b/drivers/clocksource/timer-tegra.c
> index f6a8eb0d7322..e6608141cccb 100644
> --- a/drivers/clocksource/timer-tegra.c
> +++ b/drivers/clocksource/timer-tegra.c
> @@ -318,7 +318,7 @@ static int __init tegra_init_timer(struct device_node *np, bool tegra20,
>  	sched_clock_register(tegra_read_sched_clock, 32, TIMER_1MHz);
>  
>  	ret = clocksource_mmio_init(timer_reg_base + TIMERUS_CNTR_1US,
> -				    "timer_us", TIMER_1MHz, 300, 32,
> +				    "timer_us", TIMER_1MHz, rating, 32,
>  				    clocksource_mmio_readl_up);
>  	if (ret)
>  		pr_err("failed to register clocksource: %d\n", ret);
> 

Looks good. Although, could you please clarify whether arch-timer stops on T210 when CPU
enters deepest (powerdown) idle state? I'm starting to lose track a bit already. Because
if arch-timer stops in the deepest idle state, then it's a bit odd that Joseph didn't add
the clocksource for T210 in the first place and v5.1 probably shouldn't work well because
of that already.
