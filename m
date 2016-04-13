From: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH 6/7] pinctrl: tegra: Add DT binding for io pads control
Date: Wed, 13 Apr 2016 10:31:05 +0100
Message-ID: <570E11D9.6070708@nvidia.com>
References: <1460473007-11535-1-git-send-email-ldewangan@nvidia.com>
 <1460473007-11535-7-git-send-email-ldewangan@nvidia.com>
 <570E0BAE.8090404@nvidia.com> <570E0C8C.4070600@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <570E0C8C.4070600@nvidia.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>, swarren@wwwdotorg.org, thierry.reding@gmail.com, linus.walleij@linaro.org, gnurou@gmail.com, robh+dt@kernel.org, mark.rutland@arm.com
Cc: linux-tegra@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


On 13/04/16 10:08, Laxman Dewangan wrote:

[snip]

> For T210, 64 bit, it is
>  tegra210.dtsi:    pmc: pmc@0,7000e400 {

Yes and this is wrong [0].

>>> +Required properties:
>>> +- compatible: "nvidia,tegra210-io-pad"
>> I think you have have "Must be ..." here. I am also wondering if the
>> pinctrl device should be registered by the pmc driver and so not a
>> separate driver to the PMC driver. In other words, the PMC driver calls
>> pinctrl_register() directly.
> 
> I like to keep the pmc driver as main interface and other sub
> functionalities like pad control for voltage and power states, no
> iopower control etc as sub drivers. This will help in modular approach
> of the driver.

OK, let's see what Thierry thinks about this.

>>> +The voltage supported on the pads are 1.8V and 3.3V. The enums are
>>> defined as:
>>> +    For 1.8V, use TEGRA210_IO_RAIL_1800000UV
>>> +    For 3.3V, use TEGRA210_IO_RAIL_3300000UV
>> You may consider just using integer values here like we do for
>> regulators.
> 
> We just support two values 1.8V and 3.3V only. I am fine with either way
> also.
> 
>>
>>> +                  TEGRA210_IO_PAD_DEEP_POWER_DOWN_DISABLE for
>>> +                    disable.
>>> +                  TEGRA210_IO_PAD_DEEP_POWER_DOWN_ENABLE for
>>> +                    enable.
>> Sounds like a boolean parameter. So may consider that if the property
>> 'nvidia,io-pad-deep-power-down' is present then it means enable
>> deep-power-down and if not present then don't. Then you do not need to
>> assign a value to it.
> 
> Three states, enable, disable and left default. So absent will be left
> default.

Fine with me.

Cheers
Jon

[0] http://marc.info/?l=linux-tegra&m=146038329109871&w=2
