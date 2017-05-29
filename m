From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
Subject: Re: [PATCH 2/7] clocksource: Rename CLOCKSOURCE_OF_DECLARE
Date: Mon, 29 May 2017 09:39:09 +0200
Message-ID: <1710049.UcE0hxO5ny@diego>
References: <1495879129-28109-1-git-send-email-daniel.lezcano@linaro.org> <1495879129-28109-2-git-send-email-daniel.lezcano@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-mips-bounce@linux-mips.org>
In-Reply-To: <1495879129-28109-2-git-send-email-daniel.lezcano@linaro.org>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: tglx@linutronix.de, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Russell King <linux@armlinux.org.uk>, Michal Simek <monstr@monstr.eu>, John Crispin <john@phrozen.org>, Ralf Baechle <ralf@linux-mips.org>, Ley Foon Tan <lftan@altera.com>, Vineet Gupta <vgupta@synopsys.com>, Mark Rutland <mark.rutland@arm.com>, Marc Zyngier <marc.zyngier@arm.com>, Patrice Chotard <patrice.chotard@st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@st.com>, Florian Fainelli <f.fainelli@gmail.com>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, "maintainer:BROADCOM BCM281XX/BCM11XXX/BCM216XX ARM ARCHITE..." <bcm-kernel-feedback-list@broadcom.com>, Stephen Warren <swarren@wwwdotorg.org>
List-Id: linux-tegra@vger.kernel.org

Am Samstag, 27. Mai 2017, 11:58:43 CEST schrieb Daniel Lezcano:
> The CLOCKSOUCE_OF_DECLARE macro is used widely for the timers to declare the
> clocksource at early stage. However, this macro is also used to initialize
> the clockevent if any, or the clockevent only.
> 
> It was originally suggested to declare another macro to initialize a
> clockevent, so in order to separate the two entities even they belong to the
> same IP. This was not accepted because of the impact on the DT where
> splitting a clocksource/clockevent definition does not make sense as it is
> a Linux concept not a hardware description.
> 
> On the other side, the clocksource has not interrupt declared while the
> clockevent has, so it is easy from the driver to know if the description is
> for a clockevent or a clocksource, IOW it could be implemented at the driver
> level.
> 
> So instead of dealing with a named clocksource macro, let's use a more
> generic one: TIMER_OF_DECLARE.
> 
> The patch has not functional changes.
> 
> Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
> ---
[...]
> diff --git a/drivers/clocksource/rockchip_timer.c
> b/drivers/clocksource/rockchip_timer.c index 49c02be..c27f4c8 100644
> --- a/drivers/clocksource/rockchip_timer.c
> +++ b/drivers/clocksource/rockchip_timer.c
> @@ -303,5 +303,5 @@ static int __init rk_timer_init(struct device_node *np)
>  	return -EINVAL;
>  }
> 
> -CLOCKSOURCE_OF_DECLARE(rk3288_timer, "rockchip,rk3288-timer",
> rk_timer_init); -CLOCKSOURCE_OF_DECLARE(rk3399_timer,
> "rockchip,rk3399-timer", rk_timer_init); +TIMER_OF_DECLARE(rk3288_timer,
> "rockchip,rk3288-timer", rk_timer_init); +TIMER_OF_DECLARE(rk3399_timer,
> "rockchip,rk3399-timer", rk_timer_init); diff --git
> a/drivers/clocksource/samsung_pwm_timer.c
> b/drivers/clocksource/samsung_pwm_timer.c index a68e653..21cd72c 100644

Acked-by: Heiko Stuebner <heiko@sntech.de>
