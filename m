From: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH 6/6] pinctrl: tegra: Add driver to configure voltage and
 power state of io pads
Date: Thu, 12 May 2016 20:48:26 +0100
Message-ID: <5734DE0A.5090600@nvidia.com>
References: <1462191434-28933-1-git-send-email-ldewangan@nvidia.com>
 <1462191434-28933-7-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1462191434-28933-7-git-send-email-ldewangan@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>, swarren@wwwdotorg.org, linus.walleij@linaro.org, gnurou@gmail.com, robh+dt@kernel.org, mark.rutland@arm.com, thierry.reding@gmail.com
Cc: linux-tegra@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


On 02/05/16 13:17, Laxman Dewangan wrote:
> NVIDIA Tegra210 supports the IO pads which can operate at 1.8V
> or 3.3V I/O voltage levels. Also the IO pads can be configured
> for power down state if it is not used. SW needs to configure the
> voltage level of IO pads based on IO rail voltage and its power
> state based on platform usage.
> 
> The voltage and power state configurations of pads are provided
> through pin control frameworks. Add pin control driver for Tegra's
> IO pads' voltage and power state configurations.
> 
> Signed-off-by: Laxman Dewangan <ldewangan@nvidia.com>
> 
> ---
> Changes from V1:
> - Use the generic pincontrol property for low power enable/disable.
> - sync with latest and remove all MODULE* macros
> - Use renamed APIs form PMC
> ---
>  drivers/pinctrl/tegra/Makefile                  |   1 +
>  drivers/pinctrl/tegra/pinctrl-tegra210-io-pad.c | 301 ++++++++++++++++++++++++
>  2 files changed, 302 insertions(+)
>  create mode 100644 drivers/pinctrl/tegra/pinctrl-tegra210-io-pad.c

[snip]

> +static int tegra_io_pad_pinconf_get(struct pinctrl_dev *pctldev,
> +				    unsigned int pin, unsigned long *config)
> +{
> +	struct tegra_io_pads_info *tiopi = pinctrl_dev_get_drvdata(pctldev);
> +	int param = pinconf_to_config_param(*config);
> +	struct tegra_io_pads_cfg_info *pad_cfg = &tiopi->pads_cfg[pin];
> +	int pad_id = pad_cfg->pad_id;
> +	int arg = 0;
> +	int ret;
> +
> +	switch (param) {
> +	case TEGRA_IO_PAD_POWER_SOURCE_VOLTAGE:
> +		ret = tegra_io_pads_get_configured_voltage(pad_id);
> +		if (ret < 0)
> +			return ret;
> +		arg = (ret =  3300000) ? 1 : 0;

This should be (ret == 3300000).

Cheers
Jon
