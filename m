From: Laxman Dewangan <ldewangan@nvidia.com>
Subject: Re: [PATCH V2 2/2] pinctrl: tegra: Add driver to configure voltage
 and power of io pads
Date: Tue, 22 Nov 2016 15:02:14 +0530
Message-ID: <5834109E.60006@nvidia.com>
References: <1478696782-11657-1-git-send-email-ldewangan@nvidia.com>     <1478696782-11657-3-git-send-email-ldewangan@nvidia.com>        <29e19381-9250-3059-b083-49e8ab56ea7f@nvidia.com>       <5833FE99.2020004@nvidia.com> <1479807957.1942.9.camel@perches.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1479807957.1942.9.camel@perches.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Joe Perches <joe@perches.com>, Jon Hunter <jonathanh@nvidia.com>, linus.walleij@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, swarren@wwwdotorg.org, thierry.reding@gmail.com
Cc: gnurou@gmail.com, yamada.masahiro@socionext.com, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


On Tuesday 22 November 2016 03:15 PM, Joe Perches wrote:
> On Tue, 2016-11-22 at 13:45 +0530, Laxman Dewangan wrote:
>> On Tuesday 22 November 2016 02:31 AM, Jon Hunter wrote:
>>> On 09/11/16 13:06, Laxman Dewangan wrote:
>>> +	_entry_(32, "uart", UART, true, "vddio-uart"),		\
>>> +	_entry_(33, "usb0", USB0, true, NULL),			\
>>> +	_entry_(34, "usb1", USB1, true, NULL),			\
>>> +	_entry_(35, "usb2", USB2, true, NULL),			\
>>> +	_entry_(36, "usb3", USB3, true, NULL),			\
>>> +	_entry_(37, "usb-bias", USB_BIAS, true, NULL)
>>> Can you also fix these checkpatch errors ...
>>>
>>> ERROR: Macros with complex values should be enclosed in parentheses
>>> #424: FILE: drivers/pinctrl/tegra/pinctrl-tegra-io-pad.c:350:
>>>
>>> ERROR: Macros with complex values should be enclosed in parentheses
>>> #456: FILE: drivers/pinctrl/tegra/pinctrl-tegra-io-pad.c:382:
>> I can fix this but will still have the error as:
>>
>> CHECK: Macro argument reuse '_entry_' - possible side-effects?
>> #425: FILE: drivers/pinctrl/tegra/pinctrl-tegra-io-pad.c:425:
>>
>>
>> And there is no better way to fix this.
> It's a stupid little script, feel free to ignore it.
And when I tried to add the parenthesis, it failed in compilation.
So in this case, we just need to ignore the error of

Macros with complex values should be enclosed in parentheses
