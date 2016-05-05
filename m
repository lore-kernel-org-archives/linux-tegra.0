From: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH V3 3/4] soc/tegra: pmc: Add support for IO pads power
 state and voltage
Date: Thu, 5 May 2016 18:39:18 +0530
Message-ID: <572B45FE.40801@nvidia.com>
References: <1462361973-27990-1-git-send-email-ldewangan@nvidia.com> <1462361973-27990-4-git-send-email-ldewangan@nvidia.com> <572B1CCA.5060502@nvidia.com> <572B2122.2080609@nvidia.com> <572B45C6.5090605@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <572B45C6.5090605-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, airlied-cv59FeDIM0c@public.gmane.org
Cc: gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


On Thursday 05 May 2016 06:38 PM, Jon Hunter wrote:
> On 05/05/16 11:32, Laxman Dewangan wrote:
>> On Thursday 05 May 2016 03:43 PM, Jon Hunter wrote:
>>> On 04/05/16 12:39, Laxman Dewangan wrote:
>>> +        return -EINVAL;
>>> +
>>> +    for (i = 0; i < soc->num_io_pads; ++i) {
>>> +        if (soc->io_pads_control[i].pad_id == pad_id)
>>> +            return soc->io_pads_control[i].dpd_bit_pos;
>>> +    }
>>> Do we need a loop here? Can't we just make the table a look-up table now
>>> that the ID is just an index?
>> We do not support the table for all pads and so for those non supported
>> pad index, it will be 0 (default) and 0 is the valid bit position here.
> That does make it tricky.
>
>> If you want table then we will need one more information for making that
>> index as valid/invalid.
>> We can pack the valid/invalid with bit position to make u32.
> Another option would be, to have a single table for all devices and the
> make the valid field a valid mask which has a bit for each SoC.

We have 2 register for DPD and hence making the mask bit will need u64.

I think we can have like below to avoid loop.
struct tegra_io_pads_control {
         int dpd_supported;
         int voltage_change_supported;
         int dpd_config_bit;
         int voltage_config_bit;
};


And the *_supported will be true for those supported pads.

Logic will be
if (soc->io_pads_control[id].dpd_supported)
      return soc->io_pads_control[id].dpd_config_bit;
else
      return -ENOTSUPP;

There is no loop in this.
Infact we will not need additional function here and no need to 
initialize the non-supported pads also.

Same for voltage config bit also.



>>> +    return !!(status & BIT(dpd_bit % 32));
>>> +}
>>> +EXPORT_SYMBOL(tegra_io_pads_power_is_enabled);
>>> +
>>> +int tegra_io_pads_configure_voltage(int io_pad_id, int io_volt_uv)
>>> s/io_pad_id/id/
>>>
>>> I think I prefer tegra_io_pads_set/get_voltage_conf(). What is the point
>>> in passing uV here if in device-tree you are using the enum for the
>>> voltage level? I know that I had suggested this, but given we are not
>>> going to use voltage in the DT then, not sure it has any value here.
>> This is generic interface and hence. So in future if we have more
>> option, we will not need change in interface.
> Yes but apart from the SOR driver should only be used by the pinctrl
> driver (I hope).
>
>> Otherwise, make enums for 1.8/3.3 and pass as enum here. So in future if
>> we have any other voltage then again add enums.
>> I wanted to avoid this.
> You already have added the enum for the pinctrl driver and you would
> have to change that enum in the future anyway. So why not use it here?
>
>>>    +#define TEGRA_IO_PADS_CONTROL(_pad, _dpd, _pwr)        \
>>> +{                            \
>>> +    .pad_id = (TEGRA_IO_PAD_##_pad),        \
>>> Not sure this needs to be part of the structure as it is just an index.
>> it is there for matching.
>>
>>>> +#define TEGRA_IO_PAD_USB2        41
>>>> +#define TEGRA_IO_PAD_USB3        42
>>>> +#define TEGRA_IO_PAD_USB_BIAS        43
>>> Enum?
>>>
>> Yaah, that will also be possible. Then then argument is
>>
>> enum tegra_io_pad_id id
>>
>> instead of unsigned int.
>>
>> May be not much benifit here.
> I think that this is exactly what enums are for, then you don't have to
> explicitly define each number.
>
We have defines in the dt binding header.
OK, let me expose the enums from pmc header and use this.


BTW, are you fine to keep TEGRA_IO_PAD_* as defines instead of enums.
This is what POWERGATE are there.
