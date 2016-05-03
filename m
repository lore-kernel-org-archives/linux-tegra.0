From: Laxman Dewangan <ldewangan@nvidia.com>
Subject: Re: [PATCH 3/6] soc/tegra: pmc: Add support for IO pads power state
 and voltage
Date: Tue, 3 May 2016 18:18:53 +0530
Message-ID: <57289E35.8040400@nvidia.com>
References: <1462191434-28933-1-git-send-email-ldewangan@nvidia.com> <1462191434-28933-4-git-send-email-ldewangan@nvidia.com> <57289AC0.4090604@nvidia.com> <57289A2B.7040501@nvidia.com> <57289FB5.5040705@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <57289FB5.5040705@nvidia.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Jon Hunter <jonathanh@nvidia.com>, swarren@wwwdotorg.org, linus.walleij@linaro.org, gnurou@gmail.com, robh+dt@kernel.org, mark.rutland@arm.com, thierry.reding@gmail.com
Cc: linux-tegra@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


On Tuesday 03 May 2016 06:25 PM, Jon Hunter wrote:
>
>>
>> Currently SOR driver is using the tegra_io_rail_power_off/on() APIs.
>> Once the proper interface available then I will move sor driver to use
>> new method and then we can full get rid of older APIs and macros.
>>
>> Till that, we need to have this.
> I prefer it is done before this series. In other words, if we need a
> proper enum for the rail/pad IDs then add one and convert any existing
> drivers over to use any new APIs first.

But the converting to new API can be done after this patch only.

I need to implement new APIs and then move driver to use new APIs and 
then remove older one.

Otherwise, I need to have single patch for the new API + converting 
existing user to use new APIs.
If this is allowed in subsystem level then this is best method.

We already did for max77686 RTC + mfd change together.

So will it be fine to make such changes?
