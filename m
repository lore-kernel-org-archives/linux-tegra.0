From: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/7] clocksource: Rename CLOCKSOURCE_OF_DECLARE
Date: Mon, 29 May 2017 15:25:12 +0200
Message-ID: <5d5d1f1b-0948-f28d-0c52-adcdbdf89244@gmail.com>
References: <1495879129-28109-1-git-send-email-daniel.lezcano@linaro.org>
 <1495879129-28109-2-git-send-email-daniel.lezcano@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <1495879129-28109-2-git-send-email-daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-rockchip/>
List-Post: <mailto:linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-rockchip" <linux-rockchip-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "open list:RALINK MIPS ARCHITECTURE" <linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, Baruch Siach <baruch-NswTu9S1W3P6gbPvEgmw2w@public.gmane.org>, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Santosh Shilimkar <ssantosh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Liviu Dudau <liviu.dudau-5wv7dgnIgG8@public.gmane.org>, "moderated list:ARM/OXNAS platform support" <linux-oxnas-Xt5XgHjqiBU06sgRBLv0+0B+6BGkLq7r@public.gmane.org>, Patrice Chotard <patrice.chotard-qxv4g6HH51o@public.gmane.org>, Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Ingo Molnar <mingo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "open list:ARM/STI ARCHITECTURE" <kernel-F5mvAk5X5gdBDgjK7y7TUQ@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "moderated list:ARM/SAMSUNG EXYNOS ARM ARCHITECTURES" <linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "moderated list:H8/300 ARCHITECTURE" <uclinux-h8-devel-5NWGOfrQmneRv+LV9MX5uooqe+aC9MnS@public.gmane.org>, Alexander Shiyan <shc>
List-Id: linux-tegra@vger.kernel.org



On 27/05/17 11:58, Daniel Lezcano wrote:
> The CLOCKSOUCE_OF_DECLARE macro is used widely for the timers to declare the
> clocksource at early stage. However, this macro is also used to initialize
> the clockevent if any, or the clockevent only.
> 
> It was originally suggested to declare another macro to initialize a
> clockevent, so in order to separate the two entities even they belong to the
> same IP. This was not accepted because of the impact on the DT where splitting
> a clocksource/clockevent definition does not make sense as it is a Linux
> concept not a hardware description.
> 
> On the other side, the clocksource has not interrupt declared while the
> clockevent has, so it is easy from the driver to know if the description is
> for a clockevent or a clocksource, IOW it could be implemented at the driver
> level.
> 
> So instead of dealing with a named clocksource macro, let's use a more generic
> one: TIMER_OF_DECLARE.
> 
> The patch has not functional changes.
> 
> Signed-off-by: Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> ---

[...]

> diff --git a/drivers/clocksource/mtk_timer.c b/drivers/clocksource/mtk_timer.c
> index 9065949..f9b724f 100644
> --- a/drivers/clocksource/mtk_timer.c
> +++ b/drivers/clocksource/mtk_timer.c
> @@ -265,4 +265,4 @@ static int __init mtk_timer_init(struct device_node *node)
>   
>   	return -EINVAL;
>   }
> -CLOCKSOURCE_OF_DECLARE(mtk_mt6577, "mediatek,mt6577-timer", mtk_timer_init);
> +TIMER_OF_DECLARE(mtk_mt6577, "mediatek,mt6577-timer", mtk_timer_init);

For the mediatek driver:

Acked-by: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
