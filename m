From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH V4 3/3] soc/tegra: pmc: Add support for IO pads power
 state and voltage
Date: Wed, 11 May 2016 16:35:26 +0100
Message-ID: <5733513E.9080606@nvidia.com>
References: <1462531548-12914-1-git-send-email-ldewangan@nvidia.com>
 <1462531548-12914-4-git-send-email-ldewangan@nvidia.com>
 <572CAC20.9030307@nvidia.com> <572CB906.3090004@nvidia.com>
 <572F2D84.3060505@nvidia.com> <57333366.2040500@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <57333366.2040500-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, airlied-cv59FeDIM0c@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


On 11/05/16 14:28, Laxman Dewangan wrote:
> On Sunday 08 May 2016 05:43 PM, Jon Hunter wrote:
>> On 06/05/16 16:32, Laxman Dewangan wrote:
>>> On Friday 06 May 2016 08:07 PM, Jon Hunter wrote:
>>>> On 06/05/16 11:45, Laxman Dewangan wrote:
>>>> +
>>>> +    /* Last entry */
>>>> +    TEGRA_IO_PAD_MAX,
>>>> Nit should these be TEGRA_IO_PADS_xxx?
>>> Because this was name of single pad and hence I said TEGRA_IO_PAD_XXX.
>> Aren't these used to set the voltage level and power state for the
>> entire group of IOs? Confused :-(
> 
> One IO pad can have multiple IO pins.
> IO Pad control the power state and voltage of all pins belongs to that
> IO pad.

Ugh ... I remember for xusb there was something similar we the Tegra
docs used pad to imply multiple. However, in general pad == pin == ball
or at least should.

> Now what should we say PADS or PAD here? TEGRA_IO_PAD_UART or
> TEGRA_IO_PADS_UART?

Personally, I think pads and that is purely because it aligns with the
APIs. I think that the APIs names, tegra_io_pads_xxx() should be
consistent with the enum naming.

>>>>> +};
>>>>> +
>>>>> +/* tegra_io_pads_source_voltage: The voltage level of IO rails which
>>>>> source
>>>>> + *                 the IO pads.
>>>>> + */
>>>>> +enum tegra_io_pads_source_voltage {
>>>>> +    TEGRA_IO_PADS_SOURCE_VOLTAGE_1800000UV,
>>>>> +    TEGRA_IO_PADS_SOURCE_VOLTAGE_3300000UV,
>>>>> +};
>>>> Nit I wonder if we can make this shorter ...
>>>>
>>>> enum tegra_io_pads_vconf {
>>>>      TEGRA_IO_PADS_VCONF_1V8,
>>>>      TEGRA_IO_PADS_VCONF_3V3,
>>> This looks good but for voltage and current, unit is used uV/uV across
>>> the system. So wanted to have same unit.
>> Now it is an enum does it matter? Or maybe just have ...
>>
>> enum tegra_io_pads_vconf {
>>     TEGRA_IO_PADS_1800000UV,
>>     TEGRA_IO_PADS_3300000UV,
>> };
>>
> 
> OK, TEGRA_IO_PADS_VCONF_1800000UV and TEGRA_IO_PADS_VCONF_3300000UV.
> Fine?

Fine :-)

Jon
