From: Maxime Coquelin <maxime.coquelin-qxv4g6HH51o@public.gmane.org>
Subject: Re: [PATCH V3] Watchdog: Fix parent of watchdog_devices
Date: Wed, 19 Aug 2015 12:55:05 +0200
Message-ID: <55D46089.8030801@st.com>
References: <db7db9102158b87a4a7169e84e2272b3ba03f9f7.1439954581.git.panand@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <db7db9102158b87a4a7169e84e2272b3ba03f9f7.1439954581.git.panand-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Pratyush Anand <panand-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org
Cc: linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kbuild test robot <fengguang.wu-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Andreas Werner <andreas.werner-csrFAY9JiS4@public.gmane.org>, Barry Song <baohua-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Baruch Siach <baruch-NswTu9S1W3P6gbPvEgmw2w@public.gmane.org>, Johannes Thumshirn <morbidrsa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, ARM/STI ARCHITECTURE <kernel-F5mvAk5X5gdBDgjK7y7TUQ@public.gmane.org>, Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Kukjin Kim <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Lee Jones <lee-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, ARM/U300 MACHINE SUPPORT <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "open list:INTEL MANAGEMENT ENGINE (mei)" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, BROADCOM BCM2835 ARM ARCHITECTURE <linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, ARM/SAMSUNG EXYNOS ARM ARCHITECTURES <linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, TEGRA ARCHITECTURE SUPPORT <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Hi Pratyush,

On 08/19/2015 05:28 AM, Pratyush Anand wrote:
> diff --git a/drivers/watchdog/st_lpc_wdt.c b/drivers/watchdog/st_lpc_wdt.c
> index 6785afdc0fca..14e9badf2bfa 100644
> --- a/drivers/watchdog/st_lpc_wdt.c
> +++ b/drivers/watchdog/st_lpc_wdt.c
> @@ -241,6 +241,7 @@ static int st_wdog_probe(struct platform_device *pdev)
>   		return -EINVAL;
>   	}
>   	st_wdog_dev.max_timeout = 0xFFFFFFFF / st_wdog->clkrate;
> +	st_wdog_dev.parent = &pdev->dev;
>   
>   	ret = clk_prepare_enable(clk);
>   	if (ret) {

Acked-by: Maxime Coquelin <maxime.coquelin-qxv4g6HH51o@public.gmane.org>

Thanks!
Maxime
--
To unsubscribe from this list: send the line "unsubscribe linux-watchdog" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
