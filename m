From: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH V6 3/3] soc/tegra: pmc: Add support for IO pads power
 state and voltage
Date: Fri, 20 May 2016 19:04:18 +0530
Message-ID: <573F125A.20102@nvidia.com>
References: <1463745564-19297-1-git-send-email-ldewangan@nvidia.com> <1463745564-19297-4-git-send-email-ldewangan@nvidia.com> <573F11F5.7010702@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <573F11F5.7010702-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, airlied-cv59FeDIM0c@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org
Cc: gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


On Friday 20 May 2016 07:02 PM, Jon Hunter wrote:
> On 20/05/16 12:59, Laxman Dewangan wrote:
>> +/* tegra_io_pads_config_info: Tegra IO pads bit config info.
>> + * @dpd_config_bit: DPD configuration bit position. -1 if not supported.
>> + * @voltage_config_bit: Voltage configuration bit position. -1 if not supported.
>> + * @soc_mask: Bitwise OR of SoC masks if IO pads supported on that SoC.
>> + */
> Comment coding style :-(

I saw this style multiple places and so intentionally left here.
If comment is inside the code then
/*
  * first-line comment
  * second line
  */

but for function, it can have in single line.

Anyhow, I will correct in next cycle.


>
>> +static inline int tegra_io_pads_to_dpd_bit(const struct tegra_pmc_soc *soc,
>> +					   enum tegra_io_pads id)
>>   {
>> -	unsigned long rate, value;
>> +	if (tegra_io_pads_configs[id].soc_mask & soc->io_pads_soc_mask)
>> +		return tegra_io_pads_configs[id].dpd_config_bit;
> I realise now that we are not checking if 'id' is greater than
> TEGRA_IO_PADS_MAX anywhere. This should probably be handled here.

Do we need to check? Our parameter type is enum type and hence it is not 
expected to have outside of the MAX.
I think it will be unnecessarily check here.


>>   
>>
>> +	int ret;
>> +
>> +	ret = tegra_io_pads_to_dpd_bit(pmc->soc, id);
>> +	if (ret < 0)
>> +		return ret;
>> +
>> +	*bit = ret % 32;
>> +
>> +	if (*bit < 32) {
> Isn't bit always less than 32 here now?
>
Yaah this is bug. should be if (ret < 32)

My testcase has the pad name whose dpd bit is < 32 and hence did not 
catch it..

BTW, do you have the T124 based platform for SOR testing? I have T210 
platforms where I am testing.
