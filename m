From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 1/1 v3] ARM: tegra: add PWM nodes to Tegra114 DT
Date: Tue, 12 Mar 2013 17:24:49 -0600
Message-ID: <513FB941.5090302@wwwdotorg.org>
References: <1363124563-24784-1-git-send-email-achew@nvidia.com> <513FB66C.2030007@wwwdotorg.org> <643E69AA4436674C8F39DCC2C05F7638629CA517E4@HQMAIL03.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <643E69AA4436674C8F39DCC2C05F7638629CA517E4-lR+7xdUAJVNDw2glCA4ptUEOCMrvLtNR@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrew Chew <AChew-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Hiroshi Doyu <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 03/12/2013 05:17 PM, Andrew Chew wrote:
>> From: Stephen Warren [mailto:swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org]
>> Sent: Tuesday, March 12, 2013 4:13 PM
>> To: Andrew Chew
>> Cc: Hiroshi Doyu; linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
>> Subject: Re: [PATCH 1/1 v3] ARM: tegra: add PWM nodes to Tegra114 DT
>>
>> On 03/12/2013 03:42 PM, Andrew Chew wrote:
>>> This patch adds a device tree node for the four PWM controllers
>>> present on Tegra114.
>>
>>> diff --git a/arch/arm/boot/dts/tegra114.dtsi
>>> b/arch/arm/boot/dts/tegra114.dtsi
>>
>>> +	pwm: pwm {
>>> +		compatible = "nvidia,tegra114-pwm", "nvidia,tegra20-pwm";
>>> +		reg = <0x7000a000 0x40>;
>>
>> I notice that the size is 0x100 in previous chips. Which is more correct?
> 
> Looking at the TRM, it seems to me that 0x40 is correct.  There are four
> PWM controllers, as far as I know.  Each PWM controller has exactly one
> 4-byte register that controls it.  They are located at 0x00, 0x10, 0x20, and
> 0x30.  Since the stride is 0x10, I decided to use a total size of 0x40 (rather
> than something strange like 0x34, which would have been sufficient).
> 
> I don't know why 0x100 was used in previous chips.

I guess it's because the TRM documents the address map allocation as
being 0x100. Due to that, I guess we should continue to use the 0x100
value. Both are smaller than a page anyway, so even though registers
aren't present up to 0x100, we won't waste any virtual memory space.

>>> +		#pwm-cells = <2>;
>>> +		clocks = <&tegra_car 17>;
>>> +		status = "disabled";
>>
>> Previous chips don't disable this module by default. Perhaps they should?
> 
> I thought this was the appropriate thing to do.

That's probably true.

Can you please also submit a patch to add the status property to the
previous chips, for consistency. Thanks.
