From: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH 6/7] pinctrl: tegra: Add DT binding for io pads control
Date: Fri, 15 Apr 2016 18:44:45 +0100
Message-ID: <5711288D.7060701@nvidia.com>
References: <1460473007-11535-1-git-send-email-ldewangan@nvidia.com>
 <1460473007-11535-7-git-send-email-ldewangan@nvidia.com>
 <5710F7A4.5070902@nvidia.com> <5710F6CA.6060700@nvidia.com>
 <57110560.80004@nvidia.com> <57110558.8010209@nvidia.com>
 <57110CA4.6050903@nvidia.com> <571119C6.6000107@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <571119C6.6000107@nvidia.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>, swarren@wwwdotorg.org, thierry.reding@gmail.com, linus.walleij@linaro.org, gnurou@gmail.com, robh+dt@kernel.org, mark.rutland@arm.com
Cc: linux-tegra@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


On 15/04/16 17:41, Laxman Dewangan wrote:
> 
> On Friday 15 April 2016 09:15 PM, Jon Hunter wrote:
>> On 15/04/16 16:14, Laxman Dewangan wrote:
>>>
>>> I used pins as this is the property from pincon generic so that I can
>>> use the generic implementation.
>>>
>>> Here, I will not go to the pin level control as HW does not support pin
>>> level control.
>>>
>>> I will say the unit should be interface level. Should we say
>>> IO_GROUP_CSIA, IO_GROUP_CSIB etc?
>> So we need to reflect the hardware in device-tree and although yes the
>> power-down for the CSI_x_xxx pads are all controlled together as a
>> single group, it does not feel right that we add a pseudo pin called
>> csix to represent these.
>>
>> The CSI_x_xxx pads are already in device-tree and so why not add a
>> property to each of these pads which has the IO rail information for
>> power-down and voltage-select?
> 
> Which dt binding docs have these?
> I looked for nvidia,tegra210-pinmux.txt and not able to find csi_xxx.

For CSI you are right they are not included by the current DT binding
docs, however, the sdmmc1/3 pads are. So that makes things a bit more
messy as some are and some are not.

> Here I dont want to refer the individual pins as control should be as
> group.

I understand, however, at least for power-down control I don't see why
we cannot refer to the individual pins and once all are inactive then
the rail can be powered down.

For switching the voltage it is a bit more complex, but may be we could
still look-up the IO rail based upon the pads the device uses.

Cheers
Jon


