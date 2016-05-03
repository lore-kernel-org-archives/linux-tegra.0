From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 3/6] soc/tegra: pmc: Add support for IO pads power state
 and voltage
Date: Tue, 3 May 2016 13:34:08 +0100
Message-ID: <57289AC0.4090604@nvidia.com>
References: <1462191434-28933-1-git-send-email-ldewangan@nvidia.com>
 <1462191434-28933-4-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1462191434-28933-4-git-send-email-ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


On 02/05/16 13:17, Laxman Dewangan wrote:
> The IO pins of Tegra SoCs are grouped for common control of IO
> interface like setting voltage signal levels and power state of
> the interface. The group is generally referred as IO pads. The
> power state and voltage control of IO pins can be done at IO pads
> level.
> 
> Tegra generation SoC supports the power down of IO pads when it
> is not used even in the active state of system. This saves power
> from that IO interface.
> 
> Tegra generation SoC supports multiple voltage level in IO pins for
> interfacing on some of pads. Till Tegra124, the IO rail voltage was
> detected automatically and IO pads power voltage level sets accordingly.
> But from Tegra210, it is required to program by SW explicitly.
> 
> Add support to set the power states and voltage level of the IO pads
> from client driver. The implementation for the APIs are in generic
> which is applicable for all generation os Tegra SoC.
> 
> IO pads ID and information of bit field for power state and voltage
> level controls are added for Tegra210.
> 
> Signed-off-by: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> 
> ---
> Changes from V1:
> This is reworked on earlier path to have separation between IO rails and
> io pads and add power state and voltage control APIs in single call.
> ---
>  drivers/soc/tegra/pmc.c | 182 +++++++++++++++++++++++++++++++++++++++++++++++-
>  include/soc/tegra/pmc.h |  87 +++++++++++++++++++++++
>  2 files changed, 268 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
> index fc4f7b2..b3be4b9 100644
> --- a/drivers/soc/tegra/pmc.c
> +++ b/drivers/soc/tegra/pmc.c
> @@ -76,6 +76,10 @@
>  
>  #define PMC_SCRATCH41			0x140
>  
> +/* Power detect for pad voltage */
> +#define PMC_PWR_DET			0x48
> +#define PMC_PWR_DET_VAL			0xe4
> +
>  #define PMC_SENSOR_CTRL			0x1b0
>  #define PMC_SENSOR_CTRL_SCRATCH_WRITE	BIT(2)
>  #define PMC_SENSOR_CTRL_ENABLE_RST	BIT(1)
> @@ -115,12 +119,19 @@ struct tegra_powergate {
>  	unsigned int num_resets;
>  };
>  
> +struct tegra_io_pads_control {
> +	int pad_id;
> +	int dpd_bit_pos;
> +	int pwr_val_pos;
> +};
> +
>  struct tegra_pmc_soc {
>  	unsigned int num_powergates;
>  	const char *const *powergates;
>  	unsigned int num_cpu_powergates;
>  	const u8 *cpu_powergates;
> -
> +	const struct tegra_io_pads_control *io_pads_control;
> +	unsigned int num_io_pads;
>  	bool has_tsense_reset;
>  	bool has_gpu_clamps;
>  };
> @@ -196,6 +207,14 @@ static void tegra_pmc_writel(u32 value, unsigned long offset)
>  	writel(value, pmc->base + offset);
>  }
>  
> +static void tegra_pmc_read_modify_write(unsigned long offset, u32 mask, u32 val)
> +{
> +	u32 pmc_reg = tegra_pmc_readl(offset);
> +
> +	pmc_reg = (pmc_reg & ~mask) | (val & mask);
> +	tegra_pmc_writel(pmc_reg, offset);
> +}
> +
>  static inline bool tegra_powergate_state(int id)
>  {
>  	if (id == TEGRA_POWERGATE_3D && pmc->soc->has_gpu_clamps)
> @@ -970,6 +989,165 @@ error:
>  }
>  EXPORT_SYMBOL(tegra_io_rail_power_off);
>  
> +#define TEGRA_IO_PADS_CONTROL(_pad, _dpd, _pwr)		\
> +{							\
> +	.pad_id = (TEGRA_IO_PAD_##_pad),		\
> +	.dpd_bit_pos = (_dpd),				\
> +	.pwr_val_pos = (_pwr),				\
> +}
> +
> +struct tegra_io_pads_control tegra210_io_pads_control[] = {
> +	TEGRA_IO_PADS_CONTROL(CSIA, 0, -1),
> +	TEGRA_IO_PADS_CONTROL(CSIB, 1, -1),
> +	TEGRA_IO_PADS_CONTROL(DSI, 2, -1),
> +	TEGRA_IO_PADS_CONTROL(MIPI_BIAS, 3, -1),
> +	TEGRA_IO_PADS_CONTROL(PEX_BIAS, 4, -1),
> +	TEGRA_IO_PADS_CONTROL(PEX_CLK1, 5, -1),
> +	TEGRA_IO_PADS_CONTROL(PEX_CLK2, 6, -1),
> +	TEGRA_IO_PADS_CONTROL(USB0, 9, -1),
> +	TEGRA_IO_PADS_CONTROL(USB1, 10, -1),
> +	TEGRA_IO_PADS_CONTROL(USB2, 11, -1),
> +	TEGRA_IO_PADS_CONTROL(USB_BIAS, 12, -1),
> +	TEGRA_IO_PADS_CONTROL(UART, 14, -1),
> +	TEGRA_IO_PADS_CONTROL(AUDIO, 17, -1),
> +	TEGRA_IO_PADS_CONTROL(USB3, 18, -1),
> +	TEGRA_IO_PADS_CONTROL(HSIC, 19, -1),
> +	TEGRA_IO_PADS_CONTROL(DBG, 25, -1),
> +	TEGRA_IO_PADS_CONTROL(DEBUG_NONAO, 26, -1),
> +	TEGRA_IO_PADS_CONTROL(GPIO, 27, 21),
> +	TEGRA_IO_PADS_CONTROL(HDMI, 28, -1),
> +	TEGRA_IO_PADS_CONTROL(SDMMC1, 33, 12),
> +	TEGRA_IO_PADS_CONTROL(SDMMC3, 34, 13),
> +	TEGRA_IO_PADS_CONTROL(EMMC, 35, -1),
> +	TEGRA_IO_PADS_CONTROL(CAM, 36, -1),
> +	TEGRA_IO_PADS_CONTROL(EMMC2, 37, -1),
> +	TEGRA_IO_PADS_CONTROL(DSIB, 39, -1),
> +	TEGRA_IO_PADS_CONTROL(DSIC, 40, -1),
> +	TEGRA_IO_PADS_CONTROL(DSID, 41, -1),
> +	TEGRA_IO_PADS_CONTROL(CSIC, 42, -1),
> +	TEGRA_IO_PADS_CONTROL(CSID, 43, -1),
> +	TEGRA_IO_PADS_CONTROL(CSIE, 44, -1),
> +	TEGRA_IO_PADS_CONTROL(CSIF, 45, -1),
> +	TEGRA_IO_PADS_CONTROL(SPI, 46, -1),
> +	TEGRA_IO_PADS_CONTROL(SPI_HV, 47, 23),
> +	TEGRA_IO_PADS_CONTROL(DMIC, 50, -1),
> +	TEGRA_IO_PADS_CONTROL(DP, 51, -1),
> +	TEGRA_IO_PADS_CONTROL(LVDS, 57, -1),
> +	TEGRA_IO_PADS_CONTROL(AUDIO_HV, 61, 18),
> +};
> +
> +static int tegra_io_pads_to_dpd(const struct tegra_pmc_soc *soc, int pad_id)
> +{
> +	int i;
> +
> +	if (!soc || !soc->num_io_pads)
> +		return -EINVAL;
> +
> +	for (i = 0; i < soc->num_io_pads; ++i) {
> +		if (soc->io_pads_control[i].pad_id == pad_id)
> +			return soc->io_pads_control[i].dpd_bit_pos;
> +	}
> +
> +	return -EINVAL;
> +}
> +
> +static int tegra_io_pads_to_power_val(const struct tegra_pmc_soc *soc,
> +				      int pad_id)
> +{
> +	int i;
> +
> +	if (!soc || !soc->num_io_pads)
> +		return -EINVAL;
> +
> +	for (i = 0; i < soc->num_io_pads; ++i) {
> +		if (soc->io_pads_control[i].pad_id == pad_id)
> +			return soc->io_pads_control[i].pwr_val_pos;
> +	}
> +
> +	return -EINVAL;
> +}
> +
> +int tegra_io_pads_power_enable(int io_pad_id)
> +{
> +	int dpd_bit;
> +
> +	dpd_bit = tegra_io_pads_to_dpd(pmc->soc, io_pad_id);
> +	if (dpd_bit < 0)
> +		return dpd_bit;
> +
> +	return tegra_io_rail_power_on(dpd_bit);

From a readability standpoint the above seems weird because
tegra_io_pads_power_enable() takes an ID as the argument, translates it
to a bit value and passes it to tegra_io_rail_power_on() which also
takes an ID for the argument.

> +}
> +EXPORT_SYMBOL(tegra_io_pads_power_enable);
> +
> +int tegra_io_pads_power_disable(int io_pad_id)
> +{
> +	int dpd_bit;
> +
> +	dpd_bit = tegra_io_pads_to_dpd(pmc->soc, io_pad_id);
> +	if (dpd_bit < 0)
> +		return dpd_bit;
> +
> +	return tegra_io_rail_power_off(dpd_bit);
> +}
> +EXPORT_SYMBOL(tegra_io_pads_power_disable);
> +
> +int tegra_io_pads_power_is_enabled(int io_pad_id)
> +{
> +	unsigned long status_reg;
> +	u32 status;
> +	int dpd_bit;
> +
> +	dpd_bit = tegra_io_pads_to_dpd(pmc->soc, io_pad_id);
> +	if (dpd_bit < 0)
> +		return dpd_bit;
> +
> +	status_reg = (dpd_bit < 32) ? IO_DPD_STATUS : IO_DPD2_STATUS;
> +	status = tegra_pmc_readl(status_reg);
> +
> +	return !!(status & BIT(dpd_bit % 32));
> +}
> +EXPORT_SYMBOL(tegra_io_pads_power_is_enabled);
> +
> +int tegra_io_pads_configure_voltage(int io_pad_id, int io_volt_uv)
> +{
> +	int pwr_bit;
> +	u32 bval;
> +
> +	if ((io_volt_uv != 3300000) && (io_volt_uv != 1800000))
> +		return -EINVAL;
> +
> +	pwr_bit = tegra_io_pads_to_power_val(pmc->soc, io_pad_id);
> +	if (pwr_bit < 0)
> +		return pwr_bit;
> +
> +	bval = (io_volt_uv == 3300000) ? BIT(pwr_bit) : 0;
> +
> +	mutex_lock(&pmc->powergates_lock);
> +	tegra_pmc_read_modify_write(PMC_PWR_DET, BIT(pwr_bit), BIT(pwr_bit));
> +	tegra_pmc_read_modify_write(PMC_PWR_DET_VAL, BIT(pwr_bit), bval);
> +	mutex_unlock(&pmc->powergates_lock);

There are 4 instances of BIT(pwr_bit). May be we should do this once or
have tegra_io_pads_to_power_val() return the bit?

> +	usleep_range(100, 250);
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL(tegra_io_pads_configure_voltage);
> +
> +int tegra_io_pads_get_configured_voltage(int io_pad_id)
> +{
> +	int pwr_bit;
> +	u32 pwr_det_val;
> +
> +	pwr_bit = tegra_io_pads_to_power_val(pmc->soc, io_pad_id);
> +	if (pwr_bit < 0)
> +		return pwr_bit;
> +
> +	pwr_det_val = tegra_pmc_readl(PMC_PWR_DET_VAL);
> +
> +	return (pwr_det_val & BIT(pwr_bit)) ? 3300000 : 1800000;
> +}
> +EXPORT_SYMBOL(tegra_io_pads_get_configured_voltage);
> +
>  #ifdef CONFIG_PM_SLEEP
>  enum tegra_suspend_mode tegra_pmc_get_suspend_mode(void)
>  {
> @@ -1443,6 +1621,8 @@ static const struct tegra_pmc_soc tegra210_pmc_soc = {
>  	.powergates = tegra210_powergates,
>  	.num_cpu_powergates = ARRAY_SIZE(tegra210_cpu_powergates),
>  	.cpu_powergates = tegra210_cpu_powergates,
> +	.io_pads_control = tegra210_io_pads_control,
> +	.num_io_pads = ARRAY_SIZE(tegra210_io_pads_control),
>  	.has_tsense_reset = true,
>  	.has_gpu_clamps = true,
>  };
> diff --git a/include/soc/tegra/pmc.h b/include/soc/tegra/pmc.h
> index e9e5347..79e38f5 100644
> --- a/include/soc/tegra/pmc.h
> +++ b/include/soc/tegra/pmc.h
> @@ -108,6 +108,58 @@ int tegra_pmc_cpu_remove_clamping(unsigned int cpuid);
>  #define TEGRA_IO_RAIL_LVDS	57
>  #define TEGRA_IO_RAIL_SYS_DDC	58
>  
> +/* TEGRA_IO_PAD: The IO pins of Tegra SoCs are grouped for common control
> + * of IO interface like setting voltage signal levels, power state of the
> + * interface. The group is generally referred as io-pads. The power and
> + * voltage control of IO pins are available at io-pads level.
> + * The following macros make the super list all IO pads found on Tegra SoC
> + * generations.
> + */
> +#define TEGRA_IO_PAD_AUDIO		0
> +#define TEGRA_IO_PAD_AUDIO_HV		1
> +#define TEGRA_IO_PAD_BB			2
> +#define TEGRA_IO_PAD_CAM		3
> +#define TEGRA_IO_PAD_COMP		4
> +#define TEGRA_IO_PAD_CSIA		5
> +#define TEGRA_IO_PAD_CSIB		6
> +#define TEGRA_IO_PAD_CSIC		7
> +#define TEGRA_IO_PAD_CSID		8
> +#define TEGRA_IO_PAD_CSIE		9
> +#define TEGRA_IO_PAD_CSIF		10
> +#define TEGRA_IO_PAD_DBG		11
> +#define TEGRA_IO_PAD_DEBUG_NONAO	12
> +#define TEGRA_IO_PAD_DMIC		13
> +#define TEGRA_IO_PAD_DP			14
> +#define TEGRA_IO_PAD_DSI		15
> +#define TEGRA_IO_PAD_DSIB		16
> +#define TEGRA_IO_PAD_DSIC		17
> +#define TEGRA_IO_PAD_DSID		18
> +#define TEGRA_IO_PAD_EMMC		19
> +#define TEGRA_IO_PAD_EMMC2		20
> +#define TEGRA_IO_PAD_GPIO		21
> +#define TEGRA_IO_PAD_HDMI		22
> +#define TEGRA_IO_PAD_HSIC		23
> +#define TEGRA_IO_PAD_HV			24
> +#define TEGRA_IO_PAD_LVDS		25
> +#define TEGRA_IO_PAD_MIPI_BIAS		26
> +#define TEGRA_IO_PAD_NAND		27
> +#define TEGRA_IO_PAD_PEX_BIAS		28
> +#define TEGRA_IO_PAD_PEX_CLK1		29
> +#define TEGRA_IO_PAD_PEX_CLK2		30
> +#define TEGRA_IO_PAD_PEX_CNTRL		31
> +#define TEGRA_IO_PAD_SDMMC1		32
> +#define TEGRA_IO_PAD_SDMMC3		33
> +#define TEGRA_IO_PAD_SDMMC4		34
> +#define TEGRA_IO_PAD_SPI		35
> +#define TEGRA_IO_PAD_SPI_HV		36
> +#define TEGRA_IO_PAD_SYS_DDC		37
> +#define TEGRA_IO_PAD_UART		38
> +#define TEGRA_IO_PAD_USB0		39
> +#define TEGRA_IO_PAD_USB1		40
> +#define TEGRA_IO_PAD_USB2		41
> +#define TEGRA_IO_PAD_USB3		42
> +#define TEGRA_IO_PAD_USB_BIAS		43
> +
>  #ifdef CONFIG_ARCH_TEGRA
>  int tegra_powergate_is_powered(unsigned int id);
>  int tegra_powergate_power_on(unsigned int id);
> @@ -120,6 +172,16 @@ int tegra_powergate_sequence_power_up(unsigned int id, struct clk *clk,
>  
>  int tegra_io_rail_power_on(unsigned int id);
>  int tegra_io_rail_power_off(unsigned int id);
> +
> +/* Power enable/disable of the IO pads */
> +int tegra_io_pads_power_enable(int io_pad_id);
> +int tegra_io_pads_power_disable(int io_pad_id);
> +int tegra_io_pads_power_is_enabled(int io_pad_id);

What I don't like here, is now we have two public APIs to do the same
job because tegra_io_pads_power_enable/disable() calls
tegra_io_rail_power_off/on() internally. Furthermore, the two APIs use
different ID definitions to accomplish the same job. This shouldn't be
necessary.

Jon
