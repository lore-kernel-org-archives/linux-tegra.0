From: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH v2 2/6] clocksource/drivers/tegra: Remove duplicated use
 of per_cpu_ptr
Date: Fri, 14 Jun 2019 16:48:12 +0100
Message-ID: <1aea7e18-fd5a-5ec7-4ae3-fb19826495bb@nvidia.com>
References: <20190610164400.11830-1-digetx@gmail.com>
 <20190610164400.11830-3-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190610164400.11830-3-digetx@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, Joseph Lo <josephl@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>, Peter De Schrijver <pdeschrijver@nvidia.com>
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


On 10/06/2019 17:43, Dmitry Osipenko wrote:
> It was left unnoticed by accident, which means that the code could be
> cleaned up a tad more.
> 
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/clocksource/timer-tegra.c | 42 ++++++++++++++++++-------------
>  1 file changed, 25 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/clocksource/timer-tegra.c b/drivers/clocksource/timer-tegra.c
> index 830c66e2d927..810b4e7435cf 100644
> --- a/drivers/clocksource/timer-tegra.c
> +++ b/drivers/clocksource/timer-tegra.c
> @@ -216,6 +216,19 @@ static inline unsigned int tegra_irq_idx_for_cpu(int cpu, bool tegra20)
>  	return TIMER10_IRQ_IDX + cpu;
>  }
>  
> +static inline unsigned long tegra_rate_for_timer(struct timer_of *to,
> +						 bool tegra20)
> +{
> +	/*
> +	 * TIMER1-9 are fixed to 1MHz, TIMER10-13 are running off the
> +	 * parent clock.
> +	 */
> +	if (tegra20)
> +		return 1000000;
> +
> +	return timer_of_rate(to);
> +}
> +
>  static int __init tegra_init_timer(struct device_node *np, bool tegra20,
>  				   int rating)
>  {
> @@ -268,32 +281,27 @@ static int __init tegra_init_timer(struct device_node *np, bool tegra20,
>  
>  	for_each_possible_cpu(cpu) {
>  		struct timer_of *cpu_to = per_cpu_ptr(&tegra_to, cpu);
> +		unsigned long flags = IRQF_TIMER | IRQF_NOBALANCING;
> +		unsigned long rate = tegra_rate_for_timer(to, tegra20);
>  		unsigned int base = tegra_base_for_cpu(cpu, tegra20);
>  		unsigned int idx = tegra_irq_idx_for_cpu(cpu, tegra20);
> +		unsigned int irq = irq_of_parse_and_map(np, idx);
>  
> -		/*
> -		 * TIMER1-9 are fixed to 1MHz, TIMER10-13 are running off the
> -		 * parent clock.
> -		 */
> -		if (tegra20)
> -			cpu_to->of_clk.rate = 1000000;
> -		else
> -			cpu_to->of_clk.rate = timer_of_rate(to);
> -
> -		cpu_to = per_cpu_ptr(&tegra_to, cpu);
> -		cpu_to->of_base.base = timer_reg_base + base;
> -		cpu_to->clkevt.rating = rating;
> -		cpu_to->clkevt.cpumask = cpumask_of(cpu);
> -		cpu_to->clkevt.irq = irq_of_parse_and_map(np, idx);
> -		if (!cpu_to->clkevt.irq) {
> +		if (!irq) {
>  			pr_err("failed to map irq for cpu%d\n", cpu);
>  			ret = -EINVAL;
>  			goto out_irq;
>  		}
>  
> +		cpu_to->clkevt.irq = irq;
> +		cpu_to->clkevt.rating = rating;
> +		cpu_to->clkevt.cpumask = cpumask_of(cpu);
> +		cpu_to->of_base.base = timer_reg_base + base;
> +		cpu_to->of_clk.rate = rate;
> +
>  		irq_set_status_flags(cpu_to->clkevt.irq, IRQ_NOAUTOEN);
> -		ret = request_irq(cpu_to->clkevt.irq, tegra_timer_isr,
> -				  IRQF_TIMER | IRQF_NOBALANCING,
> +
> +		ret = request_irq(cpu_to->clkevt.irq, tegra_timer_isr, flags,
>  				  cpu_to->clkevt.name, &cpu_to->clkevt);
>  		if (ret) {
>  			pr_err("failed to set up irq for cpu%d: %d\n",
> 

Acked-by: Jon Hunter <jonathanh@nvidia.com>

Cheers
Jon

-- 
nvpublic
