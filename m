From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH V3 3/4] soc/tegra: pmc: Add support for IO pads power
 state and voltage
Date: Thu, 5 May 2016 11:13:30 +0100
Message-ID: <572B1CCA.5060502@nvidia.com>
References: <1462361973-27990-1-git-send-email-ldewangan@nvidia.com>
 <1462361973-27990-4-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1462361973-27990-4-git-send-email-ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, airlied-cv59FeDIM0c@public.gmane.org
Cc: gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


On 04/05/16 12:39, Laxman Dewangan wrote:
> The IO pins of Tegra SoCs are grouped for common control of IO
> interface like setting voltage signal levels and power state of
> the interface. The group is generally referred as IO pads. The
> power state and voltage control of IO pins can be done at IO pads
> level.
> 
> Tegra generation SoC supports the power down of IO pads when it
> is not used even in the active state of system. This saves power
> from that IO interface. Also it supports multiple voltage level
> in IO pins for interfacing on some of pads. The IO pad voltage is
> automatically detected till T124, hence SW need not to configure
> this. But from T210, the automatically detection logic has been
> removed, hence SW need to explicitly set the IO pad voltage into
> IO pad configuration registers.
> 
> Add support to set the power states and voltage level of the IO pads
> from client driver. The implementation for the APIs are in generic
> which is applicable for all generation os Tegra SoC.
> 
> IO pads ID and information of bit field for power state and voltage
> level controls are added for Tegra124, Tegra132 and Tegra210. The sor
> driver is modified to use the new APIs.
> 
> Signed-off-by: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> 
> ---
> Changes from V1:
> This is reworked on earlier path to have separation between IO rails and
> io pads and add power state and voltage control APIs in single call.
> 
> Changes from V2:
> - Remove the tegra_io_rail_power_off/on() apis and change client (sor) driver
> to use the new APIs for IO pad power.
> - Remove the TEGRA_IO_RAIL_ macros.
> ---
>  drivers/gpu/drm/tegra/sor.c |   8 +-
>  drivers/soc/tegra/pmc.c     | 242 +++++++++++++++++++++++++++++++++++++++-----
>  include/soc/tegra/pmc.h     | 116 ++++++++++++++-------
>  3 files changed, 299 insertions(+), 67 deletions(-)
> 
> diff --git a/drivers/gpu/drm/tegra/sor.c b/drivers/gpu/drm/tegra/sor.c
> index 757c6e8..1d90171 100644
> --- a/drivers/gpu/drm/tegra/sor.c
> +++ b/drivers/gpu/drm/tegra/sor.c
> @@ -1134,7 +1134,7 @@ static void tegra_sor_edp_disable(struct drm_encoder *encoder)
>  			dev_err(sor->dev, "failed to disable DP: %d\n", err);
>  	}
>  
> -	err = tegra_io_rail_power_off(TEGRA_IO_RAIL_LVDS);
> +	err = tegra_io_pads_power_disable(TEGRA_IO_PAD_LVDS);
>  	if (err < 0)
>  		dev_err(sor->dev, "failed to power off I/O rail: %d\n", err);
>  
> @@ -1296,7 +1296,7 @@ static void tegra_sor_edp_enable(struct drm_encoder *encoder)
>  	tegra_sor_writel(sor, value, SOR_DP_PADCTL0);
>  
>  	/* step 2 */
> -	err = tegra_io_rail_power_on(TEGRA_IO_RAIL_LVDS);
> +	err = tegra_io_pads_power_enable(TEGRA_IO_PAD_LVDS);
>  	if (err < 0)
>  		dev_err(sor->dev, "failed to power on I/O rail: %d\n", err);
>  
> @@ -1748,7 +1748,7 @@ static void tegra_sor_hdmi_disable(struct drm_encoder *encoder)
>  	if (err < 0)
>  		dev_err(sor->dev, "failed to power down SOR: %d\n", err);
>  
> -	err = tegra_io_rail_power_off(TEGRA_IO_RAIL_HDMI);
> +	err = tegra_io_pads_power_disable(TEGRA_IO_PAD_HDMI);
>  	if (err < 0)
>  		dev_err(sor->dev, "failed to power off HDMI rail: %d\n", err);
>  
> @@ -1787,7 +1787,7 @@ static void tegra_sor_hdmi_enable(struct drm_encoder *encoder)
>  
>  	div = clk_get_rate(sor->clk) / 1000000 * 4;
>  
> -	err = tegra_io_rail_power_on(TEGRA_IO_RAIL_HDMI);
> +	err = tegra_io_pads_power_enable(TEGRA_IO_PAD_HDMI);
>  	if (err < 0)
>  		dev_err(sor->dev, "failed to power on HDMI rail: %d\n", err);
>  
> diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
> index eff9425..0611cea 100644
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
> +	int pwr_bit_pos;
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

Nit, I would prefer something shorter such as tegra_pmc_rmw() or
tegra_pmc_set_field().

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
> @@ -841,22 +860,51 @@ static void tegra_powergate_init(struct tegra_pmc *pmc)
>  	of_node_put(np);
>  }
>  
> -static int tegra_io_rail_prepare(unsigned int id, unsigned long *request,
> -				 unsigned long *status, unsigned int *bit)
> +static int tegra_io_pads_to_dpd_bit(const struct tegra_pmc_soc *soc, int pad_id)

Please just use "id". This is consistent with the pmc driver and I think
it is clear from the function that this is the pad ID.

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

Do we need a loop here? Can't we just make the table a look-up table now
that the ID is just an index?

> +
> +	return -EINVAL;
> +}
> +
> +static int tegra_io_pads_to_power_bit(const struct tegra_pmc_soc *soc,
> +				      int pad_id)
> +{
> +	int i;
> +
> +	if (!soc || !soc->num_io_pads)
> +		return -EINVAL;
> +
> +	for (i = 0; i < soc->num_io_pads; ++i) {
> +		if (soc->io_pads_control[i].pad_id == pad_id)
> +			return soc->io_pads_control[i].pwr_bit_pos;
> +	}

Same here a lookup table would be better.

> +
> +	return -EINVAL;
> +}
> +
> +static int tegra_io_pad_dpd_prepare(int pad_id, unsigned long *request,
> +				    unsigned long *status, unsigned int *bit)

Some functions are tegra_io_pads_xxx and some are tegra_io_pad_xxx.
Please be consistent.

>  {
>  	unsigned long rate;
>  	u32 value;
> +	int dpd_bit;
>  
> -	*bit = id % 32;
> +	dpd_bit = tegra_io_pads_to_dpd_bit(pmc->soc, pad_id);
> +	if (dpd_bit < 0)
> +		return dpd_bit;
>  
> -	/*
> -	 * There are two sets of 30 bits to select IO rails, but bits 30 and
> -	 * 31 are control bits rather than IO rail selection bits.
> -	 */
> -	if (id > 63 || *bit == 30 || *bit == 31)
> -		return -EINVAL;
> +	*bit = dpd_bit % 32;
>  
> -	if (id < 32) {
> +	if (dpd_bit < 32) {
>  		*status = IO_DPD_STATUS;
>  		*request = IO_DPD_REQ;
>  	} else {
> @@ -877,8 +925,8 @@ static int tegra_io_rail_prepare(unsigned int id, unsigned long *request,
>  	return 0;
>  }
>  
> -static int tegra_io_rail_poll(unsigned long offset, u32 mask,
> -			      u32 val, unsigned long timeout)
> +static int tegra_io_pad_dpd_poll(unsigned long offset, u32 mask,
> +				 u32 val, unsigned long timeout)

tegra_io_pads_xxx

>  {
>  	u32 value;
>  
> @@ -895,12 +943,12 @@ static int tegra_io_rail_poll(unsigned long offset, u32 mask,
>  	return -ETIMEDOUT;
>  }
>  
> -static void tegra_io_rail_unprepare(void)
> +static void tegra_io_pad_dpd_unprepare(void)

tegra_io_pads_xxx

>  {
>  	tegra_pmc_writel(DPD_SAMPLE_DISABLE, DPD_SAMPLE);
>  }
>  
> -int tegra_io_rail_power_on(unsigned int id)
> +int tegra_io_pads_power_enable(int pad_id)

s/pad_id/id/

>  {
>  	unsigned long request, status;
>  	unsigned int bit;
> @@ -909,7 +957,7 @@ int tegra_io_rail_power_on(unsigned int id)
>  
>  	mutex_lock(&pmc->powergates_lock);
>  
> -	err = tegra_io_rail_prepare(id, &request, &status, &bit);
> +	err = tegra_io_pad_dpd_prepare(pad_id, &request, &status, &bit);
>  	if (err)
>  		goto error;
>  
> @@ -921,22 +969,22 @@ int tegra_io_rail_power_on(unsigned int id)
>  	value |= IO_DPD_REQ_CODE_OFF;
>  	tegra_pmc_writel(value, request);
>  
> -	err = tegra_io_rail_poll(status, mask, 0, 250);
> +	err = tegra_io_pad_dpd_poll(status, mask, 0, 250);
>  	if (err) {
> -		pr_info("tegra_io_rail_poll() failed: %d\n", err);
> +		pr_info("tegra_io_pad_dpd_poll() failed: %d\n", err);
>  		goto error;
>  	}
>  
> -	tegra_io_rail_unprepare();
> +	tegra_io_pad_dpd_unprepare();
>  
>  error:
>  	mutex_unlock(&pmc->powergates_lock);
>  
>  	return err;
>  }
> -EXPORT_SYMBOL(tegra_io_rail_power_on);
> +EXPORT_SYMBOL(tegra_io_pads_power_enable);
>  
> -int tegra_io_rail_power_off(unsigned int id)
> +int tegra_io_pads_power_disable(int pad_id)

s/pad_id/id/

>  {
>  	unsigned long request, status;
>  	unsigned int bit;
> @@ -945,9 +993,9 @@ int tegra_io_rail_power_off(unsigned int id)
>  
>  	mutex_lock(&pmc->powergates_lock);
>  
> -	err = tegra_io_rail_prepare(id, &request, &status, &bit);
> +	err = tegra_io_pad_dpd_prepare(pad_id, &request, &status, &bit);
>  	if (err) {
> -		pr_info("tegra_io_rail_prepare() failed: %d\n", err);
> +		pr_info("tegra_io_pad_dpd_prepare() failed: %d\n", err);
>  		goto error;
>  	}
>  
> @@ -959,18 +1007,77 @@ int tegra_io_rail_power_off(unsigned int id)
>  	value |= IO_DPD_REQ_CODE_ON;
>  	tegra_pmc_writel(value, request);
>  
> -	err = tegra_io_rail_poll(status, mask, mask, 250);
> +	err = tegra_io_pad_dpd_poll(status, mask, mask, 250);
>  	if (err)
>  		goto error;
>  
> -	tegra_io_rail_unprepare();
> +	tegra_io_pad_dpd_unprepare();
>  
>  error:
>  	mutex_unlock(&pmc->powergates_lock);
>  
>  	return err;
>  }
> -EXPORT_SYMBOL(tegra_io_rail_power_off);
> +EXPORT_SYMBOL(tegra_io_pads_power_disable);
> +
> +int tegra_io_pads_power_is_enabled(int io_pad_id)

s/io_pad_id/id/


> +{
> +	unsigned long status_reg;
> +	u32 status;
> +	int dpd_bit;

s/dpd_bit/bit/

> +
> +	dpd_bit = tegra_io_pads_to_dpd_bit(pmc->soc, io_pad_id);
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

s/io_pad_id/id/

I think I prefer tegra_io_pads_set/get_voltage_conf(). What is the point
in passing uV here if in device-tree you are using the enum for the
voltage level? I know that I had suggested this, but given we are not
going to use voltage in the DT then, not sure it has any value here.

> +{
> +	int pwr_bit;
> +	u32 pwr_mask;

I would drop the "pwr_" and just have bit and mask.

> +	u32 bval;
> +
> +	if ((io_volt_uv != 3300000) && (io_volt_uv != 1800000))
> +		return -EINVAL;
> +
> +	pwr_bit = tegra_io_pads_to_power_bit(pmc->soc, io_pad_id);
> +	if (pwr_bit < 0)
> +		return pwr_bit;
> +
> +	pwr_mask = BIT(pwr_bit);
> +	bval = (io_volt_uv == 3300000) ? pwr_mask : 0;
> +
> +	mutex_lock(&pmc->powergates_lock);
> +	tegra_pmc_read_modify_write(PMC_PWR_DET, pwr_mask, pwr_mask);
> +	tegra_pmc_read_modify_write(PMC_PWR_DET_VAL, pwr_mask, bval);
> +	mutex_unlock(&pmc->powergates_lock);
> +
> +	usleep_range(100, 250);
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL(tegra_io_pads_configure_voltage);
> +
> +int tegra_io_pads_get_configured_voltage(int io_pad_id)

s/io_pad_id/id/

> +{
> +	int pwr_bit;
> +	u32 pwr_det_val;

int bit;
u32 val;

> +
> +	pwr_bit = tegra_io_pads_to_power_bit(pmc->soc, io_pad_id);
> +	if (pwr_bit < 0)
> +		return pwr_bit;
> +
> +	pwr_det_val = tegra_pmc_readl(PMC_PWR_DET_VAL);
> +
> +	return (pwr_det_val & BIT(pwr_bit)) ? 3300000 : 1800000;
> +}
> +EXPORT_SYMBOL(tegra_io_pads_get_configured_voltage);
>  
>  #ifdef CONFIG_PM_SLEEP
>  enum tegra_suspend_mode tegra_pmc_get_suspend_mode(void)
> @@ -1397,11 +1504,53 @@ static const u8 tegra124_cpu_powergates[] = {
>  	TEGRA_POWERGATE_CPU3,
>  };
>  
> +#define TEGRA_IO_PADS_CONTROL(_pad, _dpd, _pwr)		\
> +{							\
> +	.pad_id = (TEGRA_IO_PAD_##_pad),		\

Not sure this needs to be part of the structure as it is just an index.

> +	.dpd_bit_pos = (_dpd),				\
> +	.pwr_bit_pos = (_pwr),				\
> +}
> +
> +struct tegra_io_pads_control tegra124_io_pads_control[] = {
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
> +	TEGRA_IO_PADS_CONTROL(NAND, 13, -1),
> +	TEGRA_IO_PADS_CONTROL(UART, 14, -1),
> +	TEGRA_IO_PADS_CONTROL(BB, 15, -1),
> +	TEGRA_IO_PADS_CONTROL(AUDIO, 17, -1),
> +	TEGRA_IO_PADS_CONTROL(HSIC, 19, -1),
> +	TEGRA_IO_PADS_CONTROL(COMP, 22, -1),
> +	TEGRA_IO_PADS_CONTROL(HDMI, 28, -1),
> +	TEGRA_IO_PADS_CONTROL(PEX_CNTRL, 32, -1),
> +	TEGRA_IO_PADS_CONTROL(SDMMC1, 33, -1),
> +	TEGRA_IO_PADS_CONTROL(SDMMC3, 34, -1),
> +	TEGRA_IO_PADS_CONTROL(SDMMC4, 35, -1),
> +	TEGRA_IO_PADS_CONTROL(CAM, 36, -1),
> +	TEGRA_IO_PADS_CONTROL(HV, 38, -1),
> +	TEGRA_IO_PADS_CONTROL(DSIB, 39, -1),
> +	TEGRA_IO_PADS_CONTROL(DSIC, 40, -1),
> +	TEGRA_IO_PADS_CONTROL(DSID, 41, -1),
> +	TEGRA_IO_PADS_CONTROL(CSIE, 44, -1),
> +	TEGRA_IO_PADS_CONTROL(LVDS, 57, -1),
> +	TEGRA_IO_PADS_CONTROL(SYS_DDC, 58, -1),
> +};
> +
>  static const struct tegra_pmc_soc tegra124_pmc_soc = {
>  	.num_powergates = ARRAY_SIZE(tegra124_powergates),
>  	.powergates = tegra124_powergates,
>  	.num_cpu_powergates = ARRAY_SIZE(tegra124_cpu_powergates),
>  	.cpu_powergates = tegra124_cpu_powergates,
> +	.io_pads_control = tegra124_io_pads_control,
> +	.num_io_pads = ARRAY_SIZE(tegra124_io_pads_control),
>  	.has_tsense_reset = true,
>  	.has_gpu_clamps = true,
>  };
> @@ -1440,11 +1589,52 @@ static const u8 tegra210_cpu_powergates[] = {
>  	TEGRA_POWERGATE_CPU3,
>  };
>  
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
>  static const struct tegra_pmc_soc tegra210_pmc_soc = {
>  	.num_powergates = ARRAY_SIZE(tegra210_powergates),
>  	.powergates = tegra210_powergates,
>  	.num_cpu_powergates = ARRAY_SIZE(tegra210_cpu_powergates),
>  	.cpu_powergates = tegra210_cpu_powergates,
> +	.io_pads_control = tegra210_io_pads_control,
> +	.num_io_pads = ARRAY_SIZE(tegra210_io_pads_control),
>  	.has_tsense_reset = true,
>  	.has_gpu_clamps = true,
>  };
> diff --git a/include/soc/tegra/pmc.h b/include/soc/tegra/pmc.h
> index e9e5347..763bd6d 100644
> --- a/include/soc/tegra/pmc.h
> +++ b/include/soc/tegra/pmc.h
> @@ -76,37 +76,57 @@ int tegra_pmc_cpu_remove_clamping(unsigned int cpuid);
>  
>  #define TEGRA_POWERGATE_3D0	TEGRA_POWERGATE_3D
>  
> -#define TEGRA_IO_RAIL_CSIA	0
> -#define TEGRA_IO_RAIL_CSIB	1
> -#define TEGRA_IO_RAIL_DSI	2
> -#define TEGRA_IO_RAIL_MIPI_BIAS	3
> -#define TEGRA_IO_RAIL_PEX_BIAS	4
> -#define TEGRA_IO_RAIL_PEX_CLK1	5
> -#define TEGRA_IO_RAIL_PEX_CLK2	6
> -#define TEGRA_IO_RAIL_USB0	9
> -#define TEGRA_IO_RAIL_USB1	10
> -#define TEGRA_IO_RAIL_USB2	11
> -#define TEGRA_IO_RAIL_USB_BIAS	12
> -#define TEGRA_IO_RAIL_NAND	13
> -#define TEGRA_IO_RAIL_UART	14
> -#define TEGRA_IO_RAIL_BB	15
> -#define TEGRA_IO_RAIL_AUDIO	17
> -#define TEGRA_IO_RAIL_HSIC	19
> -#define TEGRA_IO_RAIL_COMP	22
> -#define TEGRA_IO_RAIL_HDMI	28
> -#define TEGRA_IO_RAIL_PEX_CNTRL	32
> -#define TEGRA_IO_RAIL_SDMMC1	33
> -#define TEGRA_IO_RAIL_SDMMC3	34
> -#define TEGRA_IO_RAIL_SDMMC4	35
> -#define TEGRA_IO_RAIL_CAM	36
> -#define TEGRA_IO_RAIL_RES	37
> -#define TEGRA_IO_RAIL_HV	38
> -#define TEGRA_IO_RAIL_DSIB	39
> -#define TEGRA_IO_RAIL_DSIC	40
> -#define TEGRA_IO_RAIL_DSID	41
> -#define TEGRA_IO_RAIL_CSIE	44
> -#define TEGRA_IO_RAIL_LVDS	57
> -#define TEGRA_IO_RAIL_SYS_DDC	58
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

Enum?

>  
>  #ifdef CONFIG_ARCH_TEGRA
>  int tegra_powergate_is_powered(unsigned int id);
> @@ -118,8 +138,15 @@ int tegra_powergate_remove_clamping(unsigned int id);
>  int tegra_powergate_sequence_power_up(unsigned int id, struct clk *clk,
>  				      struct reset_control *rst);
>  
> -int tegra_io_rail_power_on(unsigned int id);
> -int tegra_io_rail_power_off(unsigned int id);
> +/* Power enable/disable of the IO pads */
> +int tegra_io_pads_power_enable(int io_pad_id);
> +int tegra_io_pads_power_disable(int io_pad_id);
> +int tegra_io_pads_power_is_enabled(int io_pad_id);
> +
> +/* Set/Get of IO pad voltage */
> +int tegra_io_pads_configure_voltage(int io_pad_id, int io_volt_uv);
> +int tegra_io_pads_get_configured_voltage(int io_pad_id);
> +
>  #else
>  static inline int tegra_powergate_is_powered(unsigned int id)
>  {
> @@ -148,14 +175,29 @@ static inline int tegra_powergate_sequence_power_up(unsigned int id,
>  	return -ENOSYS;
>  }
>  
> -static inline int tegra_io_rail_power_on(unsigned int id)
> +static inline int tegra_io_pads_power_enable(int io_pad_id)
>  {
> -	return -ENOSYS;
> +	return -ENOTSUPP;
>  }
>  
> -static inline int tegra_io_rail_power_off(unsigned int id)
> +static inline int tegra_io_pads_power_disable(int io_pad_id)
>  {
> -	return -ENOSYS;
> +	return -ENOTSUPP;
> +}
> +
> +static inline int tegra_io_pads_power_is_enabled(int io_pad_id)
> +{
> +	return -ENOTSUPP;
> +}
> +
> +static inline int tegra_io_pads_configure_voltage(int io_pad_id, int io_volt_uv)
> +{
> +	return -ENOTSUPP;
> +}
> +
> +static inline int tegra_io_pads_get_configured_voltage(int io_pad_id)
> +{
> +	return -ENOTSUPP;
>  }
>  #endif /* CONFIG_ARCH_TEGRA */

In genernal this feels like 3 patches ...

1. Patch to add the new APIs
2. Patch to convert SOR to use new APIs
3. Patch to remove old APIs

May be let's see what Thierry thinks.

Cheers
Jon
