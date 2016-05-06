From: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH V4 3/3] soc/tegra: pmc: Add support for IO pads power
 state and voltage
Date: Fri, 6 May 2016 21:02:22 +0530
Message-ID: <572CB906.3090004@nvidia.com>
References: <1462531548-12914-1-git-send-email-ldewangan@nvidia.com> <1462531548-12914-4-git-send-email-ldewangan@nvidia.com> <572CAC20.9030307@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <572CAC20.9030307-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, airlied-cv59FeDIM0c@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


On Friday 06 May 2016 08:07 PM, Jon Hunter wrote:
> On 06/05/16 11:45, Laxman Dewangan wrote:
> +
> +	/* Last entry */
> +	TEGRA_IO_PAD_MAX,
> Nit should these be TEGRA_IO_PADS_xxx?

Because this was name of single pad and hence I said TEGRA_IO_PAD_XXX.


>> +};
>> +
>> +/* tegra_io_pads_source_voltage: The voltage level of IO rails which source
>> + *				 the IO pads.
>> + */
>> +enum tegra_io_pads_source_voltage {
>> +	TEGRA_IO_PADS_SOURCE_VOLTAGE_1800000UV,
>> +	TEGRA_IO_PADS_SOURCE_VOLTAGE_3300000UV,
>> +};
> Nit I wonder if we can make this shorter ...
>
> enum tegra_io_pads_vconf {
> 	TEGRA_IO_PADS_VCONF_1V8,
> 	TEGRA_IO_PADS_VCONF_3V3,

This looks good but for voltage and current, unit is used uV/uV across 
the system. So wanted to have same unit.


>
>> -int tegra_io_rail_power_on(unsigned int id);
>> -int tegra_io_rail_power_off(unsigned int id);
>> +/* Power enable/disable of the IO pads */
>> +int tegra_io_pads_power_enable(enum tegra_io_pads id);
>> +int tegra_io_pads_power_disable(enum tegra_io_pads id);
>> +int tegra_io_pads_power_is_enabled(enum tegra_io_pads id);
>> +
>> +/* Set/get Tegra IO pads voltage config registers */
>> +int tegra_io_pads_set_voltage_config(enum tegra_io_pads id,
>> +				     enum tegra_io_pads_source_voltage rail_uv);
>> +int tegra_io_pads_get_voltage_config(enum tegra_io_pads id);
> Ideally, for public function we should have kernel-doc descriptions.


I think we can have different patches for describing all the public 
interfaces with proper arguments description.
May be after this series, I can work on this.



>
> Otherwise looks fine. I would not rev this unless Thierry has some comments.
>
> Cheers
> Jon
