From: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH V5 3/3] soc/tegra: pmc: Add support for IO pads power
 state and voltage
Date: Thu, 19 May 2016 21:43:17 +0530
Message-ID: <573DE61D.6080203@nvidia.com>
References: <1463055706-17744-1-git-send-email-ldewangan@nvidia.com> <1463055706-17744-4-git-send-email-ldewangan@nvidia.com> <573DE19C.8090704@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <573DE19C.8090704-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, airlied-cv59FeDIM0c@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org
Cc: gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


On Thursday 19 May 2016 09:24 PM, Jon Hunter wrote:
> On 12/05/16 13:21, Laxman Dewangan wrote:
>> The IO pins of Tegra SoCs are grouped for common control of IO
>> interface like setting voltage signal levels and power state of
>> the interface. The group is generally referred as IO pads. The
>> power state and voltage control of IO pins can be done at IO pads
>> level.
>>
>> Tegra generation SoC supports the power down of IO pads when it
>> is not used even in the active state of system. This saves power
>> from that IO interface. Also it supports multiple voltage level
>> in IO pins for interfacing on some of pads. The IO pad voltage is
>> automatically detected till T124, hence SW need not to configure
>> this. But from T210, the automatically detection logic has been
>> removed, hence SW need to explicitly set the IO pad voltage into
>> IO pad configuration registers.
>>
>> Add support to set the power states and voltage level of the IO pads
>> from client driver. The implementation for the APIs are in generic
>> which is applicable for all generation os Tegra SoC.
>>
>> IO pads ID and information of bit field for power state and voltage
>> level controls are added for Tegra124, Tegra132 and Tegra210. The SOR
>> driver is modified to use the new APIs.
>>
>> Signed-off-by: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>>
>> ---
>> Changes from V1:
>> This is reworked on earlier path to have separation between IO rails and
>> io pads and add power state and voltage control APIs in single call.
>>
>> Changes from V2:
>> - Remove the tegra_io_rail_power_off/on() apis and change client (sor) driver
>> to use the new APIs for IO pad power.
>> - Remove the TEGRA_IO_RAIL_ macros.
>>
>> Changes from V3:
>> - Make all pad_id/io_pad_id to id.
>> - tegra_io_pad_ -> tegra_io_pads
>> - dpd_bit -> bit, pwr_mask/bit to mask/bit.
>> - Rename function to tegra_io_pads_{set,get}_voltage_config
>> - Make the io pad tables common for all SoC.
>> - Make io_pads enums.
>> - Add enums for voltage.
>>
>> Changes from V4:
>> - IO_PAD->IO_PADS
>> - TEGRA_IO_PADS_POWER_SOURCE_ -> TEGRA_IO_PADS_VCONF_
>> ---
>>   drivers/gpu/drm/tegra/sor.c |   8 +-
>>   drivers/soc/tegra/pmc.c     | 221 ++++++++++++++++++++++++++++++++++++++------
>>   include/soc/tegra/pmc.h     | 132 ++++++++++++++++++--------
>>   3 files changed, 294 insertions(+), 67 deletions(-)
> [snip]
>
>> +static int tegra_io_pads_to_voltage_bit(const struct tegra_pmc_soc *soc,
>> +					enum tegra_io_pads id)
>> +{
>> +	/* T210 only supports io-pad voltage config bit */
>> +	if (soc->io_pads_soc_mask != TEGRA_IO_PADS_T210)
>>   		return -EINVAL;
> If this is only supported for Tegra210, should these voltage functions
> be dependent on CONFIG_ARCH_TEGRA_210_SOC? If so, then I am also
> wondering if we should bother having the massive look-up table and just
> have a smaller table to translate the ID to bit for voltage as you had
> in your initial patch? Seems there are few io-pads that support the
> voltage configuration.
>

Voltage config supported from T210 onwards. Earlier it was auto detected 
and so SW need not to write it.

I think let's have this as of now and we will make the different table 
for voltage config in future when we add another chip support.

We will not use the SOC config for this, we will use only compatible 
property and its data for getting the support.
