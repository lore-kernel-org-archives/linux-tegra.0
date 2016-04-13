From: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH 4/7] soc/tegra: pmc: Add interface to set voltage of IO
 rails
Date: Wed, 13 Apr 2016 09:47:51 +0100
Message-ID: <570E07B7.1070209@nvidia.com>
References: <1460473007-11535-1-git-send-email-ldewangan@nvidia.com>
 <1460473007-11535-5-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1460473007-11535-5-git-send-email-ldewangan@nvidia.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>, swarren@wwwdotorg.org, thierry.reding@gmail.com, linus.walleij@linaro.org, gnurou@gmail.com, robh+dt@kernel.org, mark.rutland@arm.com
Cc: linux-tegra@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


On 12/04/16 15:56, Laxman Dewangan wrote:
> NVIDIA Tegra210 supports some of the IO interface which can operate
> at 1.8V or 3.3V I/O rail voltage levels. SW needs to configure
> Tegra PMC register to set different voltage level of IO interface based
> on IO rail voltage from power supply i.e. power regulators.
> 
> Add APIs to set and get IO rail voltage from the client driver.

I think that we need some further explanation about the scenario when
this is used. In other words, why this configuration needs to be done in
the kernel versus the bootloader. Is this something that can change at
runtime? I could see that for SD cards it may.

> Signed-off-by: Laxman Dewangan <ldewangan@nvidia.com>
> ---
>  drivers/soc/tegra/pmc.c | 95 +++++++++++++++++++++++++++++++++++++++++++++++++
>  include/soc/tegra/pmc.h | 32 +++++++++++++++++
>  2 files changed, 127 insertions(+)
> 
> diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
> index 0bc8219..968f7cb 100644
> --- a/drivers/soc/tegra/pmc.c
> +++ b/drivers/soc/tegra/pmc.c
> @@ -73,6 +73,10 @@
>  
>  #define PMC_SCRATCH41			0x140
>  
> +/* Power detect for IO rail voltage */
> +#define PMC_PWR_DET			0x48
> +#define PMC_PWR_DET_VAL			0xe4
> +
>  #define PMC_SENSOR_CTRL			0x1b0
>  #define PMC_SENSOR_CTRL_SCRATCH_WRITE	BIT(2)
>  #define PMC_SENSOR_CTRL_ENABLE_RST	BIT(1)
> @@ -102,6 +106,8 @@
>  
>  #define GPU_RG_CNTRL			0x2d4
>  
> +static DEFINE_SPINLOCK(tegra_pmc_access_lock);
> +

We already have a mutex for managing concurrent accesses, do we need this?

>  struct tegra_pmc_soc {
>  	unsigned int num_powergates;
>  	const char *const *powergates;
> @@ -110,6 +116,7 @@ struct tegra_pmc_soc {
>  
>  	bool has_tsense_reset;
>  	bool has_gpu_clamps;
> +	bool has_io_rail_voltage_config;
>  };
>  
>  /**
> @@ -160,11 +167,31 @@ struct tegra_pmc {
>  	struct mutex powergates_lock;
>  };
>  
> +struct tegra_io_rail_voltage_bit_info {
> +	int io_rail_id;
> +	int bit_position;
> +};
> +
>  static struct tegra_pmc *pmc = &(struct tegra_pmc) {
>  	.base = NULL,
>  	.suspend_mode = TEGRA_SUSPEND_NONE,
>  };
>  
> +#define TEGRA_IO_RAIL_VOLTAGE(_io_rail, _pos)		\
> +{							\
> +	.io_rail_id = TEGRA_IO_RAIL_##_io_rail,		\
> +	.bit_position = _pos,				\
> +}
> +
> +static struct tegra_io_rail_voltage_bit_info tegra210_io_rail_voltage_info[] = {
> +	TEGRA_IO_RAIL_VOLTAGE(SDMMC1, 12),
> +	TEGRA_IO_RAIL_VOLTAGE(SDMMC3, 13),
> +	TEGRA_IO_RAIL_VOLTAGE(AUDIO_HV, 18),
> +	TEGRA_IO_RAIL_VOLTAGE(DMIC, 20),
> +	TEGRA_IO_RAIL_VOLTAGE(GPIO, 21),
> +	TEGRA_IO_RAIL_VOLTAGE(SPI_HV, 23),
> +};
> +

You could simply this by having a look-up table similar to what we do
for the powergates.

>  static u32 tegra_pmc_readl(unsigned long offset)
>  {
>  	return readl(pmc->base + offset);
> @@ -175,6 +202,16 @@ static void tegra_pmc_writel(u32 value, unsigned long offset)
>  	writel(value, pmc->base + offset);
>  }
>  
> +static void _tegra_pmc_register_update(unsigned long addr, unsigned long mask,
> +				       unsigned long val)

u32 for mask and val. May be consider renaming to tegra_pmc_rmw().

> +{
> +	u32 pmc_reg;
> +
> +	pmc_reg = tegra_pmc_readl(addr);
> +	pmc_reg = (pmc_reg & ~mask) | (val & mask);
> +	tegra_pmc_writel(pmc_reg, addr);
> +}
> +
>  static inline bool tegra_powergate_state(int id)
>  {
>  	if (id == TEGRA_POWERGATE_3D && pmc->soc->has_gpu_clamps)
> @@ -410,6 +447,63 @@ int tegra_pmc_cpu_remove_clamping(unsigned int cpuid)
>  }
>  #endif /* CONFIG_SMP */
>  
> +static int tegra_io_rail_voltage_get_bit_pos(int io_rail_id)

All the tegra_io_rail_xxx() APIs just use "id" and it is an unsigned
int. Any reason this needs to be an int? We should keep the naming and
type consistent.

> +{
> +	int i;
> +
> +	for (i = 0; i < ARRAY_SIZE(tegra210_io_rail_voltage_info); ++i) {
> +		if (tegra210_io_rail_voltage_info[i].io_rail_id == io_rail_id)
> +			return tegra210_io_rail_voltage_info[i].bit_position;
> +	}
> +
> +	return -EINVAL;
> +}
> +
> +int tegra_io_rail_voltage_set(int io_rail, int val)

Same here w.r.t "io_rail".

Also it appears that "val" should only be 0 or 1 but we don't check for
this. I see that you treat all non-zero values as '1' but that seems a
bit funny. You may consider having the user pass uV and then you could
check for either 3300000 or 1800000.

> +{
> +	unsigned long flags;
> +	unsigned long bval, mask;
> +	int bpos;
> +
> +	if (!pmc->soc->has_io_rail_voltage_config)
> +		return -ENODEV;
> +
> +	bpos = tegra_io_rail_voltage_get_bit_pos(io_rail);
> +	if (bpos < 0)
> +		return bpos;
> +
> +	mask = BIT(bpos);
> +	bval = (val) ? mask : 0;
> +
> +	spin_lock_irqsave(&tegra_pmc_access_lock, flags);
> +	_tegra_pmc_register_update(PMC_PWR_DET, mask, mask);
> +	_tegra_pmc_register_update(PMC_PWR_DET_VAL, mask, bval);

Hmmm ... this does not appear to be consistent with the TRM. It says to
write to the PMC_PWR_DET register and then the PMC_PWR_LATCH register. I
see in the Tegra210 TRM it says to only write the to ONLY the
PMC_PWR_DET_VAL register in other places. The TRM appears to be quite
confusing here, can you explain this?

> +	spin_unlock_irqrestore(&tegra_pmc_access_lock, flags);
> +
> +	usleep_range(5, 10);
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL(tegra_io_rail_voltage_set);
> +
> +int tegra_io_rail_voltage_get(int io_rail)
> +{
> +	u32 rval;
> +	int bpos;
> +
> +	if (!pmc->soc->has_io_rail_voltage_config)
> +		return -ENODEV;
> +
> +	bpos = tegra_io_rail_voltage_get_bit_pos(io_rail);
> +	if (bpos < 0)
> +		return bpos;
> +
> +	rval = tegra_pmc_readl(PMC_PWR_DET_VAL);
> +
> +	return !!(rval & BIT(bpos));
> +}
> +EXPORT_SYMBOL(tegra_io_rail_voltage_get);
> +
>  static int tegra_pmc_restart_notify(struct notifier_block *this,
>  				    unsigned long action, void *data)
>  {
> @@ -1102,6 +1196,7 @@ static const struct tegra_pmc_soc tegra210_pmc_soc = {
>  	.cpu_powergates = tegra210_cpu_powergates,
>  	.has_tsense_reset = true,
>  	.has_gpu_clamps = true,
> +	.has_io_rail_voltage_config = true,
>  };
>  
>  static const struct of_device_id tegra_pmc_match[] = {
> diff --git a/include/soc/tegra/pmc.h b/include/soc/tegra/pmc.h
> index 4f3db41..98ebf35 100644
> --- a/include/soc/tegra/pmc.h
> +++ b/include/soc/tegra/pmc.h
> @@ -134,6 +134,27 @@ int tegra_powergate_sequence_power_up(unsigned int id, struct clk *clk,
>  int tegra_io_rail_power_on(unsigned int id);
>  int tegra_io_rail_power_off(unsigned int id);
>  int tegra_io_rail_power_get_status(unsigned int id);
> +
> +/*
> + * tegra_io_rail_voltage_set: Set IO rail voltage.
> + * @io_rail: Tegra IO rail ID as defined in macro TEGRA_IO_RAIL_*
> + * @val: Voltage need to be set. The values are:
> + *		0 for 1.8V,
> + *		1 for 3.3V.
> + *
> + * Returns 0 if success otherwise error number.
> + */
> +int tegra_io_rail_voltage_set(int io_rail, int val);
> +
> +/*
> + * tegra_io_rail_voltage_get: Get IO rail voltage.
> + * @io_rail: Tegra IO rail ID as defined in macro TEGRA_IO_RAIL_*
> + *
> + * Returns negative error number if it fails due to invalid io pad id.
> + * Otherwise 0 for 1.8V, 1 for 3.3V.
> + */
> +int tegra_io_rail_voltage_get(int io_rail);
> +
>  #else
>  static inline int tegra_powergate_is_powered(unsigned int id)
>  {
> @@ -176,6 +197,17 @@ static inline int tegra_io_rail_power_get_status(unsigned int id)
>  {
>  	return -ENOTSUP;
>  }
> +
> +static inline int tegra_io_rail_voltage_set(int io_rail, int val)
> +{
> +	return -ENOTSUP;
> +}
> +
> +static inline int tegra_io_rail_voltage_get(int io_rail)
> +{
> +	return -ENOTSUP;
> +}

I think that you are missing a 'P' in -ENOTSUPP.

Cheers
Jon
