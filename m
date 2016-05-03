From: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH 5/6] pinctrl: tegra: Add DT binding for io pads control
Date: Tue, 3 May 2016 14:33:25 +0100
Message-ID: <5728A8A5.4080603@nvidia.com>
References: <1462191434-28933-1-git-send-email-ldewangan@nvidia.com>
 <1462191434-28933-6-git-send-email-ldewangan@nvidia.com>
 <57289D3D.40301@nvidia.com> <57289F88.6040203@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <57289F88.6040203@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>, swarren@wwwdotorg.org, linus.walleij@linaro.org, gnurou@gmail.com, robh+dt@kernel.org, mark.rutland@arm.com, thierry.reding@gmail.com
Cc: linux-tegra@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


On 03/05/16 13:54, Laxman Dewangan wrote:
> 
> On Tuesday 03 May 2016 06:14 PM, Jon Hunter wrote:
>> On 02/05/16 13:17, Laxman Dewangan wrote:
>>> +
>>> +The voltage supported on the pads are 1.8V and 3.3V. The enums are
>>> defined as:
>>> +    For 1.8V, use TEGRA_IO_PAD_POWER_SOURCE_1800000UV
>>> +    For 3.3V, use TEGRA_IO_PAD_POWER_SOURCE_3300000UV
>> Are these still necessary now that the driver is using uV? Can't we just
>> use integer values for 1800000 and 3300000 in the DTS directly?
>>
> The config param and value are packed in u32 with 16bit each So we can
> not make uV in 16bit until we do conversion of uV->mV.
> Hence suggestion came from Stephen that we can have enum for Nvidia
> specific and what actually it supports by HW. HW does not support any
> other voltage.

Ah yes I see.

> 
>>> +Required subnode-properties:
>>> +==========================
>>> +- pins : An array of strings. Each string contains the name of an IO
>>> pads. Valid
>>> +     values for these names are listed below.
>> Please see my previous comments.
> 
> This is taken from other dt binding docs for description. We can have
> array of string.

OK.

> As all value of pins are not supporting all property and hence I
> explicitly wrote under properties.

I don't find it very clear. I thought all pins support the low power
modes so I think it is clearer to list all the pin names under the pins
description.

>>> +Optional subnode-properties:
>>> +==========================
>>> +-nvidia,power-source-voltage:    Integer. The voltage level of IO
>>> pads. The
>> I think I prefer nvidia,io-voltage or something. You can describe what
>> this means in this doc. In fact, the current description here does not
>> explicitly state that this voltage, is the voltage the pad is configured
>> to operate at versus the voltage of the IO rail.
> 
> Linus suggested this dt property name to make more readable and generic
> and meaningful with other property :power-source.

OK.

Jon
