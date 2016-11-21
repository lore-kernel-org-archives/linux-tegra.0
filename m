From: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH V2 2/2] pinctrl: tegra: Add driver to configure voltage
 and power of io pads
Date: Mon, 21 Nov 2016 18:19:45 +0530
Message-ID: <5832ED69.3090903@nvidia.com>
References: <1478696782-11657-1-git-send-email-ldewangan@nvidia.com> <1478696782-11657-3-git-send-email-ldewangan@nvidia.com> <b65cf9ea-208a-0704-7cc9-843bc18da508@nvidia.com> <5832C005.3070104@nvidia.com> <89eaabf1-c830-3ae9-5f34-a7f6d79e0816@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <89eaabf1-c830-3ae9-5f34-a7f6d79e0816-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


On Monday 21 November 2016 04:38 PM, Jon Hunter wrote:
>>
>> I had a discussion with the ASIC on this and as per them
>>      1.8 V nominal is (1.62V, 1.98V)
>>      3.3 V nominal is (2.97V,3.63V)
>>
>> I am working with them to update the TRM document but we can assume that
>> this information will be there in TRM.
> My feeling is that if all use-cases today are using either 1.8V or 3.3V,
> then may be we should not worry about this and only support either 1.8V
> or 3.3V. I would be more in favour of supporting other voltages if there
> is a real need.

Sometimes, the regulator will not return exact 1.8V or 3.3V due to the 
PMIC rail resolution. On such cases, it returns nearest voltage to 1.8V 
or 3.3V.
That's why the PMIC resolution is considered through IO pad voltage 
tolerances.


>
>>>> +    const struct pinctrl_pin_desc *pins_desc;
>>>> +    int num_pins_desc;
>>>> +};
>>>> +
>>>> +struct tegra_io_pads_regulator_info {
>>>> +    struct device *dev;
>>>> +    const struct tegra_io_pads_cfg_info *pads_cfg;
>>>> +    struct regulator *regulator;
>>>> +    struct notifier_block regulator_nb;
>>>> +};
>>> Is this struct necessary? Seems to be a lot of duplicated information
>>> from the other structs. Why not add the regulator and regulator_nb to
>>> the main struct? OK, not all io_pads have a regulator but you are only
>>> saving one pointer.
>> Yes, some of IO pads support multi-voltage.
> Yes, but I am saying why not put this information in the main struct and
> not bother having yet another struct where half of the information is
> duplicated.

For regulator notifier callback, we will need the driver data. If I keep 
this in the main structure then I will not able to get proper structure 
until I make that as global.

The notifier registration is
                 ret = devm_regulator_register_notifier(regulator,
&rinfo->regulator_nb);


and from the pointer of rinfo->regulator_nb, I will get the rinfo as

         rinfo = container_of(nb, struct tegra_io_pads_regulator_info,
                                      regulator_nb);

if I use this in main structure then I will not be able to get the 
driver data.


>
>>> +        if ((vdata->old_uV > TEGRA_IO_PAD_1800000UV_UPPER_LIMIT) &&
>>> +            (vdata->min_uV <= TEGRA_IO_PAD_1800000UV_UPPER_LIMIT))
>>> +            break;
>>> The data-sheet for Tegra210 only lists 1.8V or 3.3V as supported
>>> options. Do we need to support a range? Or does the h/w support a range
>>> of voltages? I am just wondering why we cannot check explicitly for 1.8V
>>> or 3.3V and treat anything else as an error.
>> Two voltage level, not range.
> Ok, then I think it would be much simpler if we just support the
> voltages we are using today.
Regulator resolution is only reason here to use tolerance.

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
