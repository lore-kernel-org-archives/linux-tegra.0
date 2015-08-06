From: Tomeu Vizoso <tomeu.vizoso@collabora.com>
Subject: Re: [PATCH v2 2/3] pinctrl: tegra: Only set the gpio range if needed
Date: Thu, 6 Aug 2015 15:40:32 +0200
Message-ID: <CAAObsKBk54ZAhGVmpONeBtX1AJv0woq7sp3cCGZ1FeDtTst_DA@mail.gmail.com>
References: <1436862596-27730-1-git-send-email-tomeu.vizoso@collabora.com> <1436862596-27730-3-git-send-email-tomeu.vizoso@collabora.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1436862596-27730-3-git-send-email-tomeu.vizoso@collabora.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Cc: linux-gpio@vger.kernel.org, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, Tomeu Vizoso <tomeu.vizoso@collabora.com>, Thierry Reding <thierry.reding@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, Stephen Warren <swarren@wwwdotorg.org>, Alexandre Courbot <gnurou@gmail.com>
List-Id: linux-tegra@vger.kernel.org

On 14 July 2015 at 10:29, Tomeu Vizoso <tomeu.vizoso@collabora.com> wrote:
> If the gpio DT node has the gpio-ranges property, the range will be
> added by the gpio core and doesn't need to be added by the pinctrl
> driver.
>
> By having the gpio-ranges property, we have an explicit dependency from
> the gpio node to the pinctrl node and we can stop using the deprecated
> pinctrl_add_gpio_range() function.
>
> Signed-off-by: Tomeu Vizoso <tomeu.vizoso@collabora.com>
> Acked-by: Stephen Warren <swarren@nvidia.com>

Hi Linus,

do you mind if this goes through the Tegra tree? It would be best if
it went together with 3/3 ("ARM: tegra: Add gpio-ranges property"), to
avoid duplicated GPIO ranges.

Thanks,

Tomeu

> ---
>
> Changes in v2: None
>
>  drivers/pinctrl/pinctrl-tegra.c | 19 ++++++++++++++++++-
>  1 file changed, 18 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/pinctrl/pinctrl-tegra.c b/drivers/pinctrl/pinctrl-tegra.c
> index 0f982b829be1..0fd7fd2b0f72 100644
> --- a/drivers/pinctrl/pinctrl-tegra.c
> +++ b/drivers/pinctrl/pinctrl-tegra.c
> @@ -624,6 +624,22 @@ static struct pinctrl_desc tegra_pinctrl_desc = {
>         .owner = THIS_MODULE,
>  };
>
> +static bool gpio_node_has_range(void)
> +{
> +       struct device_node *np;
> +       bool has_prop = false;
> +
> +       np = of_find_compatible_node(NULL, NULL, "nvidia,tegra30-gpio");
> +       if (!np)
> +               return has_prop;
> +
> +       has_prop = of_find_property(np, "gpio-ranges", NULL);
> +
> +       of_node_put(np);
> +
> +       return has_prop;
> +}
> +
>  int tegra_pinctrl_probe(struct platform_device *pdev,
>                         const struct tegra_pinctrl_soc_data *soc_data)
>  {
> @@ -708,7 +724,8 @@ int tegra_pinctrl_probe(struct platform_device *pdev,
>                 return PTR_ERR(pmx->pctl);
>         }
>
> -       pinctrl_add_gpio_range(pmx->pctl, &tegra_pinctrl_gpio_range);
> +       if (!gpio_node_has_range())
> +               pinctrl_add_gpio_range(pmx->pctl, &tegra_pinctrl_gpio_range);
>
>         platform_set_drvdata(pdev, pmx);
>
> --
> 2.4.3
>
