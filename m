From: Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [v2 5/9] clocksource: tegra: Enable ARM arch_timer with TSC
Date: Thu, 10 Jan 2013 15:10:31 +0000
Message-ID: <50EED9E7.8000602@arm.com>
References: <20130109.075708.1662067562960541635.hdoyu@nvidia.com><50ED1F8F.4060700@ti.com><79cf9366702f71f8c7add23b2aa0afec@localhost> <20130110.170300.1995294118512465281.hdoyu@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: 8BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20130110.170300.1995294118512465281.hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hiroshi Doyu <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: "santosh.shilimkar-l0cyMroinI0@public.gmane.org" <santosh.shilimkar-l0cyMroinI0@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 10/01/13 15:03, Hiroshi Doyu wrote:
> Hi Mark,
> 
> Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org> wrote @ Wed, 9 Jan 2013 10:01:05 +0100:
> 
>> Almost. I already proposed this in the past, but because the source clock
>> is variable in the Tegra case, this is not flexible enough.
>>
>> What I was suggesting was to do the following:
>>
>> timer {
>>         compatible = "arm,armv7-timer";
>>         [...]
>>         clocks = <&tsc>;
>> }
>>
>> tsc: tsc {
>>         compatible = "nvidia,tegra114-tsc";
>>         reg = <0x700f0000 0x20000>;
>>         freq-range = <... ...>;
>>         clock-output-names = "tsc";
>> }
>>
>> In the arch_timer code, start searching for the "clocks" property, and use
>> that if there is one. Otherwise, fall back to "clock-frequency", and
>> ultimately to reading CNTFRQ.
>>
>> This requires some changes (converting the tsc code to be a clock), but
>> this is at least a proper description of the hardware, and should give you
>> the required flexibility.
> 
> The above seems ok to me. I'll drop this original patch from this
> series for now until T114 clock comes to implement correctly.

Thanks Hiroshi. Please Cc me when you have a patch implementing this
functionality.

	M.
-- 
Jazz is not dead. It just smells funny...
