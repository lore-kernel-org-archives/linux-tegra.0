From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH V2] Watchdog: Fix parent of watchdog_devices
Date: Wed, 26 Aug 2015 13:38:19 +0200
Message-ID: <CACRpkdbT0Ew_LXys++EDykM-gp08dxKQ4HYp0CfAmk7EoCET9A@mail.gmail.com>
References: <9fcc2a2cc8273f461baa13c6c9992f3ca56b508a.1439915117.git.panand@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <9fcc2a2cc8273f461baa13c6c9992f3ca56b508a.1439915117.git.panand-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Pratyush Anand <panand-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Andreas Werner <andreas.werner-csrFAY9JiS4@public.gmane.org>, Barry Song <baohua-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Baruch Siach <baruch-NswTu9S1W3P6gbPvEgmw2w@public.gmane.org>, Johannes Thumshirn <morbidrsa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "open list:ARM/STI ARCHITECTURE" <kernel-F5mvAk5X5gdBDgjK7y7TUQ@public.gmane.org>, Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Kukjin Kim <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Lee Jones <lee-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "moderated list:ARM/U300 MACHINE SUPPORT" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "open list:INTEL MANAGEMENT ENGINE (mei)" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "moderated list:BROADCOM BCM2835 ARM ARCHITECTURE" <linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "moderated list:ARM/SAMSUNG EXYNOS ARM ARCHITECTURES" <linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Maxime Coquelin <maxime.coquelin-qxv4g6HH51o@public.gmane.org>open li
List-Id: linux-tegra@vger.kernel.org

On Tue, Aug 18, 2015 at 6:34 PM, Pratyush Anand <panand-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> wrote:

> /sys/class/watchdog/watchdogn/device/modalias can help to identify the
> driver/module for a given watchdog node. However, many wdt devices does not set
> its parent and so, we do not see an entry for device in sysfs for such devices.
>
> This patch fixes parent of watchdog_device so that
> /sys/class/watchdog/watchdogn/device is populated.
>
> Exceptions: booke, diag288, mpc8xxx, octeon, softdog and w83627hf -- They do not
> have any parent. Not sure, how we can we identify driver for these devices.
>
> Signed-off-by: Pratyush Anand <panand-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>

Acked-by: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

Yours,
Linus Walleij
