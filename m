From: Laxman Dewangan <ldewangan@nvidia.com>
Subject: Re: [PATCH 3/6] soc/tegra: pmc: Add support for IO pads power state
 and voltage
Date: Tue, 3 May 2016 18:37:14 +0530
Message-ID: <5728A282.5020208@nvidia.com>
References: <1462191434-28933-1-git-send-email-ldewangan@nvidia.com> <1462191434-28933-4-git-send-email-ldewangan@nvidia.com> <57289AC0.4090604@nvidia.com> <57289A2B.7040501@nvidia.com> <57289FB5.5040705@nvidia.com> <57289E35.8040400@nvidia.com> <5728A3A1.2030304@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <5728A3A1.2030304@nvidia.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Jon Hunter <jonathanh@nvidia.com>, swarren@wwwdotorg.org, linus.walleij@linaro.org, gnurou@gmail.com, robh+dt@kernel.org, mark.rutland@arm.com, thierry.reding@gmail.com
Cc: linux-tegra@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


On Tuesday 03 May 2016 06:42 PM, Jon Hunter wrote:
> On 03/05/16 13:48, Laxman Dewangan wrote:
>> On Tuesday 03 May 2016 06:25 PM, Jon Hunter wrote:
>>>> Currently SOR driver is using the tegra_io_rail_power_off/on() APIs.
>>>> Once the proper interface available then I will move sor driver to use
>>>> new method and then we can full get rid of older APIs and macros.
>>>>
>>>> Till that, we need to have this.
>>> I prefer it is done before this series. In other words, if we need a
>>> proper enum for the rail/pad IDs then add one and convert any existing
>>> drivers over to use any new APIs first.
>> But the converting to new API can be done after this patch only.
> Yes but before you add the pinctrl driver. May be you should separate
> the two.
>
> My point is that any follow-up series to this, would have to touch the
> pmc and the sor driver. So why not make the changes for the pmc and sor
> now, and once in place then add the pinctrl driver?

I will be happy on this approach also. I added pincontrol driver for 
following purpose:
- To show how new APIs used. This will help on understanding of need and 
whole as a design.
- To get reviewed the whole design/method.
- To get accepted the pmc changes on this cycle so that if possible, we 
can have pincntrl driver in next cycle to avoid cross subsystem approach.











