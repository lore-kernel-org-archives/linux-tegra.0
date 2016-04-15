From: Laxman Dewangan <ldewangan@nvidia.com>
Subject: Re: [PATCH 7/7] pinctrl: tegra: Add driver to configure voltage and
 power state of io pads
Date: Fri, 15 Apr 2016 15:25:01 +0530
Message-ID: <5710BA75.2010503@nvidia.com>
References: <1460473007-11535-1-git-send-email-ldewangan@nvidia.com>	<1460473007-11535-8-git-send-email-ldewangan@nvidia.com>	<CACRpkdZyYiNJfuiTPeivvgVTZwdwh64nkf=f8JczSAVvnT7QeA@mail.gmail.com>	<5710A8A4.90309@nvidia.com> <CACRpkdZLEozAmv6REcb7ubCNSLxGsYj1whZEKUkdiodZoS=vzg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <CACRpkdZLEozAmv6REcb7ubCNSLxGsYj1whZEKUkdiodZoS=vzg@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Stephen Warren <swarren@wwwdotorg.org>, Thierry Reding <thierry.reding@gmail.com>, Alexandre Courbot <gnurou@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Jon Hunter <jonathanh@nvidia.com>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org


On Friday 15 April 2016 02:55 PM, Linus Walleij wrote:
> On Fri, Apr 15, 2016 at 10:39 AM, Laxman Dewangan <ldewangan@nvidia.com> wrote:
>> On Friday 15 April 2016 01:38 PM, Linus Walleij wrote:
>>> On Tue, Apr 12, 2016 at 4:56 PM, Laxman Dewangan <ldewangan@nvidia.com>
>>> wrote:
>>>> +static const struct pinconf_generic_params tegra_io_pads_cfg_params[] =
>>>> {
>>>> +       {
>>>> +               .property = "nvidia,io-rail-voltage",
>>>> +               .param = TEGRA_IO_RAIL_VOLTAGE,
>>>> +       }, {
>>> What's so nvidia-specific about this?
>>> We have power-source in
>>> Documentation/devicetree/bindings/pinctrl/pinctrl-bindings.txt
>>> which takes a custom argument. This is obviously what you
>>> are doing (selecting one of two rails), so use that binding.
>> Yes, I looked for the common property but did not found anything near to
>> this.
>> My understating for power-source is that selecting the source of supply, not
>> the voltages.
> Well in a comment to the previous patch you just said that the
> hardware actually does not regulate voltages. Isn't the actual case
> that there are two rails with two different voltages, and you select one
> of the rails for the pin?
>
> That is not really selecting a voltage, that is selecting a power
> rail.
>
>> I am looking something  power-source-voltage-level.
>> Should we add this?
> If the pin could actually set a voltage level it would have a regulator.
> I don't believe that. I think it is selecting one of two rails which
> could theoretically hold two totally different voltages.
>
> And that is what power-source is about.
>
>


The IO rails connected to PMIC rail and connection does not get change.
We change the voltage of PMIC rails via regulator calls. And then 
configure pads for the new voltage.
We really do not witch the supply connection here. power-source is about 
the power supply connection, not about the voltage change on same supply.

Like in MMC driver for SDIO3.0:

regulator_set_voltage(sdmmc_rail, 3300000, 3300000);
tegra_io_pad_voltage_configure(SDMMC, 3300000)


For 1.8V

regulator_set_voltage(sdmmc_rail, 1800000, 1800000);
tegra_io_pad_voltage_configure(SDMMC, 1800000)



