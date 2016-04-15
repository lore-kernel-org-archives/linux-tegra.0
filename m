From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 7/7] pinctrl: tegra: Add driver to configure voltage and
 power state of io pads
Date: Fri, 15 Apr 2016 11:25:06 +0200
Message-ID: <CACRpkdZLEozAmv6REcb7ubCNSLxGsYj1whZEKUkdiodZoS=vzg@mail.gmail.com>
References: <1460473007-11535-1-git-send-email-ldewangan@nvidia.com>
	<1460473007-11535-8-git-send-email-ldewangan@nvidia.com>
	<CACRpkdZyYiNJfuiTPeivvgVTZwdwh64nkf=f8JczSAVvnT7QeA@mail.gmail.com>
	<5710A8A4.90309@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <5710A8A4.90309@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>
Cc: Stephen Warren <swarren@wwwdotorg.org>, Thierry Reding <thierry.reding@gmail.com>, Alexandre Courbot <gnurou@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Jon Hunter <jonathanh@nvidia.com>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

On Fri, Apr 15, 2016 at 10:39 AM, Laxman Dewangan <ldewangan@nvidia.com> wrote:
> On Friday 15 April 2016 01:38 PM, Linus Walleij wrote:
>> On Tue, Apr 12, 2016 at 4:56 PM, Laxman Dewangan <ldewangan@nvidia.com>
>> wrote:

>>> +static const struct pinconf_generic_params tegra_io_pads_cfg_params[] =
>>> {
>>> +       {
>>> +               .property = "nvidia,io-rail-voltage",
>>> +               .param = TEGRA_IO_RAIL_VOLTAGE,
>>> +       }, {
>>
>> What's so nvidia-specific about this?
>> We have power-source in
>> Documentation/devicetree/bindings/pinctrl/pinctrl-bindings.txt
>> which takes a custom argument. This is obviously what you
>> are doing (selecting one of two rails), so use that binding.
>
> Yes, I looked for the common property but did not found anything near to
> this.
> My understating for power-source is that selecting the source of supply, not
> the voltages.

Well in a comment to the previous patch you just said that the
hardware actually does not regulate voltages. Isn't the actual case
that there are two rails with two different voltages, and you select one
of the rails for the pin?

That is not really selecting a voltage, that is selecting a power
rail.

> I am looking something  power-source-voltage-level.
> Should we add this?

If the pin could actually set a voltage level it would have a regulator.
I don't believe that. I think it is selecting one of two rails which
could theoretically hold two totally different voltages.

And that is what power-source is about.

>>> +               .property = "nvidia,io-pad-deep-power-down",
>>> +               .param = TEGRA_IO_PAD_DEEP_POWER_DOWN,
>>> +       },
>>
>> Likewise the generic bindings have low-power-enable and
>> low-power-disable, this seems like a copy of low-power-enable;
>
> When writing, I considered this property but was not able to fully convinced
> myself to use this but I think now I am fine to use this as you suggested.

Thanks.

>> Even if Tegra is not using the generic code for handling the
>> standard bindings (GENERIC_PINCONF) it doesn't stop
>> you from using the generic bindings and contributing to them.
>>
>> Historically you have a few custom bindings like these:
>>
>> nvidia,pins
>> nvidia,function
>> nvidia,pull
>> nvidia,tristate
>>
>> etc etc, but that is just unfortunate and due to preceding the
>> generic bindings. I would appreciate if you started to support
>> the generic bindings in parallel, but I'm not gonna push that issue.
>
> Yaah, these are in my plate to cleanup. Let me work with Stephen, what he
> think here.

Much appreciated, thanks!

Yours,
Linus Walleij
