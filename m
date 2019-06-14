From: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH v2 6/6] clocksource/drivers/tegra: Restore base address
 before cleanup
Date: Fri, 14 Jun 2019 16:48:45 +0100
Message-ID: <b2eeb477-2e08-eaf5-6355-4a05cec5a9b7@nvidia.com>
References: <20190610164400.11830-1-digetx@gmail.com>
 <20190610164400.11830-7-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190610164400.11830-7-digetx@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, Joseph Lo <josephl@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>, Peter De Schrijver <pdeschrijver@nvidia.com>
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


On 10/06/2019 17:44, Dmitry Osipenko wrote:
> We're adjusting the timer's base for each per-CPU timer to point to the
> actual start of the timer since device-tree defines a compound registers
> range that includes all of the timers. In this case the original base
> need to be restore before calling iounmap to unmap the proper address.
> 
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/clocksource/timer-tegra.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/clocksource/timer-tegra.c b/drivers/clocksource/timer-tegra.c
> index 2a428fdf702f..7be91db98bd7 100644
> --- a/drivers/clocksource/timer-tegra.c
> +++ b/drivers/clocksource/timer-tegra.c
> @@ -345,6 +345,8 @@ static int __init tegra_init_timer(struct device_node *np, bool tegra20,
>  			irq_dispose_mapping(cpu_to->clkevt.irq);
>  		}
>  	}
> +
> +	to->of_base.base = timer_reg_base;
>  out:
>  	timer_of_cleanup(to);

So what you are saying is that because we don't know which CPU executes
the tegra_init_timer() function, then it is necessary to restore the
base. IOW if it is not CPU0, then the base will be updated and hence,
need to be restored. Correct?

Jon

-- 
nvpublic
