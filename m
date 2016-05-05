From: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH V3 3/4] soc/tegra: pmc: Add support for IO pads power
 state and voltage
Date: Thu, 5 May 2016 16:02:02 +0530
Message-ID: <572B2122.2080609@nvidia.com>
References: <1462361973-27990-1-git-send-email-ldewangan@nvidia.com> <1462361973-27990-4-git-send-email-ldewangan@nvidia.com> <572B1CCA.5060502@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <572B1CCA.5060502-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, airlied-cv59FeDIM0c@public.gmane.org
Cc: gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


On Thursday 05 May 2016 03:43 PM, Jon Hunter wrote:
> On 04/05/16 12:39, Laxman Dewangan wrote:

> +		return -EINVAL;
> +
> +	for (i = 0; i < soc->num_io_pads; ++i) {
> +		if (soc->io_pads_control[i].pad_id == pad_id)
> +			return soc->io_pads_control[i].dpd_bit_pos;
> +	}
> Do we need a loop here? Can't we just make the table a look-up table now
> that the ID is just an index?

We do not support the table for all pads and so for those non supported 
pad index, it will be 0 (default) and 0 is the valid bit position here.

If you want table then we will need one more information for making that 
index as valid/invalid.
We can pack the valid/invalid with bit position to make u32.


> +	return !!(status & BIT(dpd_bit % 32));
> +}
> +EXPORT_SYMBOL(tegra_io_pads_power_is_enabled);
> +
> +int tegra_io_pads_configure_voltage(int io_pad_id, int io_volt_uv)
> s/io_pad_id/id/
>
> I think I prefer tegra_io_pads_set/get_voltage_conf(). What is the point
> in passing uV here if in device-tree you are using the enum for the
> voltage level? I know that I had suggested this, but given we are not
> going to use voltage in the DT then, not sure it has any value here.
This is generic interface and hence. So in future if we have more 
option, we will not need change in interface.

Otherwise, make enums for 1.8/3.3 and pass as enum here. So in future if 
we have any other voltage then again add enums.
I wanted to avoid this.



>   
> +#define TEGRA_IO_PADS_CONTROL(_pad, _dpd, _pwr)		\
> +{							\
> +	.pad_id = (TEGRA_IO_PAD_##_pad),		\
> Not sure this needs to be part of the structure as it is just an index.

it is there for matching.

>> +#define TEGRA_IO_PAD_USB2		41
>> +#define TEGRA_IO_PAD_USB3		42
>> +#define TEGRA_IO_PAD_USB_BIAS		43
> Enum?
>

Yaah, that will also be possible. Then then argument is

enum tegra_io_pad_id id

instead of unsigned int.

May be not much benifit here.

>>   
>>
>>   #endif /* CONFIG_ARCH_TEGRA */
> In genernal this feels like 3 patches ...
>
> 1. Patch to add the new APIs
> 2. Patch to convert SOR to use new APIs
> 3. Patch to remove old APIs
>
> May be let's see what Thierry thinks.
>

OK,
I saw when such changes happen, we can have in single patch. This is 
exactly we did in the RTC patches for rtc + MFD.
