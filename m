From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH V3] ARM: dt: tegra: ventana: add regulators
Date: Thu, 09 Aug 2012 12:04:14 -0600
Message-ID: <5023FB9E.4010904@wwwdotorg.org>
References: <1344017356-29352-1-git-send-email-swarren@wwwdotorg.org> <5023A716.50807@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5023A716.50807-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 08/09/2012 06:03 AM, Laxman Dewangan wrote:
> On Friday 03 August 2012 11:39 PM, Stephen Warren wrote:
>> Ventana uses a TPS6586x regulator. Instantiate this, and hook up a
>> couple of fixed GPIO-controlled regulators too.
...

Sorry, I didn't look below at your other comments. Now responding...

>> +        pmic: tps6586x@34 {
>> +            compatible = "ti,tps6586x";
>> +            reg =<0x34>;
>> +            interrupts =<0 86 0x4>;
> 
> Should we say interrupt-controller also here?

I don't think so; it looks like all the interrupts within this chip are
for things that should be handled completely internally to to driver
itself. Either way, there's certainly nothing attempting to use any
interrupts from this chip right now, so if we did need that property, we
could always add it if/when we added a client that needed it.

>> +
>> +            sys-supply =<&vdd_5v0_reg>;
>> +            vin-sm0-supply =<&sys_reg>;
>> +            vin-sm1-supply =<&sys_reg>;
>> +            vin-sm2-supply =<&sys_reg>;
> 
> This depends on two changes on tps6586x regulator which are not merged yet.

Yes, I'm waiting for those changes to be merged before actually applying
this. However, there's no particular dependency; this patch simply won't
end up enabling the regulators until it's merged with the other patches,
so the .dts and regulator driver patches can go in through separate
trees OK.

>> +    pmc {
> 
> Should say status OK?

The default status is OK. Since the PMC is useful on all boards, it
isn't disabled in tegra30.dtsi; only board-specific things are disabled
in tegra30.dtsi (e.g. which I2C, MMC, I2S, ... ports are used is board
specific. Core SoC functionality isn't.)
