From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH V2 9/9] i2c: tegra: Add pinctrl support
Date: Fri, 26 Aug 2016 10:59:57 -0600
Message-ID: <3beaeb38-02ab-4701-0f02-4e519d750c28@wwwdotorg.org>
References: <1472216945-11818-1-git-send-email-jonathanh@nvidia.com>
 <1472216945-11818-10-git-send-email-jonathanh@nvidia.com>
 <75609713-af41-b4a4-226e-a5cb48ceab4e@wwwdotorg.org>
 <4a650548-22f7-1841-d9a6-b6cd637ed4bd@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4a650548-22f7-1841-d9a6-b6cd637ed4bd-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 08/26/2016 10:38 AM, Jon Hunter wrote:
>
> On 26/08/16 16:55, Stephen Warren wrote:
>> On 08/26/2016 07:09 AM, Jon Hunter wrote:
>>> On Tegra124/132 the pins for I2C6 are shared with the Display Port AUX
>>> (DPAUX) channel and on Tegra210 the pins for I2C4 and I2C6 are shared
>>> with DPAUX1 and DPAUX0, respectively. The multiplexing of the pins is
>>> handled by a register in the DPAUX and so the Tegra DPAUX driver has
>>> been updated to register a pinctrl device for managing these pins.
>>>
>>> The pins for these particular I2C devices are bound to the I2C device
>>> prior to probing. However, these I2C devices are in a different power
>>> partition to the DPAUX devices that own the pins. Hence, it is desirable
>>> to place the pins in the 'idle' state and allow the DPAUX power
>>> partition to switch off, when these I2C devices is not in use.
>>> Therefore, add calls to place the I2C pins in the 'default' and 'idle'
>>> states when the I2C device is runtime resumed and suspended,
>>> respectively.
>>>
>>> Please note that the pinctrl functions that set the state of the pins
>>> check to see if the devices has pins associated and will return zero
>>> if they do not. Therefore, it is safe to call these pinctrl functions
>>> even for I2C devices that do not have any pins associated.
>>
>> I think this should be handled by drivers/i2c/muxes/i2c-mux-pinctrl.c
>> instead?
>
> I remember having a look at i2c-mux some time back, but we did not have
> requirement to share the pins dynamically at runtime between the DPAUX
> and I2C devices.
>
> The pins are just configured at probe time for either the DPAUX or I2C
> device and then with this change when we are not active we can power
> down the pins. However, the pins are always bound to either the DPAUX or
> I2C.

Oh, so this isn't about 1 controller accessing 2 different physical 
buses at runtime by re-routing the SoC pinmux (which is the use-case 
i2c-mux-pinctrl handles), but simply about power-management.

If the I2C controller didn't need to set a different pinctrl state 
during idle, I would say that all the pin muxing should be set up at 
system boot time, just like every other part of the pinmux is. In that 
case, the fact that the pins could be routed to 1 of 2 I2C controllers 
(DPAUX0 vs. I2C4) is irrelevant to the patch; the routing is a static 
thing anyway.

Thinking some more, i2c-mux-pinctrl actually could handle this case, 
since it does define an idle pinmux state IIRC, or at least could be 
trivially extended to do so. That said, doing this directly in the I2C 
driver does seem better in this case, since the use-case is power about 
the power advantages for a single bus, rather than anything to do with 
multiple buses.

Hence I'm OK with the concept of this patch. I didn't review the code 
though.
