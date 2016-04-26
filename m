From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH 7/7] pinctrl: tegra: Add driver to configure voltage and
 power state of io pads
Date: Tue, 26 Apr 2016 09:31:47 -0600
Message-ID: <571F89E3.1040907@wwwdotorg.org>
References: <1460473007-11535-1-git-send-email-ldewangan@nvidia.com>
 <1460473007-11535-8-git-send-email-ldewangan@nvidia.com>
 <CACRpkdZyYiNJfuiTPeivvgVTZwdwh64nkf=f8JczSAVvnT7QeA@mail.gmail.com>
 <5710A8A4.90309@nvidia.com>
 <CACRpkdZLEozAmv6REcb7ubCNSLxGsYj1whZEKUkdiodZoS=vzg@mail.gmail.com>
 <5710BA75.2010503@nvidia.com>
 <CACRpkdbr-9Z1JKMVmwNFyMq+Pg+3hT5c9rKZ1y4wZecnidW9Cg@mail.gmail.com>
 <5710D4E2.2030801@nvidia.com> <571F6DE5.5020605@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <571F6DE5.5020605@nvidia.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>, Linus Walleij <linus.walleij@linaro.org>
Cc: Thierry Reding <thierry.reding@gmail.com>, Alexandre Courbot <gnurou@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Jon Hunter <jonathanh@nvidia.com>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

On 04/26/2016 07:32 AM, Laxman Dewangan wrote:
>
> On Friday 15 April 2016 05:17 PM, Laxman Dewangan wrote:
>>
>> On Friday 15 April 2016 04:45 PM, Linus Walleij wrote:
>>> On Fri, Apr 15, 2016 at 11:55 AM, Laxman Dewangan
>>> <ldewangan@nvidia.com> wrote:
>>>> On Friday 15 April 2016 02:55 PM, Linus Walleij wrote:
>>>>> If the pin could actually set a voltage level it would have a
>>>>> regulator.
>>>>> I don't believe that. I think it is selecting one of two rails which
>>>>> could theoretically hold two totally different voltages.
>>>>>
>>>>> And that is what power-source is about.
>>>> The IO rails connected to PMIC rail and connection does not get change.
>>>> We change the voltage of PMIC rails via regulator calls. And then
>>>> configure
>>>> pads for the new voltage.
>>> Aha I get it! So you adjust something in the I/O-cell so that it is
>>> adapted
>>> for the new voltage.
>>>
>>> OK that seems to be something new. I suspect
>>> power-voltage-select = <n>; where N i in uV would solve this?
>>> (We should use uV since regulators use this.)
>>
>> Thanks for new property. I will make the unit and type same as the
>> regulator framework.
>
> We have the ops for configuring the pin config as
>
>          int (*pin_config_group_set) (struct pinctrl_dev *pctldev,
>                                       unsigned selector,
>                                       unsigned long *configs,
>                                       unsigned num_configs);
>
>
> The config is 32 bit, upper 16 for config argument and  and lower 16 for
> the config param.
>
> So we can not accommodate 3300000uV until we change it to mV i.e. 3300mV.
>
> So on interface, we can read uV from DT but when making config, we can
> translate it to mV before passing to pin_config_group_set.

A SoC-specific enum would make more sense. It would avoid any 
translation. There's no need for a generic value since the available set 
of options is SoC-specific, the data source is SoC-specific, and there's 
no need for any code besides the SoC-specific driver to interpret the 
value in any way at all.

