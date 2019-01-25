From: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH 5/7] soc/tegra: pmc: Make alignment consistent
Date: Fri, 25 Jan 2019 10:55:56 +0000
Message-ID: <e57f4663-fafc-510e-40fb-90fc0b350f59@nvidia.com>
References: <20190125102255.6862-1-thierry.reding@gmail.com>
 <20190125102255.6862-5-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190125102255.6862-5-thierry.reding@gmail.com>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: linux-tegra@vger.kernel.org, Stephen Warren <swarren@nvidia.com>, linux-arm-kernel@lists.infradead.org, Joseph Lo <josephl@nvidia.com>
List-Id: linux-tegra@vger.kernel.org


On 25/01/2019 10:22, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> Some recently added code used weird alignment and indentation. Fix these
> occurrences to make them consistent with the rest of the code.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  drivers/soc/tegra/pmc.c | 29 ++++++++++++++++++-----------
>  1 file changed, 18 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
> index 32dd619c098e..2a2e6aaae97e 100644
> --- a/drivers/soc/tegra/pmc.c
> +++ b/drivers/soc/tegra/pmc.c
> @@ -1502,8 +1502,8 @@ static int tegra_io_pad_pinctrl_get_groups_count(struct pinctrl_dev *pctl_dev)
>  	return pmc->soc->num_io_pads;
>  }
>  
> -static const char *tegra_io_pad_pinctrl_get_group_name(
> -		struct pinctrl_dev *pctl, unsigned int group)
> +static const char *tegra_io_pad_pinctrl_get_group_name(struct pinctrl_dev *pctl,
> +						       unsigned int group)
>  {
>  	struct tegra_pmc *pmc = pinctrl_dev_get_drvdata(pctl);
>  
> @@ -1519,6 +1519,7 @@ static int tegra_io_pad_pinctrl_get_group_pins(struct pinctrl_dev *pctl_dev,
>  
>  	*pins = &pmc->soc->io_pads[group].id;
>  	*num_pins = 1;
> +
>  	return 0;
>  }
>  
> @@ -1548,14 +1549,18 @@ static int tegra_io_pad_pinconf_get(struct pinctrl_dev *pctl_dev,
>  		ret = tegra_io_pad_get_voltage(pmc, pad->id);
>  		if (ret < 0)
>  			return ret;
> +
>  		arg = ret;
>  		break;
> +
>  	case PIN_CONFIG_LOW_POWER_MODE:
>  		ret = tegra_io_pad_is_powered(pmc, pad->id);
>  		if (ret < 0)
>  			return ret;
> +
>  		arg = !ret;
>  		break;
> +
>  	default:
>  		return -EINVAL;
>  	}
> @@ -1622,7 +1627,7 @@ static struct pinctrl_desc tegra_pmc_pctl_desc = {
>  
>  static int tegra_pmc_pinctrl_init(struct tegra_pmc *pmc)
>  {
> -	int err = 0;
> +	int err;
>  
>  	if (!pmc->soc->num_pin_descs)
>  		return 0;
> @@ -1635,14 +1640,16 @@ static int tegra_pmc_pinctrl_init(struct tegra_pmc *pmc)
>  					      pmc);
>  	if (IS_ERR(pmc->pctl_dev)) {
>  		err = PTR_ERR(pmc->pctl_dev);
> -		dev_err(pmc->dev, "unable to register pinctrl, %d\n", err);
> +		dev_err(pmc->dev, "failed to register pin controller: %d\n",
> +			err);
> +		return err;
>  	}
>  
> -	return err;
> +	return 0;
>  }
>  
>  static ssize_t reset_reason_show(struct device *dev,
> -			struct device_attribute *attr, char *buf)
> +				 struct device_attribute *attr, char *buf)
>  {
>  	u32 value, rst_src;
>  
> @@ -1656,7 +1663,7 @@ static ssize_t reset_reason_show(struct device *dev,
>  static DEVICE_ATTR_RO(reset_reason);
>  
>  static ssize_t reset_level_show(struct device *dev,
> -			struct device_attribute *attr, char *buf)
> +				struct device_attribute *attr, char *buf)
>  {
>  	u32 value, rst_lvl;
>  
> @@ -1678,16 +1685,16 @@ static void tegra_pmc_reset_sysfs_init(struct tegra_pmc *pmc)
>  		err = device_create_file(dev, &dev_attr_reset_reason);
>  		if (err < 0)
>  			dev_warn(dev,
> -				"failed to create attr \"reset_reason\": %d\n",
> -				err);
> +				 "failed to create attr \"reset_reason\": %d\n",
> +				 err);
>  	}
>  
>  	if (pmc->soc->reset_levels) {
>  		err = device_create_file(dev, &dev_attr_reset_level);
>  		if (err < 0)
>  			dev_warn(dev,
> -				"failed to create attr \"reset_level\": %d\n",
> -				err);
> +				 "failed to create attr \"reset_level\": %d\n",
> +				 err);
>  	}
>  }
>  
> 

Acked-by: Jon Hunter <jonathanh@nvidia.com>

Cheers
Jon
-- 
nvpublic
