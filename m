From: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH V3 3/4] soc/tegra: pmc: Add support for IO pads power
 state and voltage
Date: Thu, 5 May 2016 19:05:59 +0530
Message-ID: <572B4C3F.1050700@nvidia.com>
References: <1462361973-27990-1-git-send-email-ldewangan@nvidia.com> <1462361973-27990-4-git-send-email-ldewangan@nvidia.com> <572B1CCA.5060502@nvidia.com> <572B2122.2080609@nvidia.com> <572B45C6.5090605@nvidia.com> <572B45FE.40801@nvidia.com> <572B4BAC.4070104@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <572B4BAC.4070104-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, airlied-cv59FeDIM0c@public.gmane.org
Cc: gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


On Thursday 05 May 2016 07:03 PM, Jon Hunter wrote:
> On 05/05/16 14:09, Laxman Dewangan wrote:
>> On Thursday 05 May 2016 06:38 PM, Jon Hunter wrote:
>>> On 05/05/16 11:32, Laxman Dewangan wrote:
>>>> On Thursday 05 May 2016 03:43 PM, Jon Hunter wrote:
>>>>> On 04/05/16 12:39, Laxman Dewangan wrote:
>>>>> +        return -EINVAL;
>>>>> +
>>>>> +    for (i = 0; i < soc->num_io_pads; ++i) {
>>>>> +        if (soc->io_pads_control[i].pad_id == pad_id)
>>>>> +            return soc->io_pads_control[i].dpd_bit_pos;
>>>>> +    }
>>>>> Do we need a loop here? Can't we just make the table a look-up table
>>>>> now
>>>>> that the ID is just an index?
>>>> We do not support the table for all pads and so for those non supported
>>>> pad index, it will be 0 (default) and 0 is the valid bit position here.
>>> That does make it tricky.
>>>
>>>> If you want table then we will need one more information for making that
>>>> index as valid/invalid.
>>>> We can pack the valid/invalid with bit position to make u32.
>>> Another option would be, to have a single table for all devices and the
>>> make the valid field a valid mask which has a bit for each SoC.
>> We have 2 register for DPD and hence making the mask bit will need u64.
>>
>> I think we can have like below to avoid loop.
>> struct tegra_io_pads_control {
>>          int dpd_supported;
>>          int voltage_change_supported;
>>          int dpd_config_bit;
>>          int voltage_config_bit;
>> };
> Why can't we have ...
>
> struct tegra_io_pads_control {
>          int dpd_config_bit;
>          int voltage_config_bit;
> 	unsigned int soc_mask;
> };
>
> Then .valid should indicate if it the IO pads group is valid for the
> device ...
>
> 	.soc_mask = TEGRA_IO_PADS_T124
> or
> 	.soc_mask = TEGRA_IO_PADS_T210
> or
> 	.soc_mask = TEGRA_IO_PADS_T124 | TEGRA_IO_PADS_T210
>
> You can use -1 to indicate the for the dpd and voltage bit to indicate
> if they are valid. In other words, you need to check the IO pad is valid
> for the soc and then the bit is valid.

This will also work.
Then this is not required part of the soc data.
Only soc_io_mask need to be part of soc data.
This table can be file static.


>>>
>>> I think that this is exactly what enums are for, then you don't have to
>>> explicitly define each number.
>>>
>> We have defines in the dt binding header.
> Nothing to stop us including the dt binding header in the pmc.c. We do
> this for tegra clks.
The dt binding header is not there and need to add.
Part of this patch or different patch?

Also we can not have enums in binding header. Only macros/defines.

We do not have the dt binding doc yet as it will be in future patch.


>> BTW, are you fine to keep TEGRA_IO_PAD_* as defines instead of enums.
>> This is what POWERGATE are there.
> Up to you, I prefer an enum. The POWERGATE IDs defines match the bit in
> the register so it makes sense these are explicit.
>
OK, let me make enums. Last member as MAX so that I can initialize the 
tegra_io_pad_info[TEGRA_IO_PAD_MAX] =
