From: Vidya Sagar <vidyas@nvidia.com>
Subject: Re: [PATCH 6/9] pinctrl: tegra: Pass struct tegra_pmx for pin range
 check
Date: Thu, 19 Mar 2020 22:37:43 +0530
Message-ID: <316a2eb5-8fc5-1371-244b-ffcdbedc6c8e@nvidia.com>
References: <20200319122737.3063291-1-thierry.reding@gmail.com>
 <20200319122737.3063291-7-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <20200319122737.3063291-7-thierry.reding@gmail.com>
Content-Language: en-US
Sender: linux-gpio-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc: Jon Hunter <jonathanh@nvidia.com>, linux-gpio@vger.kernel.org, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org



On 3/19/2020 5:57 PM, Thierry Reding wrote:
> External email: Use caution opening links or attachments
> 
> 
> From: Thierry Reding <treding@nvidia.com>
> 
> Pass the struct tegra_pmx when checking for the pin range in device
> tree. This makes the call site a bit easier to read and will help keep
> that readability in a subsequent patch.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>   drivers/pinctrl/tegra/pinctrl-tegra.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/pinctrl/tegra/pinctrl-tegra.c b/drivers/pinctrl/tegra/pinctrl-tegra.c
> index cefbbb8d1a68..c8246cc2c4fd 100644
> --- a/drivers/pinctrl/tegra/pinctrl-tegra.c
> +++ b/drivers/pinctrl/tegra/pinctrl-tegra.c
> @@ -689,12 +689,12 @@ const struct dev_pm_ops tegra_pinctrl_pm = {
>          .resume = &tegra_pinctrl_resume
>   };
> 
> -static bool gpio_node_has_range(const char *compatible)
> +static bool tegra_pinctrl_gpio_node_has_range(struct tegra_pmx *pmx)
>   {
>          struct device_node *np;
>          bool has_prop = false;
> 
> -       np = of_find_compatible_node(NULL, NULL, compatible);
> +       np = of_find_compatible_node(NULL, NULL, pmx->soc->gpio_compatible);
>          if (!np)
>                  return has_prop;
> 
> @@ -794,7 +794,7 @@ int tegra_pinctrl_probe(struct platform_device *pdev,
> 
>          tegra_pinctrl_clear_parked_bits(pmx);
> 
> -       if (!gpio_node_has_range(pmx->soc->gpio_compatible))
> +       if (!tegra_pinctrl_gpio_node_has_range(pmx))
>                  pinctrl_add_gpio_range(pmx->pctl, &tegra_pinctrl_gpio_range);
> 
>          platform_set_drvdata(pdev, pmx);
> --
> 2.24.1
> 
Tested-by: Vidya Sagar <vidyas@nvidia.com>
