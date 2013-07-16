From: Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] ARM: tegra: cpuidle: use CPUIDLE_FLAG_TIMER_STOP flag
Date: Tue, 16 Jul 2013 14:11:04 +0200
Message-ID: <51E53858.6090207@linaro.org>
References: <1372152228-16199-1-git-send-email-josephl@nvidia.com> <51E439BC.9030608@wwwdotorg.org> <1373973447.8538.80.camel@jlo-ubuntu-64.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1373973447.8538.80.camel-yx3yKKdKkHfc7b1ADBJPm0n48jw8i0AO@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 07/16/2013 01:17 PM, Joseph Lo wrote:
> On Tue, 2013-07-16 at 02:04 +0800, Stephen Warren wrote:
>> On 06/25/2013 03:23 AM, Joseph Lo wrote:
>>> Use the CPUIDLE_FLAG_TIMER_STOP and let the cpuidle framework
>>> to handle the CLOCK_EVT_NOTIFY_BROADCAST_ENTER/EXIT when entering
>>> this state.
>>
>> I tried applying this patch, your series "[PATCH V3 0/3] ARM: tegra1=
14:
>> cpuidle: add power down state", and your series "[PATCH V2 00/11] AR=
M:
>> tegra114: add support for system suspend", all on top of v3.11-rc1.
>>
>> On Dalmore, the new cpuidle mode /appears/ to work (I see increasing
>> values in the sysfs cpuidle "usage" file for all defined cpuidle
>> states), but I don't see the "CPU VDD off" LED light up; I'm not
>> convinced that the CPU is actually being powered off in the idle mod=
e.
>>
> The LED of the CPU Vdd indicates the power of CPU cluster. But the
> series of CPU idle power down mode support for Tegra114 only supports
> per core power down. It did not support cluster power down yet in idl=
e
> mode. That needs some extra work to support cluster power down in idl=
e
> mode.
> There are some items that I plat to do:
> 1. integrate the MCPM (multi cluster power management) code into Tegr=
a
> CPU PM code

+1

> 2. integrate coupled CPUidle framework into Tegra CPU idle driver

If you are using the MCPM, I suggest you rely on the MCPM to replace th=
e
coupled idle state by it. The code will look much more consistent.

> 3. normalize the Tegra CPU idle driver to single one

I am working on making a single ARM driver, so may be instead of doing =
a
single tegra driver, we can sync up to move the code forward to the sam=
e
scheme than the others driver, then consolidating the tegra drivers
would be easier and consistent.

That would be very nice, if you can separate in the code the PM arch
specific blocks and encapsulate the driver specific code, so no more
include from <mach/...> are needed. That will allow to move the drivers
to drivers/cpuidle directory.

>> With these patches applies, Harmony acts very strangely. After
>> hot-unplug and re-plug of CPU1, the system is hung or almost hung. T=
he
>> patches appear to reduce the amount of time CPU VDD is off judging b=
y
>> the LEDs. The patches might cause issues with system suspend too, bu=
t
>> I'm not 100% sure.
>>
> Actually I didn't add anything about hotplug or something can increas=
e
> the loading or make regressions. But I think you are testing with USB
> device attached, right? That might cause some extra loading. You can
> give it a try after just removing USB device. And I double confirm th=
at
> on Seaboard. Except that, the test result looks OK for me.
>=20
>> As such, I haven't applied any of these. Can you please test boards =
for
>> all of Tegra20/30/114, and validate that on Dalmore the CPU power is
>> actually being turned off, and report back? Thanks.
>=20
> I have tested all these patches based on next-20130716. And verified =
the
> functions on Seaboard, Cardhu and Dalmore. Looks good for me. And the
> per core power down in idle is OK too. The cluster power down only
> support when the system goes into suspend mode right now for Tegra114=
=2E
>=20
> Thanks,
> Joseph
>=20
>=20
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
>=20


--=20
 <http://www.linaro.org/> Linaro.org =E2=94=82 Open source software for=
 ARM SoCs

=46ollow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
