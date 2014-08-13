From: Wei Ni <wni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 3/3] ARM: tegra: Add thermal reset (thermtrip) support
 to PMC
Date: Wed, 13 Aug 2014 18:10:02 +0800
Message-ID: <53EB397A.7000501@nvidia.com>
References: <1407226380-747-1-git-send-email-mperttunen@nvidia.com> <1407226380-747-4-git-send-email-mperttunen@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1407226380-747-4-git-send-email-mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org" <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, "thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 08/05/2014 04:13 PM, Mikko Perttunen wrote:
> This adds a device tree controlled option to enable PMC-based
> thermal reset in overheating situations. Thermtrip is supported on
> Tegra114 and Tegra124. The thermal reset only works when the thermal
> sensors are calibrated, so a soctherm driver is also required.
> 
> Signed-off-by: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  drivers/soc/tegra/pmc.c | 348 ++++++++++++++++++++++++++++++------------------
>  1 file changed, 216 insertions(+), 132 deletions(-)
> 
> diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
> index a2c0ceb..2c617d7 100644
> --- a/drivers/soc/tegra/pmc.c
> +++ b/drivers/soc/tegra/pmc.c
> @@ -83,11 +83,28 @@
> 
>  #define GPU_RG_CNTRL                   0x2d4
> 
> +#define PMC_SENSOR_CTRL                        0x1b0
> +#define PMC_SENSOR_CTRL_SCRATCH_WRITE  (1 << 2)
> +#define PMC_SENSOR_CTRL_ENABLE_RST     (1 << 1)
> +
> +#define PMC_SCRATCH54                  0x258
> +#define PMC_SCRATCH54_DATA_SHIFT       8
> +#define PMC_SCRATCH54_ADDR_SHIFT       0
> +
> +#define PMC_SCRATCH55                  0x25c
> +#define PMC_SCRATCH55_RESET_TEGRA      (1 << 31)
> +#define PMC_SCRATCH55_CNTRL_ID_SHIFT   27
> +#define PMC_SCRATCH55_PINMUX_SHIFT     24
> +#define PMC_SCRATCH55_16BITOP          (1 << 15)
> +#define PMC_SCRATCH55_CHECKSUM_SHIFT   16
> +#define PMC_SCRATCH55_I2CSLV1_SHIFT    0
> +
>  struct tegra_pmc_soc {
>         unsigned int num_powergates;
>         const char *const *powergates;
>         unsigned int num_cpu_powergates;
>         const u8 *cpu_powergates;
> +       bool has_thermal_reset;

According to the DRM, the scratch54/55 is used for TSENSE_RESET, so I
prefer to change the name to has_tsense_reset().

>  };
> 
>  /**
> @@ -606,6 +623,203 @@ void tegra_pmc_enter_suspend_mode(enum tegra_suspend_mode mode)
>  }

> +
> +void tegra_pmc_init_thermal_reset(struct device_node *np)

I prefer to change the name to tegra_pmc_init_tsense_reset().

> +{
> +       u32 pmu_i2c_addr, i2c_ctrl_id, reg_addr, reg_data, pinmux;
> +       bool pmu_16bit_ops;
> +       u32 val, checksum;
> +       const struct of_device_id *match = of_match_node(tegra_pmc_match, np);
> +       const struct tegra_pmc_soc *data = match->data;
> +

> --
> 1.8.1.5
> 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-tegra" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
