From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH V5 3/3] soc/tegra: pmc: Add support for IO pads power
 state and voltage
Date: Fri, 20 May 2016 11:28:50 +0100
Message-ID: <573EE6E2.7020108@nvidia.com>
References: <1463055706-17744-1-git-send-email-ldewangan@nvidia.com>
 <1463055706-17744-4-git-send-email-ldewangan@nvidia.com>
 <573EE0CB.7000807@nvidia.com> <573EE015.6050600@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <573EE015.6050600-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, airlied-cv59FeDIM0c@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org
Cc: gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


On 20/05/16 10:59, Laxman Dewangan wrote:
> 
> On Friday 20 May 2016 03:32 PM, Jon Hunter wrote:
>> On 12/05/16 13:21, Laxman Dewangan wrote:
>> +#define TEGRA_IO_PADS_T124_T210        (TEGRA_IO_PADS_T124 |    \
>> +                    TEGRA_IO_PADS_T210)
>> +
>> What about T30 and T114? The TRM includes the DPD REQ/STATUS registers
>> for these?
> 
> The current user is sor driver. I queried this to Thierry that which
> ship is for sor1 and it is for T124/T132.
> So only focused on this.
> 
> My ultimate focus is on T210 without regression.
> Not inclined to add any specific feature for T30/T114.
> 
> Do you agree?

I see. I guess that is fine, we can always add support for early devices as and when it comes up.
 
>>>   struct tegra_powergate {
>>>       struct generic_pm_domain genpd;
>>>       struct tegra_pmc *pmc;
>>> @@ -115,12 +127,23 @@ struct tegra_powergate {
>>>       unsigned int num_resets;
>>>   };
>>>   +/* tegra_io_pads_config_info: Tegra IO pads bit config info.
>>> + * @dpd_config_bit: DPD configuration bit position. -1 if not
>>> supported.
>>> + * @voltage_config_bit: Voltage configuration bit position. -1 if
>>> not supported.
>>> + * @soc_mask: Bitwise OR of SoC masks if IO pads supported on that SoC.
>>> + */
>>> +struct tegra_io_pads_config_info {
>>> +    int dpd_config_bit;
>>> +    int voltage_config_bit;
>>> +    int soc_mask;
>>> +};
>>> +
>>>   struct tegra_pmc_soc {
>>>       unsigned int num_powergates;
>>>       const char *const *powergates;
>>>       unsigned int num_cpu_powergates;
>>>       const u8 *cpu_powergates;
>>> -
>>> +    int io_pads_soc_mask;
>>>       bool has_tsense_reset;
>>>       bool has_gpu_clamps;
>>>   };
>>> @@ -196,6 +219,14 @@ static void tegra_pmc_writel(u32 value, unsigned
>>> long offset)
>>>       writel(value, pmc->base + offset);
>>>   }
>>>   +static void tegra_pmc_rmw(unsigned long offset, u32 mask, u32 val)
>>> +{
>>> +    u32 pmc_reg = tegra_pmc_readl(offset);
>>> +
>>> +    pmc_reg = (pmc_reg & ~mask) | (val & mask);
>>> +    tegra_pmc_writel(pmc_reg, offset);
>>> +}
>>> +
>>>   static inline bool tegra_powergate_state(int id)
>>>   {
>>>       if (id == TEGRA_POWERGATE_3D && pmc->soc->has_gpu_clamps)
>>> @@ -841,21 +872,99 @@ static void tegra_powergate_init(struct
>>> tegra_pmc *pmc)
>>>       of_node_put(np);
>>>   }
>>>   -static int tegra_io_rail_prepare(unsigned int id, unsigned long
>>> *request,
>>> -                 unsigned long *status, unsigned int *bit)
>>> +#define TEGRA_IO_PADS_CONFIG(_id, _dpd, _volt, _soc)        \
>>> +[TEGRA_IO_PADS_##_id] = {                    \
>>> +    .dpd_config_bit = (_dpd),                \
>>> +    .voltage_config_bit = (_volt),                \
>>> +    .soc_mask = (_soc),                    \
>>> +}
>>> +
>>> +struct tegra_io_pads_config_info
>>> tegra_io_pads_configs[TEGRA_IO_PADS_MAX] = {
>>> +    TEGRA_IO_PADS_CONFIG(CSIA, 0, -1, TEGRA_IO_PADS_T124_T210),
>>> +    TEGRA_IO_PADS_CONFIG(CSIB, 1, -1, TEGRA_IO_PADS_T124_T210),
>>> +    TEGRA_IO_PADS_CONFIG(DSI, 2, -1, TEGRA_IO_PADS_T124_T210),
>>> +    TEGRA_IO_PADS_CONFIG(MIPI_BIAS, 3, -1, TEGRA_IO_PADS_T124_T210),
>>> +    TEGRA_IO_PADS_CONFIG(PEX_BIAS, 4, -1, TEGRA_IO_PADS_T124_T210),
>>> +    TEGRA_IO_PADS_CONFIG(PEX_CLK1, 5, -1, TEGRA_IO_PADS_T124_T210),
>>> +    TEGRA_IO_PADS_CONFIG(PEX_CLK2, 6, -1, TEGRA_IO_PADS_T124_T210),
>>> +    TEGRA_IO_PADS_CONFIG(USB0, 9, -1, TEGRA_IO_PADS_T124_T210),
>>> +    TEGRA_IO_PADS_CONFIG(USB1, 10, -1, TEGRA_IO_PADS_T124_T210),
>>> +    TEGRA_IO_PADS_CONFIG(USB2, 11, -1, TEGRA_IO_PADS_T124_T210),
>>> +    TEGRA_IO_PADS_CONFIG(USB_BIAS, 12, -1, TEGRA_IO_PADS_T124_T210),
>>> +    TEGRA_IO_PADS_CONFIG(NAND, 13, -1, TEGRA_IO_PADS_T124),
>>> +    TEGRA_IO_PADS_CONFIG(UART, 14, -1, TEGRA_IO_PADS_T124_T210),
>>> +    TEGRA_IO_PADS_CONFIG(BB, 15, -1, TEGRA_IO_PADS_T124),
>>> +    TEGRA_IO_PADS_CONFIG(AUDIO, 17, -1, TEGRA_IO_PADS_T124_T210),
>>> +    TEGRA_IO_PADS_CONFIG(USB3, 18, -1, TEGRA_IO_PADS_T210),
>>> +    TEGRA_IO_PADS_CONFIG(HSIC, 19, -1, TEGRA_IO_PADS_T124_T210),
>>> +    TEGRA_IO_PADS_CONFIG(COMP, 22, -1, TEGRA_IO_PADS_T124),
>>> +    TEGRA_IO_PADS_CONFIG(DBG, 25, -1, TEGRA_IO_PADS_T210),
>>> +    TEGRA_IO_PADS_CONFIG(DEBUG_NONAO, 26, -1, TEGRA_IO_PADS_T210),
>>> +    TEGRA_IO_PADS_CONFIG(GPIO, 27, 21, TEGRA_IO_PADS_T210),
>>> +    TEGRA_IO_PADS_CONFIG(HDMI, 28, -1, TEGRA_IO_PADS_T124_T210),
>>> +    TEGRA_IO_PADS_CONFIG(PEX_CNTRL, 32, -1, TEGRA_IO_PADS_T124),
>>> +    TEGRA_IO_PADS_CONFIG(SDMMC1, 33, 12, TEGRA_IO_PADS_T124_T210),
>>> +    TEGRA_IO_PADS_CONFIG(SDMMC3, 34, 13, TEGRA_IO_PADS_T124_T210),
>>> +    TEGRA_IO_PADS_CONFIG(SDMMC4, 35, -1, TEGRA_IO_PADS_T124),
>>> +    TEGRA_IO_PADS_CONFIG(EMMC, 35, -1, TEGRA_IO_PADS_T210),
>>> +    TEGRA_IO_PADS_CONFIG(CAM, 36, -1, TEGRA_IO_PADS_T124_T210),
>>> +    TEGRA_IO_PADS_CONFIG(EMMC2, 37, -1, TEGRA_IO_PADS_T210),
>>> +    TEGRA_IO_PADS_CONFIG(HV, 38, -1, TEGRA_IO_PADS_T124),
>>> +    TEGRA_IO_PADS_CONFIG(DSIB, 39, -1, TEGRA_IO_PADS_T124_T210),
>>> +    TEGRA_IO_PADS_CONFIG(DSIC, 40, -1, TEGRA_IO_PADS_T124_T210),
>>> +    TEGRA_IO_PADS_CONFIG(DSID, 41, -1, TEGRA_IO_PADS_T124_T210),
>>> +    TEGRA_IO_PADS_CONFIG(CSIC, 42, -1, TEGRA_IO_PADS_T210),
>>> +    TEGRA_IO_PADS_CONFIG(CSID, 43, -1, TEGRA_IO_PADS_T210),
>>> +    TEGRA_IO_PADS_CONFIG(CSIE, 44, -1, TEGRA_IO_PADS_T124_T210),
>>> +    TEGRA_IO_PADS_CONFIG(CSIF, 45, -1, TEGRA_IO_PADS_T210),
>>> +    TEGRA_IO_PADS_CONFIG(SPI, 46, -1, TEGRA_IO_PADS_T210),
>>> +    TEGRA_IO_PADS_CONFIG(SPI_HV, 47, 23, TEGRA_IO_PADS_T210),
>>> +    TEGRA_IO_PADS_CONFIG(DMIC, 50, -1, TEGRA_IO_PADS_T210),
>>> +    TEGRA_IO_PADS_CONFIG(DP, 51, -1, TEGRA_IO_PADS_T210),
>>> +    TEGRA_IO_PADS_CONFIG(LVDS, 57, -1, TEGRA_IO_PADS_T124_T210),
>>> +    TEGRA_IO_PADS_CONFIG(SYS_DDC, 58, -1, TEGRA_IO_PADS_T124),
>>> +    TEGRA_IO_PADS_CONFIG(AUDIO_HV, 61, 18, TEGRA_IO_PADS_T210),
>>> +};
>>> +
>>> +static inline int tegra_io_pads_to_dpd_bit(const struct
>>> tegra_pmc_soc *soc,
>>> +                       enum tegra_io_pads id)
>>>   {
>>> -    unsigned long rate, value;
>>> +    if (!(tegra_io_pads_configs[id].soc_mask &
>>> soc->io_pads_soc_mask) ||
>>> +        (tegra_io_pads_configs[id].dpd_config_bit < 0))
>>> +        return -EINVAL;
>> Seems that you may as well store -ENODEV/-ENOTSUPP in the table and then
>> you can get rid of this test.
>>
> 
> Need help, how can we avoid this?
> We need to check for the chip mask anyway.
> 
> Can you please explain more here?

If you store -ENOTSUPP in the table then your function just becomes ...

static inline int tegra_io_pads_to_dpd_bit(const struct tegra_pmc_soc *soc,
					   enum tegra_io_pads id)
{
	if (tegra_io_pads_configs[id].soc_mask & soc->io_pads_soc_mask)
		return tegra_io_pads_configs[id].dpd_config_bit;

	return -EINVAL;
}

You no longer need to explicitly check for the bit being less than 0,
because if it is, then we will return the error code directly from the
table. In other words, replace -1 with -ENOTSUPP in the table.

Jon

-- 
nvpublic
