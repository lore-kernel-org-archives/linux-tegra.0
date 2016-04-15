From: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH 6/7] pinctrl: tegra: Add DT binding for io pads control
Date: Fri, 15 Apr 2016 16:45:40 +0100
Message-ID: <57110CA4.6050903@nvidia.com>
References: <1460473007-11535-1-git-send-email-ldewangan@nvidia.com>
 <1460473007-11535-7-git-send-email-ldewangan@nvidia.com>
 <5710F7A4.5070902@nvidia.com> <5710F6CA.6060700@nvidia.com>
 <57110560.80004@nvidia.com> <57110558.8010209@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <57110558.8010209@nvidia.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>, swarren@wwwdotorg.org, thierry.reding@gmail.com, linus.walleij@linaro.org, gnurou@gmail.com, robh+dt@kernel.org, mark.rutland@arm.com
Cc: linux-tegra@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


On 15/04/16 16:14, Laxman Dewangan wrote:
> On Friday 15 April 2016 08:44 PM, Jon Hunter wrote:
>> On 15/04/16 15:12, Laxman Dewangan wrote:
>>>
>>>
>>> All CSI pads are lined to single IO rail.
>> I agree with this and from the data-sheet I see the rail that powers the
>> CSI (and DSI) interfaces is called AVDD_DSI_CSI. But again, in the DT
>> document you are referring to csia, csib, csic, csid, csie, csif as
>> pins, but these don't appear to be physical pins, and this appears to be
>> more of a software means to control power to the various csi_x pins.
>>
>> It seems to me that each of the existing CSI_A_xxx pins/pads should be
>> mapped to or register with the appropriate power-down control and when
>> all pads are set to inactive this then triggers the power-down of all
>> the CSI_A_xxx pads.
>
> I used pins as this is the property from pincon generic so that I can
> use the generic implementation.
> 
> Here, I will not go to the pin level control as HW does not support pin
> level control.
> 
> I will say the unit should be interface level. Should we say
> IO_GROUP_CSIA, IO_GROUP_CSIB etc?

So we need to reflect the hardware in device-tree and although yes the
power-down for the CSI_x_xxx pads are all controlled together as a
single group, it does not feel right that we add a pseudo pin called
csix to represent these.

The CSI_x_xxx pads are already in device-tree and so why not add a
property to each of these pads which has the IO rail information for
power-down and voltage-select?

Cheers
Jon
