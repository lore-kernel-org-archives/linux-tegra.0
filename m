From: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH V6 3/3] soc/tegra: pmc: Add support for IO pads power
 state and voltage
Date: Fri, 20 May 2016 14:32:37 +0100
Message-ID: <573F11F5.7010702@nvidia.com>
References: <1463745564-19297-1-git-send-email-ldewangan@nvidia.com>
 <1463745564-19297-4-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1463745564-19297-4-git-send-email-ldewangan@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>, thierry.reding@gmail.com, airlied@linux.ie, swarren@wwwdotorg.org
Cc: gnurou@gmail.com, dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


On 20/05/16 12:59, Laxman Dewangan wrote:
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
> level controls are added for Tegra124, Tegra132 and Tegra210. The SOR
> driver is modified to use the new APIs.
> 
> Signed-off-by: Laxman Dewangan <ldewangan@nvidia.com>
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
> 
> Changes from V3:
> - Make all pad_id/io_pad_id to id.
> - tegra_io_pad_ -> tegra_io_pads
> - dpd_bit -> bit, pwr_mask/bit to mask/bit.
> - Rename function to tegra_io_pads_{set,get}_voltage_config
> - Make the io pad tables common for all SoC.
> - Make io_pads enums.
> - Add enums for voltage.
> 
> Changes from V4:
> - IO_PAD->IO_PADS
> - TEGRA_IO_PADS_POWER_SOURCE_ -> TEGRA_IO_PADS_VCONF_
> 
> Changes from V5:
> - Fix comment style to multi-line format.
> - Use -EINVAL instead of -1 to refactor some of function as suggested by Jon.
> ---
>  drivers/gpu/drm/tegra/sor.c |   8 +-
>  drivers/soc/tegra/pmc.c     | 221 ++++++++++++++++++++++++++++++++++++++------
>  include/soc/tegra/pmc.h     | 133 ++++++++++++++++++--------
>  3 files changed, 295 insertions(+), 67 deletions(-)

...

> +/* tegra_io_pads_config_info: Tegra IO pads bit config info.
> + * @dpd_config_bit: DPD configuration bit position. -1 if not supported.
> + * @voltage_config_bit: Voltage configuration bit position. -1 if not supported.
> + * @soc_mask: Bitwise OR of SoC masks if IO pads supported on that SoC.
> + */

Comment coding style :-(

> +struct tegra_io_pads_config_info {
> +	int dpd_config_bit;
> +	int voltage_config_bit;
> +	int soc_mask;
> +};
> +
>  struct tegra_pmc_soc {
>  	unsigned int num_powergates;
>  	const char *const *powergates;
>  	unsigned int num_cpu_powergates;
>  	const u8 *cpu_powergates;
> -
> +	int io_pads_soc_mask;
>  	bool has_tsense_reset;
>  	bool has_gpu_clamps;
>  };
> @@ -196,6 +220,14 @@ static void tegra_pmc_writel(u32 value, unsigned long offset)
>  	writel(value, pmc->base + offset);
>  }
>  
> +static void tegra_pmc_rmw(unsigned long offset, u32 mask, u32 val)
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
> @@ -841,21 +873,98 @@ static void tegra_powergate_init(struct tegra_pmc *pmc)
>  	of_node_put(np);
>  }
>  
> -static int tegra_io_rail_prepare(unsigned int id, unsigned long *request,
> -				 unsigned long *status, unsigned int *bit)
> +#define TEGRA_IO_PADS_CONFIG(_id, _dpd, _volt, _soc)		\
> +[TEGRA_IO_PADS_##_id] = {					\
> +	.dpd_config_bit = (_dpd),				\
> +	.voltage_config_bit = (_volt),				\
> +	.soc_mask = (_soc),					\
> +}
> +
> +static struct tegra_io_pads_config_info
> +tegra_io_pads_configs[TEGRA_IO_PADS_MAX] = {
> +	TEGRA_IO_PADS_CONFIG(CSIA, 0, -EINVAL, TEGRA_IO_PADS_T124_T210),
> +	TEGRA_IO_PADS_CONFIG(CSIB, 1, -EINVAL, TEGRA_IO_PADS_T124_T210),
> +	TEGRA_IO_PADS_CONFIG(DSI, 2, -EINVAL, TEGRA_IO_PADS_T124_T210),
> +	TEGRA_IO_PADS_CONFIG(MIPI_BIAS, 3, -EINVAL, TEGRA_IO_PADS_T124_T210),
> +	TEGRA_IO_PADS_CONFIG(PEX_BIAS, 4, -EINVAL, TEGRA_IO_PADS_T124_T210),
> +	TEGRA_IO_PADS_CONFIG(PEX_CLK1, 5, -EINVAL, TEGRA_IO_PADS_T124_T210),
> +	TEGRA_IO_PADS_CONFIG(PEX_CLK2, 6, -EINVAL, TEGRA_IO_PADS_T124_T210),
> +	TEGRA_IO_PADS_CONFIG(USB0, 9, -EINVAL, TEGRA_IO_PADS_T124_T210),
> +	TEGRA_IO_PADS_CONFIG(USB1, 10, -EINVAL, TEGRA_IO_PADS_T124_T210),
> +	TEGRA_IO_PADS_CONFIG(USB2, 11, -EINVAL, TEGRA_IO_PADS_T124_T210),
> +	TEGRA_IO_PADS_CONFIG(USB_BIAS, 12, -EINVAL, TEGRA_IO_PADS_T124_T210),
> +	TEGRA_IO_PADS_CONFIG(NAND, 13, -EINVAL, TEGRA_IO_PADS_T124),
> +	TEGRA_IO_PADS_CONFIG(UART, 14, -EINVAL, TEGRA_IO_PADS_T124_T210),
> +	TEGRA_IO_PADS_CONFIG(BB, 15, -EINVAL, TEGRA_IO_PADS_T124),
> +	TEGRA_IO_PADS_CONFIG(AUDIO, 17, -EINVAL, TEGRA_IO_PADS_T124_T210),
> +	TEGRA_IO_PADS_CONFIG(USB3, 18, -EINVAL, TEGRA_IO_PADS_T210),
> +	TEGRA_IO_PADS_CONFIG(HSIC, 19, -EINVAL, TEGRA_IO_PADS_T124_T210),
> +	TEGRA_IO_PADS_CONFIG(COMP, 22, -EINVAL, TEGRA_IO_PADS_T124),
> +	TEGRA_IO_PADS_CONFIG(DBG, 25, -EINVAL, TEGRA_IO_PADS_T210),
> +	TEGRA_IO_PADS_CONFIG(DEBUG_NONAO, 26, -EINVAL, TEGRA_IO_PADS_T210),
> +	TEGRA_IO_PADS_CONFIG(GPIO, 27, 21, TEGRA_IO_PADS_T210),
> +	TEGRA_IO_PADS_CONFIG(HDMI, 28, -EINVAL, TEGRA_IO_PADS_T124_T210),
> +	TEGRA_IO_PADS_CONFIG(PEX_CNTRL, 32, -EINVAL, TEGRA_IO_PADS_T124),
> +	TEGRA_IO_PADS_CONFIG(SDMMC1, 33, 12, TEGRA_IO_PADS_T124_T210),
> +	TEGRA_IO_PADS_CONFIG(SDMMC3, 34, 13, TEGRA_IO_PADS_T124_T210),
> +	TEGRA_IO_PADS_CONFIG(SDMMC4, 35, -EINVAL, TEGRA_IO_PADS_T124),
> +	TEGRA_IO_PADS_CONFIG(EMMC, 35, -EINVAL, TEGRA_IO_PADS_T210),
> +	TEGRA_IO_PADS_CONFIG(CAM, 36, -EINVAL, TEGRA_IO_PADS_T124_T210),
> +	TEGRA_IO_PADS_CONFIG(EMMC2, 37, -EINVAL, TEGRA_IO_PADS_T210),
> +	TEGRA_IO_PADS_CONFIG(HV, 38, -EINVAL, TEGRA_IO_PADS_T124),
> +	TEGRA_IO_PADS_CONFIG(DSIB, 39, -EINVAL, TEGRA_IO_PADS_T124_T210),
> +	TEGRA_IO_PADS_CONFIG(DSIC, 40, -EINVAL, TEGRA_IO_PADS_T124_T210),
> +	TEGRA_IO_PADS_CONFIG(DSID, 41, -EINVAL, TEGRA_IO_PADS_T124_T210),
> +	TEGRA_IO_PADS_CONFIG(CSIC, 42, -EINVAL, TEGRA_IO_PADS_T210),
> +	TEGRA_IO_PADS_CONFIG(CSID, 43, -EINVAL, TEGRA_IO_PADS_T210),
> +	TEGRA_IO_PADS_CONFIG(CSIE, 44, -EINVAL, TEGRA_IO_PADS_T124_T210),
> +	TEGRA_IO_PADS_CONFIG(CSIF, 45, -EINVAL, TEGRA_IO_PADS_T210),
> +	TEGRA_IO_PADS_CONFIG(SPI, 46, -EINVAL, TEGRA_IO_PADS_T210),
> +	TEGRA_IO_PADS_CONFIG(SPI_HV, 47, 23, TEGRA_IO_PADS_T210),
> +	TEGRA_IO_PADS_CONFIG(DMIC, 50, -EINVAL, TEGRA_IO_PADS_T210),
> +	TEGRA_IO_PADS_CONFIG(DP, 51, -EINVAL, TEGRA_IO_PADS_T210),
> +	TEGRA_IO_PADS_CONFIG(LVDS, 57, -EINVAL, TEGRA_IO_PADS_T124_T210),
> +	TEGRA_IO_PADS_CONFIG(SYS_DDC, 58, -EINVAL, TEGRA_IO_PADS_T124),
> +	TEGRA_IO_PADS_CONFIG(AUDIO_HV, 61, 18, TEGRA_IO_PADS_T210),
> +};
> +
> +static inline int tegra_io_pads_to_dpd_bit(const struct tegra_pmc_soc *soc,
> +					   enum tegra_io_pads id)
>  {
> -	unsigned long rate, value;
> +	if (tegra_io_pads_configs[id].soc_mask & soc->io_pads_soc_mask)
> +		return tegra_io_pads_configs[id].dpd_config_bit;

I realise now that we are not checking if 'id' is greater than
TEGRA_IO_PADS_MAX anywhere. This should probably be handled here.
>  
> -	*bit = id % 32;
> +	return -EINVAL;
> +}
>  
> -	/*
> -	 * There are two sets of 30 bits to select IO rails, but bits 30 and
> -	 * 31 are control bits rather than IO rail selection bits.
> -	 */
> -	if (id > 63 || *bit == 30 || *bit == 31)
> +static int tegra_io_pads_to_voltage_bit(const struct tegra_pmc_soc *soc,
> +					enum tegra_io_pads id)
> +{
> +	/* T210 only supports io-pad voltage config bit */
> +	if (soc->io_pads_soc_mask != TEGRA_IO_PADS_T210)
>  		return -EINVAL;
>  
> -	if (id < 32) {
> +	if (tegra_io_pads_configs[id].soc_mask & soc->io_pads_soc_mask)
> +		return tegra_io_pads_configs[id].voltage_config_bit;

Same here for 'id'

> +
> +	return -EINVAL;
> +}
> +
> +static int tegra_io_pads_dpd_prepare(enum tegra_io_pads id,
> +				     unsigned long *request,
> +				     unsigned long *status,
> +				     unsigned int *bit)
> +{
> +	unsigned long rate, value;
> +	int ret;
> +
> +	ret = tegra_io_pads_to_dpd_bit(pmc->soc, id);
> +	if (ret < 0)
> +		return ret;
> +
> +	*bit = ret % 32;
> +
> +	if (*bit < 32) {

Isn't bit always less than 32 here now?

Cheers
Jon

-- 
nvpublic
