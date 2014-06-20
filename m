From: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] ARM: tegra: TN7: relax some regulators
Date: Fri, 20 Jun 2014 15:44:46 +0900
Message-ID: <53A3D85E.7030704@nvidia.com>
References: <1403164154-1362-1-git-send-email-acourbot@nvidia.com> <53A308C8.2070004@wwwdotorg.org> <20140619175643.GR5099@sirena.org.uk> <53A3C613.8030207@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <53A3C613.8030207-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Keerthy <j-keerthy-l0cyMroinI0@public.gmane.org>, Nishanth Menon <nm-l0cyMroinI0@public.gmane.org>
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 06/20/2014 02:26 PM, Alexandre Courbot wrote:
> On 06/20/2014 02:56 AM, Mark Brown wrote:
>> * PGP Signed by an unknown key
>>
>> On Thu, Jun 19, 2014 at 09:59:04AM -0600, Stephen Warren wrote:
>>> On 06/19/2014 01:49 AM, Alexandre Courbot wrote:
>>
>>>> Remove the regulator-always-on property from some regulators that do
>>>> not
>>>> need it. On recent kernels fixed regulators which supply is always on
>>>> fail registration.
>>
>>> That sounds like a bug in the regulator core, which should be fixed
>>> there.
>>
>> Please actually describe the problem you believe you are seeing - I've
>> seen no reports and I can't tell anything from what you've described,
>> nor can I see any obvious way that a regulator being fixed would have
>> any effect on its supply.
>
> Here is some more information about what happens.
>
> We have a fixed regulator defined as follows:
>
> vdd_lcd: regulator@2 {
>          compatible = "regulator-fixed";
>          reg = <2>;
>          regulator-name = "VD_LCD_1V8";
>          regulator-min-microvolt = <1800000>;
>          regulator-max-microvolt = <1800000>;
>          gpio = <&palmas_gpio 4 GPIO_ACTIVE_HIGH>;
>          enable-active-high;
>          vin-supply = <&vdd_1v8>;
>          regulator-boot-on;
> };
>
> Its vin-supply is part of the palmas device:
>
> vdd_1v8: smps8 {
>          regulator-name = "vs-pmu-1v8";
>          regulator-min-microvolt = <1800000>;
>          regulator-max-microvolt = <1800000>;
>          regulator-always-on;
>          regulator-boot-on;
> };
>
> When vdd_lcd is registered, set_supply() is called, which creates a new
> regulator for vdd_1v8. In create_regulator(),
> _regulator_can_change_status() returns false (as it should since the
> regulator is always_on) and _regulator_is_enabled() *also* returns
> false, so as a result regulator->always_on remains false for vdd_1v8.
>
> Later in regulator_register(), we try to enable the supply. Since
> regulator->always_on is false, _regulator_enable() is called on vdd_1v8,
> and the pair _regulator_is_enabled() / _regulator_can_change_status() is
> called again with the same result, which causes _regulator_enable() to
> return -EPERM. This prevents vdd_lcd from being registered.
>
> So I can see three questions here:
>
> 1) Why does _regulator_enable() on vdd_1v8 return 0 while everything
> suggests that it is enabled (this regulator powers lot of devices, like
> eMMC, which are working fine). This may be an issue with the palmas driver.

Ran a bisect eventually, found that reverting this commit led to SMPS8's 
enabled status to be properly reported at boot time (and consequently 
the register probe to succeed):

dbabd624d
regulator: palmas: Reemove open coded functions with helper functions

Keerthy, Nishanth, could it be that there is still something wrong with 
the REGULATOR_LINEAR_RANGE() definitions?

This seems to be the cause for our trouble, but the other questions 
might still stand, in case there is interest in discussing them.

>
> 2) When an always-on regulator that is not yet enabled is registered,
> shouldn't it be switched on by the regulator framework?
>
> 3) When a boot-on regulator is registered and _regulator_is_enabled()
> returns contradictory information, what should be done?
>
> Note that whether the regulator-boot-on property is present or not does
> not change anything.
>
> I tried to find a recent patch that could have introduced a change of
> behavior, but could not find anything so far. Bisecting is made harder
> by the fact this happens on a newly-introduced board which requires a
> bunch of patches of its own, but it we need more information I can try
> to do it anyway.
>
> Thanks,
> Alex.
>
