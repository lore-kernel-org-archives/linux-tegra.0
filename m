From: Vidya Sagar <vidyas-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 7/9] pinctrl: tegra: Do not add default pin range on
 Tegra194
Date: Thu, 19 Mar 2020 22:38:06 +0530
Message-ID: <5c5b5a17-edd5-4c81-d587-2fdd2abab586@nvidia.com>
References: <20200319122737.3063291-1-thierry.reding@gmail.com>
 <20200319122737.3063291-8-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200319122737.3063291-8-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Bartosz Golaszewski <bgolaszewski-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Cc: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org



On 3/19/2020 5:57 PM, Thierry Reding wrote:
> External email: Use caution opening links or attachments
> 
> 
> From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> 
> On Tegra194, almost all of the pin control programming happens in early
> boot firmware, so there is no use in having a pin range defined for all
> the pins.
> 
> Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>   drivers/pinctrl/tegra/pinctrl-tegra.c    | 2 +-
>   drivers/pinctrl/tegra/pinctrl-tegra194.c | 1 -
>   2 files changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/pinctrl/tegra/pinctrl-tegra.c b/drivers/pinctrl/tegra/pinctrl-tegra.c
> index c8246cc2c4fd..65511bf27d34 100644
> --- a/drivers/pinctrl/tegra/pinctrl-tegra.c
> +++ b/drivers/pinctrl/tegra/pinctrl-tegra.c
> @@ -794,7 +794,7 @@ int tegra_pinctrl_probe(struct platform_device *pdev,
> 
>          tegra_pinctrl_clear_parked_bits(pmx);
> 
> -       if (!tegra_pinctrl_gpio_node_has_range(pmx))
> +       if (pmx->soc->ngpios > 0 && !tegra_pinctrl_gpio_node_has_range(pmx))
>                  pinctrl_add_gpio_range(pmx->pctl, &tegra_pinctrl_gpio_range);
> 
>          platform_set_drvdata(pdev, pmx);
> diff --git a/drivers/pinctrl/tegra/pinctrl-tegra194.c b/drivers/pinctrl/tegra/pinctrl-tegra194.c
> index d4e84530158c..61fc7e680788 100644
> --- a/drivers/pinctrl/tegra/pinctrl-tegra194.c
> +++ b/drivers/pinctrl/tegra/pinctrl-tegra194.c
> @@ -134,7 +134,6 @@ static const struct tegra_pingroup tegra194_groups[] = {
>   };
> 
>   static const struct tegra_pinctrl_soc_data tegra194_pinctrl = {
> -       .ngpios = TEGRA_PIN_NUM_GPIOS,
>          .pins = tegra194_pins,
>          .npins = ARRAY_SIZE(tegra194_pins),
>          .functions = tegra194_functions,
> --
> 2.24.1
> 
Tested-by: Vidya Sagar <vidyas-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
