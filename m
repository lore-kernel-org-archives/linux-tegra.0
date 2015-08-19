From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?=
	<u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH V3] Watchdog: Fix parent of watchdog_devices
Date: Wed, 19 Aug 2015 08:44:19 +0200
Message-ID: <20150819064419.GC9999@pengutronix.de>
References: <db7db9102158b87a4a7169e84e2272b3ba03f9f7.1439954581.git.panand@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <db7db9102158b87a4a7169e84e2272b3ba03f9f7.1439954581.git.panand@redhat.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
To: Pratyush Anand <panand@redhat.com>
Cc: linux@roeck-us.net, Krzysztof Kozlowski <k.kozlowski@samsung.com>, "open list:WOLFSON MICROELECTRONICS DRIVERS" <patches@opensource.wolfsonmicro.com>, "open list:ARM/STI ARCHITECTURE" <kernel@stlinux.com>, Linus Walleij <linus.walleij@linaro.org>, Baruch Siach <baruch@tkos.co.il>, "open list:INTEL MANAGEMENT ENGINE mei" <linux-kernel@vger.kernel.org>, Wim Van Sebroeck <wim@iguana.be>, Thierry Reding <thierry.reding@gmail.com>, Alexandre Courbot <gnurou@gmail.com>, "moderated list:ARM/SAMSUNG EXYNOS ARM ARCHITECTURES" <linux-samsung-soc@vger.kernel.org>, Lee Jones <lee@kernel.org>, Kukjin Kim <kgene@kernel.org>, Tomas Winkler <tomas.winkler@intel.com>, linux-watchdog@vger.kernel.org, Stephen Warren <swarren@wwwdotorg.org>, "moderated list:BROADCOM BCM2835 ARM ARCHITECTURE" <linux-rpi-kernel@lists.infradead.org>, "open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra>
List-Id: linux-tegra@vger.kernel.org

Hello,

On Wed, Aug 19, 2015 at 08:58:24AM +0530, Pratyush Anand wrote:
> /sys/class/watchdog/watchdogn/device/modalias can help to identify th=
e
> driver/module for a given watchdog node. However, many wdt devices do=
es not set

s/es//

> its parent and so, we do not see an entry for device in sysfs for suc=
h devices.
>=20
> This patch fixes parent of watchdog_device so that
> /sys/class/watchdog/watchdogn/device is populated.
>=20
> Exceptions: booke, diag288, mpc8xxx, octeon, softdog and w83627hf -- =
They do not
> have any parent. Not sure, how we can we identify driver for these de=
vices.

I don't see why you don't use the platform device as parent for mpc8xxx=
=2E

Note however that I did several updates to the mpc8xxx driver which
probably conflict with setting the parent. I'll take care of that.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig        =
    |
Industrial Linux Solutions                 | http://www.pengutronix.de/=
  |
