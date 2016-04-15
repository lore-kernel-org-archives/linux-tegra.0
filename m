From: Laxman Dewangan <ldewangan@nvidia.com>
Subject: Re: [PATCH 7/7] pinctrl: tegra: Add driver to configure voltage and
 power state of io pads
Date: Fri, 15 Apr 2016 14:09:00 +0530
Message-ID: <5710A8A4.90309@nvidia.com>
References: <1460473007-11535-1-git-send-email-ldewangan@nvidia.com>	<1460473007-11535-8-git-send-email-ldewangan@nvidia.com> <CACRpkdZyYiNJfuiTPeivvgVTZwdwh64nkf=f8JczSAVvnT7QeA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <CACRpkdZyYiNJfuiTPeivvgVTZwdwh64nkf=f8JczSAVvnT7QeA@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Stephen Warren <swarren@wwwdotorg.org>, Thierry Reding <thierry.reding@gmail.com>, Alexandre Courbot <gnurou@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Jon Hunter <jonathanh@nvidia.com>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org


On Friday 15 April 2016 01:38 PM, Linus Walleij wrote:
> On Tue, Apr 12, 2016 at 4:56 PM, Laxman Dewangan <ldewangan@nvidia.com> wrote:
>
>> NVIDIA Tegra210 supports the IO pads which can operate at 1.8V
>> or 3.3V I/O voltage levels. Also the IO pads can be configured
>> for power down state if it is not used. SW needs to configure the
>> voltage level of IO pads based on IO rail voltage and its power
>> state based on platform usage.
>>
>> The voltage and power state configurations of pads are provided
>> through pin control frameworks. Add pin control driver for Tegra's
>> IO pads' voltage and power state configurations.
>>
>> Signed-off-by: Laxman Dewangan <ldewangan@nvidia.com>
> (...)
>> +config PINCTRL_TEGRA210_IO_PAD
> Why does this need its own Kconfig option?
> Can't you just unconditionally compile it in if
> PINCTRL_TEGRA210 is selected, you seem to say
> it is there on all these platforms anyway.

Yes, it can be done. The reason I kept is that this driver needed T210 
onwards and not for older generation of SoC.

May be we can select from T210 pincontrol.


>
>> +static const struct pinconf_generic_params tegra_io_pads_cfg_params[] = {
>> +       {
>> +               .property = "nvidia,io-rail-voltage",
>> +               .param = TEGRA_IO_RAIL_VOLTAGE,
>> +       }, {
> What's so nvidia-specific about this?
> We have power-source in
> Documentation/devicetree/bindings/pinctrl/pinctrl-bindings.txt
> which takes a custom argument. This is obviously what you
> are doing (selecting one of two rails), so use that binding.

Yes, I looked for the common property but did not found anything near to 
this.
My understating for power-source is that selecting the source of supply, 
not the voltages.
I am looking something  power-source-voltage-level.
Should we add this?




>
>> +               .property = "nvidia,io-pad-deep-power-down",
>> +               .param = TEGRA_IO_PAD_DEEP_POWER_DOWN,
>> +       },
> Likewise the generic bindings have low-power-enable and
> low-power-disable, this seems like a copy of low-power-enable;
When writing, I considered this property but was not able to fully 
convinced myself to use this but I think now I am fine to use this as 
you suggested.



>
> Even if Tegra is not using the generic code for handling the
> standard bindings (GENERIC_PINCONF) it doesn't stop
> you from using the generic bindings and contributing to them.
>
> Historically you have a few custom bindings like these:
>
> nvidia,pins
> nvidia,function
> nvidia,pull
> nvidia,tristate
>
> etc etc, but that is just unfortunate and due to preceding the
> generic bindings. I would appreciate if you started to support
> the generic bindings in parallel, but I'm not gonna push that issue.

Yaah, these are in my plate to cleanup. Let me work with Stephen, what 
he think here.


