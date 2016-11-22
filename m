From: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH V2 2/2] pinctrl: tegra: Add driver to configure voltage
 and power of io pads
Date: Tue, 22 Nov 2016 13:43:07 +0530
Message-ID: <5833FE13.9030906@nvidia.com>
References: <1478696782-11657-1-git-send-email-ldewangan@nvidia.com> <1478696782-11657-3-git-send-email-ldewangan@nvidia.com> <b65cf9ea-208a-0704-7cc9-843bc18da508@nvidia.com> <5832C005.3070104@nvidia.com> <89eaabf1-c830-3ae9-5f34-a7f6d79e0816@nvidia.com> <5832ED69.3090903@nvidia.com> <2d442ccc-c438-cf3a-24c4-032d6c906f26@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <2d442ccc-c438-cf3a-24c4-032d6c906f26-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


On Tuesday 22 November 2016 02:07 AM, Jon Hunter wrote:
> On 21/11/16 12:49, Laxman Dewangan wrote:
>> On Monday 21 November 2016 04:38 PM, Jon Hunter wrote:
>>>> I had a discussion with the ASIC on this and as per them
>>>>       1.8 V nominal is (1.62V, 1.98V)
>>>>       3.3 V nominal is (2.97V,3.63V)
>>>>
>>>> I am working with them to update the TRM document but we can assume that
>>>> this information will be there in TRM.
>>> My feeling is that if all use-cases today are using either 1.8V or 3.3V,
>>> then may be we should not worry about this and only support either 1.8V
>>> or 3.3V. I would be more in favour of supporting other voltages if there
>>> is a real need.
>> Sometimes, the regulator will not return exact 1.8V or 3.3V due to the
>> PMIC rail resolution. On such cases, it returns nearest voltage to 1.8V
>> or 3.3V.
>> That's why the PMIC resolution is considered through IO pad voltage
>> tolerances.
> Ok, gotcha. I can see that would be the case for when you call
> regulator_get_voltage() (ie. in the probe), but what about the notifier?
> I imagine that in the notifier, at least for the pre-change case, that
> the voltage is the target and not the actual. So I am wondering if we
> need to check for a range in the notifier?

I think I can use the fixed voltage 1.8V and 3.3V as the current PMIC 
does not have this issue.

If we come for some tolerance issue in future then we will review this part.
This way it will be simple for now to go ahead with simple implementation.
I am going to validate the IO rail voltage as 1800mV and 3300mV.


>>>>>> +    const struct pinctrl_pin_desc *pins_desc;
>>>>>> +    int num_pins_desc;
>>>>>> +};
>>>>>> +
>>>>>> +struct tegra_io_pads_regulator_info {
>>>>>> +    struct device *dev;
>>>>>> +    const struct tegra_io_pads_cfg_info *pads_cfg;
>>>>>> +    struct regulator *regulator;
>>>>>> +    struct notifier_block regulator_nb;
>>>>>> +};
>>>>> Is this struct necessary? Seems to be a lot of duplicated information
>>>>> from the other structs. Why not add the regulator and regulator_nb to
>>>>> the main struct? OK, not all io_pads have a regulator but you are only
>>>>> saving one pointer.
>>>> Yes, some of IO pads support multi-voltage.
>>> Yes, but I am saying why not put this information in the main struct and
>>> not bother having yet another struct where half of the information is
>>> duplicated.
>> For regulator notifier callback, we will need the driver data. If I keep
>> this in the main structure then I will not able to get proper structure
>> until I make that as global.
>>
>> The notifier registration is
>>                  ret = devm_regulator_register_notifier(regulator,
>> &rinfo->regulator_nb);
>>
>>
>> and from the pointer of rinfo->regulator_nb, I will get the rinfo as
>>
>>          rinfo = container_of(nb, struct tegra_io_pads_regulator_info,
>>                                       regulator_nb);
>>
>> if I use this in main structure then I will not be able to get the
>> driver data.
> Ah yes, you have an array of regulators. Make sense. However, shame to
> duplicate some of this data and also would be good to avoid allocating
> so much memory in probe for these structs if only a few rails actually
> have regulators ...
>
>    tiopi->rinfo = devm_kzalloc(dev, sizeof(*tiopi->rinfo) *
> 				soc_data->num_pads_cfg, GFP_KERNEL);
>
Then allocate inside loop when supply found.
This way we can optimise the size of allocation on cast of the multiple 
memory allocation.
