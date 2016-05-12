From: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH 6/6] pinctrl: tegra: Add driver to configure voltage and
 power state of io pads
Date: Thu, 12 May 2016 11:30:34 +0100
Message-ID: <57345B4A.8020409@nvidia.com>
References: <1462191434-28933-1-git-send-email-ldewangan@nvidia.com>
 <1462191434-28933-7-git-send-email-ldewangan@nvidia.com>
 <CACRpkdbvCQr11hjCBoeOO+8-MLUbwXAjv9xW=jKR=Y9hZO5sjA@mail.gmail.com>
 <573358A8.2060509@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <573358A8.2060509@wwwdotorg.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Warren <swarren@wwwdotorg.org>, Linus Walleij <linus.walleij@linaro.org>, Laxman Dewangan <ldewangan@nvidia.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Thierry Reding <thierry.reding@gmail.com>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org


On 11/05/16 17:07, Stephen Warren wrote:
> On 05/11/2016 03:19 AM, Linus Walleij wrote:
>> On Mon, May 2, 2016 at 2:17 PM, Laxman Dewangan <ldewangan@nvidia.com>
>> wrote:
>>
>>> NVIDIA Tegra210 supports the IO pads which can operate at 1.8V
>>> or 3.3V I/O voltage levels. Also the IO pads can be configured
>>> for power down state if it is not used. SW needs to configure the
>>> voltage level of IO pads based on IO rail voltage and its power
>>> state based on platform usage.
>>>
>>> The voltage and power state configurations of pads are provided
>>> through pin control frameworks. Add pin control driver for Tegra's
>>> IO pads' voltage and power state configurations.
>>>
>>> Signed-off-by: Laxman Dewangan <ldewangan@nvidia.com>
>>>
>>> ---
>>> Changes from V1:
>>> - Use the generic pincontrol property for low power enable/disable.
>>> - sync with latest and remove all MODULE* macros
>>> - Use renamed APIs form PMC
>>
>> Looks OK to me, need Stephen's ACK though!
> 
> This driver is for HW that's separate from the main Tegra pinmux module.
> Thierry Reding and Jon Hunter are more appropriate reviewers for this one.

There will be another spin of this, so let's wait for the V2.

Cheers
Jon
