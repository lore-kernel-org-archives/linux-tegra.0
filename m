From: "Winkler, Tomas" <tomas.winkler@intel.com>
Subject: RE: [PATCH V3] Watchdog: Fix parent of watchdog_devices
Date: Thu, 20 Aug 2015 08:35:22 +0000
Message-ID: <5B8DA87D05A7694D9FA63FD143655C1B3D42A60A@hasmsx108.ger.corp.intel.com>
References: <db7db9102158b87a4a7169e84e2272b3ba03f9f7.1439954581.git.panand@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
In-Reply-To: <db7db9102158b87a4a7169e84e2272b3ba03f9f7.1439954581.git.panand@redhat.com>
Content-Language: en-US
Sender: linux-samsung-soc-owner@vger.kernel.org
To: Pratyush Anand <panand@redhat.com>, "linux@roeck-us.net" <linux@roeck-us.net>
Cc: "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>, "Wu, Fengguang" <fengguang.wu@intel.com>, Alexandre Courbot <gnurou@gmail.com>, Andreas Werner <andreas.werner@men.de>, Barry Song <baohua@kernel.org>, Baruch Siach <baruch@tkos.co.il>, Johannes Thumshirn <morbidrsa@gmail.com>, "open list:ARM/STI ARCHITECTURE" <kernel@stlinux.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Kukjin Kim <kgene@kernel.org>, Lee Jones <lee@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, "moderated list:ARM/U300 MACHINE SUPPORT" <linux-arm-kernel@lists.infradead.org>, "open list:INTEL MANAGEMENT ENGINE (mei)" <linux-kernel@vger.kernel.org>, "moderated list:BROADCOM BCM2835 ARM ARCHITECTURE" <linux-rpi-kernel@lists.infradead.org>, "moderated list:ARM/SAMSUNG EXYNOS ARM ARCHITECTURES" <linux-samsung-soc@vger.kernel.org>, open list:TEGRA ARCHITECTURE SUPPORT
List-Id: linux-tegra@vger.kernel.org

> diff --git a/drivers/misc/mei/wd.c b/drivers/misc/mei/wd.c
> index 2bc0f5089f82..b346638833b0 100644
> --- a/drivers/misc/mei/wd.c
> +++ b/drivers/misc/mei/wd.c
> @@ -364,6 +364,7 @@ int mei_watchdog_register(struct mei_device *dev)
> 
>  	int ret;
> 
> +	amt_wd_dev.parent = dev->dev;
>  	/* unlock to perserve correct locking order */
>  	mutex_unlock(&dev->device_lock);
>  	ret = watchdog_register_device(&amt_wd_dev);

Acked-by: Tomas Winkler <tomas.winkler@intel.com>

Should this be got to stable as well?
