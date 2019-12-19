From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: Re: [PATCH v1 1/3] gpio: tegra: Use generic readl_relaxed/writel_relaxed
 accessors
Date: Thu, 19 Dec 2019 12:01:41 +0100
Message-ID: <CAMpxmJUmLOZoKeeo4XMVEOWKRgwfS4O2szVboY-qTTYXg_aTVg@mail.gmail.com>
References: <20191215183047.9414-1-digetx@gmail.com> <20191215183047.9414-2-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191215183047.9414-2-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Linus Walleij <linus.walleij@linaro.org>, linux-gpio <linux-gpio@vger.kernel.org>, linux-tegra@vger.kernel.org, devel@driverdev.osuosl.org, LKML <linux-kernel@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

niedz., 15 gru 2019 o 19:31 Dmitry Osipenko <digetx@gmail.com> napisa=C5=82=
(a):
>
> There is no point in using old-style raw accessors, the generic accessors
> do the same thing and also take into account CPU endianness. Tegra SoCs d=
o
> not support big-endian mode in the upstream kernel, but let's switch away
> from the outdated things anyway, just to keep code up-to-date.
>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/gpio/gpio-tegra.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpio/gpio-tegra.c b/drivers/gpio/gpio-tegra.c
> index 6fdfe4c5303e..f6a382fbd12d 100644
> --- a/drivers/gpio/gpio-tegra.c
> +++ b/drivers/gpio/gpio-tegra.c
> @@ -96,12 +96,12 @@ struct tegra_gpio_info {
>  static inline void tegra_gpio_writel(struct tegra_gpio_info *tgi,
>                                      u32 val, u32 reg)
>  {
> -       __raw_writel(val, tgi->regs + reg);
> +       writel_relaxed(val, tgi->regs + reg);
>  }
>
>  static inline u32 tegra_gpio_readl(struct tegra_gpio_info *tgi, u32 reg)
>  {
> -       return __raw_readl(tgi->regs + reg);
> +       return readl_relaxed(tgi->regs + reg);
>  }
>
>  static unsigned int tegra_gpio_compose(unsigned int bank, unsigned int p=
ort,
> --
> 2.24.0
>

The entire series looks good to me, but I'll wait for Thierry's acks
just in case.

Bart
