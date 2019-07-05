From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: Re: [PATCH] gpio: tegra: Fix build error without CONFIG_DEBUG_FS
Date: Fri, 5 Jul 2019 14:40:12 +0200
Message-ID: <CAMpxmJVZHJKQ7bbHo=T9R99qguF315bZ=YVRrCdqti2SyzAnDg@mail.gmail.com>
References: <20190705123220.54008-1-yuehaibing@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190705123220.54008-1-yuehaibing@huawei.com>
Sender: linux-kernel-owner@vger.kernel.org
To: YueHaibing <yuehaibing@huawei.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, LKML <linux-kernel@vger.kernel.org>, linux-gpio <linux-gpio@vger.kernel.org>, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

pt., 5 lip 2019 o 14:34 YueHaibing <yuehaibing@huawei.com> napisa=C5=82(a):
>
> If CONFIG_DEBUG_FS is not set, building fails:
>
> drivers/gpio/gpio-tegra.c: In function tegra_gpio_probe:
> drivers/gpio/gpio-tegra.c:665:2: error: implicit declaration of function =
debugfs_create_file;
>  did you mean bus_create_file? [-Werror=3Dimplicit-function-declaration]
>   debugfs_create_file("tegra_gpio", 0444, NULL, tgi,
>   ^~~~~~~~~~~~~~~~~~~
>   bus_create_file
> drivers/gpio/gpio-tegra.c:666:9: error: tegra_dbg_gpio_fops undeclared (f=
irst use in this function);
>  did you mean tegra_gpio_pm_ops?
>         &tegra_dbg_gpio_fops);
>          ^~~~~~~~~~~~~~~~~~~
>          tegra_gpio_pm_ops
>
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Fixes: a4de43049a1d ("gpio: tegra: Clean-up debugfs initialisation")
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> ---
>  drivers/gpio/gpio-tegra.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/gpio/gpio-tegra.c b/drivers/gpio/gpio-tegra.c
> index 59b99d8..40fd6bd 100644
> --- a/drivers/gpio/gpio-tegra.c
> +++ b/drivers/gpio/gpio-tegra.c
> @@ -662,8 +662,10 @@ static int tegra_gpio_probe(struct platform_device *=
pdev)
>                 }
>         }
>
> +#ifdef CONFIG_DEBUG_FS
>         debugfs_create_file("tegra_gpio", 0444, NULL, tgi,
>                             &tegra_dbg_gpio_fops);
> +#endif
>
>         return 0;
>  }
> --
> 2.7.4
>
>

Nack, there are inline stubs for all debugfs functions in
./include/linux/debugfs.h if CONFIG_DEBUG_FS is not selected. Just
move the #include <linux/debugfs.h> to the top of the source file.

Bart
