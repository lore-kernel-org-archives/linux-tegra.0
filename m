From: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH v2 4/6] clocksource/drivers/tegra: Drop unneeded
 typecasting in one place
Date: Fri, 14 Jun 2019 16:48:36 +0100
Message-ID: <2bea2303-42bb-a306-72ec-be60b00e2b23@nvidia.com>
References: <20190610164400.11830-1-digetx@gmail.com>
 <20190610164400.11830-5-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190610164400.11830-5-digetx@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, Joseph Lo <josephl@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>, Peter De Schrijver <pdeschrijver@nvidia.com>
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


On 10/06/2019 17:43, Dmitry Osipenko wrote:
> There is no need to cast void because kernel allows to do that without
> a warning message from a compiler.
> 
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/clocksource/timer-tegra.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/clocksource/timer-tegra.c b/drivers/clocksource/timer-tegra.c
> index 646b3530c2d2..a7fa12488066 100644
> --- a/drivers/clocksource/timer-tegra.c
> +++ b/drivers/clocksource/timer-tegra.c
> @@ -81,7 +81,7 @@ static int tegra_timer_set_periodic(struct clock_event_device *evt)
>  
>  static irqreturn_t tegra_timer_isr(int irq, void *dev_id)
>  {
> -	struct clock_event_device *evt = (struct clock_event_device *)dev_id;
> +	struct clock_event_device *evt = dev_id;
>  	void __iomem *reg_base = timer_of_base(to_timer_of(evt));
>  
>  	writel_relaxed(TIMER_PCR_INTR_CLR, reg_base + TIMER_PCR);

Acked-by: Jon Hunter <jonathanh@nvidia.com>

Cheers
Jon

-- 
nvpublic
