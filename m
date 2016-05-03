From: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH 4/6] soc/tegra: pmc: Register PMC child devices as
 platform device
Date: Tue, 3 May 2016 16:26:54 +0100
Message-ID: <5728C33E.1060306@nvidia.com>
References: <1462191434-28933-1-git-send-email-ldewangan@nvidia.com>
 <1462191434-28933-5-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1462191434-28933-5-git-send-email-ldewangan@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>, swarren@wwwdotorg.org, linus.walleij@linaro.org, gnurou@gmail.com, robh+dt@kernel.org, mark.rutland@arm.com, thierry.reding@gmail.com
Cc: linux-tegra@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


On 02/05/16 13:17, Laxman Dewangan wrote:
> Power Management Controller(PMC) of Tegra does the multiple chip
> power related functionality for internal and IO interfacing.
> Some of the functionalities are power gating of IP blocks, IO pads
> voltage and power state configuration, system power state configurations,
> wakeup controls etc.
> 
> Different functionalities of the PMC are provided through different
> framework like IO pads control can be provided through pinctrl framework,
> IO power control is via misc driver etc. All sub functionalities are
> represented as PMC child devices.
> 
> Register the PMC child devices as platform device and fill the child
> devices table for Tegra210.
> 
> Signed-off-by: Laxman Dewangan <ldewangan@nvidia.com>
> 
> ---
> Changes from V1:
> Reworked on DT for having flat entry and register all child devices
> as simple platform device instead of of_populate_device().
> ---
>  drivers/soc/tegra/pmc.c | 54 +++++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 54 insertions(+)
> 
> diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
> index b3be4b9..625167e 100644
> --- a/drivers/soc/tegra/pmc.c
> +++ b/drivers/soc/tegra/pmc.c
> @@ -132,6 +132,8 @@ struct tegra_pmc_soc {
>  	const u8 *cpu_powergates;
>  	const struct tegra_io_pads_control *io_pads_control;
>  	unsigned int num_io_pads;
> +	const char **sub_devs_name;
> +	unsigned int num_sub_devs;
>  	bool has_tsense_reset;
>  	bool has_gpu_clamps;
>  };
> @@ -158,6 +160,8 @@ struct tegra_pmc_soc {
>   * @lp0_vec_size: size of the LP0 warm boot code
>   * @powergates_available: Bitmap of available power gates
>   * @powergates_lock: mutex for power gate register access
> + * @pdevs: Platform device for PMC child devices.
> + * @num_pdevs: Number of platform devices.
>   */
>  struct tegra_pmc {
>  	struct device *dev;
> @@ -184,6 +188,9 @@ struct tegra_pmc {
>  	DECLARE_BITMAP(powergates_available, TEGRA_POWERGATE_MAX);
>  
>  	struct mutex powergates_lock;
> +
> +	struct platform_device **pdevs;
> +	unsigned int num_pdevs;

We already have num_sub_devs in the soc data, do we really need this?

>  };
>  
>  static struct tegra_pmc *pmc = &(struct tegra_pmc) {
> @@ -1379,6 +1386,43 @@ out:
>  	of_node_put(np);
>  }
>  
> +static int  tegra_pmc_init_sub_devs(struct tegra_pmc *pmc)
> +{
> +	int ret, i;
> +
> +	if (!pmc->soc->num_sub_devs)
> +		return 0;
> +
> +	pmc->pdevs = devm_kzalloc(pmc->dev, sizeof(**pmc->pdevs), GFP_KERNEL);
> +	if (!pmc->pdevs)
> +		return -ENOMEM;
> +
> +	for (i = 0; i < pmc->soc->num_sub_devs; ++i) {
> +		pmc->pdevs[i] = platform_device_register_data(pmc->dev,
> +						pmc->soc->sub_devs_name[i],
> +						0, NULL, 0);
> +		if (IS_ERR(pmc->pdevs[i])) {
> +			ret = PTR_ERR(pmc->pdevs[i]);
> +			dev_err(pmc->dev,
> +				"Failed to register platform device for %s: %d\n",
> +				pmc->soc->sub_devs_name[i], ret);
> +			goto pdev_cleanups;
> +		}
> +		pmc->num_pdevs++;

I would get rid of pmc->num_pdevs because isn't this always equal to i here?

> +	}
> +
> +	return 0;
> +
> +pdev_cleanups:
> +	for (i = pmc->num_pdevs; i > 0; i--) {

Here I think this could be ...

	while (--i) {

> +		platform_device_unregister(pmc->pdevs[i - 1]);
> +		pmc->pdevs[i - 1] = NULL;
> +	}
> +	pmc->num_pdevs = 0;
> +
> +	return ret;
> +}

Cheers
Jon
