From: jckuo <jckuo@nvidia.com>
Subject: Re: [PATCH 4/5] phy: tegra: xusb: Add support for power supplies
Date: Mon, 28 Jan 2019 15:22:09 +0800
Message-ID: <786247a4-81d1-9c2e-21b5-258dc818ccb9@nvidia.com>
References: <20190125112525.10697-1-thierry.reding@gmail.com>
 <20190125112525.10697-4-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190125112525.10697-4-thierry.reding@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, Kishon Vijay Abraham I <kishon@ti.com>
Cc: Jonathan Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Hi Thierry,

I think any non-zero return value of 
regulator_bulk_enable()/devm_regulator_bulk_get() means error.

Thanks,

JC

On 1/25/19 7:25 PM, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
>
> Support enabling various supplies needed to provide power to the PLLs
> and logic used to drive the USB, PCI and SATA pads.
>
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>   drivers/phy/tegra/xusb.c | 34 +++++++++++++++++++++++++++++++++-
>   drivers/phy/tegra/xusb.h |  5 +++++
>   2 files changed, 38 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/phy/tegra/xusb.c b/drivers/phy/tegra/xusb.c
> index 57a2d08ef6da..e510629f4f1c 100644
> --- a/drivers/phy/tegra/xusb.c
> +++ b/drivers/phy/tegra/xusb.c
> @@ -864,6 +864,7 @@ static int tegra_xusb_padctl_probe(struct platform_device *pdev)
>   	struct tegra_xusb_padctl *padctl;
>   	const struct of_device_id *match;
>   	struct resource *res;
> +	unsigned int i;
>   	int err;
>   
>   	/* for backwards compatibility with old device trees */
> @@ -901,14 +902,38 @@ static int tegra_xusb_padctl_probe(struct platform_device *pdev)
>   		goto remove;
>   	}
>   
> +	padctl->supplies = devm_kcalloc(&pdev->dev, padctl->soc->num_supplies,
> +					sizeof(*padctl->supplies), GFP_KERNEL);
> +	if (!padctl->supplies) {
> +		err = -ENOMEM;
> +		goto remove;
> +	}
> +
> +	for (i = 0; i < padctl->soc->num_supplies; i++)
> +		padctl->supplies[i].supply = padctl->soc->supply_names[i];
> +
> +	err = devm_regulator_bulk_get(&pdev->dev, padctl->soc->num_supplies,
> +				      padctl->supplies);
> +	if (err < 0) {
> +		dev_err(&pdev->dev, "failed to get regulators: %d\n", err);
> +		goto remove;
> +	}
> +
>   	err = reset_control_deassert(padctl->rst);
>   	if (err < 0)
>   		goto remove;
>   
> +	err = regulator_bulk_enable(padctl->soc->num_supplies,
> +				    padctl->supplies);
> +	if (err < 0) {
> +		dev_err(&pdev->dev, "failed to enable supplies: %d\n", err);
> +		goto reset;
> +	}
> +
>   	err = tegra_xusb_setup_pads(padctl);
>   	if (err < 0) {
>   		dev_err(&pdev->dev, "failed to setup pads: %d\n", err);
> -		goto reset;
> +		goto power_down;
>   	}
>   
>   	err = tegra_xusb_setup_ports(padctl);
> @@ -921,6 +946,8 @@ static int tegra_xusb_padctl_probe(struct platform_device *pdev)
>   
>   remove_pads:
>   	tegra_xusb_remove_pads(padctl);
> +power_down:
> +	regulator_bulk_disable(padctl->soc->num_supplies, padctl->supplies);
>   reset:
>   	reset_control_assert(padctl->rst);
>   remove:
> @@ -936,6 +963,11 @@ static int tegra_xusb_padctl_remove(struct platform_device *pdev)
>   	tegra_xusb_remove_ports(padctl);
>   	tegra_xusb_remove_pads(padctl);
>   
> +	err = regulator_bulk_disable(padctl->soc->num_supplies,
> +				     padctl->supplies);
> +	if (err < 0)
> +		dev_err(&pdev->dev, "failed to disable supplies: %d\n", err);
> +
>   	err = reset_control_assert(padctl->rst);
>   	if (err < 0)
>   		dev_err(&pdev->dev, "failed to assert reset: %d\n", err);
> diff --git a/drivers/phy/tegra/xusb.h b/drivers/phy/tegra/xusb.h
> index bb60fc09c752..5d5d22f6cb41 100644
> --- a/drivers/phy/tegra/xusb.h
> +++ b/drivers/phy/tegra/xusb.h
> @@ -370,6 +370,9 @@ struct tegra_xusb_padctl_soc {
>   	} ports;
>   
>   	const struct tegra_xusb_padctl_ops *ops;
> +
> +	const char * const *supply_names;
> +	unsigned int num_supplies;
>   };
>   
>   struct tegra_xusb_padctl {
> @@ -393,6 +396,8 @@ struct tegra_xusb_padctl {
>   	unsigned int enable;
>   
>   	struct clk *clk;
> +
> +	struct regulator_bulk_data *supplies;
>   };
>   
>   static inline void padctl_writel(struct tegra_xusb_padctl *padctl, u32 value,
